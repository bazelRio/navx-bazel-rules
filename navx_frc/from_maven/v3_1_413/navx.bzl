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
    deps.append(("navx-navx-java", "com.kauailabs.navx.frc:navx-java:3.1.413", "4246ad3205d59d56aa6e67c1255afe2c7eb9fc02b0bf464a4275ae119ecbe877"))

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
        "3.1.413",
        "https://repo1.maven.org/maven2/com/kauailabs/navx/frc",
        "f507886ca59e3bd618d2c3a0ded825700265bc25671a72987a6b544932a35074",
        [
            ("linuxathena", "d8448619d8b16a35c8137dcc7606edbf1a385594f99fffa3b4806e7600370240"),
            ("windowsx86-64", "8b02b40c9babf0f28ebeb89ebe2c791f77efcb7b332f563de2e042aa4650ff08"),
        ],
        static_only = True,
        prefix = "navx-",
    )

    wpilib_java_vendor_library(
        vendor_name = "navx-java-native",
        url = "https://repo1.maven.org/maven2",
        version = "3.1.413",
        java_deps = [],
        jni_deps = [
        ],
    )
