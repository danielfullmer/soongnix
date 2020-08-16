{ cc_binary, cc_defaults, cc_library_static, cc_test, filegroup }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

iorap-aidl = filegroup {
    name = "iorap-aidl";
    srcs = [
        #  note: using **/* doesn't work, so list each file one by one:
        #  see also b/70046217

        #  note: list only 'interface' aidl files, otherwise
        #  aidl generates an error "Refusing to generate code with unstructured parcelables."
        "binder/com/google/android/startop/iorap/IIorap.aidl"
        "binder/com/google/android/startop/iorap/ITaskListener.aidl"
    ];
};

iorap-default-flags = cc_defaults {
    name = "iorap-default-flags";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-missing-field-initializers"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];

    local_include_dirs = [
        "include"
        "src"
    ];
    #  TODO: shouldn't need this but there's a soong/cmake generator bug.
    export_include_dirs = [
        "include"
        "src"
    ];

    /*
    TODO: Header refactoring cleanup:
    
    Option 1): Move src/$component/file_name.h to src/$component/include/$component/file_name.h
    Option 2): Symlink src/$component/include/$component to src/$component
    
    Set export_include_dirs to '$component/include' for that component.
    
    Also delete the 'include' directory unless we have code other non-iorap
    targets are allowed to reference.
    */

    clang = true;
    shared_libs = ["libbase"];
};

iorap-default-dependencies = cc_defaults {
    name = "iorap-default-dependencies";

    static_libs = [
        "libiorap-binder"
        "libplatformprotos" #  android framework C++ protos.
    ];
    shared_libs = [
        "libbinder"
        "libutils"
        "libcutils" #  tracing.

        "libfruit" #  dependency injection.
        #  TODO: remove these annoying dependencies by hiding them in the main library code.

        #  dependency for libplatformprotos
        #  "libprotobuf-cpp-lite",

        #  libplatformprotos has an indirect dependency on full, causing compilation/linking
        #  errors if we use lite
        "libprotobuf-cpp-full"
    ];

    #  srcs: [":libprotobuf-internal-protos"],
    #  commented out because it causes compilation errors
    #  TODO: can we use the lite library somehow?

    header_libs = ["librxcpp"];
};

libiorap-binder = cc_library_static {
    name = "libiorap-binder";
    defaults = ["iorap-default-flags"];

    srcs = [
        ":iorap-aidl"
        "src/binder/iiorap_impl.cc"
    ];
    shared_libs = [
        "libbinder"
        "libutils"
        "libcutils" #  tracing.
    ];
    aidl = {
        local_include_dirs = ["binder"];
        include_dirs = ["frameworks/native/aidl/binder"];
        export_aidl_headers = true;
    };
    static_libs = [
        "libplatformprotos" #  android framework C++ protos.
    ];
};

libiorap-manager-default-dependencies = cc_defaults {
    name = "libiorap-manager-default-dependencies";
    static_libs = [
        "libiorap-perfetto"
    ];
    defaults = [
        "libiorap-perfetto-default-dependencies"
    ];
    #  Users of 'libiorap-manager' also need to include these defaults to avoid
    #  linking errors.
};

libiorap-manager = cc_library_static {
    name = "libiorap-manager";
    defaults = [
        "iorap-default-flags"
        "iorap-default-dependencies"
        "libiorap-manager-default-dependencies"
    ];

    srcs = [
        "src/manager/event_manager.cc"
    ];
};

iorapd = cc_binary {
    name = "iorapd";
    defaults = [
        "iorap-default-flags"
        "iorap-default-dependencies"
        "libiorap-manager-default-dependencies"
    ];
    srcs = [
        "src/iorapd/main.cc"
    ];
    static_libs = [
        "libiorap-manager"
    ];
    init_rc = [
        "iorapd.rc"
    ];
};

libiorap-inode2filename = cc_library_static {
    name = "libiorap-inode2filename";
    defaults = [
        "iorap-default-flags"
        "iorap-default-dependencies"
    ];

    srcs = [
        "src/inode2filename/inode.cc"
        "src/inode2filename/main.cc"
        "src/inode2filename/search_directories.cc"
    ];
};

