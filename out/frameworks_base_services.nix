{ cc_library_shared, droidstubs, filegroup, java_defaults, java_library, platform_compat_config }:
let

services_defaults = java_defaults {
    name = "services_defaults";
    plugins = [
        "error_prone_android_framework"
    ];
};

services-main-sources = filegroup {
    name = "services-main-sources";
    srcs = [
        "java/com/android/server/SystemConfigService.java"
        "java/com/android/server/SystemServer.java"
    ];
    path = "java";
    visibility = ["//visibility:private"];
};

services-all-sources = filegroup {
    name = "services-all-sources";
    srcs = [
        ":services.core-sources"
        ":services.accessibility-sources"
        ":services.appprediction-sources"
        ":services.appwidget-sources"
        ":services.autofill-sources"
        ":services.backup-sources"
        ":backuplib-sources"
        ":services.companion-sources"
        ":services.contentcapture-sources"
        ":services.contentsuggestions-sources"
        ":services.coverage-sources"
        ":services.devicepolicy-sources"
        ":services.midi-sources"
        ":services.net-sources"
        ":services.print-sources"
        ":services.restrictions-sources"
        ":services.startop.iorap-sources"
        ":services.systemcaptions-sources"
        ":services.usage-sources"
        ":services.usb-sources"
        ":services.voiceinteraction-sources"
        ":services.wifi-sources"
        ":service-permission-sources"
        ":service-statsd-sources"
    ];
    visibility = ["//visibility:private"];
};

#  merge all required services into one jar
#  ============================================================
services = java_library {
    name = "services";
    installable = true;

    dex_preopt = {
        app_image = true;
        profile = "art-profile";
    };

    srcs = [":services-main-sources"];

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
        "services.people"
        "services.print"
        "services.restrictions"
        "services.startop"
        "services.systemcaptions"
        "services.usage"
        "services.usb"
        "services.voiceinteraction"
        "services.wifi"
        "service-blobstore"
        "service-jobscheduler"
        "android.hidl.base-V1.0-java"
    ];

    libs = [
        "android.hidl.manager-V1.0-java"
        "framework-tethering.stubs.module_lib"
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

services-platform-compat-config = platform_compat_config {
    name = "services-platform-compat-config";
    src = ":services";
};

art-profile = filegroup {
    name = "art-profile";
    srcs = ["art-profile"];
};

#  API stub
#  =============================================================

"services-stubs.sources" = droidstubs {
    name = "services-stubs.sources";
    srcs = [":services-all-sources"];
    installable = false;
    args = " --show-annotation android.annotation.SystemApi\\(client=android.annotation.SystemApi.Client.SYSTEM_SERVER\\)" +
        " --hide-annotation android.annotation.Hide" +
        " --hide InternalClasses" + #  com.android.* classes are okay in this interface
        #  TODO: remove the --hide options below
        " --hide-package com.google.android.startop.iorap" +
        " --hide ReferencesHidden" +
        " --hide DeprecationMismatch" +
        " --hide HiddenTypedefConstant";
    visibility = ["//visibility:private"];
    filter_packages = ["com.android."];
    check_api = {
        current = {
            api_file = "api/current.txt";
            removed_api_file = "api/removed.txt";
        };
        last_released = {
            api_file = ":android.api.system-server.latest";
            removed_api_file = ":removed.api.system-server.latest";
            baseline_file = ":system-server-api-incompatibilities-with-last-released";
        };
        api_lint = {
            enabled = true;
            new_since = ":android.api.system-server.latest";
            baseline_file = "api/lint-baseline.txt";
        };
    };
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
        dir = "apistubs/android/system-server/api";
        dest = "android.txt";
    };
};

android_system_server_stubs_current = java_library {
    name = "android_system_server_stubs_current";
    srcs = [":services-stubs.sources"];
    installable = false;
    static_libs = ["android_module_lib_stubs_current"];
};

in { inherit "services-stubs.sources" android_system_server_stubs_current art-profile libandroid_servers services services-all-sources services-main-sources services-platform-compat-config services_defaults; }
