{ art_debug_defaults, art_global_defaults, bootstrap_go_package }:
let

soong-art = bootstrap_go_package {
    name = "soong-art";
    pkgPath = "android/soong/art";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "blueprint-proptools"
        "soong"
        "soong-android"
        "soong-apex"
        "soong-cc"
    ];
    srcs = [
        "art.go"
        "codegen.go"
        "makevars.go"
    ];
    pluginFor = ["soong_build"];
};

art_clang_tidy_errors = [
    "android-cloexec-dup"
    "android-cloexec-open"
    "bugprone-argument-comment"
    "bugprone-lambda-function-name"
    "bugprone-unused-raii" #  Protect scoped things like MutexLock.
    "bugprone-unused-return-value"
    "bugprone-virtual-near-miss"
    "modernize-use-bool-literals"
    "modernize-use-nullptr"
    "modernize-use-using"
    "performance-faster-string-find"
    "performance-for-range-copy"
    "performance-implicit-conversion-in-loop"
    "performance-noexcept-move-constructor"
    "performance-unnecessary-copy-initialization"
    "performance-unnecessary-value-param"
    "misc-unused-using-decls"
];

art_clang_tidy_disabled = [
    "-google-default-arguments"
    #  We have local stores that are only used for debug checks.
    "-clang-analyzer-deadcode.DeadStores"
    #  We are OK with some static globals and that they can, in theory, throw.
    "-cert-err58-cpp"
    #  We have lots of C-style variadic functions, and are OK with them. JNI ensures
    #  that working around this warning would be extra-painful.
    "-cert-dcl50-cpp"
    #  "Modernization" we don't agree with.
    "-modernize-use-auto"
    "-modernize-return-braced-init-list"
    "-modernize-use-default-member-init"
    "-modernize-pass-by-value"
];

art_defaults = art_global_defaults {
    #  Additional flags are computed by art.go

    name = "art_defaults";
    cflags = [
        #  Base set of cflags used by all things ART.
        "-fno-rtti"
        "-ggdb3"
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wstrict-aliasing"
        "-fstrict-aliasing"
        "-Wunreachable-code"
        "-Wredundant-decls"
        "-Wshadow"
        "-Wunused"
        "-fvisibility=protected"

        #  Warn about thread safety violations with clang.
        #"-Wthread-safety"
        #"-Wthread-safety-negative"

        #  Warn if switch fallthroughs aren't annotated.
        "-Wimplicit-fallthrough"

        #  Enable float equality warnings.
        "-Wfloat-equal"

        #  Enable warning of converting ints to void*.
        "-Wint-to-void-pointer-cast"

        #  Enable warning of wrong unused annotations.
        "-Wused-but-marked-unused"

        #  Enable warning for deprecated language features.
        "-Wdeprecated"

        #  Enable warning for unreachable break & return.
        "-Wunreachable-code-break"
        "-Wunreachable-code-return"

        #  Disable warning for use of offsetof on non-standard layout type.
        #  We use it to implement OFFSETOF_MEMBER - see macros.h.
        "-Wno-invalid-offsetof"

        #  Enable inconsistent-missing-override warning. This warning is disabled by default in
        #  Android.
        "-Winconsistent-missing-override"

        #  Enable thread annotations for std::mutex, etc.
        "-D_LIBCPP_ENABLE_THREAD_SAFETY_ANNOTATIONS"
    ];

    target = {
        android = {
            cflags = [
                "-DART_TARGET"

                #  To use oprofile_android --callgraph, uncomment this and recompile with
                #     mmma -j art
                #  "-fno-omit-frame-pointer",
                #  "-marm",
                #  "-mapcs",
            ];
            include_dirs = [
                #  We optimize Thread::Current() with a direct TLS access. This requires access to a
                #   private Bionic header.
                "bionic/libc/private"
            ];
        };
        linux = {
            cflags = [
                #  Enable missing-noreturn only on non-Mac. As lots of things are not implemented for
                #  Apple, it's a pain.
                "-Wmissing-noreturn"
            ];
        };
        darwin = {
            enabled = false;
        };
        host = {
            cflags = [
                #  Bug: 15446488. We don't omit the frame pointer to work around
                #  clang/libunwind bugs that cause SEGVs in run-test-004-ThreadStress.
                "-fno-omit-frame-pointer"
                #  The build assumes that all our x86/x86_64 hosts (such as buildbots and developer
                #  desktops) support at least sse4.2/popcount. This firstly implies that the ART
                #  runtime binary itself may exploit these features. Secondly, this implies that
                #  the ART runtime passes these feature flags to dex2oat and JIT by calling the
                #  method InstructionSetFeatures::FromCppDefines(). Since invoking dex2oat directly
                #  does not pick up these flags, cross-compiling from a x86/x86_64 host to a
                #  x86/x86_64 target should not be affected.
                "-msse4.2"
                "-mpopcnt"
            ];
        };
    };

    codegen = {
        arm = {
            cflags = ["-DART_ENABLE_CODEGEN_arm"];
        };
        arm64 = {
            cflags = ["-DART_ENABLE_CODEGEN_arm64"];
        };
        mips = {
            cflags = ["-DART_ENABLE_CODEGEN_mips"];
        };
        mips64 = {
            cflags = ["-DART_ENABLE_CODEGEN_mips64"];
        };
        x86 = {
            cflags = ["-DART_ENABLE_CODEGEN_x86"];
        };
        x86_64 = {
            cflags = ["-DART_ENABLE_CODEGEN_x86_64"];
        };
    };

    include_dirs = [
        "external/vixl/src"
    ];

    tidy_checks = art_clang_tidy_errors ++ art_clang_tidy_disabled;
    tidy_checks_as_errors = art_clang_tidy_errors;

    tidy_flags = [
        #  The static analyzer treats DCHECK as always enabled; we sometimes get
        #  false positives when we use DCHECKs with code that relies on NDEBUG.
        "-extra-arg=-UNDEBUG"
        #  clang-tidy complains about functions like:
        #  void foo() { CHECK(kIsFooEnabled); /* do foo... */ }
        #  not being marked noreturn if kIsFooEnabled is false.
        "-extra-arg=-Wno-missing-noreturn"
        #  Because tidy doesn't like our flow checks for compile-time configuration and thinks that
        #  the following code is dead (it is, but not for all configurations), disable unreachable
        #  code detection in Clang for tidy builds. It is still on for regular build steps, so we
        #  will still get the "real" errors.
        "-extra-arg=-Wno-unreachable-code"
    ];
};

_bp2nix_art_debug_defaults = art_debug_defaults {
    name = "art_debug_defaults";
    cflags = [
        "-DDYNAMIC_ANNOTATIONS_ENABLED=1"
        "-DVIXL_DEBUG"
        "-UNDEBUG"
    ];
    asflags = [
        "-UNDEBUG"
    ];
    target = {
        #  This has to be duplicated for android and host to make sure it
        #  comes after the -Wframe-larger-than warnings inserted by art.go
        #  target-specific properties
        android = {
            cflags = ["-Wno-frame-larger-than="];
        };
        host = {
            cflags = ["-Wno-frame-larger-than="];
        };
    };
};

in { inherit art_defaults soong-art; art_debug_defaults = _bp2nix_art_debug_defaults; }
