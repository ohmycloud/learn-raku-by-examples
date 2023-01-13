# Swift RegexBuilder Transform Vs. Raku Grammar Action

Swift RegexBuilder DSL 中的 transform 和 Raku Grammar 中的 Action 很相似, 都会把匹配到的文本或对象转换成某种自定义的数据结构类型(或标准库中的数据结构类型)。

## Swift RegexBuilder Transform

下面是一种交易数据, 这 4 列数据分别表示交易种类(KIND)、交易日期(DATE)、描述信息(INSTITUTION)和交易金额(AMOUNT)。

```
KIND      DATE        INSTITUTION        AMOUNT
----------------------------------------------------------------
CREDIT    04062020    PayPal transfer    $4.99
CREDIT    04032020    Payroll            $69.73
DEBIT     04022020    ACH transfer       $38.25
DEBIT     03242020    IRS tax kind       $52249.98
```

分别使用 Swift RegexBuilder DSL 中的 transform 和 Raku Grammar 中的 Action 来对匹配的文本进行转换。

```swift
import RegexBuilder
import _StringProcessing

// 定义枚举类型, 保存交易种类
enum TransactionKind: String {
    case credit = "CREDIT" // 信用卡
    case debit = "DEBIT"   // 银行卡
}

// 定义日期结构体
struct Date {
    var month, day, year: Int
    // Failable Initializer
    init?(mmddyyyy: String) {
        if mmddyyyy.count != 8 { return nil }

        let indexOfMonth = mmddyyyy.index(mmddyyyy.startIndex, offsetBy: 2)
        let indexOfDay   = mmddyyyy.index(indexOfMonth, offsetBy: 2)
        let indexOfYear  = mmddyyyy.index(indexOfDay, offsetBy: 4)

        month = Int(mmddyyyy[..<indexOfMonth])!
        day   = Int(mmddyyyy[indexOfMonth..<indexOfDay])!
        year  = Int(mmddyyyy[indexOfDay..<indexOfYear])!
    }
}

// 定义交易金额结构体
struct Amount {
    var valueTimes100: Int
    init?(twoDecimalPlaces text: Substring) {
        if String(text).count == 0 { return nil }
        valueTimes100 = Int(Double(text)! * 100)
    }
}

// 定义交易数据的正则表达式 DSL
let transactionPattern = Regex {
    // 解析交易种类
    TryCapture {
        ChoiceOf {
            "CREDIT"
            "DEBIT"
        }
    } transform: {
        // 把捕获到的交易种类(Substring)转换为 TransactionKind 类型
        TransactionKind(rawValue: String($0))
    }
    OneOrMore(.whitespace)
    // 解析日期
    TryCapture {
        Repeat(.digit, count: 2)
        Repeat(.digit, count: 2)
        Repeat(.digit, count: 4)
    } transform: {
        // 把捕获到的日期(Substring)转换为 Date 类型
        Date(mmddyyyy: String($0))
    }
    OneOrMore(.whitespace)
    // 解析交易描述信息
    Capture {
        OneOrMore(CharacterClass(.word, .whitespace))
        CharacterClass.word
    } transform: { String($0) } // 把捕获到的交易描述信息(Substring)转换为 String 类型
    OneOrMore(.whitespace)
    "$"
    // 解析交易金额
    TryCapture {
        OneOrMore(.digit)
        "."
        Repeat(.digit, count: 2)
    } transform: {
        // 把捕获到的交易金额(Substring)转换为 Amount 类型
        Amount(twoDecimalPlaces: $0)
    }
}

let input = """
CREDIT    04062020    PayPal transfer    $4.99
CREDIT    04032020    Payroll            $69.73
DEBIT     04022020    ACH transfer       $38.25
DEBIT     03242020    IRS tax kind    $52249.98
"""

for match in input.matches(of: transactionPattern) {
    let (_, kind, date, description, amount) = match.output
    print(kind, date, description, amount.valueTimes100)
}
```

由于需要把捕获到的 Substring 转换为自定义的数据类型, 所以我们提前定义了 TransactionKind、Date 和 Amount 类型。其中 Date 和 Amount 是结构体类型, 它们都有一个可失败的构造函数(因为 init 关键字后面的问号), 所以对 Date 和 Amount 的 transform 转换返回的是 `Date?` 和 `Amount?` 这种 Option 类型。

对捕获进行 transfrom 转换可能会失败(因为捕获到的 Substring 可能不满足初始化条件), 当 transform 转换返回 nil 的时候, 正则表达式引擎会回溯并尝试其它的备选项(alternative)。如果 transform 转换成功, 则返回解包后的自定义数据类型。所以 print(type(of: date)) 打印出来的是 `Date` 而不是 `Date?`。

由于输出的数据类型不再是 Substring 这种字符串结构, 而是自定义的结构化的数据结构类型, 所以在使用的时候就很方便了, 例如上面的 amount.valueTimes100, 访问了 amount 结构体的存储属性。你不用再对匹配到的字符串进行各种操作了, 而 Swift 5 的字符串操作仍然不是特别好用。

## Raku Grammar Action

Raku Grammar Action 是对 Mactch 对象(大部分情况下只需要写成 `$/`)进行转换, 在这个匹配对象上附加上自定义的数据结构, 例如类和哈希。这里和 Swift RegexBuilder 的 Transform 不同, Raku grammar 的 action 对象操作的是匹配对象(是一颗抽象语法树), 而不是字符串; Swift RegexBuilder 的 Transform 操作的是 Substring, 仍然算是字符串。

