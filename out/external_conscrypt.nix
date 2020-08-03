{ cc_binary_host, cc_defaults, cc_library, cc_library_host_shared, cc_library_shared, cc_library_static, filegroup, genrule, java_library, java_test }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

#
#  Definitions for building the Conscrypt Java library, native code,
#  and associated tests.
#

#  Conscrypt is divided into subdirectories.
#
#  The structure is:
#
#    constants/
#        src/gen             # Generates NativeConstants.java.
#    common/
#        src/main/java       # Common Java source for all platforms.
#        src/jni/
#             main           # Common C++ source for all platforms.
#             unbundled      # C++ source used for OpenJDK and unbundled Android.
#        src/test/java       # Common test files for all platforms.
#    android/
#        src/main/java       # Java source for unbundled Android.
#    openjdk/
#        src/main/java       # Java source for OpenJDK.
#        src/test
#             java/          # Java source for common tests.
#             resources/     # Support files for tests
#    platform/
#        src/main/java       # Java source for bundled Android.
#        src/test
#             java/          # Java source for bundled tests.
#

conscrypt_global = cc_defaults {
    name = "conscrypt_global";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wunused"
    ];

    srcs = [
        "common/src/jni/main/cpp/conscrypt/compatibility_close_monitor.cc"
        "common/src/jni/main/cpp/conscrypt/jniload.cc"
        "common/src/jni/main/cpp/conscrypt/jniutil.cc"
        "common/src/jni/main/cpp/conscrypt/native_crypto.cc"
        "common/src/jni/main/cpp/conscrypt/netutil.cc"
        "common/src/jni/main/cpp/conscrypt/trace.cc"
    ];

    local_include_dirs = [
        "common/src/jni/main/include"
    ];

    compile_multilib = "both";
    stl = "c++_static";
};

conscrypt_unbundled-jni-defaults = cc_defaults {
    name = "conscrypt_unbundled-jni-defaults";

    local_include_dirs = [
        "common/src/jni/unbundled/include"
    ];

    shared_libs = [
        "liblog"
    ];

    static_libs = [
        "libssl"
        "libcrypto"
    ];

    sdk_version = "9";
};

libconscrypt_jni = cc_library {
    name = "libconscrypt_jni";
    defaults = [
        "conscrypt_global"
        "conscrypt_unbundled-jni-defaults"
    ];
};

libconscrypt_openjdk_jni = cc_library_host_shared {
    name = "libconscrypt_openjdk_jni";
    defaults = ["conscrypt_global"];

    cflags = [
        "-DCONSCRYPT_OPENJDK"
    ];

    local_include_dirs = [
        "common/src/jni/unbundled/include"
    ];

    static_libs = [
        "libssl"
        "libcrypto"
    ];

    #  TODO: b/26097626. ASAN breaks use of this library in JVM.
    #  Re-enable sanitization when the issue with making clients of this library
    #  preload ASAN runtime is resolved. Without that, clients are getting runtime
    #  errors due to unresolved ASAN symbols, such as
    #  __asan_option_detect_stack_use_after_return.
    sanitize = {
        never = true;
    };

    stl = "libc++_static";

    #  The post-build signing tools need signapk.jar and its shared libs
    multilib = {
        lib64 = {
            dist = {
                targets = ["droidcore"];
            };
        };
    };
};

conscrypt_generate_constants = cc_binary_host {
    name = "conscrypt_generate_constants";
    srcs = ["constants/src/gen/cpp/generate_constants.cc"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libcrypto"
        "libssl"
    ];
};

conscrypt-nojarjar_generated_constants = genrule {
    name = "conscrypt-nojarjar_generated_constants";
    out = ["org/conscrypt/NativeConstants.java"];
    cmd = "$(location conscrypt_generate_constants) > $(out)";
    tools = ["conscrypt_generate_constants"];
};

#  Create the conscrypt library without jarjar for tests
conscrypt-nojarjar = java_library {
    name = "conscrypt-nojarjar";
    host_supported = true;
    hostdex = true;

    srcs = [
        "common/src/main/java/**/*.java"
        ":conscrypt-nojarjar_generated_constants"
    ];

    no_standard_libs = true;
    system_modules = "core-all-system-modules";
    target = {
        android = {
            srcs = ["platform/src/main/java/**/*.java"];
            libs = ["core-all"];
        };
        host = {
            srcs = ["openjdk/src/main/java/**/*.java"];
            javacflags = ["-XDignore.symbol.file"];
        };
    };

    required = ["libjavacrypto"];
    java_version = "1.7";
};

conscrypt_generated_constants = genrule {
    name = "conscrypt_generated_constants";
    out = ["com/android/org/conscrypt/NativeConstants.java"];
    cmd = "$(location conscrypt_generate_constants) com.android.org.conscrypt > $(out)";
    tools = ["conscrypt_generate_constants"];
};

conscrypt_java_files = filegroup {
    name = "conscrypt_java_files";
    srcs = [
        "repackaged/common/src/main/java/**/*.java"
        "repackaged/platform/src/main/java/**/*.java"
        ":conscrypt_generated_constants"
    ];
};

conscrypt_public_api_files = filegroup {
    name = "conscrypt_public_api_files";
    srcs = ["publicapi/src/main/java/**/*.java"];
};

