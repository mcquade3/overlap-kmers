#!/usr/local/bin/perl
# Mike McQuade
# Overlap.pl
# Creates an overlap graph given a list of k-mers.

# Define the packages to use
use strict;
use warnings;

# Initialize variables
my (@kmers,%overlap);

# Open the file to read
open(my $fh,"<ba3c.txt") or die $!;

# Read in the values from the file
while (my $line = <$fh>) {
	chomp($line);
	push @kmers,$line;
}

# Map each k-mer with a matching suffix to a k-mer with a matching prefix
for (my $i = 0; $i < scalar(@kmers); $i++) {
	for (my $j = 0; $j < scalar(@kmers); $j++) {
		if (substr($kmers[$i],1) eq substr($kmers[$j],0,-1)) {
			$overlap{$kmers[$i]} = $kmers[$j];
		}
	}
}

# Print out the graph
foreach my $key (sort keys %overlap) {
	print "$key -> $overlap{$key}\n";
}

# Close the file
close($fh) || die "Couldn't close file properly";