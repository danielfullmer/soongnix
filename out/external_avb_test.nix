{ python_test_host }:
let

#
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
#

at_auth_unlock_unittest = python_test_host {
    name = "at_auth_unlock_unittest";
    main = "at_auth_unlock_unittest.py";
    srcs = [
        "at_auth_unlock_unittest.py"
    ];
    libs = [
        "at_auth_unlock"
    ];
    data = [
        "data/atx_pik_certificate.bin"
        "data/atx_puk_certificate.bin"
        "data/atx_unlock_challenge.bin"
        "data/atx_unlock_credential.bin"
        "data/testkey_atx_puk.pem"
    ];
    version = {
        py2 = {
            enabled = false;
        };
        py3 = {
            enabled = true;
        };
    };
    test_config = "at_auth_unlock_unittest.xml";
    test_suites = ["general-tests"];
};

in { inherit at_auth_unlock_unittest; }
