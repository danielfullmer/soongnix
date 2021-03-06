{ java_library_static }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

ctsdeviceutillegacy = java_library_static {
    name = "ctsdeviceutillegacy";

    static_libs = [
        "compatibility-device-util"
        "junit"
    ];

    libs = ["android.test.base.stubs"];

    srcs = [
        "src/android/webkit/cts/WebViewOnUiThread.java"
        "src/android/webkit/cts/WebViewSyncLoader.java"
        "src/android/webkit/cts/WebkitUtils.java"
        "src/com/android/compatibility/common/util/SynchronousPixelCopy.java"
    ];

    sdk_version = "test_current";

};

#  A variant of ctsdeviceutillegacy that depends on androidx.test instead of android.support.test
ctsdeviceutillegacy-axt = java_library_static {
    name = "ctsdeviceutillegacy-axt";

    static_libs = [
        "compatibility-device-util-axt"
        "junit"
    ];

    libs = ["android.test.base.stubs"];

    srcs = [
        "src/android/webkit/cts/WebViewOnUiThread.java"
        "src/android/webkit/cts/WebViewSyncLoader.java"
        "src/android/webkit/cts/WebkitUtils.java"
        "src/com/android/compatibility/common/util/SynchronousPixelCopy.java"
    ];

    sdk_version = "test_current";

};

in { inherit ctsdeviceutillegacy ctsdeviceutillegacy-axt; }
