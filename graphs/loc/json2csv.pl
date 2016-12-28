#!/usr/bin/perl

use JSON;
use Data::Dumper;
use POSIX qw(strftime);

my $json_data;
{ 
	local $/ = undef;
	$json_data = <>;
}

my $o = decode_json $json_data;

#print Dumper($o->{series});

# date => { code => n }
my $csv_data = {};

for my $serie (@{$o->{series}}) {
	my $name = $serie->{name};
	for my $entry (@{$serie->{data}}) {
		my $time = $entry->[0];
		my $lines = $entry->[1];
		$csv_data->{$time}->{$name} = $lines;
	}
}


print "#Date,Code,Comments,Blanks\n";
for my $time (sort { $a <=> $b } keys %$csv_data) {
	my $line = $csv_data->{$time};
	my $stime = strftime("%b %Y", localtime($time/1000));
	#my $stime = $time/1000;

	printf("%s,%i,%i,%i\n", $stime, $line->{Code}, $line->{Comments}, $line->{Blanks} );

}

