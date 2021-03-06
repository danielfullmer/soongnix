{ cc_defaults, cc_library_headers, cc_library_shared }:
let

#  Copyright (c) 2011 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

#  These defines will apply to all source files
#  Think again before changing it
webrtc_flags = cc_defaults {
    name = "webrtc_flags";
    vendor = true;

    cflags = [
        "-DWEBRTC_POSIX"
        "-DWEBRTC_LINUX"
        "-DWEBRTC_THREAD_RR"
        "-DWEBRTC_CLOCK_TYPE_REALTIME"
        "-DWEBRTC_ANDROID"

        #  The following macros are used by modules,
        #  we might need to re-organize them
        #  "-DWEBRTC_ANDROID_OPENSLES", // [module audio_device]
        #  "-DNETEQ_VOICEENGINE_CODECS", // [module audio_coding neteq]
        #  "-DWEBRTC_MODULE_UTILITY_VIDEO", // [module media_file] [module utility]

        "-Wall"
        "-Werror"
        #  The following warnings are disabled in most webrtc modules,
        #  until we upgrade to newer cleaner upstream webrtc.
        "-Wno-missing-braces"
        "-Wno-missing-field-initializers"
        "-Wno-unused-parameter"
    ];

    header_libs = ["libwebrtc_headers"];

    arch = {
        arm = {
            instruction_set = "arm";

            cflags = [
                "-DWEBRTC_ARCH_ARM"
                #  "-DWEBRTC_DETECT_ARM_NEON", // only used in a build configuration without Neon
                #  TODO(kma): figure out if the above define could be moved to NDK build only.

                #  The following upstram ARM_NEON and ARMV7A defintions do not work on AOSP yet.
                #  They should be fixed in the next merge from upstream.
                # # TODO(kma): test if the code under next two macros works with generic GCC compilers
                #  "-DWEBRTC_ARCH_ARM_NEON",
                #  "-flax-vector-conversions",
                #  "-DWEBRTC_ARCH_ARM_V7A",
            ];
        };
    };

    #  The following clang-tidy checks are disabled in most webrtc modules,
    #  until we upgrade to newer cleaner upstream webrtc.
    tidy_checks = [
        "-cert-*"
        "-clang-analyzer-*"
        "-hicpp-*"
        "-llvm-*"
        "-google-build-namespaces"
        "-google-default-arguments"
        "-google-explicit-constructor"
        "-google-runtime-int"
        "-google-runtime-operator"
        "-misc-incorrect-roundings"
        "-misc-macro-parentheses"
        "-misc-misplaced-widening-cast"
        "-misc-noexcept-move-constructor"
        "-misc-suspicious-string-compare"
        "-misc-unused-parameters"
        "-misc-unused-using-decls"
        "-performance-type-promotion-in-math-fn"
        "-performance-unnecessary-copy-initialization"
        "-performance-unnecessary-value-param"
    ];
};

libwebrtc_audio_preprocessing = cc_library_shared {
    name = "libwebrtc_audio_preprocessing";
    vendor = true;

    whole_static_libs = [
        "libwebrtc_aec"
        "libwebrtc_aecm"
        "libwebrtc_agc"
        "libwebrtc_apm"
        "libwebrtc_apm_utility"
        "libwebrtc_apvad"
        "libwebrtc_base"
        "libwebrtc_beamformer"
        "libwebrtc_common"
        "libwebrtc_intell"
        "libwebrtc_isac"
        "libwebrtc_resampler"
        "libwebrtc_ns"
        "libwebrtc_spl"
        "libwebrtc_system_wrappers"
        "libwebrtc_transient"
        "libwebrtc_vad"
    ];

    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libprotobuf-cpp-lite"
    ];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };

    #  Disable native_coverage since linking fails with -O0 (needed for
    #  coverage).  The fix is to mark InStream::Rewind and OutStream::Rewind as
    #  pure virtual in webrtc/common_types.h
    native_coverage = false;
};

libwebrtc_audio_coding = cc_library_shared {
    name = "libwebrtc_audio_coding";
    vendor = true;

    whole_static_libs = [
        "libwebrtc_base"
        "libwebrtc_common"
        "libwebrtc_intell"
        "libwebrtc_isac"
        "libwebrtc_isacfix"
        "libwebrtc_resampler"
        "libwebrtc_spl"
        "libwebrtc_system_wrappers"
    ];

    shared_libs = [
        "libprotobuf-cpp-lite"
        "liblog"
        "libcutils"
        "libdl"
    ];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
};

libwebrtc_headers = cc_library_headers {
    name = "libwebrtc_headers";
    vendor = true;
    export_include_dirs = ["."];
};

subdirs = ["webrtc/*"];

in { inherit libwebrtc_audio_coding libwebrtc_audio_preprocessing libwebrtc_headers webrtc_flags; }
