"""
Loads the correct version of the navx_frc Libraries
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def navx_version_conf_impl(repository_ctx):
    """
    Rule for loading the specified version of the navx libraries.

    Args:
        repository_ctx:
    """

    build_file = Label("@navx_bazel_rules//navx_frc/from_source:BUILD.bazel")
    repo_file = Label("@navx_bazel_rules//navx_frc/from_source:navx.bzl")

    repository_ctx.symlink(repository_ctx.path(build_file), "BUILD.bazel")
    repository_ctx.symlink(repository_ctx.path(repo_file), "navx.bzl")

navx_version_conf = repository_rule(
    implementation = navx_version_conf_impl,
    configure = True,
)

def load_navx_from_source(local_repository_path = None, git_repository_args = None):
    if local_repository_path and git_repository_args:
        fail("Only one type of source repository can be used, local or a git remote ")

    if local_repository_path:
        print("Cloning...")
        native.local_repository(
            name = "navx",
            path = local_repository_path,
        )
    elif git_repository_args:
        git_repository(
            name = "navx",
            **git_repository_args
        )
    else:
        fail("You must specify an argument")

    navx_version_conf(name = "local_navx")
