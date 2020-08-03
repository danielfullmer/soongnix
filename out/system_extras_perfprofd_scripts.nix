{ python_binary_host, python_defaults }:
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

perfprofd_python_default = python_defaults {
    name = "perfprofd_python_default";
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

perf_proto_stack = python_binary_host {
    name = "perf_proto_stack";
    defaults = ["perfprofd_python_default"];
    main = "perf_proto_stack.py";
    srcs = [
        "perf_proto_stack.py"
        "sorted_collection.py"
        ":quipper_data_proto"
        ":perfprofd_record_proto"
    ];
    libs = [
        "python-symbol"
        #  Soong won't add "libprotobuf-python" to the dependencies if
        #  filegroup contains .proto files. So add it here explicitly.
        "libprotobuf-python"
    ];
    proto = {
        canonical_path_from_root = false;
        include_dirs = ["external/perf_data_converter/src/quipper"];
    };
    required = ["unwind_symbols"];
};

perf_proto_json2sqlite = python_binary_host {
    name = "perf_proto_json2sqlite";
    defaults = ["perfprofd_python_default"];
    main = "perf_proto_json2sqlite.py";
    srcs = [
        "perf_proto_json2sqlite.py"
    ];
};

perf_proto_flames = python_binary_host {
    name = "perf_proto_flames";
    defaults = ["perfprofd_python_default"];
    main = "perf_proto_stack_sqlite_flame.py";
    srcs = [
        "perf_proto_stack_sqlite_flame.py"
    ];
    libs = [
        "simpleperf-inferno"
    ];
};

perf_config_proto = python_binary_host {
    name = "perf_config_proto";
    defaults = ["perfprofd_python_default"];
    main = "perf_config_proto.py";
    srcs = [
        "perf_config_proto.py"
        ":perfprofd_config_proto"
    ];
    libs = [
        #  Soong won't add "libprotobuf-python" to the dependencies if
        #  filegroup contains .proto files. So add it here explicitly.
        "libprotobuf-python"
    ];
    proto = {
        canonical_path_from_root = false;
    };
};

in { inherit perf_config_proto perf_proto_flames perf_proto_json2sqlite perf_proto_stack perfprofd_python_default; }
