{ java_library_host, java_test_host }:
let

# #############################################
#  Compile Robolectric shadows supportv4
# #############################################

Robolectric_shadows_supportv4 = java_library_host {
    name = "Robolectric_shadows_supportv4";
    libs = [
        "Robolectric_shadows_framework"
        "Robolectric_annotations"
        "Robolectric_robolectric"
        "Robolectric_shadowapi"
        "Robolectric_utils"
        "robolectric-javax.annotation-api-1.2"
        "robolectric-host-android-support-v4"
        "robolectric-host-android_all"
    ];
    plugins = ["Robolectric_processor"];
    javacflags = ["-Aorg.robolectric.annotation.processing.shadowPackage=org.robolectric.shadows.support.v4"];
    srcs = [
        "src/main/java/org/robolectric/shadows/support/v4/ShadowAsyncTaskLoader.java"
        "src/main/java/org/robolectric/shadows/support/v4/ShadowDrawerLayout.java"
        "src/main/java/org/robolectric/shadows/support/v4/ShadowLocalBroadcastManager.java"
        "src/main/java/org/robolectric/shadows/support/v4/ShadowMediaBrowserCompat.java"
        "src/main/java/org/robolectric/shadows/support/v4/ShadowSwipeRefreshLayout.java"
        "src/main/java/org/robolectric/shadows/support/v4/SupportFragmentController.java"
        "src/main/java/org/robolectric/shadows/support/v4/SupportFragmentTestUtil.java"
        "src/main/java/org/robolectric/shadows/support/v4/package-info.java"
    ];
};

# #############################################
#  Compile Robolectric shadows supportv4 tests
# #############################################

Robolectric_shadows_supportv4_tests = java_test_host {
    name = "Robolectric_shadows_supportv4_tests";
    srcs = [
        "src/test/java/org/robolectric/R.java"
        "src/test/java/org/robolectric/android/AccessibilityUtilTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/BuildCompatTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/CursorLoaderTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/NotificationCompatBuilderTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/ShadowAsyncTaskLoaderTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/ShadowDialogFragmentTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/ShadowDrawerLayoutTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/ShadowLoaderTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/ShadowLocalBroadcastManagerTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/ShadowMediaBrowserCompatTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/ShadowPagerAdapterTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/ShadowSwipeRefreshLayoutTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/ShadowViewPagerTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/SupportFragmentControllerTest.java"
        "src/test/java/org/robolectric/shadows/support/v4/SupportFragmentTestUtilTest.java"
        "src/test/java/org/robolectric/util/TestRunnerWithManifest.java"
    ];
    java_resource_dirs = ["src/test/resources"];
    static_libs = [
        "Robolectric_shadows_supportv4"
        "Robolectric_shadows_framework"
        "Robolectric_annotations"
        "Robolectric_robolectric"
        "Robolectric_resources"
        "Robolectric_shadowapi"
        "Robolectric_sandbox"
        "Robolectric_junit"
        "Robolectric_utils"
        "robolectric-accessibility-test-framework-2.1"
        "robolectric-host-android-support-v4"
        "robolectric-maven-ant-tasks-2.1.3"
        "hamcrest-library"
        "mockito"
        "bouncycastle-unbundled"
        "hamcrest"
        "asm-commons-6.0"
        "guava"
        "objenesis"
        "asm-tree-6.0"
        "junit"
        "truth-prebuilt"
        "robolectric-ant-1.8.0"
        "asm-6.0"
        "jsr305"
    ];
    libs = ["robolectric-host-android_all"];
};

in { inherit Robolectric_shadows_supportv4 Robolectric_shadows_supportv4_tests; }
