{ filegroup }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

"apex.test-file_contexts" = filegroup {
    name = "apex.test-file_contexts";
    srcs = [
        "apex.test-file_contexts"
    ];
};

"com.android.adbd-file_contexts" = filegroup {
    name = "com.android.adbd-file_contexts";
    srcs = [
        "com.android.adbd-file_contexts"
    ];
};

"com.android.sdkext-file_contexts" = filegroup {
    name = "com.android.sdkext-file_contexts";
    srcs = [
        "com.android.sdkext-file_contexts"
    ];
};

"com.android.art.debug-file_contexts" = filegroup {
    name = "com.android.art.debug-file_contexts";
    srcs = [
        "com.android.art.debug-file_contexts"
    ];
};

"com.android.art.release-file_contexts" = filegroup {
    name = "com.android.art.release-file_contexts";
    srcs = [
        "com.android.art.release-file_contexts"
    ];
};

"com.android.bootanimation-file_contexts" = filegroup {
    name = "com.android.bootanimation-file_contexts";
    srcs = [
        "com.android.bootanimation-file_contexts"
    ];
};

"com.android.cellbroadcast-file_contexts" = filegroup {
    name = "com.android.cellbroadcast-file_contexts";
    srcs = [
        "com.android.cellbroadcast-file_contexts"
    ];
};

"com.android.conscrypt-file_contexts" = filegroup {
    name = "com.android.conscrypt-file_contexts";
    srcs = [
        "com.android.conscrypt-file_contexts"
    ];
};

"com.android.cronet-file_contexts" = filegroup {
    name = "com.android.cronet-file_contexts";
    srcs = [
        "com.android.cronet-file_contexts"
    ];
};

"com.android.ipsec-file_contexts" = filegroup {
    name = "com.android.ipsec-file_contexts";
    srcs = [
        "com.android.ipsec-file_contexts"
    ];
};

"com.android.i18n-file_contexts" = filegroup {
    name = "com.android.i18n-file_contexts";
    srcs = [
        "com.android.i18n-file_contexts"
    ];
};

"com.android.media-file_contexts" = filegroup {
    name = "com.android.media-file_contexts";
    srcs = [
        "com.android.media-file_contexts"
    ];
};

"com.android.mediaprovider-file_contexts" = filegroup {
    name = "com.android.mediaprovider-file_contexts";
    srcs = [
        "com.android.mediaprovider-file_contexts"
    ];
};

"com.android.media.swcodec-file_contexts" = filegroup {
    name = "com.android.media.swcodec-file_contexts";
    srcs = [
        "com.android.media.swcodec-file_contexts"
    ];
};

"com.android.neuralnetworks-file_contexts" = filegroup {
    name = "com.android.neuralnetworks-file_contexts";
    srcs = [
        "com.android.neuralnetworks-file_contexts"
    ];
};

"com.android.os.statsd-file_contexts" = filegroup {
    name = "com.android.os.statsd-file_contexts";
    srcs = [
        "com.android.os.statsd-file_contexts"
    ];
};

"com.android.permission-file_contexts" = filegroup {
    name = "com.android.permission-file_contexts";
    srcs = [
        "com.android.permission-file_contexts"
    ];
};

"com.android.resolv-file_contexts" = filegroup {
    name = "com.android.resolv-file_contexts";
    srcs = [
        "com.android.resolv-file_contexts"
    ];
};

"com.android.runtime-file_contexts" = filegroup {
    name = "com.android.runtime-file_contexts";
    srcs = [
        "com.android.runtime-file_contexts"
    ];
};

"com.android.telephony-file_contexts" = filegroup {
    name = "com.android.telephony-file_contexts";
    srcs = [
        "com.android.telephony-file_contexts"
    ];
};

"com.android.tzdata-file_contexts" = filegroup {
    name = "com.android.tzdata-file_contexts";
    srcs = [
        "com.android.tzdata-file_contexts"
    ];
};

"com.android.vndk-file_contexts" = filegroup {
    name = "com.android.vndk-file_contexts";
    srcs = [
        "com.android.vndk-file_contexts"
    ];
};

"com.android.wifi-file_contexts" = filegroup {
    name = "com.android.wifi-file_contexts";
    srcs = [
        "com.android.wifi-file_contexts"
    ];
};

"com.android.tethering-file_contexts" = filegroup {
    name = "com.android.tethering-file_contexts";
    srcs = [
        "com.android.tethering-file_contexts"
    ];
};

"com.android.extservices-file_contexts" = filegroup {
    name = "com.android.extservices-file_contexts";
    srcs = [
        "com.android.extservices-file_contexts"
    ];
};

in { inherit "apex.test-file_contexts" "com.android.adbd-file_contexts" "com.android.art.debug-file_contexts" "com.android.art.release-file_contexts" "com.android.bootanimation-file_contexts" "com.android.cellbroadcast-file_contexts" "com.android.conscrypt-file_contexts" "com.android.cronet-file_contexts" "com.android.extservices-file_contexts" "com.android.i18n-file_contexts" "com.android.ipsec-file_contexts" "com.android.media-file_contexts" "com.android.media.swcodec-file_contexts" "com.android.mediaprovider-file_contexts" "com.android.neuralnetworks-file_contexts" "com.android.os.statsd-file_contexts" "com.android.permission-file_contexts" "com.android.resolv-file_contexts" "com.android.runtime-file_contexts" "com.android.sdkext-file_contexts" "com.android.telephony-file_contexts" "com.android.tethering-file_contexts" "com.android.tzdata-file_contexts" "com.android.vndk-file_contexts" "com.android.wifi-file_contexts"; }
