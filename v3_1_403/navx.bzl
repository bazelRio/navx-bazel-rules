"""
Auto-generated rules for navx
"""

load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_java_vendor_library", "wpilib_native_dependency")

def third_party_navx():
    __third_party_navx_native()
    return __third_party_navx_java()

def __third_party_navx_java():
    artifacts = [
        "com.kauailabs.navx.frc:navx-java:3.1.403",
    ]

    repositories = ["https://repo1.maven.org/maven2"]

    return artifacts, repositories

def __third_party_navx_native():
    wpilib_native_dependency(
        "navx-cpp",
        "3.1.403",
        "https://repo1.maven.org/maven2/com/kauailabs/navx/frc",
        "430bd89ea01e2a946c616e15555e44437379e80e820feacc140976bee135e211",
        [
            ("linuxathena", "3b4aab28f056108c57ae2f88884396468636eb4f33b80ab97275900d13229b18"),
            ("windowsx86-64", "ceb3d65cf02b006d1fe3994cb5b3984b4b1721ca735e1a51380fffef41f64500"),
        ],
        static_only = True,
        prefix = "navx-",
    )

    wpilib_java_vendor_library(
        vendor_name = "navx-java-native",
        url = "https://repo1.maven.org/maven2",
        version = "3.1.403",
        java_deps = [],
        jni_deps = [
        ],
    )
