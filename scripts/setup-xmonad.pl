#!/usr/bin/env perl

use strict;
use warnings;
use feature ':5.10';

use Path::Class;
use Carp qw(confess);

my $home = dir($ENV{HOME});
confess "NO HOMEDIR!?" unless -d $home;

my $dotdir = $home->subdir("config");
confess "$dotdir does not exist" unless -e -d $dotdir;

my @files = (
  {
    original => $dotdir->file('xmonad', 'xmonad.start'),
    dest => Path::Class::File->new('/', 'usr','local','bin','xmonad.start'),
  },
  {
    original => $dotdir->file('xmonad', 'xmonad.desktop'),
    dest => Path::Class::File->new(
      '/',
      'usr',
      'share',
      'xsessions',
      'xmonad-extended.desktop'
    ),
  }
);

file:
foreach  my $file (@files)
{
  no warnings 'exiting';
  given ($file->{dest}) {
    when ( -l $_ ) {
      my $link = file(readlink $_);
      if ($link->absolute ne $_->absolute) {
        say {*STDERR} "warning: destination link '$_' exists, ".
          "but points to the wrong place. (should point to $file->{original}, ".
          "points to $link).";
      }
      next file;
    }
    when ( -e $_ ) {
      say {*STDERR} "warning: destination link '$_' exists as a regular file!";
      next file;
    }
  }
  say "linking $file->{original} to $file->{dest}";
  symlink $file->{original}, $file->{dest} 
    or say {*STDERR} "Error linking $file->{original} to $file->{dest}: $!";
}
