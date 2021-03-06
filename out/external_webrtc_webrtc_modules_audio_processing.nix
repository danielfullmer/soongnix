{ cc_library_static, cc_test }:
let

#  Copyright (c) 2011 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

subdirs = ["*"];

libwebrtc_apm = cc_library_static {
    name = "libwebrtc_apm";
    defaults = ["webrtc_flags"];

    srcs = [
        "debug.proto"
        "test/unittest.proto"
        "audio_buffer.cc"
        "audio_processing_impl.cc"
        "echo_cancellation_impl.cc"
        "echo_control_mobile_impl.cc"
        "gain_control_impl.cc"
        "high_pass_filter_impl.cc"
        "level_estimator_impl.cc"
        "noise_suppression_impl.cc"
        "rms_level.cc"
        "splitting_filter.cc"
        "three_band_filter_bank.cc"
        "processing_component.cc"
        "voice_detection_impl.cc"
    ];

    cflags = [
        "-DWEBRTC_NS_FIXED"
        "-DWEBRTC_ANDROID_PLATFORM_BUILD"
        "-DWEBRTC_AUDIOPROC_DEBUG_DUMP"

        #  floating point
        #  "-DWEBRTC_NS_FLOAT",
    ];

    local_include_dirs = ["include"];
    header_libs = ["libwebrtc_modules_headers"];
    static_libs = [
        "libwebrtc_spl"
        "libwebrtc_vad"
        "libwebrtc_system_wrappers"
    ];
};

#  apm process test app
webrtc_apm_process_test = cc_test {
    name = "webrtc_apm_process_test";
    defaults = ["webrtc_flags"];

    srcs = [
        "debug.proto"
        "test/unittest.proto"
        "test/process_test.cc"
        "test/test_utils.cc"
        "test/protobuf_utils.cc"
        ":webrtc_common_audio_wav"
        ":webrtc_system_wrappers_tick_util"
        ":webrtc_test_testsupport_fileutils"
        ":webrtc_test_testsupport_perf_test"
    ];

    cflags = [
        "-DWEBRTC_ANDROID_PLATFORM_BUILD"
        "-DWEBRTC_AUDIOPROC_DEBUG_DUMP"
    ];

    local_include_dirs = ["include"];

    shared_libs = [
        "libutils"
        "libwebrtc_audio_preprocessing"
    ];

    arch = {
        arm = {
            instruction_set = "thumb";
        };
    };
};

#  apm unit test app
webrtc_apm_unit_test = cc_test {
    name = "webrtc_apm_unit_test";
    defaults = ["webrtc_flags"];

    srcs = [
        "debug.proto"
        "test/unittest.proto"
        "test/audio_processing_unittest.cc"
        "test/protobuf_utils.cc"
        "test/test_utils.cc"
        ":webrtc_common_audio_resampler_push_resampler"
        ":webrtc_test_testsupport_fileutils"
    ];

    cflags = [
        "-DWEBRTC_AUDIOPROC_FIXED_PROFILE"
        "-DWEBRTC_ANDROID_PLATFORM_BUILD"
        "-DWEBRTC_AUDIOPROC_DEBUG_DUMP"
    ];

    local_include_dirs = ["include"];

    shared_libs = ["libwebrtc_audio_preprocessing"];

    arch = {
        arm = {
            instruction_set = "thumb";
        };
    };
};

in { inherit libwebrtc_apm webrtc_apm_process_test webrtc_apm_unit_test; }
