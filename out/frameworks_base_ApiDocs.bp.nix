{ doc_defaults, droiddoc, droidstubs, java_genrule, stubs_defaults }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#  How API docs are generated:
#
#  raw source files --(metalava)--> stub source files --(doclava)--> API doc
#
#  The metalava conversion is done by droidstub modules framework-doc-*-stubs.
#  The API doc generation is done by the various droiddoc modules each of which
#  is for different format.

# ///////////////////////////////////////////////////////////////////
#  stub source files are generated using metalava
# ///////////////////////////////////////////////////////////////////

framework_docs_only_libs = [
    "voip-common"
    "android.test.mock"
    "android-support-annotations"
    "android-support-compat"
    "android-support-core-ui"
    "android-support-core-utils"
    "android-support-design"
    "android-support-dynamic-animation"
    "android-support-exifinterface"
    "android-support-fragment"
    "android-support-media-compat"
    "android-support-percent"
    "android-support-transition"
    "android-support-v7-cardview"
    "android-support-v7-gridlayout"
    "android-support-v7-mediarouter"
    "android-support-v7-palette"
    "android-support-v7-preference"
    "android-support-v13"
    "android-support-v14-preference"
    "android-support-v17-leanback"
    "android-support-vectordrawable"
    "android-support-animatedvectordrawable"
    "android-support-v7-appcompat"
    "android-support-v7-recyclerview"
    "android-support-v8-renderscript"
    "android-support-multidex"
    "android-support-multidex-instrumentation"
];

