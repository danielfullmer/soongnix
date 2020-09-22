{ filegroup, genrule, prebuilt_etc, soong_namespace }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#  Import this namespace in order to use AOSP No Input configuration example

_missingName = soong_namespace {
    imports = [
        "frameworks/av/services/audiopolicy/engineconfigurable/config/example/phone"
        "frameworks/av/services/audiopolicy/config"
    ];
};

"parameter-framework.policy" = prebuilt_etc {
    name = "parameter-framework.policy";
    filename_from_src = true;
    vendor = true;
    src = ":domaingeneratorpolicyrule_gen";
    sub_dir = "parameter-framework/Settings/Policy";
    required = [
        "PolicyClass.xml"
        "PolicySubsystem.xml"
        "PolicySubsystem-CommonTypes.xml"
    ];
};

domaingeneratorpolicyrule_gen = genrule {
    name = "domaingeneratorpolicyrule_gen";
    defaults = ["domaingeneratorpolicyrule"];
    srcs = [
        ":audio_policy_pfw_toplevel"
        ":audio_policy_pfw_structure_files"
        ":audio_policy_engine_criterion_types"
        ":edd_files"
    ];
};

audio_policy_pfw_toplevel = filegroup {
    name = "audio_policy_pfw_toplevel";
    srcs = [":ParameterFrameworkConfigurationPolicy.userdebug.xml"];
};

audio_policy_pfw_structure_files = filegroup {
    name = "audio_policy_pfw_structure_files";
    srcs = [
        ":PolicyClass"
        ":PolicySubsystem"
        ":buildcommontypesstructure_gen"
    ];
};

edd_files = filegroup {
    name = "edd_files";
    srcs = [
        "device_for_input_source.pfw"
        ":volumes.pfw"
    ];
};

"PolicySubsystem.xml" = prebuilt_etc {
    name = "PolicySubsystem.xml";
    vendor = true;
    src = ":PolicySubsystem-no-strategy";
    sub_dir = "parameter-framework/Structure/Policy";
};

in { inherit "PolicySubsystem.xml" "parameter-framework.policy" _missingName audio_policy_pfw_structure_files audio_policy_pfw_toplevel domaingeneratorpolicyrule_gen edd_files; }