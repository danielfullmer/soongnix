{ vintf_compatibility_matrix }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

"framework_compatibility_matrix.legacy.xml" = vintf_compatibility_matrix {
    name = "framework_compatibility_matrix.legacy.xml";
    stem = "compatibility_matrix.legacy.xml";
    srcs = [
        "compatibility_matrix.legacy.xml"
    ];
    kernel_configs = [
        #  legacy uses O kernel requirements
        "kernel_config_o_3.18"
        "kernel_config_o_4.4"
        "kernel_config_o_4.9"
    ];
};

"framework_compatibility_matrix.1.xml" = vintf_compatibility_matrix {
    name = "framework_compatibility_matrix.1.xml";
    stem = "compatibility_matrix.1.xml";
    srcs = [
        "compatibility_matrix.1.xml"
    ];
    kernel_configs = [
        "kernel_config_o_3.18"
        "kernel_config_o_4.4"
        "kernel_config_o_4.9"
    ];
};

"framework_compatibility_matrix.2.xml" = vintf_compatibility_matrix {
    name = "framework_compatibility_matrix.2.xml";
    stem = "compatibility_matrix.2.xml";
    srcs = [
        "compatibility_matrix.2.xml"
    ];
    kernel_configs = [
        "kernel_config_o_mr1_3.18"
        "kernel_config_o_mr1_4.4"
        "kernel_config_o_mr1_4.9"
    ];
};

"framework_compatibility_matrix.3.xml" = vintf_compatibility_matrix {
    name = "framework_compatibility_matrix.3.xml";
    stem = "compatibility_matrix.3.xml";
    srcs = [
        "compatibility_matrix.3.xml"
    ];
    kernel_configs = [
        "kernel_config_p_4.4"
        "kernel_config_p_4.9"
        "kernel_config_p_4.14"
    ];
};

"framework_compatibility_matrix.4.xml" = vintf_compatibility_matrix {
    name = "framework_compatibility_matrix.4.xml";
    stem = "compatibility_matrix.4.xml";
    srcs = [
        "compatibility_matrix.4.xml"
    ];
    kernel_configs = [
        "kernel_config_q_4.9"
        "kernel_config_q_4.14"
        "kernel_config_q_4.19"
    ];
};

in { inherit "framework_compatibility_matrix.1.xml" "framework_compatibility_matrix.2.xml" "framework_compatibility_matrix.3.xml" "framework_compatibility_matrix.4.xml" "framework_compatibility_matrix.legacy.xml"; }
