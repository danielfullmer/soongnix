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
        "acloud_metrics"
        "acloud_proto"
        "acloud_public"
        "acloud_setup"
        "py-apitools"
        "py-dateutil"
        "py-google-api-python-client"
        "py-oauth2client"
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
        "public/*_test.py"
        "public/actions/*_test.py"
        "internal/lib/*_test.py"
        "metrics/*.py"
    ];
    libs = [
        "acloud_create"
        "acloud_delete"
        "acloud_reconnect"
        "acloud_internal"
        "acloud_list"
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
        "public/*.py"
        "public/actions/*.py"
    ];
    exclude_srcs = [
        "public/*_test.py"
        "public/actions/*_test.py"
        "public/acloud_main.py"
    ];
};

acloud_internal = python_library_host {
    name = "acloud_internal";
    defaults = ["acloud_default"];
    srcs = [
        "internal/*.py"
        "internal/lib/*.py"
    ];
    exclude_srcs = [
        "internal/lib/*_test.py"
    ];
};

acloud_proto = python_library_host {
    name = "acloud_proto";
    defaults = ["acloud_default"];
    srcs = [
        "internal/proto/*.proto"
    ];
    proto = {
        canonical_path_from_root = false;
    };
};

acloud_setup = python_library_host {
    name = "acloud_setup";
    defaults = ["acloud_default"];
    srcs = [
        "setup/*.py"
    ];
    exclude_srcs = [
        "setup/*_test.py"
    ];
};

acloud_create = python_library_host {
    name = "acloud_create";
    defaults = ["acloud_default"];
    srcs = [
        "create/*.py"
    ];
};

acloud_delete = python_library_host {
    name = "acloud_delete";
    defaults = ["acloud_default"];
    srcs = [
        "delete/*.py"
    ];
};

acloud_list = python_library_host {
    name = "acloud_list";
    defaults = ["acloud_default"];
    srcs = [
        "list/*.py"
    ];
};

acloud_reconnect = python_library_host {
    name = "acloud_reconnect";
    defaults = ["acloud_default"];
    srcs = [
        "reconnect/*.py"
    ];
};

acloud_metrics = python_library_host {
    name = "acloud_metrics";
    defaults = ["acloud_default"];
    srcs = [
        "metrics/*.py"
    ];
    libs = [
        "asuite_cc_client"
        "asuite_metrics"
    ];
};

in { inherit acloud acloud_create acloud_default acloud_delete acloud_internal acloud_list acloud_metrics acloud_proto acloud_public acloud_reconnect acloud_setup acloud_test; }
