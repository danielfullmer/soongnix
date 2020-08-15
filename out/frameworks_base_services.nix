{ cc_library_shared, java_library }:
let

#  merge all required services into one jar
#  ============================================================
services = java_library {
    name = "services";
    installable = true;

    dex_preopt = {
        app_image = true;
        profile = "art-profile";
    };

    srcs = [
        "java/com/android/server/SystemServer.java"
    ];

    #  The convention is to name each service module 'services.$(module_name)'
    static_libs = [
        "services.core"
        "services.accessibility"
        "services.appprediction"
        "services.appwidget"
        "services.autofill"
        "services.backup"
        "services.companion"
        "services.contentcapture"
        "services.contentsuggestions"
        "services.coverage"
        "services.devicepolicy"
        "services.midi"
        "services.net"
        "services.print"
        "services.restrictions"
        "services.startop"
        "services.systemcaptions"
        "services.usage"
        "services.usb"
        "services.voiceinteraction"
        "android.hidl.base-V1.0-java"
    ];

    libs = [
        "android.hidl.manager-V1.0-java"
    ];

    #  Uncomment to enable output of certain warnings (deprecated, unchecked)
    # javacflags: ["-Xlint"],

};

#  native library
#  =============================================================

libandroid_servers = cc_library_shared {
    name = "libandroid_servers";
    defaults = ["libservices.core-libs"];
    whole_static_libs = ["libservices.core"];
};

in { inherit libandroid_servers services; }
