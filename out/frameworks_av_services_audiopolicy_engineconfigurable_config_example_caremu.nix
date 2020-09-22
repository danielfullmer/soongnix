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

#  Import this namespace in order to use AOSP Car Emulator configuration example

_missingName = soong_namespace {
    imports = [
        "frameworks/av/services/audiopolicy/engineconfigurable/config/example/automotive"
        "frameworks/av/services/audiopolicy/config"
    ];
};

"audio_policy_engine_configuration.xml" = prebuilt_etc {
    name = "audio_policy_engine_configuration.xml";
    vendor = true;
    src = ":audio_policy_engine_configuration";
    required = [
        "audio_policy_engine_criterion_types.xml"
        "audio_policy_engine_criteria.xml"
        "audio_policy_engine_product_strategies.xml"
        ":audio_policy_engine_volumes.xml"
    ];
};

"audio_policy_engine_product_strategies.xml" = prebuilt_etc {
    name = "audio_policy_engine_product_strategies.xml";
    vendor = true;
    src = "audio_policy_engine_product_strategies.xml";
};

"audio_policy_engine_criterion_types.xml" = prebuilt_etc {
    name = "audio_policy_engine_criterion_types.xml";
    vendor = true;
    src = ":audio_policy_engine_criterion_types";
};

#
#  Generate audio_policy_engine criterion type file => provides device addresses criterion type
#
audio_policy_engine_criterion_types = genrule {
    name = "audio_policy_engine_criterion_types";
    defaults = ["buildpolicycriteriontypesrule"];
    srcs = [
        ":audio_policy_configuration_top_file"
        ":audio_policy_configuration_files"
    ];
};

audio_policy_configuration_files = filegroup {
    name = "audio_policy_configuration_files";
    srcs = [
        ":r_submix_audio_policy_configuration"
        ":default_volume_tables"
        ":audio_policy_volumes"
        ":surround_sound_configuration_5_0"
        ":primary_audio_policy_configuration"
    ];
};

audio_policy_configuration_top_file = filegroup {
    name = "audio_policy_configuration_top_file";
    srcs = [":audio_policy_configuration_generic"];
};

audio_policy_engine_configuration_files = filegroup {
    name = "audio_policy_engine_configuration_files";
    srcs = [
        ":audio_policy_engine_configuration"
        "audio_policy_engine_product_strategies.xml"
        ":audio_policy_engine_volumes"
        ":audio_policy_engine_criterion_types"
        ":audio_policy_engine_criteria"
    ];
};

in { inherit "audio_policy_engine_configuration.xml" "audio_policy_engine_criterion_types.xml" "audio_policy_engine_product_strategies.xml" _missingName audio_policy_configuration_files audio_policy_configuration_top_file audio_policy_engine_configuration_files audio_policy_engine_criterion_types; }