{ cc_defaults, cc_library, cc_test }:
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

#  Simply '#include <fruit/fruit.h>' to get started.
#  See https://github.com/google/fruit/wiki for more details.
libfruit = cc_library {
    name = "libfruit";
    host_supported = true;
    export_include_dirs = [
        "include"
        "configuration/android"
    ];
    srcs = [
        "src/binding_normalization.cpp"
        "src/component.cpp"
        "src/demangle_type_name.cpp"
        "src/fixed_size_allocator.cpp"
        "src/injector_storage.cpp"
        "src/memory_pool.cpp"
        "src/normalized_component_storage.cpp"
        "src/normalized_component_storage_holder.cpp"
        "src/semistatic_graph.cpp"
        "src/semistatic_map.cpp"
    ];
};

#  TODO: tests written in python+pytest that calls back into compiler. unclear how to best proceed.

libfruit-example-defaults = cc_defaults {
    name = "libfruit-example-defaults";
    host_supported = true;
    gtest = false;
    shared_libs = ["libfruit"];
    cflags = ["-Wno-non-virtual-dtor"];
};

libfruit-example-hello-world = cc_test {
    defaults = ["libfruit-example-defaults"];
    name = "libfruit-example-hello-world";
    srcs = ["examples/hello_world/main.cpp"];
};

in { inherit libfruit libfruit-example-defaults libfruit-example-hello-world; }
