{ aidl_interface, cc_library_shared }:
let

/*
 * Copyright (C) 2020 The Android Open Source Project
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

#  AIDL interfaces of MediaTranscoding.
mediatranscoding_aidl_interface = aidl_interface {
    name = "mediatranscoding_aidl_interface";
    unstable = true;
    local_include_dir = "aidl";
    srcs = [
        "aidl/android/media/IMediaTranscodingService.aidl"
        "aidl/android/media/ITranscodingServiceClient.aidl"
        "aidl/android/media/TranscodingErrorCode.aidl"
        "aidl/android/media/TranscodingJobPriority.aidl"
        "aidl/android/media/TranscodingType.aidl"
        "aidl/android/media/TranscodingVideoCodecType.aidl"
        "aidl/android/media/TranscodingJobParcel.aidl"
        "aidl/android/media/TranscodingRequestParcel.aidl"
        "aidl/android/media/TranscodingResultParcel.aidl"
    ];
};

libmediatranscoding = cc_library_shared {
    name = "libmediatranscoding";

    srcs = [
        "TranscodingClientManager.cpp"
    ];

    shared_libs = [
        "libbinder_ndk"
        "libcutils"
        "liblog"
        "libutils"
    ];

    export_include_dirs = ["include"];

    static_libs = [
        "mediatranscoding_aidl_interface-ndk_platform"
    ];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libmediatranscoding mediatranscoding_aidl_interface; }
