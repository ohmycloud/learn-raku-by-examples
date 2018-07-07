#!/usr/bin/env perl6

use HTTP::Server::Async;
use HTTP::Server::Router;

# 浏览器访问 localhost:1666

my HTTP::Server::Async $server .= new;
my $supplier = Supplier.new;
my $supply = $supplier.Supply;
my $out = &auto-restart(&start-server($supply, -> $x, $y { $x + $y; }));
my $channel = Channel.new;

$out.tap;
serve $server;

route '/', sub ($req, $res) {
    $res.headers<Content-Type> = 'text/html;charset=utf-8';
    $res.close('<a href="littlesister">点击 获取小姐姐</a><br><a href="add">点击 进行加法</a>');
}
route '/littlesister', sub ($req, $res) {
    $res.headers<Content-Type> = 'text/html;charset=utf-8';
    $res.close('U GOT 小姐姐!!');
}
route '/add', sub ($req, $res) {
    $res.headers<Content-Type> = 'text/html;charset=utf-8';
    $res.close('<form action="addresult" method="POST">Left Operator:<br><input type="text" name="leftop"><br>
 Right Operator:<br><input type="text" name="rightop"><br><input type="submit" value="Submit"></form>');
}
route '/addresult', sub ($req, $res) {
    $res.headers<Content-Type> = 'text/html;charset=utf-8';
    my @r = $req.data.decode("utf-8") ~~ /^'leftop='(.+)\&'rightop='(\w+).*$/;
    @r = @r[0]>>.Str;
    $supplier.emit(@r);
    $res.close( "{@r[0].join(" + ")} = " ~ $channel.receive);
}
route / .+ /, sub ($req, $res) {
    $res.status = 404;
    $res.close("Not found, 404 lololo!");
}
$server.listen(True);

sub start-server(Supply $s, &operator --> Supply) {
	supply {
		sub server() {
			whenever $s -> $msg {
                emit &operator($msg.[0].[0], $msg.[0].[1]);
			}
		}
		server();
	}
}

sub auto-restart(Supply $s --> Supply) {
	supply {
		sub auto() {
			whenever $s -> $msg {
                $channel.send($msg);
				QUIT {
					default {
                        $channel.send("ERROR");
						.note;
						"Ready to restart server".say;
						auto();
					}
				}
			}
		}
		auto();
	}
}
