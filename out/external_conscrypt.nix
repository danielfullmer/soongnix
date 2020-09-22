{ cc_binary_host, cc_defaults, cc_library, cc_library_host_shared, cc_library_shared, cc_library_static, filegroup, genrule, java_library, java_library_host, java_sdk_library, java_test, module_exports, package, sdk }:
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

_missingName = package {
    default_visibility = [
        ":__subpackages__"
    ];
};

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
        "libcrypto_static"
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
        "libcrypto_static"
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

conscrypt-unbundled_generated_constants = genrule {
    name = "conscrypt-unbundled_generated_constants";
    out = ["org/conscrypt/NativeConstants.java"];
    cmd = "$(location conscrypt_generate_constants) > $(out)";
    tools = ["conscrypt_generate_constants"];
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
        "repackaged/common/src/main/java/com/android/org/conscrypt/AbstractConscryptEngine.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/AbstractConscryptSocket.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/AbstractSessionContext.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ActiveSession.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/AddressUtils.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/AllocatedBuffer.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ApplicationProtocolSelector.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ApplicationProtocolSelectorAdapter.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ArrayUtils.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/BufferAllocator.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ByteArray.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/CertBlacklist.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/CertPinManager.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/CertificatePriorityComparator.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ChainStrengthAnalyzer.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ClientSessionContext.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/Conscrypt.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ConscryptCertStore.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ConscryptEngine.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ConscryptEngineSocket.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ConscryptFileDescriptorSocket.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ConscryptHostnameVerifier.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ConscryptServerSocket.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ConscryptSession.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/CryptoUpcalls.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/DESEDESecretKeyFactory.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/DefaultSSLContextImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/DuckTypedPSKKeyManager.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ECParameters.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/EmptyArray.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/EvpMdRef.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ExperimentalApi.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ExternalSession.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/FileClientSessionCache.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/GCMParameters.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/HandshakeListener.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/Internal.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/IvParameters.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/Java7ExtendedSSLSession.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/Java8EngineSocket.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/Java8EngineWrapper.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/Java8ExtendedSSLSession.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/Java8FileDescriptorSocket.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/KeyGeneratorImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/KeyManagerFactoryImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/KeyManagerImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/NativeCrypto.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/NativeRef.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/NativeSsl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/NativeSslSession.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OAEPParameters.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OidData.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLAeadCipher.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLAeadCipherAES.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLAeadCipherChaCha20.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLBIOInputStream.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLBIOSink.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLBIOSource.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLCipher.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLCipherChaCha20.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLCipherRSA.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLContextImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLECDHKeyAgreement.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLECGroupContext.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLECKeyFactory.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLECKeyPairGenerator.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLECPointContext.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLECPrivateKey.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLECPublicKey.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLEvpCipher.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLEvpCipherAES.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLEvpCipherARC4.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLEvpCipherDESEDE.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLKey.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLKeyHolder.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLMac.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLMessageDigestJDK.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLProvider.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLRSAKeyFactory.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLRSAKeyPairGenerator.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLRSAPrivateCrtKey.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLRSAPrivateKey.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLRSAPublicKey.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLRandom.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLServerSocketFactoryImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLSignature.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLSignatureRawECDSA.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLSignatureRawRSA.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLSocketFactoryImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLSocketImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLX509CRL.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLX509CRLEntry.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLX509CertPath.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLX509Certificate.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/OpenSSLX509CertificateFactory.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/PSKKeyManager.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/PSSParameters.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/PeerInfoProvider.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/Preconditions.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/SSLClientSessionCache.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/SSLNullSession.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/SSLParametersImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/SSLServerSessionCache.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/SSLUtils.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ServerSessionContext.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/SessionSnapshot.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ShortBufferWithoutStackTraceException.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/TrustManagerFactoryImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/TrustManagerImpl.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/TrustedCertificateIndex.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/X509PublicKey.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/CTConstants.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/CTLogInfo.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/CTLogStore.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/CTPolicy.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/CTVerificationResult.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/CTVerifier.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/CertificateEntry.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/DigitallySigned.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/Serialization.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/SerializationException.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/SignedCertificateTimestamp.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/ct/VerifiedSCT.java"
        "repackaged/common/src/main/java/com/android/org/conscrypt/io/IoUtils.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/CertBlacklistImpl.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/Hex.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/InternalUtil.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/JSSEProvider.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/NativeCryptoJni.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/Platform.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/TrustedCertificateKeyStoreSpi.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/TrustedCertificateStore.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/ct/CTLogStoreImpl.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/ct/CTPolicyImpl.java"
        "repackaged/platform/src/main/java/com/android/org/conscrypt/ct/KnownLogs.java"
        ":conscrypt_generated_constants"
    ];
};

