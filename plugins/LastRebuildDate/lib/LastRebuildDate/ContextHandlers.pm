# $Id$

package LastRebuildDate::ContextHandlers;

use strict;
use warnings;


#----- Tags
sub hdlr_tag {
    my ($ctx, $args) = @_;
    my $return;
    if ($args->{blog_id}){
        my $blog_id = $args->{blog_id} ;
        my %terms;
        my %params;
        $terms{blog_id} = $blog_id;
        $params{sort} = 'modified_on';
        $params{direction} = 'descend';
        $params{limit} = 1;
        require LastRebuildDate::Object;
        my $fileinfo = LastRebuildDate::Object->load(\%terms,\%params);

        my $format;
        if ($args->{'format'}){
            $format = $args->{'format'};
        }
        else {
            $format = "%b. %e, %Y";
        }
        use MT::Util qw( format_ts );
        $return = format_ts($format,$fileinfo->modified_on);
    }
    return $return;
}


1;
