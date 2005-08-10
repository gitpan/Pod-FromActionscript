#!/usr/bin/perl

use warnings;
use strict;

BEGIN
{
   use Test::More tests => 3;
   use_ok("Pod::FromActionscript", "asdoc2pod");
}

my $out;
asdoc2pod(in => "", out => \$out);
is($out, "", "empty input");

my $in = <<'EOF';
/**
* Foo - The Foo class
*
* Synopsis:
*     import Foo;
*     var foo:Foo = new Foo();
* 
* @license
* 
* WTFPL - http://sam.zoy.org/wtfpl/
* 
* @author Joe Blow <joe@example.com>
*/
class Foo {
}
EOF

my $expect = <<'EOF';
=head1 NAME

Foo - The Foo class

=head1 DESCRIPTION

Synopsis:
    import Foo;
    var foo:Foo = new Foo();

=head1 LICENSE

WTFPL - http://sam.zoy.org/wtfpl/

=head1 AUTHOR

Joe Blow <joe@example.com>

EOF

asdoc2pod(in => $in, out => \$out);
is($out, $expect, "full example");
