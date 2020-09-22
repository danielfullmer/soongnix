{ python_binary_host, python_defaults, python_library_host, python_test_host }:
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

acloud_default = python_defaults {
    name = "acloud_default";
    pkg_path = "acloud";
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = false;
        };
        py3 = {
            enabled = false;
            embedded_launcher = false;
        };
    };
};

acloud = python_binary_host {
    name = "acloud";
    #  Make acloud's built name to acloud-dev
    stem = "acloud-dev";
    defaults = ["acloud_default"];
    main = "public/acloud_main.py";
    srcs = [
        "public/acloud_main.py"
        "errors.py"
    ];
    data = [
        "public/data/default.config"
    ];
    libs = [
        "acloud_create"
        "acloud_delete"
        "acloud_reconnect"
        "acloud_internal"
        "acloud_list"
        "acloud_pull"
        "acloud_metrics"
        "acloud_proto"
        "acloud_public"
        "acloud_setup"
        "py-apitools"
        "py-dateutil"
        "py-google-api-python-client"
        "py-oauth2client"
        "py-pyopenssl"
        "py-six"
    ];
    dist = {
        targets = ["droidcore"];
    };
};

acloud_test = python_test_host {
    name = "acloud_test";
    main = "acloud_test.py";
    defaults = ["acloud_default"];
    data = [
        "public/data/default.config"
    ];
    srcs = [
        "acloud_test.py"
        "errors.py"
        "public/config_test.py"
        "public/device_driver_test.py"
        "public/report_test.py"
        "public/actions/common_operations_test.py"
        "public/actions/create_cuttlefish_action_test.py"
        "public/actions/create_goldfish_action_test.py"
        "public/actions/remote_instance_cf_device_factory_test.py"
        "internal/lib/adb_tools_test.py"
        "internal/lib/android_build_client_test.py"
        "internal/lib/android_compute_client_test.py"
        "internal/lib/base_cloud_client_test.py"
        "internal/lib/cheeps_compute_client_test.py"
        "internal/lib/cvd_compute_client_multi_stage_test.py"
        "internal/lib/cvd_compute_client_test.py"
        "internal/lib/cvd_runtime_config_test.py"
        "internal/lib/gcompute_client_test.py"
        "internal/lib/goldfish_compute_client_test.py"
        "internal/lib/gstorage_client_test.py"
        "internal/lib/ota_tools_test.py"
        "internal/lib/ssh_test.py"
        "internal/lib/utils_test.py"
        "metrics/__init__.py"
        "metrics/metrics.py"
    ];
    libs = [
        "acloud_create"
        "acloud_delete"
        "acloud_reconnect"
        "acloud_internal"
        "acloud_list"
        "acloud_pull"
        "acloud_proto"
        "acloud_public"
        "acloud_setup"
        "asuite_cc_client"
        "py-apitools"
        "py-dateutil"
        "py-google-api-python-client"
        "py-mock"
        "py-oauth2client"
    ];
    test_config = "acloud_unittest.xml";
    test_suites = ["general-tests"];
};

acloud_public = python_library_host {
    name = "acloud_public";
    defaults = ["acloud_default"];
    srcs = [
        "public/__init__.py"
        "public/__main__.py"
        "public/acloud_common.py"
        "public/acloud_main.py"
        "public/avd.py"
        "public/config.py"
        "public/config_test.py"
        "public/device_driver.py"
        "public/device_driver_test.py"
        "public/report.py"
        "public/report_test.py"
        "public/actions/__init__.py"
        "public/actions/base_device_factory.py"
        "public/actions/common_operations.py"
        "public/actions/common_operations_test.py"
        "public/actions/create_cuttlefish_action.py"
        "public/actions/create_cuttlefish_action_test.py"
        "public/actions/create_goldfish_action.py"
        "public/actions/create_goldfish_action_test.py"
        "public/actions/remote_instance_cf_device_factory.py"
        "public/actions/remote_instance_cf_device_factory_test.py"
    ];
    exclude_srcs = [
        "public/config_test.py"
        "public/device_driver_test.py"
        "public/report_test.py"
        "public/actions/common_operations_test.py"
        "public/actions/create_cuttlefish_action_test.py"
        "public/actions/create_goldfish_action_test.py"
        "public/actions/remote_instance_cf_device_factory_test.py"
        "public/acloud_main.py"
    ];
};

