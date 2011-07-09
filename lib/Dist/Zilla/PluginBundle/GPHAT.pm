package Dist::Zilla::PluginBundle::GPHAT;
use Moose;

with 'Dist::Zilla::Role::PluginBundle::Easy';

# ABSTRACT: Dist::Zilla plugins for gphat

=head1 DESCRIPTION

This is the plugin bundle that GPHAT uses.  It's equivalent to:

    [@Basic]

    [Git::NextVersion]
    first_version   = 0.01
    version_regexp  = ^(\d+\.\d+)$

    [ReadmeMarkdownFromPod]

    [PkgVersion]

    [AutoPrereqs]

    [NextRelease]
    format          = %v %{MMM d yyyy}d

    [SynopsisTests]

    [PodSyntaxTests]

    [MetaJSON]

    [GithubMeta]

    [CopyFilesFromBuild]
    copy            = README.mkdn

    [PruneFiles]
    filenames       = dist.ini

    [Git::Commit]

    [Git::Tag]
    tag_format      = %v

    [PodWeaver]

=cut

sub configure {
    my ($self) = @_;

    $self->add_bundle('@Basic');

    $self->add_plugins([
        'Git::NextVersion' => {
            first_version  => '0.01',
            version_regexp => '^(\d+\.\d+)$'
        }
    ]);

    $self->add_plugins(qw(
        ReadmeMarkdownFromPod
        PkgVersion
        AutoPrereqs
    ));

    $self->add_plugins([
        'NextRelease' => {
            format => '%v %{MMM d yyyy}d'
        }
    ]);

    $self->add_plugins(qw(
        SynopsisTests
        PodSyntaxTests
        MetaJSON
        GithubMeta
    ));

    $self->add_plugins([
        'CopyFilesFromBuild' => {
            format => 'README.mkdn'
        }
    ]);
    
    $self->add_plugins([
        'PruneFiles' => {
            filenames => qw(dist.ini weaver.ini)
        }
    ]);

    $self->add_plugins(qw(Git::Commit));

    $self->add_plugins([
        'Git::Tag' => {
            tag_format => '%v'
        }
    ]);

    $self->add_plugins(qw(PodWeaver));
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;
