{ cc_defaults, cc_library_headers, cc_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

librxcpp = cc_library_headers {
    name = "librxcpp";
    host_supported = true;
    export_include_dirs = ["Rx/v2/src"];
};

librxcpp-tests-defaults = cc_defaults {
    name = "librxcpp-tests-defaults";
    host_supported = true;
    srcs = [
        "Rx/v2/test/**/*.cpp"
    ];
    header_libs = ["librxcpp"];
    gtest = false;
};

librxcpp-tests-upstream = cc_test {
    #  "Upstream" config. Use exceptions.
    #  Ensure that if we update from upstream later that the merged code
    #  is still working on Android.
    name = "librxcpp-tests-upstream";
    defaults = ["librxcpp-tests-defaults"];
    whole_static_libs = ["libcatch2-upstream"];
    #  Allow exceptions for all the use of try/catch/throw in rxcpp.
    cflags = ["-fexceptions"];
};

librxcpp-tests = cc_test {
    #  "AOSP" config. Disable exceptions.
    #  Anything in AOSP using librxcpp will use it as this config, so
    #  that's what we really care about testing.
    name = "librxcpp-tests";
    defaults = ["librxcpp-tests-defaults"];
    whole_static_libs = ["libcatch2"];
};

in { inherit librxcpp librxcpp-tests librxcpp-tests-defaults librxcpp-tests-upstream; }
