{ prebuilt_etc, soong_namespace }:
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

#  Import this namespace in order to use AOSP Phone with Default Engine configuration example

_missingName = soong_namespace {
};

"audio_policy_engine_configuration.xml" = prebuilt_etc {
    name = "audio_policy_engine_configuration.xml";
    vendor = true;
    src = "phone/audio_policy_engine_configuration.xml";
    required = [
        ":audio_policy_engine_stream_volumes.xml"
        ":audio_policy_engine_default_stream_volumes.xml"
        ":audio_policy_engine_product_strategies.xml"
    ];
};

"audio_policy_engine_product_strategies.xml" = prebuilt_etc {
    name = "audio_policy_engine_product_strategies.xml";
    vendor = true;
    src = "phone/audio_policy_engine_product_strategies.xml";
};

"audio_policy_engine_stream_volumes.xml" = prebuilt_etc {
    name = "audio_policy_engine_stream_volumes.xml";
    vendor = true;
    src = "phone/audio_policy_engine_stream_volumes.xml";
};

"audio_policy_engine_default_stream_volumes.xml" = prebuilt_etc {
    name = "audio_policy_engine_default_stream_volumes.xml";
    vendor = true;
    src = "phone/audio_policy_engine_default_stream_volumes.xml";
};

in { inherit "audio_policy_engine_configuration.xml" "audio_policy_engine_default_stream_volumes.xml" "audio_policy_engine_product_strategies.xml" "audio_policy_engine_stream_volumes.xml" _missingName; }
