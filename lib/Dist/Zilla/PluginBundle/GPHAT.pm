package Dist::Zilla::PluginBundle::GPHAT;
use Moose;

# ABSTRACT: Dist::Zilla plugins for gphat

=head1 DESCRIPTION

This is my preferred Dist::Zilla setup.  It's equivalent to:

    [@Basic]

    [Git::NextVersion]
    first_version   = 0.01
    version_regexp  = ^(\d+\.\d+)$

    [ReadmeMarkdownFromPod]

    [PkgVersion]

    [AutoPrereqs]

    [Prereqs]
    JSON::Any       = 0
    JSON::XS        = 0

    [NextRelease]
    format          = %v %{MMM d yyyy}d

    [SynopsisTests]

    [PodSyntaxTests]

    [MetaJSON]

    [MetaResources]
    repository.url  = https://github.com/gphat/data-verifier
    repository.type = git

    [CopyFilesFromBuild]
    copy            = README.mkdn

    [PruneFiles]
    filenames       = dist.ini

    [Git::Commit]

    [Git::Tag]
    tag_format      = %v

    [PodWeaver]

=cut

1;