conscrypt_public_api_files = filegroup {
    name = "conscrypt_public_api_files";
    srcs = [
        "publicapi/src/main/java/android/net/ssl/SSLEngines.java"
        "publicapi/src/main/java/android/net/ssl/SSLSockets.java"
    ];
    path = "publicapi/src/main/java";
};

#  Create the conscrypt library from the source produced by the srcgen/generate_android_src.sh
#  script.
conscrypt = java_library {
    name = "conscrypt";
    visibility = [
        "//art/build"
        "//device:__subpackages__"
        "//external/robolectric-shadows"
        "//system/apex/tests"
        ":__subpackages__"
    ];
    apex_available = [
        "com.android.conscrypt"
        "test_com.android.conscrypt"
    ];
    #  Conscrypt should support Q
    min_sdk_version = "29";

    installable = true;
    hostdex = true;

    srcs = [
        ":conscrypt_java_files"
        ":conscrypt_public_api_files"
    ];

    libs = ["unsupportedappusage"];

    #  Conscrypt can be updated independently from the other core libraries so it must only depend
    #  on public SDK and intra-core APIs.
    sdk_version = "none";
    system_modules = "art-module-intra-core-api-stubs-system-modules";
    patch_module = "java.base";

    #  Workaround for b/124476339: libjavacrypto is required for both APEX and
    #  hostdex builds, but adding a top-level required property results in
    #  it being installed to /system on Android.
    #  TODO(b/124476339): move required back to a top level property
    target = {
        #  boringssl_self_test needed in both /system/bin and /apex/com.android.conscrypt/bin
        android = {
            required = ["boringssl_self_test"];
        };
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

#  Referenced implicitly from conscrypt.module.platform.api.
"conscrypt.module.platform.api.api.public.latest" = filegroup {
    name = "conscrypt.module.platform.api.api.public.latest";
    srcs = [
        "api/platform/last-api.txt"
    ];
};

#  Referenced implicitly from conscrypt.module.platform.api.
"conscrypt.module.platform.api-removed.api.public.latest" = filegroup {
    name = "conscrypt.module.platform.api-removed.api.public.latest";
    srcs = [
        "api/platform/last-removed.txt"
    ];
};

#  A library containing the core platform API stubs of the Conscrypt module.
#
#  Core platform APIs are only intended for use of other parts of the platform, not the
#  core library modules.
#
#  The API specification .txt files managed by this only contain the additional
#  classes/members that are in the platform API but which are not in the public
#  API.
"conscrypt.module.platform.api" = java_sdk_library {
    name = "conscrypt.module.platform.api";
    visibility = [
        "//external/wycheproof"
        "//libcore:__subpackages__"
    ];
    srcs = [
        ":conscrypt_java_files"
    ];
    api_dir = "api/platform";
    api_only = true;
    droiddoc_options = [
        "--hide-annotation libcore.api.Hide"
        "--show-single-annotation libcore.api.CorePlatformApi"
        "--skip-annotation-instance-methods=false"
    ];
    hostdex = true;

    sdk_version = "none";
    system_modules = "art-module-platform-api-stubs-system-modules";
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

    sdk_version = "core_platform";

    required = ["libjavacrypto"];
};

#  Referenced implicitly from conscrypt.module.public.api.
"conscrypt.module.public.api.api.public.latest" = filegroup {
    name = "conscrypt.module.public.api.api.public.latest";
    srcs = [
        "api/public/last-api.txt"
    ];
};

#  Referenced implicitly from conscrypt.module.public.api.
"conscrypt.module.public.api-removed.api.public.latest" = filegroup {
    name = "conscrypt.module.public.api-removed.api.public.latest";
    srcs = [
        "api/public/last-removed.txt"
    ];
};

#  A library containing the public API stubs of the Conscrypt module.
"conscrypt.module.public.api" = java_sdk_library {
    name = "conscrypt.module.public.api";
    visibility = [
        "//frameworks/base"
        "//libcore"
    ];
    srcs = [
        ":conscrypt_public_api_files"
    ];
    api_dir = "api/public";
    api_only = true;
    droiddoc_options = [
        #  Emit nullability annotations from the source to the stub files.
        "--include-annotations"
    ];

    java_version = "1.9";

    sdk_version = "none";
    system_modules = "art-module-public-api-stubs-system-modules";
};

#  Referenced implicitly from conscrypt.module.intra.core.api.
"conscrypt.module.intra.core.api.api.public.latest" = filegroup {
    name = "conscrypt.module.intra.core.api.api.public.latest";
    srcs = [
        "api/intra/last-api.txt"
    ];
};

#  Referenced implicitly from conscrypt.module.intra.core.api.
"conscrypt.module.intra.core.api-removed.api.public.latest" = filegroup {
    name = "conscrypt.module.intra.core.api-removed.api.public.latest";
    srcs = [
        "api/intra/last-removed.txt"
    ];
};

#  A library containing the intra-core API stubs of the Conscrypt module.
#
#  Intra-core APIs are only intended for the use of other core library modules.
#
#  The API specification .txt files managed by this only contain the additional
#  classes/members that are in the intra-core API but which are not the public API.
"conscrypt.module.intra.core.api" = java_sdk_library {
    name = "conscrypt.module.intra.core.api";
    visibility = [
        "//external/okhttp"
        "//libcore:__subpackages__"
    ];
    srcs = [
        ":conscrypt_java_files"
        ":conscrypt_public_api_files"
    ];
    api_dir = "api/intra";
    api_only = true;
    droiddoc_options = [
        "--hide-annotation libcore.api.Hide"
        "--show-single-annotation libcore.api.IntraCoreApi"
        "--skip-annotation-instance-methods=false"
    ];

    sdk_version = "none";
    system_modules = "art-module-intra-core-api-stubs-system-modules";
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

    srcs = [
        "common/src/jni/main/cpp/conscrypt/compatibility_close_monitor.cc"
        "common/src/jni/main/cpp/conscrypt/jniload.cc"
        "common/src/jni/main/cpp/conscrypt/jniutil.cc"
        "common/src/jni/main/cpp/conscrypt/native_crypto.cc"
        "common/src/jni/main/cpp/conscrypt/netutil.cc"
        "common/src/jni/main/cpp/conscrypt/trace.cc"
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
        android = {
            runtime_libs = ["libandroidio"];
        };
        not_windows = {
            runtime_libs = ["libandroidio"];
        };
    };
    apex_available = [
        "com.android.conscrypt"
        "test_com.android.conscrypt"
    ];
    min_sdk_version = "29";
};

#  Unbundled Conscrypt jar for use by signapk and apksigner tool
#
#  Builds against standard host libraries.
conscrypt-unbundled = java_library_host {
    name = "conscrypt-unbundled";
    visibility = [
        "//build/make/tools/signapk"
        "//tools/apksig"
    ];
    srcs = [
        "common/src/main/java/org/conscrypt/AbstractConscryptEngine.java"
        "common/src/main/java/org/conscrypt/AbstractConscryptSocket.java"
        "common/src/main/java/org/conscrypt/AbstractSessionContext.java"
        "common/src/main/java/org/conscrypt/ActiveSession.java"
        "common/src/main/java/org/conscrypt/AddressUtils.java"
        "common/src/main/java/org/conscrypt/AllocatedBuffer.java"
        "common/src/main/java/org/conscrypt/ApplicationProtocolSelector.java"
        "common/src/main/java/org/conscrypt/ApplicationProtocolSelectorAdapter.java"
        "common/src/main/java/org/conscrypt/ArrayUtils.java"
        "common/src/main/java/org/conscrypt/BufferAllocator.java"
        "common/src/main/java/org/conscrypt/ByteArray.java"
        "common/src/main/java/org/conscrypt/CertBlacklist.java"
        "common/src/main/java/org/conscrypt/CertPinManager.java"
        "common/src/main/java/org/conscrypt/CertificatePriorityComparator.java"
        "common/src/main/java/org/conscrypt/ChainStrengthAnalyzer.java"
        "common/src/main/java/org/conscrypt/ClientSessionContext.java"
        "common/src/main/java/org/conscrypt/Conscrypt.java"
        "common/src/main/java/org/conscrypt/ConscryptCertStore.java"
        "common/src/main/java/org/conscrypt/ConscryptEngine.java"
        "common/src/main/java/org/conscrypt/ConscryptEngineSocket.java"
        "common/src/main/java/org/conscrypt/ConscryptFileDescriptorSocket.java"
        "common/src/main/java/org/conscrypt/ConscryptHostnameVerifier.java"
        "common/src/main/java/org/conscrypt/ConscryptServerSocket.java"
        "common/src/main/java/org/conscrypt/ConscryptSession.java"
        "common/src/main/java/org/conscrypt/CryptoUpcalls.java"
        "common/src/main/java/org/conscrypt/DESEDESecretKeyFactory.java"
        "common/src/main/java/org/conscrypt/DefaultSSLContextImpl.java"
        "common/src/main/java/org/conscrypt/DuckTypedPSKKeyManager.java"
        "common/src/main/java/org/conscrypt/ECParameters.java"
        "common/src/main/java/org/conscrypt/EmptyArray.java"
        "common/src/main/java/org/conscrypt/EvpMdRef.java"
        "common/src/main/java/org/conscrypt/ExperimentalApi.java"
        "common/src/main/java/org/conscrypt/ExternalSession.java"
        "common/src/main/java/org/conscrypt/FileClientSessionCache.java"
        "common/src/main/java/org/conscrypt/GCMParameters.java"
        "common/src/main/java/org/conscrypt/HandshakeListener.java"
        "common/src/main/java/org/conscrypt/Internal.java"
        "common/src/main/java/org/conscrypt/IvParameters.java"
        "common/src/main/java/org/conscrypt/Java7ExtendedSSLSession.java"
        "common/src/main/java/org/conscrypt/Java8EngineSocket.java"
        "common/src/main/java/org/conscrypt/Java8EngineWrapper.java"
        "common/src/main/java/org/conscrypt/Java8ExtendedSSLSession.java"
        "common/src/main/java/org/conscrypt/Java8FileDescriptorSocket.java"
        "common/src/main/java/org/conscrypt/KeyGeneratorImpl.java"
        "common/src/main/java/org/conscrypt/KeyManagerFactoryImpl.java"
        "common/src/main/java/org/conscrypt/KeyManagerImpl.java"
        "common/src/main/java/org/conscrypt/NativeCrypto.java"
        "common/src/main/java/org/conscrypt/NativeRef.java"
        "common/src/main/java/org/conscrypt/NativeSsl.java"
        "common/src/main/java/org/conscrypt/NativeSslSession.java"
        "common/src/main/java/org/conscrypt/OAEPParameters.java"
        "common/src/main/java/org/conscrypt/OidData.java"
        "common/src/main/java/org/conscrypt/OpenSSLAeadCipher.java"
        "common/src/main/java/org/conscrypt/OpenSSLAeadCipherAES.java"
        "common/src/main/java/org/conscrypt/OpenSSLAeadCipherChaCha20.java"
        "common/src/main/java/org/conscrypt/OpenSSLBIOInputStream.java"
        "common/src/main/java/org/conscrypt/OpenSSLBIOSink.java"
        "common/src/main/java/org/conscrypt/OpenSSLBIOSource.java"
        "common/src/main/java/org/conscrypt/OpenSSLCipher.java"
        "common/src/main/java/org/conscrypt/OpenSSLCipherChaCha20.java"
        "common/src/main/java/org/conscrypt/OpenSSLCipherRSA.java"
        "common/src/main/java/org/conscrypt/OpenSSLContextImpl.java"
        "common/src/main/java/org/conscrypt/OpenSSLECDHKeyAgreement.java"
        "common/src/main/java/org/conscrypt/OpenSSLECGroupContext.java"
        "common/src/main/java/org/conscrypt/OpenSSLECKeyFactory.java"
        "common/src/main/java/org/conscrypt/OpenSSLECKeyPairGenerator.java"
        "common/src/main/java/org/conscrypt/OpenSSLECPointContext.java"
        "common/src/main/java/org/conscrypt/OpenSSLECPrivateKey.java"
        "common/src/main/java/org/conscrypt/OpenSSLECPublicKey.java"
        "common/src/main/java/org/conscrypt/OpenSSLEvpCipher.java"
        "common/src/main/java/org/conscrypt/OpenSSLEvpCipherAES.java"
        "common/src/main/java/org/conscrypt/OpenSSLEvpCipherARC4.java"
        "common/src/main/java/org/conscrypt/OpenSSLEvpCipherDESEDE.java"
        "common/src/main/java/org/conscrypt/OpenSSLKey.java"
        "common/src/main/java/org/conscrypt/OpenSSLKeyHolder.java"
        "common/src/main/java/org/conscrypt/OpenSSLMac.java"
        "common/src/main/java/org/conscrypt/OpenSSLMessageDigestJDK.java"
        "common/src/main/java/org/conscrypt/OpenSSLProvider.java"
        "common/src/main/java/org/conscrypt/OpenSSLRSAKeyFactory.java"
        "common/src/main/java/org/conscrypt/OpenSSLRSAKeyPairGenerator.java"
        "common/src/main/java/org/conscrypt/OpenSSLRSAPrivateCrtKey.java"
        "common/src/main/java/org/conscrypt/OpenSSLRSAPrivateKey.java"
        "common/src/main/java/org/conscrypt/OpenSSLRSAPublicKey.java"
        "common/src/main/java/org/conscrypt/OpenSSLRandom.java"
        "common/src/main/java/org/conscrypt/OpenSSLServerSocketFactoryImpl.java"
        "common/src/main/java/org/conscrypt/OpenSSLSignature.java"
        "common/src/main/java/org/conscrypt/OpenSSLSignatureRawECDSA.java"
        "common/src/main/java/org/conscrypt/OpenSSLSignatureRawRSA.java"
        "common/src/main/java/org/conscrypt/OpenSSLSocketFactoryImpl.java"
        "common/src/main/java/org/conscrypt/OpenSSLSocketImpl.java"
        "common/src/main/java/org/conscrypt/OpenSSLX509CRL.java"
        "common/src/main/java/org/conscrypt/OpenSSLX509CRLEntry.java"
        "common/src/main/java/org/conscrypt/OpenSSLX509CertPath.java"
        "common/src/main/java/org/conscrypt/OpenSSLX509Certificate.java"
        "common/src/main/java/org/conscrypt/OpenSSLX509CertificateFactory.java"
        "common/src/main/java/org/conscrypt/PSKKeyManager.java"
        "common/src/main/java/org/conscrypt/PSSParameters.java"
        "common/src/main/java/org/conscrypt/PeerInfoProvider.java"
        "common/src/main/java/org/conscrypt/Preconditions.java"
        "common/src/main/java/org/conscrypt/SSLClientSessionCache.java"
        "common/src/main/java/org/conscrypt/SSLNullSession.java"
        "common/src/main/java/org/conscrypt/SSLParametersImpl.java"
        "common/src/main/java/org/conscrypt/SSLServerSessionCache.java"
        "common/src/main/java/org/conscrypt/SSLUtils.java"
        "common/src/main/java/org/conscrypt/ServerSessionContext.java"
        "common/src/main/java/org/conscrypt/SessionSnapshot.java"
        "common/src/main/java/org/conscrypt/ShortBufferWithoutStackTraceException.java"
        "common/src/main/java/org/conscrypt/TrustManagerFactoryImpl.java"
        "common/src/main/java/org/conscrypt/TrustManagerImpl.java"
        "common/src/main/java/org/conscrypt/TrustedCertificateIndex.java"
        "common/src/main/java/org/conscrypt/X509PublicKey.java"
        "common/src/main/java/org/conscrypt/ct/CTConstants.java"
        "common/src/main/java/org/conscrypt/ct/CTLogInfo.java"
        "common/src/main/java/org/conscrypt/ct/CTLogStore.java"
        "common/src/main/java/org/conscrypt/ct/CTPolicy.java"
        "common/src/main/java/org/conscrypt/ct/CTVerificationResult.java"
        "common/src/main/java/org/conscrypt/ct/CTVerifier.java"
        "common/src/main/java/org/conscrypt/ct/CertificateEntry.java"
        "common/src/main/java/org/conscrypt/ct/DigitallySigned.java"
        "common/src/main/java/org/conscrypt/ct/Serialization.java"
        "common/src/main/java/org/conscrypt/ct/SerializationException.java"
        "common/src/main/java/org/conscrypt/ct/SignedCertificateTimestamp.java"
        "common/src/main/java/org/conscrypt/ct/VerifiedSCT.java"
        "common/src/main/java/org/conscrypt/io/IoUtils.java"
        "openjdk/src/main/java/org/conscrypt/HostProperties.java"
        "openjdk/src/main/java/org/conscrypt/Java8PlatformUtil.java"
        "openjdk/src/main/java/org/conscrypt/Java9PlatformUtil.java"
        "openjdk/src/main/java/org/conscrypt/NativeCryptoJni.java"
        "openjdk/src/main/java/org/conscrypt/NativeLibraryLoader.java"
        "openjdk/src/main/java/org/conscrypt/NativeLibraryUtil.java"
        "openjdk/src/main/java/org/conscrypt/Platform.java"
        ":conscrypt-unbundled_generated_constants"
    ];
    javacflags = ["-XDignore.symbol.file"];
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
        "libcrypto_static"
    ];
    sdk_version = "9";
    stl = "c++_shared";
};

#  Make the conscrypt-tests library.
conscrypt-tests = java_test {
    name = "conscrypt-tests";
    visibility = [
        "//cts/tests/libcore/luni"
        "//external/conscrypt/apex/tests"
    ];
    hostdex = true;
    srcs = [
        "repackaged/platform/src/test/java/com/android/org/conscrypt/CertBlacklistTest.java"
        "repackaged/platform/src/test/java/com/android/org/conscrypt/TrustedCertificateStoreTest.java"
        "repackaged/platform/src/test/java/com/android/org/conscrypt/ct/CTLogStoreImplTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/CertPinManagerTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/ChainStrengthAnalyzerTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/TrustManagerImplTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/ct/CTVerifierTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/ct/SerializationTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParameterGeneratorTestDH.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParameterGeneratorTestDSA.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParametersPSSTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParametersTestAES.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParametersTestDES.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParametersTestDESede.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParametersTestDH.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParametersTestDSA.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParametersTestEC.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParametersTestGCM.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/AlgorithmParametersTestOAEP.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/KeyFactoryTestDH.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/KeyFactoryTestDSA.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/KeyFactoryTestEC.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/KeyFactoryTestRSA.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/KeyFactoryTestRSACrt.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/KeyFactoryTestRSACustom.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/KeyPairGeneratorTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/KeyPairGeneratorTestDH.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/KeyPairGeneratorTestDSA.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/KeyPairGeneratorTestRSA.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/MessageDigestTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/SignatureTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/TestECPrivateKey.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/TestECPublicKey.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/TestPrivateKey.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/TestPublicKey.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/cert/CertificateFactoryTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/cert/X509CRLTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/java/security/cert/X509CertificateTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/crypto/AeadCipherTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/crypto/CipherBasicsTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/crypto/CipherTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/crypto/ECDHKeyAgreementTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/crypto/KeyGeneratorTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/HttpsURLConnectionTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/KeyManagerFactoryTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/KeyStoreBuilderParametersTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SNIHostNameTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLContextTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLEngineTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLEngineVersionCompatibilityTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLParametersTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLServerSocketFactoryTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLServerSocketTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLSessionContextTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLSessionTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLSocketFactoryTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLSocketTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/SSLSocketVersionCompatibilityTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/TrustManagerFactoryTest.java"
        "repackaged/common/src/test/java/com/android/org/conscrypt/javax/net/ssl/X509KeyManagerTest.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/ChannelType.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/TestUtils.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AbstractAlgorithmParameterGeneratorTest.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AbstractAlgorithmParametersTest.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AbstractKeyFactoryTest.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AbstractKeyPairGeneratorTest.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AlgorithmParameterAsymmetricHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AlgorithmParameterKeyAgreementHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AlgorithmParameterSignatureHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AlgorithmParameterSymmetricHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/CipherAsymmetricCryptHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/CipherHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/CpuFeatures.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/DefaultKeys.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/KeyAgreementHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/SignatureHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/StandardNames.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/TestHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/TestKeyStore.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/FakeSSLSession.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/ForwardingX509ExtendedKeyManager.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/PSKKeyManagerProxy.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/RandomPrivateKeyX509ExtendedKeyManager.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/SSLConfigurationAsserts.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestHostnameVerifier.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestKeyManager.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestSSLContext.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestSSLEnginePair.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestSSLSessions.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestSSLSocketPair.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestTrustManager.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/BrokenProvider.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/FailingSniMatcher.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/NullPrintStream.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/OpaqueProvider.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/RestrictedAlgorithmConstraints.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/Streams.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/TlsTester.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/AlpnHelloExtension.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/CipherSuite.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/ClientHello.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/CompressionMethod.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/EllipticCurve.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/EllipticCurvesHelloExtension.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/HandshakeMessage.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/HelloExtension.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/ServerNameHelloExtension.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/record/TlsProtocols.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/record/TlsRecord.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/util/IoUtils.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/util/TlsProtocolVersion.java"
        "repackaged/testing/src/main/java/tests/net/DelegatingSSLSocketFactory.java"
        "repackaged/testing/src/main/java/tests/net/DelegatingSocketFactory.java"
        "repackaged/testing/src/main/java/tests/util/ForEachRunner.java"
        "repackaged/testing/src/main/java/tests/util/Pair.java"
        "repackaged/testing/src/main/java/tests/util/ServiceTester.java"
        "publicapi/src/test/java/android/net/ssl/SSLEnginesTest.java"
        "publicapi/src/test/java/android/net/ssl/SSLSocketsTest.java"
    ];
    java_resource_dirs = [
        #  Resource directories do not need repackaging.
        "openjdk/src/test/resources"
        "common/src/test/resources"
    ];

    sdk_version = "none";
    system_modules = "art-module-intra-core-api-stubs-system-modules";
    libs = [
        "conscrypt"
        "core-test-rules"
        "junit"
        "mockito-target-minus-junit4"
    ];

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
        "repackaged/testing/src/main/java/com/android/org/conscrypt/ChannelType.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/TestUtils.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AbstractAlgorithmParameterGeneratorTest.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AbstractAlgorithmParametersTest.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AbstractKeyFactoryTest.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AbstractKeyPairGeneratorTest.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AlgorithmParameterAsymmetricHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AlgorithmParameterKeyAgreementHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AlgorithmParameterSignatureHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/AlgorithmParameterSymmetricHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/CipherAsymmetricCryptHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/CipherHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/CpuFeatures.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/DefaultKeys.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/KeyAgreementHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/SignatureHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/StandardNames.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/TestHelper.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/java/security/TestKeyStore.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/FakeSSLSession.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/ForwardingX509ExtendedKeyManager.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/PSKKeyManagerProxy.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/RandomPrivateKeyX509ExtendedKeyManager.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/SSLConfigurationAsserts.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestHostnameVerifier.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestKeyManager.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestSSLContext.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestSSLEnginePair.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestSSLSessions.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestSSLSocketPair.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/javax/net/ssl/TestTrustManager.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/BrokenProvider.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/FailingSniMatcher.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/NullPrintStream.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/OpaqueProvider.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/RestrictedAlgorithmConstraints.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/testing/Streams.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/TlsTester.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/AlpnHelloExtension.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/CipherSuite.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/ClientHello.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/CompressionMethod.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/EllipticCurve.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/EllipticCurvesHelloExtension.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/HandshakeMessage.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/HelloExtension.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/handshake/ServerNameHelloExtension.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/record/TlsProtocols.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/record/TlsRecord.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/util/IoUtils.java"
        "repackaged/testing/src/main/java/com/android/org/conscrypt/tlswire/util/TlsProtocolVersion.java"
        "repackaged/testing/src/main/java/tests/net/DelegatingSSLSocketFactory.java"
        "repackaged/testing/src/main/java/tests/net/DelegatingSocketFactory.java"
        "repackaged/testing/src/main/java/tests/util/ForEachRunner.java"
        "repackaged/testing/src/main/java/tests/util/Pair.java"
        "repackaged/testing/src/main/java/tests/util/ServiceTester.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/BenchmarkProtocol.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/BufferType.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/CipherEncryptBenchmark.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/CipherFactory.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/ClientEndpoint.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/ClientSocketBenchmark.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/EndpointFactory.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/EngineFactory.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/EngineHandshakeBenchmark.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/EngineWrapBenchmark.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/ServerEndpoint.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/ServerSocketBenchmark.java"
        "repackaged/benchmark-base/src/main/java/com/android/org/conscrypt/Transformation.java"
        "repackaged/benchmark-android/src/main/java/com/android/org/conscrypt/AndroidEndpointFactory.java"
        "repackaged/benchmark-android/src/main/java/com/android/org/conscrypt/AndroidEngineFactory.java"
        "repackaged/benchmark-android/src/main/java/com/android/org/conscrypt/CaliperAlpnBenchmark.java"
        "repackaged/benchmark-android/src/main/java/com/android/org/conscrypt/CaliperClientSocketBenchmark.java"
        "repackaged/benchmark-android/src/main/java/com/android/org/conscrypt/CaliperEngineHandshakeBenchmark.java"
        "repackaged/benchmark-android/src/main/java/com/android/org/conscrypt/CaliperEngineWrapBenchmark.java"
    ];
    sdk_version = "none";
    system_modules = "art-module-intra-core-api-stubs-system-modules";
    libs = [
        "conscrypt"
        "junit"
        "bouncycastle-unbundled"
        "bouncycastle-bcpkix-unbundled"
        "bouncycastle-ocsp-unbundled"
        "caliper-api-target"
    ];

    javacflags = [
        "-Xmaxwarns 9999999"
        # "-Xlint:all",
        # "-Xlint:-serial,-deprecation,-unchecked",
    ];

    required = ["libjavacrypto"];
    java_version = "1.7";
};

