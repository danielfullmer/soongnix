{ cc_binary_host, cc_defaults, cc_library_static, genrule, python_binary_host }:
let

#  Copyright 2018, The Android Open Source Project
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

#  Include generated Android.bp files
build = [
    "Android.base.bp"
    "Android.platform.bp"
    "Android.sampler.bp"
    "Android.v8.bp"
    "Android.v8gen.bp"
];

v8_defaults = cc_defaults {
    name = "v8_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-endif-labels"
        "-Wno-implicit-fallthrough"
        "-Wno-import"
        "-Wno-format"
        "-Wno-unused-variable"
        "-Wno-unused-parameter"
        "-Wno-unused-private-field"
        "-Wno-sign-compare"
        "-Wno-missing-field-initializers"
        "-Wno-ignored-qualifiers"
        "-Wno-undefined-var-template"
        "-Wno-null-pointer-arithmetic"
        "-Wno-non-virtual-dtor"
        "-Wno-user-defined-warnings"
        "-Wno-unused-lambda-capture"
        "-fno-exceptions"
        "-fvisibility=hidden"
        "-DENABLE_DEBUGGER_SUPPORT"
        "-DENABLE_LOGGING_AND_PROFILING"
        "-DENABLE_VMSTATE_TRACKING"
        "-DV8_NATIVE_REGEXP"
        "-DV8_INTL_SUPPORT"
        "-DV8_CONCURRENT_MARKING"
        "-std=gnu++0x"
        "-Os"
    ];

    arch = {
        arm = {
            cflags = ["-DV8_TARGET_ARCH_ARM"];
        };
        arm64 = {
            cflags = ["-DV8_TARGET_ARCH_ARM64"];
        };
        mips = {
            cflags = [
                "-DV8_TARGET_ARCH_MIPS"
                "-Umips"
                "-finline-limit=64"
                "-fno-strict-aliasing"
            ];
        };
        mips64 = {
            cflags = [
                "-DV8_TARGET_ARCH_MIPS64"
                "-Umips"
                "-finline-limit=64"
                "-fno-strict-aliasing"
            ];
        };
        x86 = {
            cflags = ["-DV8_TARGET_ARCH_IA32"];
        };
        x86_64 = {
            cflags = ["-DV8_TARGET_ARCH_X64"];
        };
    };
};

