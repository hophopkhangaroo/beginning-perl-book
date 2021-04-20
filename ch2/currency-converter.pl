use warnings;
use strict;

print "Please enter an exhange rate: ";
my $exchange_rate = <STDIN>;

print "Please enter 3 prices (USD) to convert: ";
my $price1 = <STDIN>;
my $price2 = <STDIN>;
my $price3 = <STDIN>;

chomp ($price1, $price2, $price3);

print "$price1 dollars is ", $price1*$exchange_rate, " in the other currency.\n";
print "$price2 dollars is ", $price2*$exchange_rate, " in the other currency.\n";
print "$price3 dollars is ", $price3*$exchange_rate, " in the other currency.\n";