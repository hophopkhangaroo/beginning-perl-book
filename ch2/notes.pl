# Scalars are single valued items

# -- Number systems --

# 0 for octal
# 0b for binary
# 0x for hex

# Single quotes ' do not interpolate (variables do not
#   evaluate to their values and no escaping needed)
# Double quotes do interpolate so you need to escape (backslash)
# Can use q// and qq// for single and double quotes respectively
# Can use any nonalphabetic nonnumeric delimiter instead of /
# Can also use {} () <> []

# here-documents can be used to write a long string
print<<EOF;

This is a here-document. It starts on the line after the two arrows,
and it ends when the text following the arrows is found at the beginning
of a line, like this:

EOF

# A here doc must start with << and then a label. 
# By default acts as double quotes but if you want single quote
# then surround label with single quotes.

# Numbers in decimals as strings will get converted for you automatically
# But for octal or hex, need oct() and hex() functions
# No binary function but can use oct(), will get same answer

# -- Binary Operations --
# & - returns 1 if 1 and 1; 0 else
# | - returns 0 only if 0 and 0
# ^ - exclusive or
# ~ - replace 1s with 0s, vice versa

# <=> returns -1 if left number is smaller, 0 if equal, 1 if right side is
# bigger
print "Compare six and nine: ", 6 <=> 9, "\n";

# Boolean operators: && || !

# -- String Operators --

# Concatenation operator - use full stop . 
print "Print ", "several ", "strings ", "here", "\n";
print "Print " . "one " . "string " . "here" . "\n";
# Will automatically convert numbers to string

# repetition operator - marked with x. Repeats a string a given number of times
print "GO! "x3, "\n";

# --- String Comparison ---

# ord() gives ASCII value of a character
# lt - less than
# gt - greater than
# eq - equal
# ne - not equal
# ge - greater than or equal
# le - less than or equal
# cmp - three-way comparison
print"Which came first, the chicken or the egg? ";
print "chicken" cmp "egg", "\n";
print "Are dogs greater than cats? ";
print "dog" gt "cat", "\n";
print "Is ^ less than + ? ";
print "^" lt "+", "\n";

# --$variable then they act before everything else
# $variable++ act after
$a=4;
$b=10;
print "Our variables are ", $a, " and ", $b, "\n";
$b=$a++;
print "After incrementing, we have ", $a, " and ", $b, "\n";
$b=++$a*2;
print "Now, we have ", $a, " and ", $b, "\n";
$a=--$b+4;
print "Finally, we have ", $a, " and ", $b, "\n";

# Multiple assignments
$d = $c = $b = $a = 1;
print "$a $b $c $d\n";

# doesnt work. Only assigns 4 to $a and the rest are undef
($a, $b, $c, $d) = 4;
print "$a $b $c $d\n";

# this works
($a, $b, $c, $d) = (5) x4;
print "$a $b $c $d\n";

# -- Scope --

# When we declare variables without any words, it is implicitly a global variable
# So they can be accessed from anywhere in the program
# This is generally a bad idea and using "use strict" will prevent you 
# from implicitly defining a global variable.
# Among other things, it makes sure you declare all of your variables

# The keyword 'my' creates a new lexical variable and limits scope of 
# the variable to local block or the file if not inside a block
$record = 4;
print "We're at record ", $record, "\n";

{
    my $record;
    $record = 7;
    print "Inside the block, we're at record ", $record, "\n";
}

print "We're still at record ", $record, "\n";

# The keyword 'our' declares a global variable

# Variable name must start with letter or _
# Cannot have -
# $_ is called default variable which a lot of functions read from and 
# write to if no other variable is given
# scalar variable names prefixed by $, arrays with @, and hashes with %

# Interpolation happens for scalars and arrays but not hashes

# -- User Input --

# <STDIN> reads from a file called standard input
# not really a file though but the user's keyboard
# Similarly, the print function by default writes to the file called
# standard output which is usually the user's screen
print "Please enter something interesting\n";
$comment = <STDIN>;
print $comment, "\n";