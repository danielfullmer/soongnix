{ python_binary_host, python_defaults, python_library_host, python_test_host }:
let

#  Copyright (C) 2019 The Android Open Source Project
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
#  Module-specific defaults.
#
#  For module X, if we need to build it both as a library and an executable:
#   - A default rule `releasetools_X_defaults` is created, which lists `srcs`, `libs` and
#     `required` properties.
#   - `python_library_host` and `python_binary_host` are created by listing
#     `releasetools_X_defaults` in their defaults.
#

releasetools_add_img_to_target_files_defaults = python_defaults {
    name = "releasetools_add_img_to_target_files_defaults";
    srcs = [
        "add_img_to_target_files.py"
    ];
    libs = [
        "releasetools_build_image"
        "releasetools_build_super_image"
        "releasetools_common"
    ];
    required = [
        "care_map_generator"
    ];
};

releasetools_build_image_defaults = python_defaults {
    name = "releasetools_build_image_defaults";
    srcs = [
        "build_image.py"
    ];
    libs = [
        "releasetools_common"
        "releasetools_verity_utils"
    ];
    required = [
        "blk_alloc_to_base_fs"
        "e2fsck"
        "simg2img"
        "tune2fs"
    ];
};

releasetools_build_super_image_defaults = python_defaults {
    name = "releasetools_build_super_image_defaults";
    srcs = [
        "build_super_image.py"
    ];
    libs = [
        "releasetools_common"
    ];
};

releasetools_img_from_target_files_defaults = python_defaults {
    name = "releasetools_img_from_target_files_defaults";
    srcs = [
        "img_from_target_files.py"
    ];
    libs = [
        "releasetools_build_super_image"
        "releasetools_common"
    ];
    required = [
        "zip2zip"
    ];
};

releasetools_check_target_files_vintf_defaults = python_defaults {
    name = "releasetools_check_target_files_vintf_defaults";
    srcs = [
        "check_target_files_vintf.py"
    ];
    libs = [
        "releasetools_common"
    ];
    required = [
        "checkvintf"
    ];
};

releasetools_ota_from_target_files_defaults = python_defaults {
    name = "releasetools_ota_from_target_files_defaults";
    srcs = [
        "edify_generator.py"
        "ota_from_target_files.py"
        "target_files_diff.py"
    ];
    libs = [
        "releasetools_check_target_files_vintf"
        "releasetools_common"
        "releasetools_verity_utils"
    ];
    required = [
        "brillo_update_payload"
        "checkvintf"
    ];
};

#
#  Host libraries.
#

releasetools_library_defaults = python_defaults {
    name = "releasetools_library_defaults";
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
};

releasetools_add_img_to_target_files = python_library_host {
    name = "releasetools_add_img_to_target_files";
    defaults = [
        "releasetools_library_defaults"
        "releasetools_add_img_to_target_files_defaults"
    ];
};

releasetools_apex_utils = python_library_host {
    name = "releasetools_apex_utils";
    defaults = ["releasetools_library_defaults"];
    srcs = [
        "apex_utils.py"
    ];
    libs = [
        "releasetools_common"
    ];
};

releasetools_build_image = python_library_host {
    name = "releasetools_build_image";
    defaults = [
        "releasetools_library_defaults"
        "releasetools_build_image_defaults"
    ];
};

releasetools_build_super_image = python_library_host {
    name = "releasetools_build_super_image";
    defaults = [
        "releasetools_library_defaults"
        "releasetools_build_super_image_defaults"
    ];
};

releasetools_check_target_files_vintf = python_library_host {
    name = "releasetools_check_target_files_vintf";
    defaults = [
        "releasetools_library_defaults"
        "releasetools_check_target_files_vintf_defaults"
    ];
};

releasetools_common = python_library_host {
    name = "releasetools_common";
    defaults = ["releasetools_library_defaults"];
    srcs = [
        "blockimgdiff.py"
        "common.py"
        "images.py"
        "rangelib.py"
        "sparse_img.py"
    ];
    #  Only the tools that are referenced directly are listed as required modules. For example,
    #  `avbtool` is not here, as the script always uses the one from info_dict['avb_avbtool'].
    required = [
        "aapt2"
        "boot_signer"
        "brotli"
        "bsdiff"
        "imgdiff"
        "minigzip"
        "lz4"
        "mkbootfs"
        "signapk"
    ];
};

releasetools_img_from_target_files = python_library_host {
    name = "releasetools_img_from_target_files";
    defaults = [
        "releasetools_library_defaults"
        "releasetools_img_from_target_files_defaults"
    ];
};

releasetools_ota_from_target_files = python_library_host {
    name = "releasetools_ota_from_target_files";
    defaults = [
        "releasetools_library_defaults"
        "releasetools_ota_from_target_files_defaults"
    ];
};

releasetools_verity_utils = python_library_host {
    name = "releasetools_verity_utils";
    defaults = ["releasetools_library_defaults"];
    srcs = [
        "verity_utils.py"
    ];
    required = [
        "append2simg"
        "build_verity_metadata"
        "build_verity_tree"
        "fec"
    ];
};

#
#  Host binaries.
#

