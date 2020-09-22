{ android_test_helper_app }:
let

#  Copyright (C) 2020 Google Inc.
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

#  v1 implementation of test app built with v1 manifest.
IncrementalTestApp = android_test_helper_app {
    name = "IncrementalTestApp";
    srcs = [
        "v1/src/android/incrementalinstall/incrementaltestapp/MainActivity.java"
        "v1/src/android/incrementalinstall/incrementaltestapp/dynamiccode/DynamicCodeShim.java"
        "v1/src/android/incrementalinstall/incrementaltestapp/dynamiccode/IDynamicCode.java"
        "v1/src/android/incrementalinstall/incrementaltestapp/nativelib/CompressedNativeLib.java"
        "v1/src/android/incrementalinstall/incrementaltestapp/nativelib/UncompressedNativeLib.java"
    ];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    test_suites = [
        "cts"
    ];
    v4_signature = true;
    static_libs = [
        "incremental-install-common-lib"
    ];
    sdk_version = "test_current";
    export_package_resources = true;
    aapt_include_all_resources = true;
    manifest = "AndroidManifestV1.xml";

    #  This flag allow the native lib to be compressed in the apk or associated split apk, and
    #  needs to be extracted by the installer instead of calling directly into the apk.
    use_embedded_native_libs = false;
};

#  v2 implementation of test app built with v1 manifest for zero version update test.
IncrementalTestApp2_v1 = android_test_helper_app {
    name = "IncrementalTestApp2_v1";
    srcs = ["v2/src/android/incrementalinstall/incrementaltestapp/MainActivity.java"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    test_suites = [
        "cts"
    ];
    v4_signature = true;
    static_libs = [
        "incremental-install-common-lib"
    ];
    sdk_version = "test_current";
    export_package_resources = true;
    aapt_include_all_resources = true;
    manifest = "AndroidManifestV1.xml";
};

#  v2 implementation of test app built with v2 manifest for version update test.
IncrementalTestApp2_v2 = android_test_helper_app {
    name = "IncrementalTestApp2_v2";
    srcs = ["v2/src/android/incrementalinstall/incrementaltestapp/MainActivity.java"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    test_suites = [
        "cts"
    ];
    v4_signature = true;
    static_libs = [
        "incremental-install-common-lib"
    ];
    sdk_version = "test_current";
    export_package_resources = true;
    aapt_include_all_resources = true;
    manifest = "AndroidManifestV2.xml";
};

in { inherit IncrementalTestApp IncrementalTestApp2_v1 IncrementalTestApp2_v2; }