"iorap.inode2filename" = cc_binary {
    name = "iorap.inode2filename";
    defaults = [
        "iorap-default-flags"
        "iorap-default-dependencies"
    ];
    srcs = [
        "src/inode2filename/inode.cc"
        "src/inode2filename/main.cc"
        "src/inode2filename/search_directories.cc"
    ];
    #  Easier debugging. TODO: make a separate debug config.
    #  XX: Using -O0 seems to completely hide some errors.
    cflags = [
        "-O2"
        "-UNDEBUG"
        "-DIORAP_INODE2FILENAME_MAIN=1"
    ];
    sanitize = {
        undefined = true;
        all_undefined = true;
        #  Pretty print when ubsan detects a problem.
        #  Otherwise it just calls abort().

        /*
        diag: {
        undefined: true,
        },
        */ #  don't use the diag when you want it to crash.
    };
};

iorapd-tests = cc_test {
    name = "iorapd-tests";
    test_suites = ["device-tests"];
    gtest = false; #  we use gtest *and* gmock.
    defaults = [
        "iorap-default-flags"
        "iorap-default-dependencies"
    ];
    srcs = [
        "tests/src/binder/app_launch_event_test.cc"
        "tests/src/binder/auto_parcelable_test.cc"
        "tests/src/inode2filename/search_directories_test.cc"
        "tests/src/tmp/introspection_test.cc"
    ];
    cflags = [
        "-O2"
        "-UNDEBUG"
    ];

    #  TODO:  we should probably have per-component tests.
    static_libs = [
        "libgmock_main"
        "libgmock"
        "libgtest"
        "libiorap-inode2filename"
    ];
};

libiorap-perfetto-protos = filegroup {
    name = "libiorap-perfetto-protos";
    srcs = [
    ];
};

#  Static libraries cannot export their dependencies,
#  the current convention is to use an extra 'defaults' rule for statics
#  to bring in all the dependencies.
libiorap-perfetto-default-dependencies = cc_defaults {
    name = "libiorap-perfetto-default-dependencies";

    #  Some of the libperfetto header typedefs leak out into iorap.
    #  Avoids compilation #include errors.
    #  TODO: clean this up, the headers should not leak out (maybe all we need is a PerfettoConsumer
    #  forward declaration?).
    include_dirs = ["external/perfetto/include"];
    #  Various perfetto protos are used directly by iorap.
    #
    #  Furthermore, we need this regardless to avoid linking errors when linking
    #  libiorap-perfetto.a into the main cc_binary rule.
    static_libs = [
        "perfetto_trace_protos"
    ];

    shared_libs = [
        #  Not part of true dependencies: Users of 'libiorap-perfetto' do not link against
        #  libperfetto.
        #  We only put this to avoid linking errors when building iorapd.
        #  TODO: can we split iorapd into libiorapd-main that doesn't link against libperfetto?
        #  only the last cc_binary should need the full transitive closure of the dependency graph.
        "libperfetto"
    ];
};

libiorap-perfetto = cc_library_static {
    name = "libiorap-perfetto";
    defaults = [
        "iorap-default-flags"
        "iorap-default-dependencies"
        "libiorap-perfetto-default-dependencies"
    ];

    srcs = [
        "src/perfetto/main.cc"
        "src/perfetto/rx_producer.cc"
    ];
};

"iorap.cmd.perfetto" = cc_binary {
    name = "iorap.cmd.perfetto";
    defaults = [
        "iorap-default-flags"
        "iorap-default-dependencies"
    ];
    shared_libs = ["libperfetto"];
    include_dirs = ["external/perfetto/include"];
    srcs = [
        "src/perfetto/main.cc"
        "src/perfetto/rx_producer.cc"
    ];
    #  Easier debugging. TODO: make a separate debug config.
    #  XX: Using -O0 seems to completely hide some errors.
    cflags = [
        "-O2"
        "-UNDEBUG"
        "-DIORAP_PERFETTO_MAIN=1"
    ];
    sanitize = {
        undefined = true;
        all_undefined = true;
        #  Pretty print when ubsan detects a problem.
        #  Otherwise it just calls abort().

        /*
        diag: {
        undefined: true,
        },
        */ #  don't use the diag when you want it to crash.
    };

    static_libs = [
        "perfetto_trace_protos"
    ];
};

in { inherit "iorap.cmd.perfetto" "iorap.inode2filename" iorap-aidl iorap-default-dependencies iorap-default-flags iorapd iorapd-tests libiorap-binder libiorap-inode2filename libiorap-manager libiorap-manager-default-dependencies libiorap-perfetto libiorap-perfetto-default-dependencies libiorap-perfetto-protos; }