releasetools_binary_defaults = python_defaults {
    name = "releasetools_binary_defaults";
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
            embedded_launcher = false;
        };
    };
};

add_img_to_target_files = python_binary_host {
    name = "add_img_to_target_files";
    defaults = [
        "releasetools_binary_defaults"
        "releasetools_add_img_to_target_files_defaults"
    ];
};

build_image = python_binary_host {
    name = "build_image";
    defaults = [
        "releasetools_binary_defaults"
        "releasetools_build_image_defaults"
    ];
};

build_super_image = python_binary_host {
    name = "build_super_image";
    defaults = [
        "releasetools_binary_defaults"
        "releasetools_build_super_image_defaults"
    ];
};

check_partition_sizes = python_binary_host {
    name = "check_partition_sizes";
    srcs = [
        "check_partition_sizes.py"
    ];
    libs = [
        "releasetools_common"
    ];
    defaults = [
        "releasetools_binary_defaults"
    ];
};

check_ota_package_signature = python_binary_host {
    name = "check_ota_package_signature";
    defaults = ["releasetools_binary_defaults"];
    srcs = [
        "check_ota_package_signature.py"
    ];
    libs = [
        "releasetools_common"
    ];
    required = [
        "delta_generator"
    ];
};

check_target_files_signatures = python_binary_host {
    name = "check_target_files_signatures";
    defaults = ["releasetools_binary_defaults"];
    srcs = [
        "check_target_files_signatures.py"
    ];
    libs = [
        "releasetools_common"
    ];
    required = [
        "aapt"
    ];
};

check_target_files_vintf = python_binary_host {
    name = "check_target_files_vintf";
    defaults = [
        "releasetools_binary_defaults"
        "releasetools_check_target_files_vintf_defaults"
    ];
};

img_from_target_files = python_binary_host {
    name = "img_from_target_files";
    defaults = [
        "releasetools_binary_defaults"
        "releasetools_img_from_target_files_defaults"
    ];
};

make_recovery_patch = python_binary_host {
    name = "make_recovery_patch";
    defaults = ["releasetools_binary_defaults"];
    srcs = [
        "make_recovery_patch.py"
    ];
    libs = [
        "releasetools_common"
    ];
};

merge_builds = python_binary_host {
    name = "merge_builds";
    defaults = ["releasetools_binary_defaults"];
    srcs = [
        "merge_builds.py"
    ];
    libs = [
        "releasetools_build_super_image"
        "releasetools_common"
    ];
};

merge_target_files = python_binary_host {
    name = "merge_target_files";
    defaults = ["releasetools_binary_defaults"];
    srcs = [
        "merge_target_files.py"
    ];
    libs = [
        "releasetools_add_img_to_target_files"
        "releasetools_build_super_image"
        "releasetools_check_target_files_vintf"
        "releasetools_common"
        "releasetools_img_from_target_files"
        "releasetools_ota_from_target_files"
    ];
    required = [
        "checkvintf"
    ];
};

ota_from_target_files = python_binary_host {
    name = "ota_from_target_files";
    defaults = [
        "releasetools_binary_defaults"
        "releasetools_ota_from_target_files_defaults"
    ];
};

ota_package_parser = python_binary_host {
    name = "ota_package_parser";
    defaults = ["releasetools_binary_defaults"];
    srcs = [
        "ota_package_parser.py"
        "rangelib.py"
    ];
};

sparse_img = python_binary_host {
    name = "sparse_img";
    defaults = ["releasetools_binary_defaults"];
    srcs = [
        "rangelib.py"
        "sparse_img.py"
    ];
};

sign_apex = python_binary_host {
    name = "sign_apex";
    defaults = ["releasetools_binary_defaults"];
    srcs = [
        "sign_apex.py"
    ];
    libs = [
        "releasetools_apex_utils"
        "releasetools_common"
    ];
};

sign_target_files_apks = python_binary_host {
    name = "sign_target_files_apks";
    defaults = ["releasetools_binary_defaults"];
    srcs = [
        "sign_target_files_apks.py"
    ];
    libs = [
        "releasetools_add_img_to_target_files"
        "releasetools_apex_utils"
        "releasetools_common"
    ];
};

validate_target_files = python_binary_host {
    name = "validate_target_files";
    defaults = ["releasetools_binary_defaults"];
    srcs = [
        "validate_target_files.py"
    ];
    libs = [
        "releasetools_common"
    ];
};

#
#  Tests.
#