#  Create the conscrypt library from the source produced by the srcgen/generate_android_src.sh
#  script.
conscrypt = java_library {
    name = "conscrypt";
    installable = true;
    hostdex = true;

    srcs = [
        ":conscrypt_java_files"
        ":conscrypt_public_api_files"
    ];

    #  Conscrypt can be updated independently from the other core libraries so it must only depend
    #  on public SDK and intra-core APIs.
    no_standard_libs = true;
    libs = ["core.intra.stubs"];
    patch_module = "java.base";
    system_modules = "core-intra-stubs-system-modules";

    #  Workaround for b/124476339: libjavacrypto is required for both APEX and
    #  hostdex builds, but adding a top-level required property results in
    #  it being installed to /system on Android.
    #  TODO(b/124476339): move required back to a top level property
    target = {
        hostdex = {
            required = ["libjavacrypto"];
        };
    };

    permitted_packages = [
        "android.net.ssl"
        "com.android.org.conscrypt"
    ];

    plugins = ["java_api_finder"];
};

#  A guaranteed unstripped version of conscrypt.
#  The build system may or may not strip the conscrypt jar, but this one will
#  not be stripped. See b/24535627.
conscrypt-testdex = java_library {
    name = "conscrypt-testdex";
    installable = true;

    static_libs = ["conscrypt"];
    dex_preopt = {
        enabled = false;
    };

    no_framework_libs = true;

    required = ["libjavacrypto"];
};

#  Platform conscrypt crypto JNI library
libjavacrypto-defaults = cc_defaults {
    name = "libjavacrypto-defaults";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wunused"
        "-fvisibility=hidden"
    ];

    srcs = ["common/src/jni/main/cpp/**/*.cc"];
    include_dirs = [
        "libcore/luni/src/main/native"
    ];
    local_include_dirs = ["common/src/jni/main/include"];
};

#  Platform conscrypt crypto JNI library
libjavacrypto = cc_library_shared {
    name = "libjavacrypto";
    host_supported = true;
    defaults = ["libjavacrypto-defaults"];

    cflags = ["-DJNI_JARJAR_PREFIX=com/android/"];
    header_libs = ["libnativehelper_header_only"];
    shared_libs = [
        "libcrypto"
        "liblog"
        "libssl"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

#  Unbundled Conscrypt jar
conscrypt_unbundled = java_library {
    name = "conscrypt_unbundled";

    srcs = [
        "common/src/main/java/**/*.java"
        "android/src/main/java/**/*.java"
        ":conscrypt-nojarjar_generated_constants"
    ];

    libs = ["conscrypt-stubs"];

    sdk_version = "current";
    java_version = "1.7";
};

#  Stub library for unbundled builds
conscrypt-stubs = java_library {
    name = "conscrypt-stubs";

    srcs = ["android-stub/src/main/java/**/*.java"];

    sdk_version = "current";
    java_version = "1.7";
};

#  Static unbundled Conscrypt crypto JNI library
libconscrypt_static = cc_library_static {
    name = "libconscrypt_static";
    defaults = ["libjavacrypto-defaults"];

    cflags = [
        "-DJNI_JARJAR_PREFIX=com/google/android/gms/"
        "-DCONSCRYPT_UNBUNDLED"
        "-DSTATIC_LIB"
    ];

    local_include_dirs = ["common/src/jni/unbundled/include"];

    static_libs = [
        "libssl"
        "libcrypto"
    ];
    sdk_version = "9";
    stl = "c++_shared";
};

#  Make the conscrypt-tests library.
conscrypt-tests = java_test {
    name = "conscrypt-tests";
    hostdex = true;
    srcs = [
        "repackaged/platform/src/test/java/**/*.java"
        "repackaged/common/src/test/java/**/*.java"
        "repackaged/openjdk-integ-tests/src/test/java/**/*.java"
        "repackaged/testing/src/main/java/**/*.java"
        "publicapi/src/test/java/**/*.java"
    ];
    java_resource_dirs = [
        #  Resource directories do not need repackaging.
        "openjdk/src/test/resources"
        "openjdk-integ-tests/src/test/resources"
    ];

    no_standard_libs = true;
    libs = [
        "core-all"
        "conscrypt"
        "junit"
        "mockito-target-minus-junit4"
    ];
    system_modules = "core-all-system-modules";

    static_libs = [
        "bouncycastle-unbundled"
        "bouncycastle-bcpkix-unbundled"
        "bouncycastle-ocsp-unbundled"
    ];
    javacflags = [
        "-Xmaxwarns 9999999"
        # "-Xlint:all",
        # "-Xlint:-serial,-deprecation,-unchecked",
    ];

    required = ["libjavacrypto"];
    java_version = "1.7";
};

#  Make the conscrypt-benchmarks library.
conscrypt-benchmarks = java_test {
    name = "conscrypt-benchmarks";
    srcs = [
        "repackaged/testing/src/main/java/**/*.java"
        "repackaged/benchmark-base/src/main/java/**/*.java"
        "repackaged/benchmark-android/src/main/java/**/*.java"
    ];
    no_standard_libs = true;
    libs = [
        "core-all"
        "conscrypt"
        "junit"
        "bouncycastle-unbundled"
        "bouncycastle-bcpkix-unbundled"
        "bouncycastle-ocsp-unbundled"
        "caliper-api-target"
    ];
    system_modules = "core-all-system-modules";

    javacflags = [
        "-Xmaxwarns 9999999"
        # "-Xlint:all",
        # "-Xlint:-serial,-deprecation,-unchecked",
    ];

    required = ["libjavacrypto"];
    java_version = "1.7";
};

in { inherit conscrypt conscrypt-benchmarks conscrypt-nojarjar conscrypt-nojarjar_generated_constants conscrypt-stubs conscrypt-testdex conscrypt-tests conscrypt_generate_constants conscrypt_generated_constants conscrypt_global conscrypt_java_files conscrypt_public_api_files conscrypt_unbundled conscrypt_unbundled-jni-defaults libconscrypt_jni libconscrypt_openjdk_jni libconscrypt_static libjavacrypto libjavacrypto-defaults; }
