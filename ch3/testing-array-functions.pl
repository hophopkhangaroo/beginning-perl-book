use warnings;
use strict;

my @my_array = (0..10);
print "@my_array\n";
reverse(@my_array);
print "@my_array\n";

#Looks like reverse retunrs a new array instead of altering the argument array