acloud_internal = python_library_host {
    name = "acloud_internal";
    defaults = ["acloud_default"];
    srcs = [
        "internal/__init__.py"
        "internal/constants.py"
        "internal/lib/__init__.py"
        "internal/lib/adb_tools.py"
        "internal/lib/adb_tools_test.py"
        "internal/lib/android_build_client.py"
        "internal/lib/android_build_client_test.py"
        "internal/lib/android_compute_client.py"
        "internal/lib/android_compute_client_test.py"
        "internal/lib/auth.py"
        "internal/lib/base_cloud_client.py"
        "internal/lib/base_cloud_client_test.py"
        "internal/lib/cheeps_compute_client.py"
        "internal/lib/cheeps_compute_client_test.py"
        "internal/lib/cvd_compute_client.py"
        "internal/lib/cvd_compute_client_multi_stage.py"
        "internal/lib/cvd_compute_client_multi_stage_test.py"
        "internal/lib/cvd_compute_client_test.py"
        "internal/lib/cvd_runtime_config.py"
        "internal/lib/cvd_runtime_config_test.py"
        "internal/lib/driver_test_lib.py"
        "internal/lib/gcompute_client.py"
        "internal/lib/gcompute_client_test.py"
        "internal/lib/goldfish_compute_client.py"
        "internal/lib/goldfish_compute_client_test.py"
        "internal/lib/gstorage_client.py"
        "internal/lib/gstorage_client_test.py"
        "internal/lib/ota_tools.py"
        "internal/lib/ota_tools_test.py"
        "internal/lib/ssh.py"
        "internal/lib/ssh_test.py"
        "internal/lib/utils.py"
        "internal/lib/utils_test.py"
    ];
    exclude_srcs = [
        "internal/lib/adb_tools_test.py"
        "internal/lib/android_build_client_test.py"
        "internal/lib/android_compute_client_test.py"
        "internal/lib/base_cloud_client_test.py"
        "internal/lib/cheeps_compute_client_test.py"
        "internal/lib/cvd_compute_client_multi_stage_test.py"
        "internal/lib/cvd_compute_client_test.py"
        "internal/lib/cvd_runtime_config_test.py"
        "internal/lib/gcompute_client_test.py"
        "internal/lib/goldfish_compute_client_test.py"
        "internal/lib/gstorage_client_test.py"
        "internal/lib/ota_tools_test.py"
        "internal/lib/ssh_test.py"
        "internal/lib/utils_test.py"
    ];
};

acloud_proto = python_library_host {
    name = "acloud_proto";
    defaults = ["acloud_default"];
    srcs = [
        "internal/proto/internal_config.proto"
        "internal/proto/user_config.proto"
    ];
    proto = {
        canonical_path_from_root = false;
    };
};

acloud_setup = python_library_host {
    name = "acloud_setup";
    defaults = ["acloud_default"];
    srcs = [
        "setup/__init__.py"
        "setup/base_task_runner.py"
        "setup/gcp_setup_runner.py"
        "setup/gcp_setup_runner_test.py"
        "setup/google_sdk.py"
        "setup/host_setup_runner.py"
        "setup/host_setup_runner_test.py"
        "setup/setup.py"
        "setup/setup_args.py"
        "setup/setup_common.py"
        "setup/setup_common_test.py"
    ];
    exclude_srcs = [
        "setup/gcp_setup_runner_test.py"
        "setup/host_setup_runner_test.py"
        "setup/setup_common_test.py"
    ];
};

acloud_create = python_library_host {
    name = "acloud_create";
    defaults = ["acloud_default"];
    srcs = [
        "create/__init__.py"
        "create/avd_spec.py"
        "create/avd_spec_test.py"
        "create/base_avd_create.py"
        "create/cheeps_remote_image_remote_instance.py"
        "create/cheeps_remote_image_remote_instance_test.py"
        "create/create.py"
        "create/create_args.py"
        "create/create_args_test.py"
        "create/create_common.py"
        "create/create_common_test.py"
        "create/create_test.py"
        "create/gce_local_image_remote_instance.py"
        "create/gce_remote_image_remote_instance.py"
        "create/goldfish_local_image_local_instance.py"
        "create/goldfish_local_image_local_instance_test.py"
        "create/goldfish_remote_image_remote_instance.py"
        "create/local_image_local_instance.py"
        "create/local_image_local_instance_test.py"
        "create/local_image_remote_host.py"
        "create/local_image_remote_instance.py"
        "create/remote_image_local_instance.py"
        "create/remote_image_local_instance_test.py"
        "create/remote_image_remote_host.py"
        "create/remote_image_remote_host_test.py"
        "create/remote_image_remote_instance.py"
    ];
};

acloud_delete = python_library_host {
    name = "acloud_delete";
    defaults = ["acloud_default"];
    srcs = [
        "delete/__init__.py"
        "delete/delete.py"
        "delete/delete_args.py"
        "delete/delete_test.py"
    ];
};

acloud_list = python_library_host {
    name = "acloud_list";
    defaults = ["acloud_default"];
    srcs = [
        "list/__init__.py"
        "list/instance.py"
        "list/instance_test.py"
        "list/list.py"
        "list/list_args.py"
        "list/list_test.py"
    ];
};

acloud_reconnect = python_library_host {
    name = "acloud_reconnect";
    defaults = ["acloud_default"];
    srcs = [
        "reconnect/__init__.py"
        "reconnect/reconnect.py"
        "reconnect/reconnect_args.py"
        "reconnect/reconnect_test.py"
    ];
};

acloud_pull = python_library_host {
    name = "acloud_pull";
    defaults = ["acloud_default"];
    srcs = [
        "pull/__init__.py"
        "pull/pull.py"
        "pull/pull_args.py"
        "pull/pull_test.py"
    ];
};

acloud_metrics = python_library_host {
    name = "acloud_metrics";
    defaults = ["acloud_default"];
    srcs = [
        "metrics/__init__.py"
        "metrics/metrics.py"
    ];
    libs = [
        "asuite_cc_client"
        "asuite_metrics"
    ];
};

in { inherit acloud acloud_create acloud_default acloud_delete acloud_internal acloud_list acloud_metrics acloud_proto acloud_public acloud_pull acloud_reconnect acloud_setup acloud_test; }
