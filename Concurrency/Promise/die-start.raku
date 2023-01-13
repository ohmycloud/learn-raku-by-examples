use v6.c;

#  start statement prefix used in sink context will automatically attach an exceptions handler.
# If an exception occurs in the given code,
# it will be printed and the program will then exit, 
# like if it were thrown without any start statement prefixes involved.

# v6.d 会直接退出, 不打印
start { die }; sleep ⅓; say "hello"; # OUTPUT: «hello␤» 