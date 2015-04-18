#!/usr/bin/perl

use strict;
use warnings;

use File::Slurp;

# Simple text cleanup code
# Usage - ./prog_name file_name

# 1. Remove duplicates
# 2. Sort output lines
# 3. Get parent dir

sub remove_dups_and_sort {
	my %seen = ();
	map {$seen{$_} = 1} @{$_[0]};
	
	return [sort keys %seen];
}

sub get_parent_dir {
	return [map {@_ = split('/', $_); join('/', @_[0..$#_ -1])} @{$_[0]}];
}


my @input = map{chomp; $_} read_file($ARGV[0]);

@input = @{remove_dups_and_sort(\@input)};
@input = @{get_parent_dir(\@input)};
@input = @{remove_dups_and_sort(\@input)};

map {print $_."\n"} @input;