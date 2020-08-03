{ cc_binary, cc_defaults, cc_library_shared, cc_library_static, filegroup }:
let

keystore_defaults = cc_defaults {
    name = "keystore_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wunused"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
            "shift"
            "integer-divide-by-zero"
            "implicit-unsigned-integer-truncation"
            #  BUG: 123630767
            # "implicit-signed-integer-truncation",
            "implicit-integer-sign-change"
        ];
    };

    clang = true;
};

keystore = cc_binary {
    name = "keystore";
    defaults = ["keystore_defaults"];

    srcs = [
        ":IKeyAttestationApplicationIdProvider.aidl"
        "KeyStore.cpp"
        "auth_token_table.cpp"
        "blob.cpp"
        "confirmation_manager.cpp"
        "grant_store.cpp"
        "key_config.proto"
        "key_proto_handler.cpp"
        "key_store_service.cpp"
        "keyblob_utils.cpp"
        "keymaster_enforcement.cpp"
        "keymaster_worker.cpp"
        "keystore_attestation_id.cpp"
        "keystore_main.cpp"
        "keystore_utils.cpp"
        "legacy_keymaster_device_wrapper.cpp"
        "operation.cpp"
        "operation_config.proto"
        "operation_proto_handler.cpp"
        "permissions.cpp"
        "user_state.cpp"
    ];
    shared_libs = [
        "android.hardware.confirmationui@1.0"
        "android.hardware.keymaster@3.0"
        "android.hardware.keymaster@4.0"
        "android.system.wifi.keystore@1.0"
        "libbase"
        "libbinder"
        "libcrypto"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libkeymaster4support"
        "libkeymaster_messages"
        "libkeymaster_portable"
        "libkeystore_aidl"
        "libkeystore_binder"
        "libkeystore_parcelables"
        "liblog"
        "libprotobuf-cpp-lite"
        "libselinux"
        "libservices"
        "libsoftkeymasterdevice"
        "libutils"
        "libwifikeystorehal"
    ];
    init_rc = ["keystore.rc"];
    aidl = {
        include_dirs = ["frameworks/base/core/java/"];
    };

    product_variables = {
        pdk = {
            enabled = false;
        };
        debuggable = {
            cflags = [
                #  Allow VTS tests running as root to have
                #  additional permissions.
                "-DGRANT_ROOT_ALL_PERMISSIONS"
            ];
        };
    };

    required = ["keystore_cli_v2"];
};

keystore_cli = cc_binary {
    name = "keystore_cli";
    defaults = ["keystore_defaults"];

    srcs = ["keystore_cli.cpp"];
    shared_libs = [
        "android.hardware.keymaster@4.0"
        "libbinder"
        "libcrypto"
        "libcutils"
        "libhidlbase"
        "libhwbinder"
        "libkeystore_aidl" #  for IKeyStoreService.asInterface()
        "libkeystore_binder"
        "libkeystore_parcelables"
        "liblog"
        "libutils"
    ];
};

keystore_cli_v2 = cc_binary {
    name = "keystore_cli_v2";
    defaults = ["keystore_defaults"];

    cflags = [
        "-DKEYMASTER_NAME_TAGS"
        "-Wno-unused-parameter"
    ];
    srcs = ["keystore_cli_v2.cpp"];
    shared_libs = [
        "android.hardware.confirmationui@1.0"
        "libbinder"
        "android.hardware.keymaster@4.0"
        "libchrome"
        "libutils"
        "libhidlbase"
        "libhwbinder"
        "libkeymaster4support"
        "libkeystore_aidl"
        "libkeystore_binder"
        "libkeystore_parcelables"
    ];

    local_include_dirs = ["include"];
};

libkeystore_parcelables = cc_library_shared {
    name = "libkeystore_parcelables";
    defaults = ["keystore_defaults"];
    export_include_dirs = ["include"];
    srcs = [
        "KeyAttestationApplicationId.cpp"
        "KeyAttestationPackageInfo.cpp"
        "KeymasterArguments.cpp"
        "keystore_aidl_hidl_marshalling_utils.cpp"
        "KeystoreResponse.cpp"
        "OperationResult.cpp"
        "Signature.cpp"
    ];
    shared_libs = [
        "android.hardware.keymaster@4.0"
        "libbinder"
        "libhardware"
        "libhidlbase"
        "libhwbinder"
        "libkeymaster4support"
        "liblog"
        "libprotobuf-cpp-lite"
        "libutils"
    ];
    export_shared_lib_headers = [
        "android.hardware.keymaster@4.0"
        "libbinder"
        "libhidlbase"
        "libhwbinder"
        "libkeymaster4support"
    ];
};

