"""
Loads the correct version of the navx_frc repository
"""

def navx_version_conf_impl(repository_ctx):
    """
    Rule for loading the specified version of the navx_frc libraries

    Args:
        repository_ctx:
    """

    version = repository_ctx.attr.version

    supported_versions = [
        "3.1.413",
        "4.0.425",
        "4.0.428",
    ]

    if version not in supported_versions:
        fail("Unsupported version " + version)

    flattened_version = "v" + version.replace(".", "_")

    build_file = Label("@navx_bazel_rules//navx_frc/from_maven/" + flattened_version + ":BUILD.bazel")
    repo_file = Label("@navx_bazel_rules//navx_frc/from_maven/" + flattened_version + ":navx.bzl")

    repository_ctx.symlink(repository_ctx.path(build_file), "BUILD.bazel")
    repository_ctx.symlink(repository_ctx.path(repo_file), "navx.bzl")

navx_version_conf = repository_rule(
    implementation = navx_version_conf_impl,
    configure = True,
    attrs = {
        "version": attr.string(mandatory = True),
    },
)

def load_navx_from_maven(version):
    navx_version_conf(name = "local_navx", version = version)
