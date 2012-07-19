package t;

use strict;
no warnings;

use base 'Attribute::Exporter';

use constant test8 => 'test8';
use constant test9 => 'test9';

__PACKAGE__->export_constant(\&test8);
__PACKAGE__->export_constant('test9');

our $test5 :export_ok = 'test5';
our $test6 = 'test6';
our $test7 :export_ok = qr/foo/;

sub test1 :export_def {
  return 'test1';
}

sub test2 :export_ok {
  return 'test2';
}

sub test3 {
  return 'test3';
}

sub test4 :export_ok {
  return $_[0];
}

sub redefine {
  my ($class, $type, $dest, $src) = @_;

  no strict 'refs';
  if ($type eq 'CODE') {
    *{"t::${dest}"} = \&{"t::${src}"};
  } elsif ($type eq 'SCALAR') {
    *{"t::${dest}"} = \${"t::${src}"};
  }
  use strict;
}

1;
