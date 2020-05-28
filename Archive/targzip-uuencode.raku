#!/usr/bin/env perl6

use Archive::Libarchive::Raw;
use Archive::Libarchive::Constants;

sub archiver(@filei, $fileo)
{
  my archive $a = archive_write_new;
  archive_write_set_format_by_name($a, 'gnutar');
  archive_write_add_filter_by_name($a, 'gzip');
  archive_write_add_filter_by_name($a, 'uuencode');
  archive_write_open_filename($a, $fileo);
  for @filei -> $file {
    my archive_entry $entry = archive_entry_new;
    archive_entry_set_pathname($entry, $file);
    archive_entry_set_size($entry, $file.IO.s);
    archive_entry_set_filetype($entry, AE_IFREG);
    archive_entry_set_perm($entry, 0o644);
    archive_write_header($a, $entry);
    my $fh = open $file, :r;
    while my $buffer = $fh.read(8192) {
      archive_write_data($a, $buffer, $buffer.bytes);
    }
    $fh.close;
    archive_entry_free($entry);
  }
  archive_write_close($a);
  archive_write_free($a);
}

sub MAIN($fileo! where { ! .IO.f || die "file '$fileo' already present" },
         *@filei where { $_.all ~~ .IO.f || die "One of ( $_ ) not found" } )
{
  archiver(@filei, $fileo);
}