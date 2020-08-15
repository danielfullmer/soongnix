{ python_library }:
let

#  Copyright 2018 Google Inc. All rights reserved.
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
py-apitools = python_library {
    name = "py-apitools";
    host_supported = true;
    srcs = [
        "__init__.py"
        "base/__init__.py"
        "base/py/__init__.py"
        "base/py/app2.py"
        "base/py/base_api.py"
        "base/py/base_api_test.py"
        "base/py/base_cli.py"
        "base/py/batch.py"
        "base/py/batch_test.py"
        "base/py/buffered_stream.py"
        "base/py/buffered_stream_test.py"
        "base/py/cli.py"
        "base/py/credentials_lib.py"
        "base/py/credentials_lib_test.py"
        "base/py/encoding.py"
        "base/py/encoding_test.py"
        "base/py/exceptions.py"
        "base/py/extra_types.py"
        "base/py/extra_types_test.py"
        "base/py/http_wrapper.py"
        "base/py/http_wrapper_test.py"
        "base/py/list_pager.py"
        "base/py/list_pager_test.py"
        "base/py/stream_slice.py"
        "base/py/stream_slice_test.py"
        "base/py/transfer.py"
        "base/py/transfer_test.py"
        "base/py/util.py"
        "base/py/util_test.py"
        "gen/__init__.py"
        "gen/client_generation_test.py"
        "gen/command_registry.py"
        "gen/extended_descriptor.py"
        "gen/gen_client.py"
        "gen/gen_client_lib.py"
        "gen/gen_client_test.py"
        "gen/message_registry.py"
        "gen/service_registry.py"
        "gen/test_utils.py"
        "gen/util.py"
        "gen/util_test.py"
        "scripts/__init__.py"
        "scripts/oauth2l.py"
        "scripts/oauth2l_test.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    libs = [
        "py-httplib2"
        "py-oauth2client"
        "py-six"
    ];
    pkg_path = "apitools";
};

in { inherit py-apitools; }
