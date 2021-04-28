# define lists within parentheses
# print is a list operator. ie, it takes in lists as arguments
# and the parentheses can be ommitted
# lists are sequences of scalars

# When lists are made of entirely single words, can use qw// operator
# The following lists are identical:
('one', 'two', 'three', 'four')
qw/one two three four/
qw(one two three four)
qw<one two three four>
qw{one two three four}
qw[one two three four]
qw|one two three four|
qw(
    one
    two
    three
    four
)
# Note, perl automatically flattens lists. That means a list inside a list is no 
# longer a list. The following are identical:
(3, 8, 5, 15)
((3, 8), (5, 15))
(3, (8, 5), 15)
# we will see how to store lists inside of other lists in ch7 when we talk about references
my $month = 3;
print qw(
    January     February    March
    April       May         June
    July        August      September
    October     November    December
)[$month];
# Note: qw allows us to use arbitrary whitespace to make code look neater
# @list[2.9] gives us @list[2] since perl always rounds down
# negative indices go backwards

# list slice: (19, 68, 47, 60, 53, 51, 58, 55, 47)[4, 5, 6]
# ($mone, $mtwo) = ($mtwo, $mone); this switches because perl builds on right first
# and then assigns to left

# --- Ranges ---
# This is a list of the numbers 1 to 6:
(1 .. 6)
# Similarly for letters 
('a' .. 'k')
# Can use reverse to count backwards 
reverse(1 .. 6)
# The following returns March through September
(qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[2..8])
# can also mix ranges and literals
(qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)[0,3,7..11])

# --- ARRAYS ---
# variable name start with @
my @days = qw(Monday Tuesday Wednesday Thursday Friday Saturday Sunday);
#This way prints @days with no spaces in between
print @days, "\n";
# This way has spaces in between (interpolation adds spaces between each element)
print "@days";
# an array in a list context returns the list of its elements
# an array in a scalar context returns the length of the array
print @array1; # list context because print accepts lists
$scalar1 = @array1; # scalar context
# force into scalar context
print scalar @array1;

# we could access all elements of array like so 
my $scalar1; my $scalar2; my $scalar3;
($scalar1, $scalar2, $scalar3) = @array;
# but if we want only one element, then use 
$a = $array[0];
# notice that we prefix array with $. In general, we prefix what we expect to get, not what we actually have


# Accessing Multiple Elements
# Like how we did with lists but now we need to preface with an @ since 
# we will be returning another array
my @array = qw(Jan Feb Mar May Apr Jun Jul Aug Sep Oct Nov Dec);
print @array[3,5,7..9];

# swap two array elements
@months[3,4] = @months[4,3];

# Running through Arrays
my @array = qw(America Asia Europe Africa);
my $element;
for $element (@array) {
    print $element, "\n";
}
# $element is the iterator variable that we give for the for loop
# if an iterator is not given, then $_ is used as default
# Here is how we would double the contents of an array
for (@array) { $_*=2; }

# This gives us a list from 0 to the index of the highest element 
# in the @questions array
(0..$#questions)
# See joke2.pl to see this used in a for loop

# Array Functions
reverse(@array) # returns the array in reverse order
# push and pop adds and removes last element of array respectively
# example:
my $item;
my @array;
$item = pop @array; # removes last item from array and returns it, sets it to $item
push @array, "another item"; # adds the string "another item" to end of array
# unshift and shift do what push and pop does for the first element
# sort sorts an array and can take arguments as to how it should be sorted
my @string = sort { $a cmp $b } @unsorted;
print "String sort:  @string\n";
my @number = sort { $a <=> $b } @unsorted;
print "Numeric sort:  @number\n";

# ----- HASHES ------
# Dictionaries pretty much.
%hash;
%where=(
    "Gary"     , "Dallas",
    "Lucy"     , "Exeter",
    "Ian"      , "Reading",
    "Samantha" , "Oregon"
);
# Can use alternate syntax to make the relationship clearer
%where=(
    Gary     => "Dallas",
    Lucy     => "Exeter",
    Ian      => "Reading",
    Samantha => "Oregon"
);
# Left side is called hash key. RIght is its value
# Hash keys must be unique
# Convert array to hash:
@array = qw(Gary Dallas Lucy Exeter Ian Reading Samantha Oregon);
%where = @array;
# Then back to array
@array = %where;
# Warning: hashes do not have order so when converting to array, might be different order
# Can turn hash around with reverse. Be careful that none of your values are 
# identical. Otherwise, some will be overwritten when they become keys
# These two do the same thing:
%who = reverse @array;
%who = (
    Oregon  => "Samantha",
    Reading => "Ian",
    Exeter  => "Lucy",
    Dallas  => "Gary"
);

# working with hash values
# Use curly braces to access values by key {}
print "Gary lives in ", $where{Gary}, "\n";

# Adding, Changing, and Taking Values Away from a Hash
# This adds Eva to the hash. Same syntax to reassign
$where{Eva} = "Uxbridge";
# Use delete() to remove an entry from a hash
delete $where{Lucy};

# Accessing Multiple Values
keys (%hash) #returns a list of the keys
# So to loop over hash by key, do 
for (keys %where) {
    print "$_lives in $where{$_}\n";
}
values (%hash) # returns a list of values
# the keyword "each" will be looked at later