libv8gen = cc_library_static {
    name = "libv8gen";
    defaults = ["v8_defaults"];
    srcs = ["src/snapshot/snapshot-empty.cc"];
    generated_sources = [
        "v8gen_libraries"
        "v8gen_extra_libraries"
        "v8gen_experimental_extra_libraries"
    ];
    cflags = ["-DANDROID_LINK_SHARED_ICU4C"];
    header_libs = [
        "libicuuc_headers"
        "libicui18n_headers"
    ];
    generated_headers = ["v8_torque_file"];

    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

v8_torque = cc_binary_host {
    name = "v8_torque";
    defaults = ["v8_defaults"];
    srcs = [
        "src/torque/declarable.cc"
        "src/torque/declaration-visitor.cc"
        "src/torque/declarations.cc"
        "src/torque/earley-parser.cc"
        "src/torque/file-visitor.cc"
        "src/torque/implementation-visitor.cc"
        "src/torque/scope.cc"
        "src/torque/source-positions.cc"
        "src/torque/torque-parser.cc"
        "src/torque/type-oracle.cc"
        "src/torque/types.cc"
        "src/torque/utils.cc"

        "src/torque/torque.cc"
    ];
    static_libs = [
        "libv8base"
    ];
};

v8_torque_file = genrule {
    name = "v8_torque_file";
    tools = ["v8_torque"];
    srcs = [
        "src/builtins/base.tq"
        "src/builtins/array.tq"
        "src/builtins/array-copywithin.tq"
        "src/builtins/array-foreach.tq"
        "src/builtins/array-reverse.tq"
        "src/builtins/typed-array.tq"
        "src/builtins/data-view.tq"
        "third_party/v8/builtins/array-sort.tq"
    ];
    cmd = "mkdir -p $(genDir)/torque-generated/ && $(location v8_torque) -o $(genDir)/torque-generated/ $(in) && $(location v8_torque) -o $(genDir)/ $(in)";
    out = [
        "torque-generated/builtin-definitions-from-dsl.h"
        "torque-generated/builtins-base-from-dsl-gen.h"
        "torque-generated/builtins-array-from-dsl-gen.h"
        "torque-generated/builtins-typed-array-from-dsl-gen.h"
        "torque-generated/builtins-data-view-from-dsl-gen.h"
        "builtin-definitions-from-dsl.h"
        "builtins-base-from-dsl-gen.h"
        "builtins-array-from-dsl-gen.h"
        "builtins-typed-array-from-dsl-gen.h"
        "builtins-data-view-from-dsl-gen.h"
    ];
};

v8_torque_file_cc = genrule {
    name = "v8_torque_file_cc";
    tools = ["v8_torque"];
    srcs = [
        "src/builtins/base.tq"
        "src/builtins/array.tq"
        "src/builtins/array-copywithin.tq"
        "src/builtins/array-foreach.tq"
        "src/builtins/array-reverse.tq"
        "src/builtins/typed-array.tq"
        "src/builtins/data-view.tq"
        # "test/torque/test-torque.tq",
        "third_party/v8/builtins/array-sort.tq"
    ];
    cmd = "mkdir -p $(genDir)/torque-generated/ && $(location v8_torque) -o $(genDir)/ $(in)";
    out = [
        "builtins-base-from-dsl-gen.cc"
        "builtins-array-from-dsl-gen.cc"
        "builtins-typed-array-from-dsl-gen.cc"
        "builtins-data-view-from-dsl-gen.cc"
    ];
};

v8_js2c = python_binary_host {
    name = "v8_js2c";
    main = "tools/js2c.py";
    srcs = [
        "tools/js2c.py"
        "tools/jsmin.py"
    ];
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

v8gen_libraries = genrule {
    name = "v8gen_libraries";
    tools = ["v8_js2c"];
    cmd = "$(location v8_js2c) $(out) CORE $(in)";
    srcs = [":v8_js_lib_files"];
    out = ["libraries.cc"];
};

v8gen_extra_libraries = genrule {
    name = "v8gen_extra_libraries";
    tools = ["v8_js2c"];
    cmd = "$(location v8_js2c) $(out) EXTRAS";
    out = ["extra-libraries.cc"];
};

v8gen_experimental_extra_libraries = genrule {
    name = "v8gen_experimental_extra_libraries";
    tools = ["v8_js2c"];
    cmd = "$(location v8_js2c) $(out) EXPERIMENTAL_EXTRAS";
    out = ["experimental-extra-libraries.cc"];
};

libv8 = cc_library_static {
    name = "libv8";
    defaults = ["v8_defaults"];
    whole_static_libs = [
        "libv8base"
        "libv8platform"
        "libv8sampler"
        "libv8src"
        "libv8gen"
    ];
    export_include_dirs = ["include"];

    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

#  The bare 'd8' name conflicts with d8 from prebuilts/r8
#  NOT WORKING YET
/*
cc_binary {
    name: "v8_d8",
    defaults: ["v8_defaults"],

    srcs: [
        "src/d8.cc",
        "src/d8-posix.cc",
        "src/async-hooks-wrapper.cc",
        "src/d8-console.cc",
        //"src/inspector/v8-inspector-impl.cc",
    ],
    generated_sources: ["v8_d8_gen"],
    generated_headers: ["v8_torque_file"],

    static_libs: ["libv8"],
    shared_libs: [
        "liblog",
        "libicuuc",
        "libicui18n",
    ],
    cflags: ["-O0", "-DANDROID_LINK_SHARED_ICU4C"],
    local_include_dirs: ["include"],

    arch: {
        mips: {
            // Bug: http://b/31101212  WAR LLVM bug until next Clang update
            cflags: ["-O2"],
        },
    },
}

genrule {
    name: "v8_d8_gen",
    tools: ["v8_js2c"],
    cmd: "$(location v8_js2c) $(out) D8 $(in)",
    srcs: [
        "src/d8.js",
        "src/js/macros.py",
    ],
    out: ["d8-js.cc"],
}
*/

in { inherit libv8 libv8gen v8_defaults v8_js2c v8_torque v8_torque_file v8_torque_file_cc v8gen_experimental_extra_libraries v8gen_extra_libraries v8gen_libraries; }
