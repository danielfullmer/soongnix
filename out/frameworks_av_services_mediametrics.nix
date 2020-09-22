{ cc_binary, cc_defaults, cc_library_shared }:
let

#  Media Statistics service
#

tidy_errors = [
    #  https://clang.llvm.org/extra/clang-tidy/checks/list.html
    #  For many categories, the checks are too many to specify individually.
    #  Feel free to disable as needed - as warnings are generally ignored,
    #  we treat warnings as errors.
    "android-*"
    "bugprone-*"
    "cert-*"
    "clang-analyzer-security*"
    "google-*"
    "misc-*"
    # "modernize-*",  // explicitly list the modernize as they can be subjective.
    "modernize-avoid-bind"
    # "modernize-avoid-c-arrays", // std::array<> can be verbose
    "modernize-concat-nested-namespaces"
    # "modernize-deprecated-headers", // C headers still ok even if there is C++ equivalent.
    "modernize-deprecated-ios-base-aliases"
    "modernize-loop-convert"
    "modernize-make-shared"
    "modernize-make-unique"
    "modernize-pass-by-value"
    "modernize-raw-string-literal"
    "modernize-redundant-void-arg"
    "modernize-replace-auto-ptr"
    "modernize-replace-random-shuffle"
    "modernize-return-braced-init-list"
    "modernize-shrink-to-fit"
    "modernize-unary-static-assert"
    "modernize-use-auto" #  debatable - auto can obscure type
    "modernize-use-bool-literals"
    "modernize-use-default-member-init"
    "modernize-use-emplace"
    "modernize-use-equals-default"
    "modernize-use-equals-delete"
    "modernize-use-nodiscard"
    "modernize-use-noexcept"
    "modernize-use-nullptr"
    "modernize-use-override"
    # "modernize-use-trailing-return-type", // not necessarily more readable
    "modernize-use-transparent-functors"
    "modernize-use-uncaught-exceptions"
    "modernize-use-using"
    "performance-*"

    #  Remove some pedantic stylistic requirements.
    "-google-readability-casting" #  C++ casts not always necessary and may be verbose
    "-google-readability-todo" #  do not require TODO(info)
];

mediametrics_flags_defaults = cc_defaults {
    name = "mediametrics_flags_defaults";
    #  https://clang.llvm.org/docs/UsersManual.html#command-line-options
    #  https://clang.llvm.org/docs/DiagnosticsReference.html
    cflags = [
        "-Wall"
        "-Wdeprecated"
        "-Werror"
        "-Werror=implicit-fallthrough"
        "-Werror=sometimes-uninitialized"
        "-Werror=conditional-uninitialized"
        "-Wextra"
        "-Wredundant-decls"
        "-Wshadow"
        "-Wstrict-aliasing"
        "-fstrict-aliasing"
        "-Wthread-safety"
        # "-Wthread-safety-negative", // experimental - looks broken in R.
        "-Wunreachable-code"
        "-Wunreachable-code-break"
        "-Wunreachable-code-return"
        "-Wunused"
        "-Wused-but-marked-unused"
    ];
    #  https://clang.llvm.org/extra/clang-tidy/
    tidy = true;
    tidy_checks = tidy_errors;
    tidy_checks_as_errors = tidy_errors;
    tidy_flags = [
        "-format-style='file'"
        "--header-filter='frameworks/av/services/mediametrics/'"
    ];
};

mediametrics = cc_binary {
    name = "mediametrics";
    defaults = [
        "mediametrics_flags_defaults"
    ];

    srcs = [
        "main_mediametrics.cpp"
    ];

    shared_libs = [
        "libbinder"
        "liblog"
        "libmediametricsservice"
        "libmediautils"
        "libutils"
    ];
    header_libs = [
        "libaudioutils_headers"
        "libmediametrics_headers"
    ];

    init_rc = [
        "mediametrics.rc"
    ];
};

libmediametricsservice = cc_library_shared {
    name = "libmediametricsservice";
    defaults = [
        "mediametrics_flags_defaults"
    ];

    srcs = [
        "AudioAnalytics.cpp"
        "AudioPowerUsage.cpp"
        "AudioTypes.cpp"
        "cleaner.cpp"
        "iface_statsd.cpp"
        "MediaMetricsService.cpp"
        "statsd_audiopolicy.cpp"
        "statsd_audiorecord.cpp"
        "statsd_audiothread.cpp"
        "statsd_audiotrack.cpp"
        "statsd_codec.cpp"
        "statsd_drm.cpp"
        "statsd_extractor.cpp"
        "statsd_nuplayer.cpp"
        "statsd_recorder.cpp"
        "StringUtils.cpp"
    ];

    proto = {
        type = "lite";
    };

    shared_libs = [
        "libbase" #  android logging
        "libbinder"
        "libcutils"
        "liblog"
        "libmedia_helper"
        "libmediametrics"
        "libmediautils"
        "libmemunreachable"
        "libprotobuf-cpp-lite"
        "libstatslog"
        "libutils"
    ];

    static_libs = [
        "libplatformprotos"
    ];

    include_dirs = [
        "system/media/audio_utils/include"
    ];
};

in { inherit libmediametricsservice mediametrics mediametrics_flags_defaults; }
