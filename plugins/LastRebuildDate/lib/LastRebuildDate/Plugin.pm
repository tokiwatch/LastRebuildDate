# $Id$

package LastRebuildDate::Plugin;

use strict;
use warnings;
use Data::Dumper;

sub plugin {
    return MT->component('LastRebuildDate');
}

sub _log {
    my ($msg) = @_;
    return unless defined($msg);
    my $prefix = sprintf "%s:%s:%s: %s", caller();
    $msg = $prefix . $msg if $prefix;
    use MT::Log;
    my $log = MT::Log->new;
    $log->message($msg) ;
    $log->save or die $log->errstr;
    return;
}

sub last_rebuild_date_pref {
    my $plugin = plugin();
    my ($blog_id) = @_;
    my %plugin_param;

    $plugin->load_config(\%plugin_param, 'blog:'.$blog_id);
    my $value = $plugin_param{last_rebuild_date_pref};
    unless ($value) {
        $plugin->load_config(\%plugin_param, 'system');
        $value = $plugin_param{last_rebuild_date_pref};
    }
    $value;
}

sub hdlr_build_file {
    my ($cb, %args) = @_;
    my %file_info = %{$args{file_info}{column_values}};

    require LastRebuildDate::Object;
    my %terms;
    $terms{fileinfo_id} = $file_info{id};
    $terms{blog_id}     = $file_info{blog_id};
    my $obj = LastRebuildDate::Object->get_by_key(\%terms);

    my @ts = MT::Util::offset_time_list( time, $file_info{blog_id});
    my $ts = sprintf '%04d%02d%02d%02d%02d%02d',
    $ts[5] + 1900, $ts[4] + 1, @ts[ 3, 2, 1, 0 ];
    $obj->modified_on($ts);

    $obj->save or die;

}

1;
