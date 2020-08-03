{ cc_binary }:
let

/*
 * Copyright 2018 The Android Open Source Project
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

ion_watcher = cc_binary {
    name = "ion_watcher";
    srcs = [
        "ion_watcher.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "libutils"
    ];
};

in { inherit ion_watcher; }
