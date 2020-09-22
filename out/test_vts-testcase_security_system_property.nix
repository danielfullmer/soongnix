{ python_test_host, vts_config }:
let

#
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
#

VtsTrebleSysProp = vts_config {
    name = "VtsTrebleSysProp";
};

vts_treble_sys_prop_test = python_test_host {
    name = "vts_treble_sys_prop_test";
    main = "vts_treble_sys_prop_test.py";
    srcs = [
        "vts_treble_sys_prop_test.py"
    ];
    libs = [
        "vndk_utils"
        "vts_vndk_utils"
    ];
    data = [
        ":public_property_contexts"
    ];
    test_suites = [
        "vts"
    ];
    test_config = "vts_treble_sys_prop_test.xml";
    version = {
        py2 = {
            enabled = false;
            embedded_launcher = false;
        };
        py3 = {
            enabled = true;
            embedded_launcher = true;
        };
    };
};

in { inherit VtsTrebleSysProp vts_treble_sys_prop_test; }
