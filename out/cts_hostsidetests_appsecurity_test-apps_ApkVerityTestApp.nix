{ android_test_helper_app, cc_library_shared }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

CtsApkVerityTestApp = android_test_helper_app {
    name = "CtsApkVerityTestApp";
    manifest = "AndroidManifest.xml";
    srcs = [
        "src/android/appsecurity/cts/apkveritytestapp/DummyActivity.java"
        "src/android/appsecurity/cts/apkveritytestapp/InstalledFilesCheck.java"
    ];
    jni_libs = [
        "libCtsApkVerityTestAppJni"
    ];
    compile_multilib = "both";
    libs = [
        "junit"
    ];
    static_libs = [
        "androidx.test.runner"
        "ctstestrunner-axt"
    ];
    dex_preopt = {
        enabled = false;
    };
    use_embedded_native_libs = true;
    sdk_version = "current";
    certificate = ":cts-testkey1";
};

CtsApkVerityTestAppSplit = android_test_helper_app {
    name = "CtsApkVerityTestAppSplit";
    manifest = "feature_split/AndroidManifest.xml";
    srcs = ["feature_split/src/android/appsecurity.cts.apkveritytestapp/feature_x/DummyActivity.java"];
    aaptflags = [
        "--custom-package android.appsecurity.cts.apkveritytestapp.feature_x"
        "--package-id 0x80"
    ];
    dex_preopt = {
        enabled = false;
    };
    sdk_version = "current";
    certificate = ":cts-testkey1";
};

libCtsApkVerityTestAppJni = cc_library_shared {
    name = "libCtsApkVerityTestAppJni";
    srcs = ["jni/android_appsecurity_cts_apkveritytestapp_InstalledFilesCheck.cpp"];
    shared_libs = [
        "libnativehelper_compat_libc++"
        "liblog"
    ];
    static_libs = [
        "libbase_ndk"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    stl = "c++_static";
    sdk_version = "current";
};

in { inherit CtsApkVerityTestApp CtsApkVerityTestAppSplit libCtsApkVerityTestAppJni; }
