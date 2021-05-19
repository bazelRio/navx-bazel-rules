"""
Auto-generated rules for navx
"""

load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_java_vendor_library", "wpilib_native_dependency")

def third_party_navx():
    __third_party_navx_native()
    return __third_party_navx_java()

def __third_party_navx_java():
    artifacts = [
        "com.kauailabs.navx.frc:navx-java:4.0.416",
    ]

    repositories = ["https://repo1.maven.org/maven2"]

    return artifacts, repositories

def __third_party_navx_native():
    wpilib_native_dependency(
        "navx-cpp",
        "4.0.416",
        "https://repo1.maven.org/maven2/com/kauailabs/navx/frc",
        "6482edc027dff06570e81747ff87aa8369b302122c38530b0cab0d2c11e83f80",
        [
            ("linuxathena", "8fff590713097d8ab67544712f0d865ea28e3b38aa1f10708ef087b9ebc00a65"),
            ("windowsx86-64", "c1834b0eb551873257a137b534811876ccdf4ac910a3eb01e3d9673bec6dd6d4"),
        ],
        static_only = True,
        prefix = "navx-",
    )

    wpilib_java_vendor_library(
        vendor_name = "navx-java-native",
        url = "https://repo1.maven.org/maven2",
        version = "4.0.416",
        java_deps = [],
        jni_deps = [
        ],
    )
