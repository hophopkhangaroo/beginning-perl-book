use warnings;
use strict;

my $valid_num = 0;
print "Please enter an integer less than 256: ";
chomp(my $num = <STDIN>);
while ($num >= 256 || $num < 0) {
    print "Please enter a valid integer less than 256: ";
    chomp($num = <STDIN>);
}

my $bin_num = "";
my @bin_mults = (1,2,4,8,16,32,64,128,256);
for my $mult (@bin_mults) {
    if ($mult & $num) {
        $bin_num = "1".$bin_num;
    } else {
        $bin_num = "0".$bin_num;
    }
}

print "Your number in binary is: $bin_num";