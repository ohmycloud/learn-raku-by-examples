use Cro::HTTP::Client;

unit class FeiShu:ver<0.0.1>;

has $.app_id;
has $.app_secret;
has $.access_token;
has $.chat_name;
has $.headers = {
            "Authorization": "Bearer {}".format(self.access_token),
            "Content-Type": "application/json"
        };


# 获取token
method get_access_token() {
    my %data = "app_id" => $!app_id,
               "app_secret" => $!app_secret;
    
    try:
        res = requests.post("https://open.feishu.cn/open-apis/auth/v3/tenant_access_token/internal/", json=data)
        if res.status_code == 200:
            res_json = res.json()
            access_token = res_json.get("tenant_access_token")
            return access_token
    except Exception as e:
        return {"error": e}
}

# 获取群列表
method get_chat_list() {
    my %params = 
        "page_size" => 100,
        "page_token" => "";
    
    try:
        res = requests.get("https://open.feishu.cn/open-apis/chat/v4/list", params=params, headers=self.headers)
        if res.status_code == 200:
            res_json = res.json()
            data = res_json.get("data")
            groups = data.get("groups")
            for i in groups:
                if i.get("name") == self.chat_name:
                    return i
    except Exception as e:
        return {"error": e}
}

method send_msg($text) {
    my $res = self.get_chat_list()
    my $chat_id = $res.get("chat_id")
    my %data = "chat_id" => chat_id,
               "msg_type" => "text",
               "content" => { "text" => text };
        
    try:
        res=requests.post("https://open.feishu.cn/open-apis/message/v4/send/", headers=self.headers,json=data)
        return res.json()
    except Exception as e:
        return {"error":e}
}

=begin pod

=head1 NAME

FeiShu - blah blah blah

=head1 SYNOPSIS

=begin code :lang<raku>

use FeiShu;

=end code

=head1 DESCRIPTION

FeiShu is ...

=head1 AUTHOR

 <>

=head1 COPYRIGHT AND LICENSE

Copyright 2021 

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
