use v6;

# 往数据库中写入数据

#aldstat_qr_code_statistics（旧表）
#aldstat_hourly_qr
##aldstat_7days_single_qr
#aldstat_30days_single_qr

#ald_code
#ald_qr_group
#aldstat_daily_qr_group
#aldstat_7days_single_qr_group
#aldstat_30days_single_qr_group
#aldstat_hourly_qr_group

# 日期

my @days =  Date.new('2017-10-01') .. Date.new('2017-11-15');

sub prepare_sql($table, @insert_fields, @update_fields) {
    # 准备 sql 语句模版
    my @on_duplicate_key;
    my @placeholder     ;

    (@on_duplicate_key.append($_ ~ '=' ~ 'VALUES(' ~ $_ ~ ')') for @update_fields);
    (@placeholder.append('%s') for @insert_fields);

    my $insert_columns = '(' ~ @insert_fields.join(',') ~ ')';
    my $values = 'values(' ~ @placeholder.join(',') ~ ')';
    my $on_duplicate_key_update = @on_duplicate_key.join(',');

    return  "insert into %s %s %s ON DUPLICATE KEY UPDATE %s".printf($table, $insert_columns, $values, $on_duplicate_key_update);
}



my @insert_fields = ('app_key','day','open_count','update_at'); # 插入的字段
my @update_fields = ('open_count', 'update_at');                # 需要更新的字段
my $sql           = prepare_sql('aldstat_trend_analysis', @insert_fields, @update_fields);

say $sql;
