"""
Auto-generated rules for navx
"""

load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_java_vendor_library", "wpilib_native_dependency")

def third_party_navx():
    __third_party_navx_native()
    return __third_party_navx_java()

def __third_party_navx_java():
    artifacts = [
        "com.kauailabs.navx.frc:navx-java:4.0.425",
    ]

    repositories = ["https://repo1.maven.org/maven2"]

    return artifacts, repositories

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
