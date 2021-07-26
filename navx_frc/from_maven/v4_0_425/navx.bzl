"""
Auto-generated rules for navx
"""

load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_java_vendor_library", "wpilib_native_dependency")
load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def third_party_navx():
    __third_party_navx_native()
    return __third_party_navx_java()

def __third_party_navx_java():
    repository_url = "https://repo1.maven.org/maven2"

    deps = []
    deps.append(("navx-navx-java", "com.kauailabs.navx.frc:navx-java:4.0.425", "e7063e6ae04c7f5b1f55455b1fe534ee155fce7bf22adec462f24d516298330d"))

    for name, artifact, sha in deps:
        jvm_maven_import_external(
            name = name,
            artifact = artifact,
            artifact_sha256 = sha,
            server_urls = [repository_url],
        )

    artifacts = []

    return artifacts, []

def __third_party_navx_native():
    wpilib_native_dependency(
        "navx-cpp",
        "4.0.425",
        "https://repo1.maven.org/maven2/com/kauailabs/navx/frc",
        "6482edc027dff06570e81747ff87aa8369b302122c38530b0cab0d2c11e83f80",
        [
            ("linuxathena", "a194cc44434733494cb92cd6d7f557b46bf6a4934e3381f2884f010481b4e263"),
            ("windowsx86-64", "8fd6e0c9a6aec8e67451e4f3a5ace597def6c6e60d3f6d51dcc403f04a8a4d3d"),
        ],
        static_only = True,
        prefix = "navx-",
    )

    wpilib_java_vendor_library(
        vendor_name = "navx-java-native",
        url = "https://repo1.maven.org/maven2",
        version = "4.0.425",
        java_deps = [],
        jni_deps = [
        ],
    )
