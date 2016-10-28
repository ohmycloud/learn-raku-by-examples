use v6;

# 提取文本
# 捕获的层级关系还不清楚。
# 我想把文本格式化成下面这样，即取"[]"中的值！
# 2016-02-26 17:29:42|JMSDestination|pay_jmsmodule_01!pay_jmsqueue_01|1|0|0|10|373184|1

for $=finish.lines -> $line {
    my @fileds = split(/\s+/, $line);
    $line ~~ m:g/'[' ~ ']' (<[\w!_]>+)/;
    # say  @fileds[0..1].Str, join "|", @(~$/.[0..*][0..*]);
}
=finish
2016-02-26 17:29:42 Type:[JMSDestination] Name:[pay_jmsmodule_01!pay_jmsqueue_01] ConsumersHighCount:[1] MessagesCurrentCount:[0] MessagesPendingCount:[0] MessagesHighCount:[10] MessagesReceivedCount:[373184] ConsumersTotalCount:[1]
2016-02-26 17:29:42 Type:[JMSDestination] Name:[pay_jmsmodule_01!Queue-urm-log] ConsumersHighCount:[1] MessagesCurrentCount:[0] MessagesPendingCount:[0] MessagesHighCount:[4] MessagesReceivedCount:[126072] ConsumersTotalCount:[1]
2016-02-26 17:29:42 Type:[JMSDestination] Name:[pay_jmsmodule_01!Queue-pay-log] ConsumersHighCount:[0] MessagesCurrentCount:[0] MessagesPendingCount:[0] MessagesHighCount:[0] MessagesReceivedCount:[0] ConsumersTotalCount:[0]
2016-02-26 17:29:42 Type:[JMSDestination] Name:[pay_jmsmodule_01!pay_deadqueue] ConsumersHighCount:[0] MessagesCurrentCount:[0] MessagesPendingCount:[0] MessagesHighCount:[0] MessagesReceivedCount:[0] ConsumersTotalCount:[0]