framework-doc-stubs-default = stubs_defaults {
    name = "framework-doc-stubs-default";
    srcs = [
        ":framework-mime-sources"
        ":framework-non-updatable-sources"
        ":framework-updatable-sources"
        "core/java/android/app/EventLogTags.logtags"
        "core/java/android/app/admin/SecurityLogTags.logtags"
        "core/java/android/content/EventLogTags.logtags"
        "core/java/android/net/EventLogTags.logtags"
        "core/java/android/os/EventLogTags.logtags"
        "core/java/android/speech/tts/EventLogTags.logtags"
        "core/java/android/webkit/EventLogTags.logtags"
        "core/java/com/android/internal/app/EventLogTags.logtags"
        "core/java/com/android/internal/logging/EventLogTags.logtags"
        "core/java/com/android/server/DropboxLogTags.logtags"
        "core/java/org/chromium/arc/EventLogTags.logtags"
        "test-base/src/android/test/AndroidTestCase.java"
        "test-base/src/android/test/FlakyTest.java"
        "test-base/src/android/test/InstrumentationTestCase.java"
        "test-base/src/android/test/InstrumentationTestSuite.java"
        "test-base/src/android/test/PerformanceTestCase.java"
        "test-base/src/android/test/RepetitiveTest.java"
        "test-base/src/android/test/UiThreadTest.java"
        "test-base/src/android/test/suitebuilder/annotation/LargeTest.java"
        "test-base/src/android/test/suitebuilder/annotation/MediumTest.java"
        "test-base/src/android/test/suitebuilder/annotation/SmallTest.java"
        "test-base/src/android/test/suitebuilder/annotation/Smoke.java"
        "test-base/src/android/test/suitebuilder/annotation/Suppress.java"
        "test-base/src/com/android/internal/util/Predicate.java"
        "test-base/src/junit/framework/Assert.java"
        "test-base/src/junit/framework/AssertionFailedError.java"
        "test-base/src/junit/framework/ComparisonCompactor.java"
        "test-base/src/junit/framework/ComparisonFailure.java"
        "test-base/src/junit/framework/Protectable.java"
        "test-base/src/junit/framework/Test.java"
        "test-base/src/junit/framework/TestCase.java"
        "test-base/src/junit/framework/TestFailure.java"
        "test-base/src/junit/framework/TestListener.java"
        "test-base/src/junit/framework/TestResult.java"
        "test-base/src/junit/framework/TestSuite.java"
        ":opt-telephony-srcs"
        ":opt-net-voip-srcs"
        ":art-module-public-api-stubs-source"
        ":conscrypt.module.public.api{.public.stubs.source}"
        ":android_icu4j_public_api_files"
        "test-mock/src/android/test/mock/MockAccountManager.java"
        "test-mock/src/android/test/mock/MockApplication.java"
        "test-mock/src/android/test/mock/MockContentProvider.java"
        "test-mock/src/android/test/mock/MockContentResolver.java"
        "test-mock/src/android/test/mock/MockContext.java"
        "test-mock/src/android/test/mock/MockCursor.java"
        "test-mock/src/android/test/mock/MockDialogInterface.java"
        "test-mock/src/android/test/mock/MockIContentProvider.java"
        "test-mock/src/android/test/mock/MockPackageManager.java"
        "test-mock/src/android/test/mock/MockResources.java"
        "test-mock/src/android/test/mock/MockService.java"
        "test-runner/src/android/test/ActivityInstrumentationTestCase.java"
        "test-runner/src/android/test/ActivityInstrumentationTestCase2.java"
        "test-runner/src/android/test/ActivityTestCase.java"
        "test-runner/src/android/test/ActivityUnitTestCase.java"
        "test-runner/src/android/test/AndroidTestRunner.java"
        "test-runner/src/android/test/ApplicationTestCase.java"
        "test-runner/src/android/test/AssertionFailedError.java"
        "test-runner/src/android/test/ClassPathPackageInfoSource.java"
        "test-runner/src/android/test/ComparisonFailure.java"
        "test-runner/src/android/test/InstrumentationTestRunner.java"
        "test-runner/src/android/test/IsolatedContext.java"
        "test-runner/src/android/test/LaunchPerformanceBase.java"
        "test-runner/src/android/test/LoaderTestCase.java"
        "test-runner/src/android/test/MoreAsserts.java"
        "test-runner/src/android/test/NoExecTestResult.java"
        "test-runner/src/android/test/ProviderTestCase.java"
        "test-runner/src/android/test/ProviderTestCase2.java"
        "test-runner/src/android/test/RenamingDelegatingContext.java"
        "test-runner/src/android/test/ServiceTestCase.java"
        "test-runner/src/android/test/SimpleCache.java"
        "test-runner/src/android/test/SingleLaunchActivityTestCase.java"
        "test-runner/src/android/test/SyncBaseInstrumentation.java"
        "test-runner/src/android/test/TestCaseUtil.java"
        "test-runner/src/android/test/TestPrinter.java"
        "test-runner/src/android/test/TestSuiteProvider.java"
        "test-runner/src/android/test/TouchUtils.java"
        "test-runner/src/android/test/ViewAsserts.java"
        "test-runner/src/android/test/suitebuilder/AssignableFrom.java"
        "test-runner/src/android/test/suitebuilder/SmokeTestSuiteBuilder.java"
        "test-runner/src/android/test/suitebuilder/TestGrouping.java"
        "test-runner/src/android/test/suitebuilder/TestMethod.java"
        "test-runner/src/android/test/suitebuilder/TestPredicates.java"
        "test-runner/src/android/test/suitebuilder/TestSuiteBuilder.java"
        "test-runner/src/android/test/suitebuilder/UnitTestSuiteBuilder.java"
        "test-runner/src/junit/runner/BaseTestRunner.java"
        "test-runner/src/junit/runner/StandardTestSuiteLoader.java"
        "test-runner/src/junit/runner/TestRunListener.java"
        "test-runner/src/junit/runner/TestSuiteLoader.java"
        "test-runner/src/junit/runner/Version.java"
        "test-runner/src/junit/runner/package-info.java"
        "test-runner/src/junit/textui/ResultPrinter.java"
        "test-runner/src/junit/textui/TestRunner.java"
        "test-runner/src/junit/textui/package-info.java"
    ];
    libs = framework_docs_only_libs;
    create_doc_stubs = true;
    annotations_enabled = true;
    api_levels_annotations_enabled = true;
    api_levels_annotations_dirs = [
        "sdk-dir"
        "api-versions-jars-dir"
    ];
    previous_api = ":android.api.public.latest";
    merge_annotations_dirs = [
        "metalava-manual"
    ];
};

framework-doc-stubs = droidstubs {
    name = "framework-doc-stubs";
    defaults = ["framework-doc-stubs-default"];
    arg_files = [
        "core/res/AndroidManifest.xml"
    ];
    args = metalava_framework_docs_args;
    write_sdk_values = true;
};

framework-doc-system-stubs = droidstubs {
    name = "framework-doc-system-stubs";
    defaults = ["framework-doc-stubs-default"];
    arg_files = [
        "core/res/AndroidManifest.xml"
    ];
    args = metalava_framework_docs_args + " --show-annotation android.annotation.SystemApi\\(client=android.annotation.SystemApi.Client.PRIVILEGED_APPS\\) ";
    write_sdk_values = true;
};

# ///////////////////////////////////////////////////////////////////
#  API docs are created from the generated stub source files
#  using droiddoc
# ///////////////////////////////////////////////////////////////////

framework_docs_only_args = " -android -manifest $(location core/res/AndroidManifest.xml) " +
    "-werror -lerror -hide 111 -hide 113 -hide 125 -hide 126 -hide 127 -hide 128 " +
    "-overview $(location core/java/overview.html) " +
    #  Federate Support Library references against local API file.
    "-federate SupportLib https://developer.android.com " +
    "-federationapi SupportLib $(location :current-support-api) " +
    #  Federate Support Library references against local API file.
    "-federate AndroidX https://developer.android.com " +
    "-federationapi AndroidX $(location :current-androidx-api) ";

