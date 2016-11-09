use strict;
use Date;
use v5.10;
use Test::More tests=>8;

sub diff_day {
  my $date1 = Date->new($_[0]);
  my $date2 = Date->new($_[1]);
  ok($date1->difference_day($date2) eq $_[2], 'difference_day');
}

my $date1 = Date->new('31.12.2016');
$date1->add_day(1);
my $date2 = Date->new('1.1.2017');
is_deeply($date1, $date2, 'add_day');

$date1->add_day(365);
ok($date1->get_date() eq '1.1.2018', 'add_day');

my $date3 = Date->new('29.2.2016');
ok($date3->get_weekday() eq 'monday', 'weekday');

$date3->add_day(1);
ok($date3->get_weekday() eq 'tuesday', 'weekday');

my $date4 = Date->new('31.10.2016');
$date4->add_month(1);
ok($date4->get_date() eq '30.11.2016', 'add_month');

my $date5 = Date->new('29.2.2012');
$date5->add_year(1);
ok($date5->get_date() eq '28.2.2013', 'add_year');

$date1 = Date->new('31.12.2016');
$date2 = Date->new('1.1.2017');
ok($date1->difference_day($date2) eq '1', 'difference_day');

$date1 = Date->new('1.3.1');
$date2 = Date->new('1.3.10');
ok($date1->difference_month($date2) eq '108', 'difference_month');

$date1 = Date->new('1.1.2017');
$date2 = Date->new('31.12.2016');
ok($date1->difference_day($date2) eq '1', 'difference_day');

diff_day('1.1.2017', '31.12.2016', '1');

$date1 = Date->new('1.1.2017');
$date1->add_day(-1);
ok($date1->get_date() eq '31.12.2016', 'add_day');

$date1 = Date->new('31.10.2017');
$date1->add_month(-1);
ok($date1->get_date() eq '30.9.2017', 'add_month');


$date1 = Date->new('31.10.2017');
$date1->add_year(-100);
ok($date1->get_date() eq '31.10.1917', 'add_year');
