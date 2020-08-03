{ python_binary_host, python_test_host }:
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

minijail_compile_seccomp_policy = python_binary_host {
    name = "minijail_compile_seccomp_policy";
    main = "compile_seccomp_policy.py";
    srcs = [
        "arch.py"
        "bpf.py"
        "compile_seccomp_policy.py"
        "compiler.py"
        "parser.py"
    ];
    version = {
        py2 = {
            enabled = false;
        };
        py3 = {
            enabled = true;
        };
    };
};

minijail_parser_unittest = python_test_host {
    name = "minijail_parser_unittest";
    main = "parser_unittest.py";
    srcs = [
        "arch.py"
        "bpf.py"
        "parser.py"
        "parser_unittest.py"
    ];
    data = [
        "testdata/arch_64.json"
    ];
    version = {
        py2 = {
            enabled = false;
        };
        py3 = {
            enabled = true;
        };
    };
};

minijail_compiler_unittest = python_test_host {
    name = "minijail_compiler_unittest";
    main = "compiler_unittest.py";
    srcs = [
        "arch.py"
        "bpf.py"
        "compiler.py"
        "compiler_unittest.py"
        "parser.py"
    ];
    data = [
        "testdata/arch_64.json"
    ];
    version = {
        py2 = {
            enabled = false;
        };
        py3 = {
            enabled = true;
        };
    };
};

in { inherit minijail_compile_seccomp_policy minijail_compiler_unittest minijail_parser_unittest; }
