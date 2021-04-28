use warnings;
use strict;

# Interesting
#my @array1 = ('a0'..'b9');
#print "@array1";

# Phone number data
my %phone_numbers = (
    Khang => "555-5555",
    Jack => "555-1234",
    Kyle => "555-6542"
);

my $name;
my $answer;
my $quit = 1;

print "Here are all the people in my phone book:\n";
for (keys %phone_numbers) {
    print $_ , "\n";
}

do {
    print "Whose phone number would you like to lookup? ";
    $name = <STDIN>;
    chomp $name;

    print "$name\'s phone number is $phone_numbers{$name}!\n";
    print "Would you like to look up another phone number? (y/n) ";
    $answer = <STDIN>;
    chomp $answer;
    if ($answer eq "n") {$quit = 0;}
} while $quit;

