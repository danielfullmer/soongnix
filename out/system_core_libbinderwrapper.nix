{ cc_defaults, cc_library_shared, cc_library_static }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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
#

libbinderwrapper_defaults = cc_defaults {
    name = "libbinderwrapper_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"

        #  for libchrome
        "-Wno-sign-promo"
    ];
    export_include_dirs = ["include"];
    shared_libs = [
        "libbinder"
        "libchrome"
        "libutils"
    ];
};

#  libbinderwrapper shared library
#  ========================================================
libbinderwrapper = cc_library_shared {
    name = "libbinderwrapper";
    defaults = ["libbinderwrapper_defaults"];
    vendor_available = true;

    srcs = [
        "binder_wrapper.cc"
        "real_binder_wrapper.cc"
    ];
};

#  libbinderwrapper_test_support static library
#  ========================================================
libbinderwrapper_test_support = cc_library_static {
    name = "libbinderwrapper_test_support";
    defaults = ["libbinderwrapper_defaults"];

    static_libs = ["libgtest"];
    shared_libs = ["libbinderwrapper"];

    srcs = [
        "binder_test_base.cc"
        "stub_binder_wrapper.cc"
    ];
};

in { inherit libbinderwrapper libbinderwrapper_defaults libbinderwrapper_test_support; }