#  Library for keystore clients
libkeystore_binder = cc_library_shared {
    name = "libkeystore_binder";
    defaults = ["keystore_defaults"];

    srcs = [
        "keyblob_utils.cpp"
        "keystore_client.proto"
        "keystore_client_impl.cpp"
        "keystore_get.cpp"
    ];
    shared_libs = [
        "android.hardware.keymaster@4.0"
        "libbinder"
        "libhidlbase"
        "libhwbinder"
        "libkeymaster4support"
        "libkeystore_aidl"
        "libkeystore_parcelables"
        "liblog"
        "libprotobuf-cpp-lite"
        "libutils"
    ];

    proto = {
        type = "lite";
        export_proto_headers = true;
    };
    aidl = {
        export_aidl_headers = true;
        include_dirs = ["frameworks/base/core/java/"];
    };
    export_include_dirs = ["include"];
    export_shared_lib_headers = [
        "android.hardware.keymaster@4.0"
        "libbinder"
        "libhidlbase"
        "libhwbinder"
        "libkeystore_aidl"
        "libkeystore_parcelables"
    ];
};

#  Library for keystore clients using the WiFi HIDL interface
libkeystore-wifi-hidl = cc_library_shared {
    name = "libkeystore-wifi-hidl";
    defaults = ["keystore_defaults"];

    srcs = ["keystore_get_wifi_hidl.cpp"];
    shared_libs = [
        "android.system.wifi.keystore@1.0"
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
    ];

    export_include_dirs = ["include"];

    vendor = true;
};

#  Library for unit tests
libkeystore_test = cc_library_static {
    name = "libkeystore_test";
    defaults = ["keystore_defaults"];

    srcs = [
        ":IKeyAttestationApplicationIdProvider.aidl"
        "auth_token_table.cpp"
        "blob.cpp"
        "keystore_attestation_id.cpp"
        "KeyAttestationApplicationId.cpp"
        "KeyAttestationPackageInfo.cpp"
        "Signature.cpp"
    ];
    cflags = ["-O0"];
    static_libs = ["libgtest_main"];
    shared_libs = [
        "android.hardware.keymaster@4.0"
        "libbinder"
        "libcrypto"
        "libhidlbase"
        "libhwbinder"
        "libkeymaster4support"
        "libutils"
        "libkeystore_aidl"
        "libkeystore_parcelables"
    ];
    export_shared_lib_headers = [
        "android.hardware.keymaster@4.0"
        "libhidlbase"
        "libhwbinder"
        "libkeymaster4support"
    ];

    aidl = {
        include_dirs = ["frameworks/base/core/java/"];
    };
    export_include_dirs = ["include"];
};

keystore_aidl = filegroup {
    name = "keystore_aidl";
    srcs = [
        "binder/android/security/IConfirmationPromptCallback.aidl"
        "binder/android/security/keystore/IKeystoreCertificateChainCallback.aidl"
        "binder/android/security/keystore/IKeystoreExportKeyCallback.aidl"
        "binder/android/security/keystore/IKeystoreKeyCharacteristicsCallback.aidl"
        "binder/android/security/keystore/IKeystoreOperationResultCallback.aidl"
        "binder/android/security/keystore/IKeystoreResponseCallback.aidl"
        "binder/android/security/keystore/IKeystoreService.aidl"
    ];
    path = "binder";
};

libkeystore_aidl = cc_library_shared {
    name = "libkeystore_aidl";
    srcs = [":keystore_aidl"];
    aidl = {
        export_aidl_headers = true;
        include_dirs = [
            "system/security/keystore/binder"
        ];
    };
    shared_libs = [
        "libbinder"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libkeystore_parcelables"
        "liblog"
        "libselinux"
        "libutils"
    ];
    export_shared_lib_headers = [
        "libbinder"
        "libkeystore_parcelables"
    ];
};

in { inherit keystore keystore_aidl keystore_cli keystore_cli_v2 keystore_defaults libkeystore-wifi-hidl libkeystore_aidl libkeystore_binder libkeystore_parcelables libkeystore_test; }
