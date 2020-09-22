{ cc_fuzz }:
let

/******************************************************************************
 *
 * Copyright (C) 2020 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 *****************************************************************************
 * Originally developed and contributed by Ittiam Systems Pvt. Ltd, Bangalore
 */

amrnb_dec_fuzzer = cc_fuzz {
    name = "amrnb_dec_fuzzer";
    host_supported = true;
    srcs = [
        "amrnb_dec_fuzzer.cpp"
    ];
    static_libs = [
        "libstagefright_amrnbdec"
        "libstagefright_amrnb_common"
        "liblog"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit amrnb_dec_fuzzer; }
