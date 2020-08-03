{ android_app }:
let

ContactsProvider = android_app {
    name = "ContactsProvider";
    #  Only compile source java files in this apk.
    srcs = [
        "src/**/*.java"
        "src/com/android/providers/contacts/EventLogTags.logtags"
    ];
    libs = [
        "ext"
        "telephony-common"
    ];
    static_libs = [
        "android-common"
        "com.android.vcard"
        "guava"
    ];

    #  The Jacoco tool analyzes code coverage when running unit tests on the
    #  application. This configuration line selects which packages will be analyzed,
    #  leaving out code which is tested by other means (e.g. static libraries) that
    #  would dilute the coverage results. These options do not affect regular
    #  production builds.
    jacoco = {
        include_filter = ["com.android.providers.contacts.*"];
    };
    platform_apis = true;
    certificate = "shared";
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit ContactsProvider; }
