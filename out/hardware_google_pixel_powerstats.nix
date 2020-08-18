{ cc_library_static }:
let

libpixelpowerstats = cc_library_static {
    name = "libpixelpowerstats";
    vendor_available = true;
    export_include_dirs = ["include"];

    srcs = [
        "PowerStats.cpp"
        "PowerStatsUtils.cpp"
        "GenericStateResidencyDataProvider.cpp"
        "WlanStateResidencyDataProvider.cpp"
        "AidlStateResidencyDataProvider.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "android.hardware.power@1.1"
        "android.hardware.power.stats@1.0"
        "pixelpowerstats_provider_aidl_interface-cpp"
        "liblog"
        "libbinder"
    ];
};

in { inherit libpixelpowerstats; }
