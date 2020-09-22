{ cc_library_headers, cc_library_static, cc_test }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

VtsHalRadioV1_0TargetTest = cc_test {
    name = "VtsHalRadioV1_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "radio_hidl_hal_cell_broadcast.cpp"
        "radio_hidl_hal_data.cpp"
        "radio_hidl_hal_icc.cpp"
        "radio_hidl_hal_ims.cpp"
        "radio_hidl_hal_misc.cpp"
        "radio_hidl_hal_sms.cpp"
        "radio_hidl_hal_stk.cpp"
        "radio_hidl_hal_test.cpp"
        "radio_hidl_hal_voice.cpp"
        "radio_indication.cpp"
        "radio_response.cpp"
        "VtsHalRadioV1_0TargetTest.cpp"
        "vts_test_util.cpp"
    ];
    static_libs = [
        "android.hardware.radio@1.0"
    ];
    test_config = "vts_hal_radio_target_test.xml";
    test_suites = [
        "general-tests"
        "vts"
    ];
};

VtsHalSapV1_0TargetTest = cc_test {
    name = "VtsHalSapV1_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "sap_callback.cpp"
        "sap_hidl_hal_api.cpp"
        "sap_hidl_hal_test.cpp"
        "VtsHalSapV1_0TargetTest.cpp"
        "vts_test_util.cpp"
    ];
    static_libs = [
        "android.hardware.radio@1.0"
    ];
    test_config = "vts_hal_sap_target_test.xml";
    test_suites = [
        "general-tests"
        "vts"
    ];
};

RadioVtsTestUtilBase = cc_library_static {
    name = "RadioVtsTestUtilBase";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "vts_test_util.cpp"
    ];
    shared_libs = [
        "android.hardware.radio@1.0"
    ];
};

"radio.util.header@1.0" = cc_library_headers {
    name = "radio.util.header@1.0";
    export_include_dirs = ["."];
};

in { inherit "radio.util.header@1.0" RadioVtsTestUtilBase VtsHalRadioV1_0TargetTest VtsHalSapV1_0TargetTest; }