releasetools_test_defaults = python_defaults {
    name = "releasetools_test_defaults";
    srcs = [
        "check_ota_package_signature.py"
        "check_partition_sizes.py"
        "check_target_files_signatures.py"
        "make_recovery_patch.py"
        "merge_target_files.py"
        "ota_package_parser.py"
        "sign_apex.py"
        "sign_target_files_apks.py"
        "validate_target_files.py"

        "test_add_img_to_target_files.py"
        "test_apex_utils.py"
        "test_blockimgdiff.py"
        "test_build_image.py"
        "test_check_partition_sizes.py"
        "test_check_target_files_vintf.py"
        "test_common.py"
        "test_merge_target_files.py"
        "test_ota_from_target_files.py"
        "test_rangelib.py"
        "test_sign_apex.py"
        "test_sign_target_files_apks.py"
        "test_utils.py"
        "test_validate_target_files.py"
        "test_verity_utils.py"
    ];
    libs = [
        "releasetools_add_img_to_target_files"
        "releasetools_apex_utils"
        "releasetools_build_image"
        "releasetools_build_super_image"
        "releasetools_check_target_files_vintf"
        "releasetools_common"
        "releasetools_img_from_target_files"
        "releasetools_ota_from_target_files"
        "releasetools_verity_utils"
    ];
    data = [
        "testdata/TestApp.apk"
        "testdata/apexkeys_framework.txt"
        "testdata/apexkeys_framework_conflict.txt"
        "testdata/apexkeys_merge.txt"
        "testdata/apexkeys_vendor.txt"
        "testdata/apkcerts_framework.txt"
        "testdata/apkcerts_merge.txt"
        "testdata/apkcerts_vendor.txt"
        "testdata/foo.apex"
        "testdata/has_apk.apex"
        "testdata/media.x509.pem"
        "testdata/merge_config_framework_item_list"
        "testdata/payload_signer.sh"
        "testdata/platform.x509.pem"
        "testdata/sigfile.bin"
        "testdata/signed-sigfile.bin"
        "testdata/signing_helper.sh"
        "testdata/testkey.key"
        "testdata/testkey.pk8"
        "testdata/testkey.pubkey.pem"
        "testdata/testkey.x509.pem"
        "testdata/testkey_EC.key"
        "testdata/testkey_RSA4096.key"
        "testdata/testkey_mincrypt"
        "testdata/testkey_with_passwd.key"
        "testdata/testkey_with_passwd.pk8"
        "testdata/testkey_with_passwd.x509.pem"
        "testdata/verity.x509.pem"
        "testdata/verity_mincrypt"
        "testdata/vintf/"
        "testdata/vintf/kernel/"
        "testdata/vintf/matrix_incompat/"
        "testdata/vintf/sku_compat/"
        "testdata/vintf/sku_incompat/"
        "testdata/vintf/kernel/SYSTEM/"
        "testdata/vintf/kernel/SYSTEM/compatibility_matrix.xml"
        "testdata/vintf/matrix_incompat/SYSTEM/"
        "testdata/vintf/matrix_incompat/SYSTEM/compatibility_matrix.xml"
        "testdata/vintf/sku_compat/ODM/"
        "testdata/vintf/sku_compat/SYSTEM/"
        "testdata/vintf/sku_compat/ODM/etc/"
        "testdata/vintf/sku_compat/ODM/etc/vintf/"
        "testdata/vintf/sku_compat/ODM/etc/vintf/manifest_sku.xml"
        "testdata/vintf/sku_compat/SYSTEM/compatibility_matrix.xml"
        "testdata/vintf/sku_incompat/ODM/"
        "testdata/vintf/sku_incompat/SYSTEM/"
        "testdata/vintf/sku_incompat/ODM/etc/"
        "testdata/vintf/sku_incompat/ODM/etc/vintf/"
        "testdata/vintf/sku_incompat/ODM/etc/vintf/manifest_sku.xml"
        "testdata/vintf/sku_incompat/SYSTEM/compatibility_matrix.xml"
    ];
    required = [
        "otatools"
    ];
};

releasetools_test = python_test_host {
    name = "releasetools_test";
    defaults = ["releasetools_test_defaults"];
    main = "test_utils.py";
    version = {
        py2 = {
            enabled = true;
            #  When using embedded launcher, atest will try (but may fail) to load libc++.so from
            #  host, because the test executable won't be able to find the needed libs via its
            #  runpath.
            embedded_launcher = false;
        };
        py3 = {
            enabled = false;
            embedded_launcher = false;
        };
    };
    test_suites = ["general-tests"];
};

releasetools_py3_test = python_test_host {
    name = "releasetools_py3_test";
    defaults = ["releasetools_test_defaults"];
    main = "test_utils.py";
    version = {
        py2 = {
            enabled = false;
            embedded_launcher = false;
        };
        py3 = {
            enabled = true;
            embedded_launcher = false;
        };
    };
    test_suites = ["general-tests"];
};

in { inherit add_img_to_target_files build_image build_super_image check_ota_package_signature check_partition_sizes check_target_files_signatures check_target_files_vintf img_from_target_files make_recovery_patch merge_builds merge_target_files ota_from_target_files ota_package_parser releasetools_add_img_to_target_files releasetools_add_img_to_target_files_defaults releasetools_apex_utils releasetools_binary_defaults releasetools_build_image releasetools_build_image_defaults releasetools_build_super_image releasetools_build_super_image_defaults releasetools_check_target_files_vintf releasetools_check_target_files_vintf_defaults releasetools_common releasetools_img_from_target_files releasetools_img_from_target_files_defaults releasetools_library_defaults releasetools_ota_from_target_files releasetools_ota_from_target_files_defaults releasetools_py3_test releasetools_test releasetools_test_defaults releasetools_verity_utils sign_apex sign_target_files_apks sparse_img validate_target_files; }