framework-docs-default = doc_defaults {
    name = "framework-docs-default";
    libs = framework_docs_only_libs ++ [
        "stub-annotations"
        "unsupportedappusage"
    ];
    html_dirs = [
        "docs/html"
    ];
    knowntags = [
        "docs/knowntags.txt"
        ":known-oj-tags"
    ];
    custom_template = "droiddoc-templates-sdk";
    resourcesdir = "docs/html/reference/images/";
    resourcesoutdir = "reference/android/images/";
    hdf = [
        "dac true"
        "sdk.codename O"
        "sdk.preview.version 1"
        "sdk.version 7.0"
        "sdk.rel.id 1"
        "sdk.preview 0"
    ];
    arg_files = [
        "core/res/AndroidManifest.xml"
        "core/java/overview.html"
        ":current-support-api"
        ":current-androidx-api"
    ];
    create_stubs = false;
};

framework-dokka-docs-default = doc_defaults {
    name = "framework-dokka-docs-default";
    create_stubs = false;
};

doc-comment-check-docs = droiddoc {
    name = "doc-comment-check-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    args = framework_docs_only_args + " -referenceonly -parsecomments";
    installable = false;
};

offline-sdk-docs = droiddoc {
    name = "offline-sdk-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc offline"
    ];
    compat_config = ":global-compat-config";
    proofread_file = "offline-sdk-docs-proofrerad.txt";
    args = framework_docs_only_args + " -offlinemode -title \"Android SDK\"";
    static_doc_index_redirect = "docs/docs-preview-index.html";
};

offline-sdk-referenceonly-docs = droiddoc {
    #  Please sync with android-api-council@ before making any changes for the name property below.
    #  Since there's cron jobs that fetch offline-sdk-referenceonly-docs-docs.zip periodically.
    #  See b/116221385 for reference.
    name = "offline-sdk-referenceonly-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc offline"
    ];
    proofread_file = "offline-sdk-referenceonly-docs-proofrerad.txt";
    args = framework_docs_only_args + " -offlinemode -title \"Android SDK\" -referenceonly";
    static_doc_index_redirect = "docs/docs-documentation-redirect.html";
    static_doc_properties = "docs/source.properties";
};

offline-system-sdk-referenceonly-docs = droiddoc {
    #  Please sync with android-api-council@ before making any changes for the name property below.
    #  Since there's cron jobs that fetch offline-system-sdk-referenceonly-docs-docs.zip periodically.
    #  See b/116221385 for reference.
    name = "offline-system-sdk-referenceonly-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-system-stubs"
    ];
    hdf = [
        "android.whichdoc offline"
    ];
    proofread_file = "offline-system-sdk-referenceonly-docs-proofrerad.txt";
    args = framework_docs_only_args + " -hide 101 -hide 104 -hide 108" +
    " -offlinemode -title \"Android System SDK\" -referenceonly";
    static_doc_index_redirect = "docs/docs-documentation-redirect.html";
    static_doc_properties = "docs/source.properties";
};

online-sdk-docs = droiddoc {
    name = "online-sdk-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc online"
        "android.hasSamples true"
    ];
    proofread_file = "online-sdk-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -toroot / -samplegroup Admin " +
        " -samplegroup Background " +
        " -samplegroup Connectivity " +
        " -samplegroup Content " +
        " -samplegroup Input " +
        " -samplegroup Media " +
        " -samplegroup Notification " +
        " -samplegroup RenderScript " +
        " -samplegroup Security " +
        " -samplegroup Sensors " +
        " -samplegroup System " +
        " -samplegroup Testing " +
        " -samplegroup UI " +
        " -samplegroup Views " +
        " -samplegroup Wearable -samplesdir development/samples/browseable ";
};

online-system-api-sdk-docs = droiddoc {
    name = "online-system-api-sdk-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-system-stubs"
    ];
    hdf = [
        "android.whichdoc online"
        "android.hasSamples true"
    ];
    proofread_file = "online-system-api-sdk-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -referenceonly " +
        " -title \"Android SDK - Including system APIs.\" " +
        " -hide 101 " +
        " -hide 104 " +
        " -hide 108 " +
        " -toroot / -samplegroup Admin " +
        " -samplegroup Background " +
        " -samplegroup Connectivity " +
        " -samplegroup Content " +
        " -samplegroup Input " +
        " -samplegroup Media " +
        " -samplegroup Notification " +
        " -samplegroup RenderScript " +
        " -samplegroup Security " +
        " -samplegroup Sensors " +
        " -samplegroup System " +
        " -samplegroup Testing " +
        " -samplegroup UI " +
        " -samplegroup Views " +
        " -samplegroup Wearable -samplesdir development/samples/browseable ";
    installable = false;
};

