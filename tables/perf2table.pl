#!/usr/bin/perl

use utf8;
use common::sense;

my $c = 20;

print "\\begin{tabular}{|c|l|l|}";
print "\\hline Overhead & Cmd/Object & Symbol \\\\  \\hline\n\\hline";
while (<>) {
	next if /^#/;
	last if ($c-- == 0);
	chomp;
	s/ +/ /g;
	s/%/\\%/g;
	s/_/\\_/g;
	s/lto1-//;
	s/-....\.so//;
	my @a = split / +/,$_,6;
	print join(" & ", "\$$a[1]\$", "\\tt $a[2]\\hfill/$a[3]", "\\tt $a[5]")."\\\\\n\\hline ";
}
print "\\end{tabular}";
