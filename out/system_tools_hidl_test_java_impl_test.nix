{ java_genrule, java_library }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

hidl_java_impl_test_gen = java_genrule {
    name = "hidl_java_impl_test_gen";
    tools = [
        "hidl-gen"
    ];
    required = [
        "android.hardware.tests.baz-V1.0-java"
    ];
    cmd = "$(location hidl-gen) -o $(genDir) -Ljava-impl android.hardware.tests.baz@1.0";
    out = [
        "Base.java"
    ];
};

hidl_java_impl_test = java_library {
    name = "hidl_java_impl_test";
    srcs = [
        ":hidl_java_impl_test_gen"
    ];
    static_libs = [
        "android.hardware.tests.baz-V1.0-java"
    ];
};

in { inherit hidl_java_impl_test hidl_java_impl_test_gen; }
