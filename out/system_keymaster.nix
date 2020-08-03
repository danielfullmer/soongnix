{ cc_library, cc_library_shared, cc_library_static }:
let

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

#  libkeymaster_messages contains just the code necessary to communicate with a
#  AndroidKeymaster implementation, e.g. one running in TrustZone.
libkeymaster_messages = cc_library_shared {
    name = "libkeymaster_messages";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "android_keymaster/android_keymaster_messages.cpp"
        "android_keymaster/android_keymaster_utils.cpp"
        "android_keymaster/authorization_set.cpp"
        "android_keymaster/keymaster_tags.cpp"
        "android_keymaster/logger.cpp"
        "android_keymaster/serializable.cpp"
        "android_keymaster/keymaster_stl.cpp"
    ];
    header_libs = ["libhardware_headers"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-DKEYMASTER_NAME_TAGS"
    ];
    stl = "none";
    clang = true;
    clang_cflags = [
        "-Wimplicit-fallthrough"
        #  TODO(krasin): reenable coverage flags, when the new Clang toolchain is released.
        #  Currently, if enabled, these flags will cause an internal error in Clang.
        "-fno-sanitize-coverage=edge,indirect-calls,8bit-counters,trace-cmp"
    ];

    export_include_dirs = ["include"];
    sanitize = {
        integer_overflow = false;
    };
};

#  libkeymaster_portable contains almost everything needed for a keymaster
#  implementation, lacking only a subclass of the (abstract) KeymasterContext
#  class to provide environment-specific services and a wrapper to translate from
#  the function-based keymaster HAL API to the message-based AndroidKeymaster API.
libkeymaster_portable = cc_library {
    name = "libkeymaster_portable";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "android_keymaster/android_keymaster.cpp"
        "android_keymaster/android_keymaster_messages.cpp"
        "android_keymaster/android_keymaster_utils.cpp"
        "android_keymaster/authorization_set.cpp"
        "android_keymaster/keymaster_enforcement.cpp"
        "android_keymaster/keymaster_stl.cpp"
        "android_keymaster/keymaster_tags.cpp"
        "android_keymaster/logger.cpp"
        "android_keymaster/operation.cpp"
        "android_keymaster/operation_table.cpp"
        "android_keymaster/serializable.cpp"
        "key_blob_utils/auth_encrypted_key_blob.cpp"
        "key_blob_utils/integrity_assured_key_blob.cpp"
        "key_blob_utils/ocb.c"
        "key_blob_utils/ocb_utils.cpp"
        "key_blob_utils/software_keyblobs.cpp"
        "km_openssl/aes_key.cpp"
        "km_openssl/aes_operation.cpp"
        "km_openssl/asymmetric_key.cpp"
        "km_openssl/asymmetric_key_factory.cpp"
        "km_openssl/attestation_record.cpp"
        "km_openssl/attestation_utils.cpp"
        "km_openssl/block_cipher_operation.cpp"
        "km_openssl/ckdf.cpp"
        "km_openssl/ec_key.cpp"
        "km_openssl/ec_key_factory.cpp"
        "km_openssl/ecdsa_operation.cpp"
        "km_openssl/ecies_kem.cpp"
        "km_openssl/hkdf.cpp"
        "km_openssl/hmac.cpp"
        "km_openssl/hmac_key.cpp"
        "km_openssl/hmac_operation.cpp"
        "km_openssl/iso18033kdf.cpp"
        "km_openssl/kdf.cpp"
        "km_openssl/nist_curve_key_exchange.cpp"
        "km_openssl/openssl_err.cpp"
        "km_openssl/openssl_utils.cpp"
        "km_openssl/rsa_key.cpp"
        "km_openssl/rsa_key_factory.cpp"
        "km_openssl/rsa_operation.cpp"
        "km_openssl/software_random_source.cpp"
        "km_openssl/symmetric_key.cpp"
        "km_openssl/triple_des_key.cpp"
        "km_openssl/triple_des_operation.cpp"
        "km_openssl/wrapped_key.cpp"
    ];

    shared_libs = [
        "libcrypto"
    ];
    header_libs = ["libhardware_headers"];
    export_header_lib_headers = ["libhardware_headers"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-DBORINGSSL_NO_CXX"
    ];
    #  NOTE: libkeymaster_portable must run unchanged in the trusty runtime environment.
    #  Therefore, it must not link against any c++ stl library. keymaster_stl.cpp
    #  weakly defines the subset of stl symbols required for this library to work
    #  and which are also available in the trusty context.
    stl = "none";
    clang = true;
    clang_cflags = [
        "-Wno-error=unused-const-variable"
        "-Wno-error=unused-private-field"
        "-Wimplicit-fallthrough"
        #  TODO(krasin): reenable coverage flags, when the new Clang toolchain is released.
        #  Currently, if enabled, these flags will cause an internal error in Clang.
        "-fno-sanitize-coverage=edge,indirect-calls,8bit-counters,trace-cmp"
    ];

    export_include_dirs = ["include"];
    sanitize = {
        integer_overflow = false;
    };
};

