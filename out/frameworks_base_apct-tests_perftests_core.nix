{ android_test }:
let

CorePerfTests = android_test {
    name = "CorePerfTests";

    resource_dirs = ["res"];
    srcs = [
        "src/android/accounts/AccountManagerPerfTest.java"
        "src/android/app/OverlayManagerPerfTest.java"
        "src/android/app/PendingIntentPerfTest.java"
        "src/android/app/ResourcesManagerPerfTest.java"
        "src/android/app/ResourcesPerfTest.java"
        "src/android/app/ResourcesThemePerfTest.java"
        "src/android/database/CursorWindowPerfTest.java"
        "src/android/database/SQLiteDatabaseIoPerfTest.java"
        "src/android/database/SQLiteDatabasePerfTest.java"
        "src/android/database/TableHelper.java"
        "src/android/graphics/perftests/CanvasPerfTest.java"
        "src/android/graphics/perftests/OutlinePerfTest.java"
        "src/android/graphics/perftests/PaintHasGlyphPerfTest.java"
        "src/android/graphics/perftests/PaintMeasureTextTest.java"
        "src/android/graphics/perftests/PathPerfTest.java"
        "src/android/graphics/perftests/RenderNodePerfTest.java"
        "src/android/graphics/perftests/TypefaceCreatePerfTest.java"
        "src/android/graphics/perftests/VectorDrawablePerfTest.java"
        "src/android/os/BinderCallsStatsPerfTest.java"
        "src/android/os/CpuUsageTrackingPerfTest.java"
        "src/android/os/KernelCpuThreadReaderPerfTest.java"
        "src/android/os/LooperStatsPerfTest.java"
        "src/android/os/ParcelArrayPerfTest.java"
        "src/android/os/ParcelPerfTest.java"
        "src/android/os/PssPerfTest.java"
        "src/android/os/SharedPreferencesTest.java"
        "src/android/os/SomeService.java"
        "src/android/os/StrictModeTest.java"
        "src/android/os/TracePerfTest.java"
        "src/android/perftests/SystemPerfTest.java"
        "src/android/text/BoringLayoutCreateDrawPerfTest.java"
        "src/android/text/BoringLayoutIsBoringPerfTest.java"
        "src/android/text/CanvasDrawTextTest.java"
        "src/android/text/DynamicLayoutPerfTest.java"
        "src/android/text/NonEditableTextGenerator.java"
        "src/android/text/PaintMeasureDrawPerfTest.java"
        "src/android/text/PrecomputedTextMemoryUsageTest.java"
        "src/android/text/PrecomputedTextPerfTest.java"
        "src/android/text/StaticLayoutCreateDrawPerfTest.java"
        "src/android/text/StaticLayoutGetOffsetForHorizontalPerfTest.java"
        "src/android/text/StaticLayoutMultithreadPerfTest.java"
        "src/android/text/StaticLayoutPerfTest.java"
        "src/android/text/TextPerfUtils.java"
        "src/android/text/TextViewSetTextMeasurePerfTest.java"
        "src/android/util/ArraySetPerfTest.java"
        "src/android/util/perftests/LogPerfTest.java"
        "src/android/view/CutoutSpecificationBenchmark.java"
        "src/android/view/ViewPerfTest.java"
        "src/android/view/ViewShowHidePerfTest.java"
        "src/android/widget/EditTextBackspacePerfTest.java"
        "src/android/widget/EditTextCursorMovementPerfTest.java"
        "src/android/widget/EditTextLongTextPerfTest.java"
        "src/android/widget/LayoutPerfTest.java"
        "src/android/widget/TextViewAutoSizeLayoutPerfTest.java"
        "src/android/widget/TextViewFontFamilyLayoutPerfTest.java"
        "src/android/widget/TextViewOnMeasurePerfTest.java"
        "src/android/widget/TextViewPrecomputedTextPerfTest.java"
        "src/android/widget/TextViewSetTextLocalePerfTest.java"
        "src/android/os/PackageParsingPerfTest.kt"
        "src/android/os/ISomeService.aidl"
    ];

    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx.test.rules"
        "androidx.annotation_annotation"
        "apct-perftests-overlay-apps"
        "apct-perftests-resources-manager-apps"
        "apct-perftests-utils"
        "guava"
    ];

    libs = ["android.test.base"];

    platform_apis = true;

    jni_libs = ["libperftestscore_jni"];

    #  Use google-fonts/dancing-script for the performance metrics
    #  ANDROIDMK TRANSLATION ERROR: Only $(LOCAL_PATH)/.. values are allowed
    #  LOCAL_ASSET_DIR := $(TOP)/external/google-fonts/dancing-script

    test_suites = ["device-tests"];
    certificate = "platform";

};

in { inherit CorePerfTests; }
