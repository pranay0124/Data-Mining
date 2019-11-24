## remove this line and change the extension to .pl before running it
#!c:/Perl/bin/perl.exe -w 
#####################################################################
# Author: Gregory Piatetsky-Shapiro, 2006
#####################################################################
## This is a basic program for parsing a web log and extracting different fields
## It provides a start for more complex programs that perform log analysis.

use strict;
if  ($#ARGV < 0) {
    print "Usage: web_log_parse.pl log_file
  log_file: raw log file

Output: parses log_file and prints a count of lines\n";
    exit;
}

my $LOG_FILE=$ARGV[0];

open LOGF, $LOG_FILE or die "Cannot open $LOG_FILE for read: $!";

my $cnt=0;
my $bad_line_cnt=0;
while (<LOGF>) {
    my $line = $_;
    if ($line =~ /^(\S+) - - \[([^:]+):(..):(..):(..) -0500\] "(GET|HEAD|POST|OPTIONS) (\S+) HTTP(\S+)" (\d\d\d) (\S+) "([^"]*)" "([^"]+)"/ ) {
       ## "
	my $ip = $1;
	my $date = $2;
	my $hh = $3;
	my $mm = $4;
	my $ss = $5;
	my $method = $6;
	my $url = $7;
	my $hver = $8;
	my $status = $9;
	my $size = $10;
        my $ref = $11;
	my $agent = $12;
	## uncomment the line below to print the log fields
	##print join " ", $ip, $date, $hh, $mm, $ss, $method, $url, $status, $size, $ref, $agent, "\n";
	$cnt++;
    } else {
	print "bad line $line\n";
	$bad_line_cnt++;
    }
}
print "successfully parsed $cnt lines in $LOG_FILE\n";
if ($bad_line_cnt > 0) {print " found $bad_line_cnt bad lines\n";}