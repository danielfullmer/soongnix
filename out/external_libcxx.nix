{ cc_binary, cc_defaults, cc_library_shared, cc_library_static, python_test }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

"libc++ defaults" = cc_defaults {
    name = "libc++ defaults";
    host_supported = true;
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    cppflags = [
        "-std=c++14"
        "-fexceptions"
        "-DLIBCXX_BUILDING_LIBCXXABI"
        "-D_LIBCPP_BUILDING_LIBRARY"
    ];
    rtti = true;
    stl = "none";
    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
            cflags = [
                "-D_LIBCPP_HAS_THREAD_API_WIN32"
                "-D_LIBCXXABI_BUILDING_LIBRARY"
                "-D_LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS"
                "-D_LIBCXXABI_DISABLE_VISIBILITY_ANNOTATIONS"
                "-UWIN32_LEAN_AND_MEAN"
            ];
        };
        windows_x86 = {
            cflags = [
                "-fsjlj-exceptions"
            ];
        };
    };
};

#  host + device static lib
"libc++_static" = cc_library_static {
    name = "libc++_static";
    defaults = ["libc++ defaults"];
    vendor_available = true;
    ramdisk_available = true;
    recovery_available = true;
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    #  being part of updatable apexes, this should work on older releases
    min_sdk_version = "apex_inherit";
    native_bridge_supported = true;
    srcs = [
        "src/algorithm.cpp"
        "src/any.cpp"
        "src/bind.cpp"
        "src/charconv.cpp"
        "src/chrono.cpp"
        "src/condition_variable.cpp"
        "src/debug.cpp"
        "src/exception.cpp"
        "src/future.cpp"
        "src/hash.cpp"
        "src/ios.cpp"
        "src/iostream.cpp"
        "src/locale.cpp"
        "src/memory.cpp"
        "src/mutex.cpp"
        "src/new.cpp"
        "src/optional.cpp"
        "src/random.cpp"
        "src/regex.cpp"
        "src/shared_mutex.cpp"
        "src/stdexcept.cpp"
        "src/string.cpp"
        "src/strstream.cpp"
        "src/system_error.cpp"
        "src/thread.cpp"
        "src/typeinfo.cpp"
        "src/utility.cpp"
        "src/valarray.cpp"
        "src/variant.cpp"
        "src/vector.cpp"
    ];
    whole_static_libs = [
        "libc++abi"
    ];
    target = {
        windows = {
            srcs = [
                "src/support/win32/*.cpp"
            ];
        };
    };
};

#  host + device dynamic lib
"libc++" = cc_library_shared {
    name = "libc++";
    host_supported = true;
    vendor_available = true;
    native_bridge_supported = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    ramdisk_available = true;
    recovery_available = true;
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    #  being part of updatable apexes, this should work on older releases
    min_sdk_version = "apex_inherit";
    whole_static_libs = ["libc++_static"];
    stl = "none";

    target = {
        darwin = {
            unexported_symbols_list = "lib/libc++unexp.exp";
            force_symbols_not_weak_list = "lib/notweak.exp";
            force_symbols_weak_list = "lib/weak.exp";
            ldflags = [
                "-Wl,-undefined,dynamic_lookup"
            ];
        };

        linux_bionic = {
            enabled = true;
        };
    };
};

"libc++experimental" = cc_library_static {
    name = "libc++experimental";
    defaults = ["libc++ defaults"];
    srcs = [
        "src/experimental/memory_resource.cpp"
    ];
};

"libc++fs" = cc_library_static {
    name = "libc++fs";
    recovery_available = true;
    defaults = ["libc++ defaults"];
    srcs = [
        "src/filesystem/directory_iterator.cpp"
        "src/filesystem/operations.cpp"
    ];
    multilib = {
        lib32 = {
            #  off_t usage is constrained to within the libc++ source (not the
            #  headers), so we can build the filesystem library with a 64-bit
            #  off_t on LP32 to get large file support without needing all users
            #  of the library to match.
            cflags = ["-D_FILE_OFFSET_BITS=64"];
        };
    };
    target = {
        windows = {
            enabled = false;
        };
    };
};

#  This target is used to extract the build commands for a test executable.
#  See run_tests.py.
libcxx_test_template = cc_binary {
    name = "libcxx_test_template";
    srcs = [
        "libcxx_test_template.cpp"
    ];
    cppflags = [
        "-fsized-deallocation"
        "-fexceptions"
        "-fcoroutines-ts"
        "-Wno-format-zero-length"
        "-Wno-implicit-fallthrough"
        "-Wno-non-virtual-dtor"
        "-Wno-return-stack-address"
        "-Wno-unused-local-typedef"

        "-UNDEBUG"

        #  Optimization is causing relocation for nothrow new to be thrown away.
        #  http://llvm.org/bugs/show_bug.cgi?id=21421
        "-O0"
    ];
    static_libs = [
        "libc++experimental"
        "libc++fs"
    ];
    rtti = true;
    local_include_dirs = [
        "test/support"
    ];
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    compile_multilib = "both";
    host_supported = true;
    target = {
        linux = {
            ldflags = [
                #  This makes the tests run a little faster.
                "-Wl,--strip-all"
            ];
        };
    };
    gnu_extensions = false;
    cpp_std = "c++17";
};

"filesystem_dynamic_test_helper.py" = python_test {
    name = "filesystem_dynamic_test_helper.py";
    main = "test/support/filesystem_dynamic_test_helper.py";
    srcs = [
        "test/support/filesystem_dynamic_test_helper.py"
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

in { inherit "filesystem_dynamic_test_helper.py" "libc++ defaults" "libc++" "libc++_static" "libc++experimental" "libc++fs" libcxx_test_template; }
