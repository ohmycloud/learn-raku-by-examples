use v6;
use DBIish;

my $host='118.89.235.117';
my $password='Aldwx!23(){}**$#!';


my $dbh = DBIish.connect('mysql', :$host, :port(3306),
        :database<ald_xinen>, :user<aldwx>, :$password);

my $sth = $dbh.do(q:to/STATEMENT/);
    DROP TABLE IF EXISTS nom
    STATEMENT

$sth = $dbh.do(q:to/STATEMENT/);
    CREATE TABLE nom (
        name        varchar(4),
        description varchar(30),
        quantity    int,
        price       numeric(5,2)
    )
    STATEMENT

$sth = $dbh.do(q:to/STATEMENT/);
    INSERT INTO nom (name, description, quantity, price)
    VALUES ( 'BUBH', 'Hot beef burrito', 1, 4.95 )
    STATEMENT

$sth = $dbh.prepare(q:to/STATEMENT/);
    INSERT INTO nom (name, description, quantity, price)
    VALUES ( ?, ?, ?, ? )
    STATEMENT

$sth.execute('TAFM', 'Mild fish taco', 1, 4.85);
$sth.execute('BEOM', 'Medium size orange juice', 2, 1.20);

$sth = $dbh.prepare(q:to/STATEMENT/);
    SELECT name, description, quantity, price, quantity*price AS amount
    FROM nom
    STATEMENT

$sth.execute();

my @rows = $sth.allrows();
say @rows.elems; # 3

$sth.finish;

$dbh.dispose;