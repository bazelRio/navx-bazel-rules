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
    deps.append(("navx-navx-java", "com.kauailabs.navx.frc:navx-java:4.0.428", "076765ec25be525025c8b6ca768068bd10694fc461bd34d23b03180853227161"))

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
        "4.0.428",
        "https://repo1.maven.org/maven2/com/kauailabs/navx/frc",
        "6482edc027dff06570e81747ff87aa8369b302122c38530b0cab0d2c11e83f80",
        [
            ("linuxathena", "611a7bca53648b47276b8bfe17629f44a3f4ca9ff1a6c0f9748fe52c76262885"),
            ("windowsx86-64", "1fd92748b4ff1fe39e587041dfe3843b3f0aac01b6ac07a11a278ec9506512f3"),
        ],
        static_only = True,
        prefix = "navx-",
    )

    wpilib_java_vendor_library(
        vendor_name = "navx-java-native",
        url = "https://repo1.maven.org/maven2",
        version = "4.0.428",
        java_deps = [],
        jni_deps = [
        ],
    )
