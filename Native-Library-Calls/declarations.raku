use NativeCall;

class SockAddr is repr('CStruct') {
    has int32    $.sa_family;
    has Str      $.sa_data;
};
class Addrinfo is repr('CStruct') {
    has int32     $.ai_flags;
    has int32     $.ai_family;
    has int32     $.ai_socktype;
    has int32     $.ai_protocol;
    has int32     $.ai_addrlen;
    has SockAddr  $.ai_addr       is rw;
    has Str       $.ai_cannonname is rw;
    has Addrinfo  $.ai_next       is rw;

};