#  Device SDK exposed by the Conscrypt module.
conscrypt-module-sdk = sdk {
    name = "conscrypt-module-sdk";
    java_sdk_libs = [
        "conscrypt.module.public.api"
        "conscrypt.module.intra.core.api"
        "conscrypt.module.platform.api"
    ];
    native_shared_libs = [
        "libconscrypt_jni"
    ];
};

#  Host tools exported by the Conscrypt module.
conscrypt-module-host-exports = module_exports {
    name = "conscrypt-module-host-exports";
    host_supported = true;
    device_supported = false;
    java_libs = [
        "conscrypt-unbundled"
    ];
};

#  Test libraries exposed by the Conscrypt module.
conscrypt-module-test-exports = module_exports {
    name = "conscrypt-module-test-exports";
    java_libs = [
        #  For use by robolectric.
        "conscrypt"
        #  For use by art tests
        "conscrypt-testdex"
    ];
    java_tests = [
        #  For use by CTS
        "conscrypt-tests"
    ];
};

in { inherit "conscrypt.module.intra.core.api" "conscrypt.module.intra.core.api-removed.api.public.latest" "conscrypt.module.intra.core.api.api.public.latest" "conscrypt.module.platform.api" "conscrypt.module.platform.api-removed.api.public.latest" "conscrypt.module.platform.api.api.public.latest" "conscrypt.module.public.api" "conscrypt.module.public.api-removed.api.public.latest" "conscrypt.module.public.api.api.public.latest" _missingName conscrypt conscrypt-benchmarks conscrypt-module-host-exports conscrypt-module-sdk conscrypt-module-test-exports conscrypt-testdex conscrypt-tests conscrypt-unbundled conscrypt-unbundled_generated_constants conscrypt_generate_constants conscrypt_generated_constants conscrypt_global conscrypt_java_files conscrypt_public_api_files conscrypt_unbundled-jni-defaults libconscrypt_jni libconscrypt_openjdk_jni libconscrypt_static libjavacrypto libjavacrypto-defaults; }
