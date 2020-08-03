{ cc_library_static, cc_test }:
let

/*
 * Copyright 2017 The Android Open Source Project
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

#  Adapted in part from frameworks/native/opengl/libs/Android.bp

BlobCache_test = cc_test {
    name = "BlobCache_test";
    host_supported = true;
    defaults = ["ml_nn_cache_libs_defaults_android_host"];
    srcs = [
        "BlobCache.cpp"
        "BlobCache_test.cpp"
    ];
};

libBlobCache = cc_library_static {
    name = "libBlobCache";
    defaults = ["ml_nn_cache_libs_defaults_android_host"];
    srcs = ["BlobCache.cpp"];
    export_include_dirs = ["."];
};

in { inherit BlobCache_test libBlobCache; }