#  libsoftkeymaster provides a software-based keymaster HAL implementation.
#  This is used by keystore as a fallback for when the hardware keymaster does
#  not support the request.
libsoftkeymasterdevice = cc_library {
    name = "libsoftkeymasterdevice";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "android_keymaster/keymaster_configuration.cpp"
        "legacy_support/ec_keymaster0_key.cpp"
        "legacy_support/ec_keymaster1_key.cpp"
        "legacy_support/ecdsa_keymaster1_operation.cpp"
        "legacy_support/keymaster0_engine.cpp"
        "legacy_support/keymaster1_engine.cpp"
        "legacy_support/rsa_keymaster0_key.cpp"
        "legacy_support/rsa_keymaster1_key.cpp"
        "legacy_support/rsa_keymaster1_operation.cpp"
        "legacy_support/keymaster1_legacy_support.cpp"
        "contexts/soft_attestation_cert.cpp"
        "contexts/soft_keymaster_context.cpp"
        "contexts/pure_soft_keymaster_context.cpp"
        "contexts/soft_keymaster_device.cpp"
        "km_openssl/soft_keymaster_enforcement.cpp"
        "contexts/soft_keymaster_logger.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
    ];
    clang = true;
    clang_cflags = [
        "-Wno-error=unused-const-variable"
        "-Wno-error=unused-private-field"
        #  TODO(krasin): reenable coverage flags, when the new Clang toolchain is released.
        #  Currently, if enabled, these flags will cause an internal error in Clang.
        "-fno-sanitize-coverage=edge,indirect-calls,8bit-counters,trace-cmp"
    ];

    shared_libs = [
        "libkeymaster_messages"
        "libkeymaster_portable"
        "liblog"
        "libbase"
        "libcrypto"
        "libcutils"
    ];

    export_include_dirs = ["include"];
};

libpuresoftkeymasterdevice = cc_library {
    name = "libpuresoftkeymasterdevice";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "android_keymaster/keymaster_configuration.cpp"
        "contexts/soft_attestation_cert.cpp"
        "contexts/pure_soft_keymaster_context.cpp"
        "contexts/soft_keymaster_logger.cpp"
        "km_openssl/soft_keymaster_enforcement.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
    ];
    clang = true;
    clang_cflags = [
        "-Wno-error=unused-const-variable"
        "-Wno-error=unused-private-field"
        #  TODO(krasin): reenable coverage flags, when the new Clang toolchain is released.
        #  Currently, if enabled, these flags will cause an internal error in Clang.
        "-fno-sanitize-coverage=edge,indirect-calls,8bit-counters,trace-cmp"
    ];

    shared_libs = [
        "libkeymaster_messages"
        "libkeymaster_portable"
        "liblog"
        "libcrypto"
        "libcutils"
        "libbase"
    ];

    export_include_dirs = ["include"];
};

libkeymaster3device = cc_library_shared {
    name = "libkeymaster3device";
    vendor = true;
    srcs = [
        "legacy_support/keymaster_passthrough_key.cpp"
        "legacy_support/keymaster_passthrough_engine.cpp"
        "legacy_support/keymaster_passthrough_operation.cpp"
        "contexts/keymaster1_passthrough_context.cpp"
        "contexts/keymaster2_passthrough_context.cpp"
        "ng/AndroidKeymaster3Device.cpp"
        "android_keymaster/keymaster_configuration.cpp"
        "legacy_support/ec_keymaster0_key.cpp"
        "legacy_support/ec_keymaster1_key.cpp"
        "legacy_support/ecdsa_keymaster1_operation.cpp"
        "legacy_support/keymaster0_engine.cpp"
        "legacy_support/keymaster1_engine.cpp"
        "legacy_support/keymaster1_legacy_support.cpp"
        "legacy_support/rsa_keymaster0_key.cpp"
        "legacy_support/rsa_keymaster1_key.cpp"
        "legacy_support/rsa_keymaster1_operation.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
    ];
    clang = true;
    clang_cflags = [
        "-Wno-error=unused-const-variable"
        "-Wno-error=unused-private-field"
        #  TODO(krasin): reenable coverage flags, when the new Clang toolchain is released.
        #  Currently, if enabled, these flags will cause an internal error in Clang.
        "-fno-sanitize-coverage=edge,indirect-calls,8bit-counters,trace-cmp"
    ];

    shared_libs = [
        "libkeymaster_messages"
        "android.hardware.keymaster@3.0"
        "libcrypto"
        "libcutils"
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "libkeymaster_portable"
        "libpuresoftkeymasterdevice"
        "liblog"
        "libutils"
    ];

    export_include_dirs = [
        "include"
        "ng/include"
    ];
};

libkeymaster4 = cc_library_shared {
    name = "libkeymaster4";
    vendor_available = true;
    srcs = [
        "legacy_support/keymaster_passthrough_key.cpp"
        "legacy_support/keymaster_passthrough_engine.cpp"
        "legacy_support/keymaster_passthrough_operation.cpp"
        "ng/AndroidKeymaster4Device.cpp"
        "android_keymaster/keymaster_configuration.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
    ];
    clang = true;
    clang_cflags = [
        "-Wno-error=unused-const-variable"
        "-Wno-error=unused-private-field"
        #  TODO(krasin): reenable coverage flags, when the new Clang toolchain is released.
        #  Currently, if enabled, these flags will cause an internal error in Clang.
        "-fno-sanitize-coverage=edge,indirect-calls,8bit-counters,trace-cmp"
    ];

    shared_libs = [
        "libkeymaster_messages"
        "android.hardware.keymaster@4.0"
        "libcrypto"
        "libcutils"
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "libkeymaster_portable"
        "libpuresoftkeymasterdevice"
        "liblog"
        "libutils"
        "libkeymaster4support"
    ];

    export_include_dirs = ["ng/include"];
};

#  libkeymasterfiles is an empty library that exports all of the files in keymaster as includes.
libkeymasterfiles = cc_library_static {
    name = "libkeymasterfiles";
    export_include_dirs = [
        "."
        "include"
    ];
};

in { inherit libkeymaster3device libkeymaster4 libkeymaster_messages libkeymaster_portable libkeymasterfiles libpuresoftkeymasterdevice libsoftkeymasterdevice; }
