{ cc_defaults, cc_test, vts_config }:
let

#
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
#

vts_security_avb_defaults = cc_defaults {
    name = "vts_security_avb_defaults";
    srcs = ["VtsSecurityAvbTest.cpp"];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    static_libs = [
        "libavb"
        "libcrypto_static"
        "libfs_avb"
        "libfs_mgr"
    ];
};

vts_security_avb_test = cc_test {
    name = "vts_security_avb_test";
    defaults = ["vts_security_avb_defaults"];
    test_config = "vts_security_avb_test.xml";
    test_suites = [
        "device-tests"
        "vts"
    ];
    data = [
        ":q-gsi_avbpubkey"
        ":r-gsi_avbpubkey"
        ":s-gsi_avbpubkey"
    ];
};

VtsSecurityAvbTest = cc_test {
    name = "VtsSecurityAvbTest";
    defaults = ["vts_security_avb_defaults"];
};

VtsSecurityAvb = vts_config {
    name = "VtsSecurityAvb";
};

in { inherit VtsSecurityAvb VtsSecurityAvbTest vts_security_avb_defaults vts_security_avb_test; }
