use warnings;
use strict;

print "Please enter a number in hexadecimal: ";
chomp(my $hex_num = <STDIN>);
print "Your number in decimal is ", hex($hex_num), "\n";

print "Please enter a number in octal: ";
chomp(my $oct_num = <STDIN>);
print "Your number in decimal is ", oct($oct_num);

