{ cc_defaults, cc_library_shared }:
let

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
    "-google-build-using-namespace" #  Reenable and fix later.
];

soundpool_flags_defaults = cc_defaults {
    name = "soundpool_flags_defaults";
    #  https://clang.llvm.org/docs/UsersManual.html#command-line-options
    #  https://clang.llvm.org/docs/DiagnosticsReference.html
    cflags = [
        "-Wall"
        "-Wdeprecated"
        "-Werror"
        "-Werror=implicit-fallthrough"
        "-Werror=sometimes-uninitialized"
        # "-Werror=conditional-uninitialized",
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
        "--header-filter='frameworks/base/media/jni/soundpool'"
    ];
};

libsoundpool = cc_library_shared {
    name = "libsoundpool";
    defaults = [
        "soundpool_flags_defaults"
    ];

    srcs = [
        "android_media_SoundPool.cpp"
        "Sound.cpp"
        "SoundDecoder.cpp"
        "SoundManager.cpp"
        "SoundPool.cpp"
        "Stream.cpp"
        "StreamManager.cpp"
    ];

    header_libs = [
        "libmedia_headers"
        "libmediametrics_headers"
    ];

    shared_libs = [
        "libaudioutils"
        "liblog"
        "libcutils"
        "libutils"
        "libandroid_runtime"
        "libnativehelper"
        "libaudioclient"
        "libmediandk"
        "libbinder"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit libsoundpool soundpool_flags_defaults; }
