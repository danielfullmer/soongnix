{ module_exports, sdk }:
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

#  The SDK for the art module apex.
art-module-sdk = sdk {
    name = "art-module-sdk";
    java_system_modules = [
        "art-module-public-api-stubs-system-modules"
        "art-module-intra-core-api-stubs-system-modules"
        "art-module-platform-api-stubs-system-modules"
    ];
    native_static_libs = [
        "libartimagevalues"
    ];
};

#  Exported host tools and libraries.
art-module-host-exports = module_exports {
    name = "art-module-host-exports";
    host_supported = true;
    device_supported = false;
    java_libs = [
        "timezone-host"
    ];
};

#  Exported tests and supporting libraries
art-module-test-exports = module_exports {
    name = "art-module-test-exports";
    java_libs = [
        "core-compat-test-rules"
        "core-test-rules"
        "core-tests-support"
        "okhttp-tests-nojarjar"
    ];
    java_tests = [
        "libcore-crypto-tests"
    ];
    native_shared_libs = [
        "libjavacoretests"
    ];
};

in { inherit art-module-host-exports art-module-sdk art-module-test-exports; }
