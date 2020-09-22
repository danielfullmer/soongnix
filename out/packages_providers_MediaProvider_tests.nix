{ android_test }:
let

#  This looks a bit awkward, but we need our tests to run against either
#  MediaProvider or MediaProviderGoogle, and we don't know which one is
#  on the device being tested, so we can't sign our tests with a key that
#  will allow instrumentation.  Thus we pull all the sources we need to
#  run tests against into the test itself.
MediaProviderTests = android_test {
    name = "MediaProviderTests";
    test_suites = [
        "device-tests"
        "mts"
    ];
    compile_multilib = "both";

    manifest = "AndroidManifest.xml";

    resource_dirs = [
        "main_res"
        "res"
    ];
    srcs = [
        ":framework-mediaprovider-sources"
        ":mediaprovider-sources"
        "src/com/android/providers/media/CacheClearingActivityTest.java"
        "src/com/android/providers/media/DatabaseHelperTest.java"
        "src/com/android/providers/media/GetResultActivity.java"
        "src/com/android/providers/media/IdleServiceTest.java"
        "src/com/android/providers/media/LocalCallingIdentityTest.java"
        "src/com/android/providers/media/MediaDocumentsProviderTest.java"
        "src/com/android/providers/media/MediaProviderForFuseTest.java"
        "src/com/android/providers/media/MediaProviderTest.java"
        "src/com/android/providers/media/PermissionActivityTest.java"
        "src/com/android/providers/media/playlist/PlaylistPersisterTest.java"
        "src/com/android/providers/media/playlist/PlaylistTest.java"
        "src/com/android/providers/media/scan/DrmTest.java"
        "src/com/android/providers/media/scan/LegacyMediaScannerTest.java"
        "src/com/android/providers/media/scan/MediaScannerTest.java"
        "src/com/android/providers/media/scan/ModernMediaScannerTest.java"
        "src/com/android/providers/media/scan/NullMediaScannerTest.java"
        "src/com/android/providers/media/util/BackgroundThreadTest.java"
        "src/com/android/providers/media/util/CachedSupplierTest.java"
        "src/com/android/providers/media/util/DatabaseUtilsTest.java"
        "src/com/android/providers/media/util/ExifUtilsTest.java"
        "src/com/android/providers/media/util/FileUtilsTest.java"
        "src/com/android/providers/media/util/ForegroundThreadTest.java"
        "src/com/android/providers/media/util/IsoInterfaceTest.java"
        "src/com/android/providers/media/util/LoggingTest.java"
        "src/com/android/providers/media/util/LongArrayTest.java"
        "src/com/android/providers/media/util/MemoryTest.java"
        "src/com/android/providers/media/util/MetricsTest.java"
        "src/com/android/providers/media/util/MimeUtilsTest.java"
        "src/com/android/providers/media/util/PermissionUtilsTest.java"
        "src/com/android/providers/media/util/RedactingFileDescriptorTest.java"
        "src/com/android/providers/media/util/SQLiteQueryBuilderTest.java"
        "src/com/android/providers/media/util/SQLiteTokenizerTest.java"
        "src/com/android/providers/media/util/XmpInterfaceTest.java"
    ];

    libs = [
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
        "unsupportedappusage"
    ];

    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx.core_core"
        "androidx.test.rules"
        "guava"
        "mockito-target"
        "truth-prebuilt"
    ];

    certificate = "media";

    aaptflags = ["--custom-package com.android.providers.media"];

    errorprone = {
        javacflags = [
            "-Xep:CatchFail:ERROR"
            "-Xep:MissingFail:ERROR"
        ];
    };
};

in { inherit MediaProviderTests; }