```raku
my $input = q:to/END/;
CREDIT    04062020    PayPal transfer    $4.99
CREDIT    04032020    Payroll            $69.73
DEBIT     04022020    ACH transfer       $38.25
DEBIT     03242020    IRS tax payment    $52249.98
END

# 定义交易种类
class Kind { has $.kind is rw}

# 定义交易日期
class TDate { 
    has $.day is rw;
    has $.month is rw;
    has $.year is rw;
}

# 定义交易金额
class Amount {
    has $.amount is rw;
}

# 定义解析交易数据的 Grammar
grammar TransactionGrammar {
    token TOP             { <transaction>+ %% \n*                             }
    rule  transaction     { <kind> <date> <description> <amount>              }
    token kind            { 'CREDIT' | 'DEBIT'                                }
    token date            { <digit-sequence>+ % '/'                           }
    token description     { [<-[\s]>+]+ % \s                                  }
    token amount          { <currency-sign> <currency-number>                 }
    token digit-sequence  { \d+                                               }
    token currency-sign   { '$'                                               }
    token currency-number { <digit-sequence>+ % '.'                           }
}

# 定义用于转换匹配对象的 Action
class TransactionAction {
    method TOP($/)             { make $/<transaction>».made }
    method transaction($/)     { 
        my %h = kind => $<kind>.made,
            date => $<date>.made,
            description => $<description>.made,
            cost => $<amount>.made;
        make %h;     
    }
    method kind($/)            { make Kind.new(kind => ~$/) }
    method date($m)            {
        my $match = (~$m).match(/(\d ** 2)(\d ** 2)(\d ** 4)/);
        make $m: TDate.new(day => ~$match[0], month => ~$match[1], year => ~$match[2]);
    }
    method description($/)     { make ~$/ }
    method amount($/)          { 
        make Amount.new(amount => +$<currency-number> * 100);
    }
    method digit-sequence($/)  { make ~$/ }
    method currency-sign($/)   { make ~$/ }
    method currency-number($/) { make ~$/ }
}

my $match = TransactionGrammar.parse($input, :actions(TransactionAction)).made;
.say for $match<>;
```

Action 是一个类, 在这个类中定义的方法和 Grammar 中的 token/regex/rule 同名。当 Grammar 中的 token/regex/rule 匹配时, 会调用 Action 中与之同名的方法, 以完成对匹配对象的转换。

在上面的 TransactionGrammar 中, 我们定义了一个名为 transaction 的 rule(空格是有语义的):

```raku
rule transaction { <kind> <date> <description> <amount> }
```

上面的 rule 可以改写成 token:

```raku
token transaction { <kind><.ws><date><.ws><description><.ws><amount><.ws> }
```

所以 rule 中的空白是有语义的, token 中的空白是没有语义的, 除非显式地写出来, 例如 <.ws> 是匹配 0 个或多个空白, 但不捕获。

在 Grammar 匹配到 transaction 时, 就会调用 Action 中与之同名的名为 transaction 的方法, 并把匹配对象 `$/` 传递给这个方法。在 transaction 方法中, 我们通过 `.made`(或 `.ast`) 方法分别取到附加在 `$/<kind>`、`$/<date>`、`$/<description>` 和 `$/<amount>` 对象上的自定义数据, 作为我们自定义的哈析的值, 然后把这个哈析再附加到 transaction 的匹配对象上。

在 token `TOP` 中, `$/<transaction>».made` 取到每个 transaction 对象上附加的数据, 然后附加到最顶层的匹配对象上。

我们还看到 TransactionAction 的 date 方法接收的并不是 `$/`, 而是一个自定义的变量。在某些情况下, 这是有必要的:

```raku
method date($/)            {
    my $match = (~$/).match(/(\d ** 2)(\d ** 2)(\d ** 4)/);
    make TDate.new(day => ~$match[0], month => ~$match[1], year => ~$match[2]);
}
```

上面的写法使用了 `$/` 作为 date 方法的参数, 但是会报错:

```
Cannot assign to a readonly variable or a value
```

当我刚看到这个报错的时候, 我想不明白, 为什么这儿不能赋值给一个只读变量, 但是明明 $match 是可变的啊。实际上, 这里的赋值不是赋值给 $match, 而是赋值给 `$/`, 因为 match 方法也产生了一个匹配对象, 匹配结果存储在 $/ 中, $/ 是不可变的。 

amount 方法中的 `+$<currency-number>` 把匹配到的货币字符串转换为数值。

运行上面的代码, 可以看到它打印的结果数据都是 Hash 类型, 结果就是我们把文本类型的字符串转换成了可编程的结构化数据了:

```
{cost => Amount.new(amount => 499.0), date => TDate.new(day => "04", month => "06", year => "2020"), description => PayPal transfer, kind => Kind.new(kind => "CREDIT")}
{cost => Amount.new(amount => 6973.0), date => TDate.new(day => "04", month => "03", year => "2020"), description => Payroll, kind => Kind.new(kind => "CREDIT")}
{cost => Amount.new(amount => 3825.0), date => TDate.new(day => "04", month => "02", year => "2020"), description => ACH transfer, kind => Kind.new(kind => "DEBIT")}
{cost => Amount.new(amount => 5224998.0), date => TDate.new(day => "03", month => "24", year => "2020"), description => IRS tax kind, kind => Kind.new(kind => "DEBIT")}
```

假设想打印出所有的交易金额:

```raku
.<cost>.amount.say for $match<>;
```

输出:

```
499
6973
3825
5224998
```

## 总结

Swift RegexBuilder DSL 中的 transform 和 Raku Grammar 中的 action 一脉相承, 前者是在匹配后就调用 transfrom 闭包来完成转换, 后者把解析(grammar)和转换(action)分开了, 甚至可以写在不同的模块中, 更加灵活。