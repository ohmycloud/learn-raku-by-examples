use v6.d;

# Don't sink 
my $ = start { die }; sleep ⅓; say 'hello';

# Catch yourself
start { die; CATCH { default { say " catched!!!" } }}; sleep ⅓; say 'hello';