ds-docs-java = droiddoc {
    name = "ds-docs-java";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc online"
        "android.hasSamples true"
    ];
    proofread_file = "ds-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -toroot / -yamlV2 -metalavaApiSince -samplegroup Admin " +
        " -samplegroup Background " +
        " -samplegroup Connectivity " +
        " -samplegroup Content " +
        " -samplegroup Input " +
        " -samplegroup Media " +
        " -samplegroup Notification " +
        " -samplegroup RenderScript " +
        " -samplegroup Security " +
        " -samplegroup Sensors " +
        " -samplegroup System " +
        " -samplegroup Testing " +
        " -samplegroup UI " +
        " -samplegroup Views " +
        " -samplegroup Wearable -devsite -samplesdir development/samples/browseable ";
};

ds-docs-kt = droiddoc {
    name = "ds-docs-kt";
    defaults = ["framework-dokka-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    args = "-noJdkLink -links https://kotlinlang.org/api/latest/jvm/stdlib/^external/dokka/package-list " +
        "-noStdlibLink";
    proofread_file = "ds-dokka-proofread.txt";
    dokka_enabled = true;
};

ds-docs = java_genrule {
    name = "ds-docs";
    tools = [
        "zip2zip"
        "merge_zips"
    ];
    srcs = [
        ":ds-docs-java{.docs.zip}"
        ":ds-docs-kt{.docs.zip}"
    ];
    out = ["ds-docs.zip"];
    dist = {
        targets = ["docs"];
    };
    cmd = "$(location zip2zip) -i $(location :ds-docs-kt{.docs.zip}) -o $(genDir)/ds-docs-kt-moved.zip **/*:en/reference/kotlin && " +
        "$(location merge_zips) $(out) $(location :ds-docs-java{.docs.zip}) $(genDir)/ds-docs-kt-moved.zip";
};

ds-docs-switched = java_genrule {
    name = "ds-docs-switched";
    tools = [
        "switcher4"
        "soong_zip"
    ];
    srcs = [
        ":ds-docs-java{.docs.zip}"
        ":ds-docs-kt{.docs.zip}"
    ];
    out = ["ds-docs-switched.zip"];
    dist = {
        targets = ["docs"];
    };
    cmd = "unzip $(location :ds-docs-java{.docs.zip}) -d $(genDir) && " +
        "unzip $(location :ds-docs-kt{.docs.zip}) -d $(genDir)/en/reference/kotlin && " +
        "SWITCHER=$$(cd $$(dirname $(location switcher4)) && pwd)/$$(basename $(location switcher4)) && " +
        "(cd $(genDir)/en/reference && $$SWITCHER --work platform) && " +
        "$(location soong_zip) -o $(out) -C $(genDir) -D $(genDir)";
};

ds-static-docs = droiddoc {
    name = "ds-static-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc online"
    ];
    proofread_file = "ds-static-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -staticonly " +
        " -toroot / " +
        " -devsite " +
        " -ignoreJdLinks ";
};

ds-ref-navtree-docs = droiddoc {
    name = "ds-ref-navtree-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc online"
    ];
    proofread_file = "ds-ref-navtree-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -toroot / " +
        " -atLinksNavtree " +
        " -navtreeonly ";
};

online-sdk-dev-docs = droiddoc {
    name = "online-sdk-dev-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc online"
        "android.hasSamples true"
    ];
    proofread_file = "online-sdk-dev-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -toroot / -samplegroup Admin " +
        " -samplegroup Background " +
        " -samplegroup Connectivity " +
        " -samplegroup Content " +
        " -samplegroup Input " +
        " -samplegroup Media " +
        " -samplegroup Notification " +
        " -samplegroup RenderScript " +
        " -samplegroup Security " +
        " -samplegroup Sensors " +
        " -samplegroup System " +
        " -samplegroup Testing " +
        " -samplegroup UI " +
        " -samplegroup Views " +
        " -samplegroup Wearable -samplesdir development/samples/browseable ";
};

hidden-docs = droiddoc {
    name = "hidden-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    proofread_file = "hidden-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -referenceonly " +
        " -title \"Android SDK - Including hidden APIs.\"";
};

in { inherit doc-comment-check-docs ds-docs ds-docs-java ds-docs-kt ds-docs-switched ds-ref-navtree-docs ds-static-docs framework-doc-stubs framework-doc-stubs-default framework-doc-system-stubs framework-docs-default framework-dokka-docs-default hidden-docs offline-sdk-docs offline-sdk-referenceonly-docs offline-system-sdk-referenceonly-docs online-sdk-dev-docs online-sdk-docs online-system-api-sdk-docs; }
