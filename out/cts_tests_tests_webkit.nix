{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsWebkitTestCases = android_test {
    name = "CtsWebkitTestCases";
    defaults = ["cts_defaults"];
    libs = [
        "android.test.runner.stubs"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctsdeviceutillegacy-axt"
        "ctstestserver"
        "ctstestrunner-axt"
        "hamcrest-library"
    ];
    srcs = [
        "src/android/webkit/cts/CookieManagerTest.java"
        "src/android/webkit/cts/CookieSyncManagerCtsActivity.java"
        "src/android/webkit/cts/CookieTest.java"
        "src/android/webkit/cts/DateSorterTest.java"
        "src/android/webkit/cts/GeolocationTest.java"
        "src/android/webkit/cts/HttpAuthHandlerTest.java"
        "src/android/webkit/cts/MimeTypeMapTest.java"
        "src/android/webkit/cts/MockContentProvider.java"
        "src/android/webkit/cts/PostMessageTest.java"
        "src/android/webkit/cts/ServiceWorkerClientTest.java"
        "src/android/webkit/cts/ServiceWorkerWebSettingsTest.java"
        "src/android/webkit/cts/TestHtmlConstants.java"
        "src/android/webkit/cts/TestProcessClient.java"
        "src/android/webkit/cts/TestProcessService.java"
        "src/android/webkit/cts/TestProcessServiceA.java"
        "src/android/webkit/cts/TestProcessServiceB.java"
        "src/android/webkit/cts/TracingControllerTest.java"
        "src/android/webkit/cts/URLUtilTest.java"
        "src/android/webkit/cts/WebBackForwardListTest.java"
        "src/android/webkit/cts/WebChromeClientTest.java"
        "src/android/webkit/cts/WebHistoryItemTest.java"
        "src/android/webkit/cts/WebSettingsTest.java"
        "src/android/webkit/cts/WebViewClientTest.java"
        "src/android/webkit/cts/WebViewCtsActivity.java"
        "src/android/webkit/cts/WebViewDataDirTest.java"
        "src/android/webkit/cts/WebViewRenderProcessClientTest.java"
        "src/android/webkit/cts/WebViewRenderProcessTest.java"
        "src/android/webkit/cts/WebViewSslTest.java"
        "src/android/webkit/cts/WebViewTest.java"
        "src/android/webkit/cts/WebViewTransportTest.java"
        "src/android/webkit/cts/WebViewZoomTest.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    #  uncomment when dalvik.annotation.Test* are removed or part of SDK
    # sdk_version: "current"
    platform_apis = true;
};

in { inherit CtsWebkitTestCases; }
