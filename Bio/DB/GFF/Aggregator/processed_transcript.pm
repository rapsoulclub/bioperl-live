=head1 NAME

Bio::DB::GFF::Aggregator::processed_transcript -- Sequence Ontology Transcript

=head1 SYNOPSIS

  use Bio::DB::GFF;

  # Open the sequence database
  my $db      = Bio::DB::GFF->new( -adaptor => 'dbi:mysql',
                                   -dsn     => 'dbi:mysql:elegans42',
				   -aggregator => ['processed_transcript'],
				 );

 ------------------------------------------------------------------------
 Aggregator method: processed_transcript
 Main method:       mRNA
 Sub methods:       CDS 5'-UTR 3'-UTR transcription_start_site polyA_site
 ------------------------------------------------------------------------

=head1 DESCRIPTION

Bio::DB::GFF::Aggregator::so_gene is one of the default aggregators,
and was written to be compatible with the Sequence Ontology canonical
gene.  It aggregates raw "CDS", "5'-UTR", "3'-UTR",
"transcription_start_site" and "polyA_site" features into "gene"
features.  The UTRs may also be named "untranslated_region,"
"five_prime_untranslated_region," or
"three_prime_untranslated_region."

=cut

package Bio::DB::GFF::Aggregator::processed_transcript;

use strict;
use Bio::DB::GFF::Aggregator;

use vars qw($VERSION @ISA);
@ISA = qw(Bio::DB::GFF::Aggregator);

$VERSION = '0.10';

=head2 method

 Title   : method
 Usage   : $aggregator->method
 Function: return the method for the composite object
 Returns : the string "gene"
 Args    : none
 Status  : Public

=cut

sub method { 'processed_transcript' }

=head2 part_names

 Title   : part_names
 Usage   : $aggregator->part_names
 Function: return the methods for the sub-parts
 Returns : the list CDS 5'-UTR 3'-UTR transcription_start_site polyA_site
 Args    : none
 Status  : Public

=cut

sub part_names {
  return qw(CDS 5'-UTR 3'-UTR transcription_start_site 
	    polyA_site UTR five_prime_untranslated_region
	    three_prime_untranslated_region);
}

=head2 main_name

 Title   : main_name
 Usage   : $aggregator->main_name
 Function: return the method for the main component
 Returns : the string "mRNA"
 Args    : none
 Status  : Public

=cut

sub main_name {
  return 'mRNA';
}

1;
__END__

=head1 BUGS

None reported.


=head1 SEE ALSO

L<Bio::DB::GFF>, L<Bio::DB::GFF::Aggregator>

=head1 AUTHOR

Lincoln Stein E<lt>lstein@cshl.orgE<gt>.

Copyright (c) 2001 Cold Spring Harbor Laboratory.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

