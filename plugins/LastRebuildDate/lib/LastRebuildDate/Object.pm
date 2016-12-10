# $Id$

package LastRebuildDate::Object;
use warnings;
use strict;
use Carp;
use MT::Object;
use base qw( MT::Object );

__PACKAGE__->install_properties ({
    column_defs => {
        'id' => 'integer not null auto_increment',
        'blog_id' => 'integer not null',
        'fileinfo_id' => 'integer not null',
    },
    indexes => {
    },
    datasource => 'last_rebuild_date',
    audit => 1,
    primary_key => 'id',
    child_of    => 'MT::FileInfo',
});

1;

__END__
