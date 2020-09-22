{ filegroup, prebuilt_etc, soong_namespace }:
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

_missingName = soong_namespace {
};

"a2dp_in_audio_policy_configuration.xml" = prebuilt_etc {
    name = "a2dp_in_audio_policy_configuration.xml";
    vendor = true;
    src = ":a2dp_in_audio_policy_configuration";
};

"a2dp_audio_policy_configuration.xml" = prebuilt_etc {
    name = "a2dp_audio_policy_configuration.xml";
    vendor = true;
    src = ":a2dp_audio_policy_configuration";
};

"audio_policy_configuration.xml" = prebuilt_etc {
    name = "audio_policy_configuration.xml";
    vendor = true;
    src = ":audio_policy_configuration_generic";
};

"r_submix_audio_policy_configuration.xml" = prebuilt_etc {
    name = "r_submix_audio_policy_configuration.xml";
    vendor = true;
    src = ":r_submix_audio_policy_configuration";
};

"audio_policy_volumes.xml" = prebuilt_etc {
    name = "audio_policy_volumes.xml";
    vendor = true;
    src = ":audio_policy_volumes";
};

"default_volume_tables.xml" = prebuilt_etc {
    name = "default_volume_tables.xml";
    vendor = true;
    src = ":default_volume_tables";
};

"surround_sound_configuration_5_0.xml" = prebuilt_etc {
    name = "surround_sound_configuration_5_0.xml";
    vendor = true;
    src = ":surround_sound_configuration_5_0";
};

"usb_audio_policy_configuration.xml" = prebuilt_etc {
    name = "usb_audio_policy_configuration.xml";
    vendor = true;
    src = ":usb_audio_policy_configuration";
};

"primary_audio_policy_configuration.xml" = prebuilt_etc {
    name = "primary_audio_policy_configuration.xml";
    src = ":primary_audio_policy_configuration";
    vendor = true;
};

a2dp_in_audio_policy_configuration = filegroup {
    name = "a2dp_in_audio_policy_configuration";
    srcs = ["a2dp_in_audio_policy_configuration.xml"];
};

a2dp_audio_policy_configuration = filegroup {
    name = "a2dp_audio_policy_configuration";
    srcs = ["a2dp_audio_policy_configuration.xml"];
};

primary_audio_policy_configuration = filegroup {
    name = "primary_audio_policy_configuration";
    srcs = ["primary_audio_policy_configuration.xml"];
};

surround_sound_configuration_5_0 = filegroup {
    name = "surround_sound_configuration_5_0";
    srcs = ["surround_sound_configuration_5_0.xml"];
};

default_volume_tables = filegroup {
    name = "default_volume_tables";
    srcs = ["default_volume_tables.xml"];
};

audio_policy_volumes = filegroup {
    name = "audio_policy_volumes";
    srcs = ["audio_policy_volumes.xml"];
};

audio_policy_configuration_generic = filegroup {
    name = "audio_policy_configuration_generic";
    srcs = ["audio_policy_configuration_generic.xml"];
};

audio_policy_configuration_generic_configurable = filegroup {
    name = "audio_policy_configuration_generic_configurable";
    srcs = ["audio_policy_configuration_generic_configurable.xml"];
};

usb_audio_policy_configuration = filegroup {
    name = "usb_audio_policy_configuration";
    srcs = ["usb_audio_policy_configuration.xml"];
};

r_submix_audio_policy_configuration = filegroup {
    name = "r_submix_audio_policy_configuration";
    srcs = ["r_submix_audio_policy_configuration.xml"];
};

in { inherit "a2dp_audio_policy_configuration.xml" "a2dp_in_audio_policy_configuration.xml" "audio_policy_configuration.xml" "audio_policy_volumes.xml" "default_volume_tables.xml" "primary_audio_policy_configuration.xml" "r_submix_audio_policy_configuration.xml" "surround_sound_configuration_5_0.xml" "usb_audio_policy_configuration.xml" _missingName a2dp_audio_policy_configuration a2dp_in_audio_policy_configuration audio_policy_configuration_generic audio_policy_configuration_generic_configurable audio_policy_volumes default_volume_tables primary_audio_policy_configuration r_submix_audio_policy_configuration surround_sound_configuration_5_0 usb_audio_policy_configuration; }
