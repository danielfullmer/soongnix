{ filegroup }:
let

#
#  Copyright 2020 The Android Open Source Project
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

stable-mediasession2-aidl-srcs = filegroup {
    name = "stable-mediasession2-aidl-srcs";
    srcs = ["stable/android/media/Session2Token.aidl"];
    path = "stable";
};

private-mediasession2-aidl-srcs = filegroup {
    name = "private-mediasession2-aidl-srcs";
    srcs = [
        "private/android/media/IMediaController2.aidl"
        "private/android/media/IMediaSession2.aidl"
        "private/android/media/IMediaSession2Service.aidl"
    ];
    path = "private";
};

mediasession2-aidl-srcs = filegroup {
    name = "mediasession2-aidl-srcs";
    srcs = [
        ":private-mediasession2-aidl-srcs"
        ":stable-mediasession2-aidl-srcs"
    ];
};

in { inherit mediasession2-aidl-srcs private-mediasession2-aidl-srcs stable-mediasession2-aidl-srcs; }
