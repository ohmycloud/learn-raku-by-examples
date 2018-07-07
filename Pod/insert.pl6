use v6;

for $=finish.lines -> $line {
    #next if $++ < 3 || $line ~~ / '-' /;
    #| id    | name | password                         | gender | idgard | logo | sign | mail | verity_mail | phone       | verity_phone | company | wechat_unionid | wechat_openid | wechat_nickname | wechat_city | wechat_province | wechat_country | wechat_avatarurl | wechat_gender | modify | created    | is_scene | is_winning | is_dev | is_authorized | is_last_key | third_id | last_at |                     

    say 'insert into aladdin_user (name,password,gender,idgard,logo,sign,mail,verity_mail,phone,verity_phone,company,wechat_unionid,wechat_openid,wechat_nickname,wechat_city,wechat_province,wechat_country,wechat_avatarurl,wechat_gender,modify,created,is_scene,is_winning,is_dev,is_authorized,is_last_key,third_id,last_at) values (' ~ ($line.split: /<[\s+ |]>/, :skip-empty)>>.&quote.join(",") ~ ");";

}

sub quote(Str $ele) {
    return '"' ~ $ele ~ '"';
}

=finish
|NULL|3de11d8ea894d9a77857b30454c61b66|1|NULL|NULL|BB|NULL|0|13559175915|1|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|NULL|AA|1510811069|1|1|1|1|NULL|NULL|0|