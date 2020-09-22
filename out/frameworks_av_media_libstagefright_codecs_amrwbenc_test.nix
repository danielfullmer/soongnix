{ cc_test }:
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

AmrwbEncoderTest = cc_test {
    name = "AmrwbEncoderTest";
    gtest = true;

    srcs = [
        "AmrwbEncoderTest.cpp"
    ];

    static_libs = [
        "libstagefright_enc_common"
        "libstagefright_amrwbenc"
        "libaudioutils"
        "libsndfile"
    ];

    shared_libs = [
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
};

in { inherit AmrwbEncoderTest; }
