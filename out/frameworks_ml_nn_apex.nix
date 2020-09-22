{ android_app_certificate, apex, apex_defaults, apex_key, filegroup }:
let

/*
 * Copyright 2019 The Android Open Source Project
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

"com.android.neuralnetworks.key" = apex_key {
    name = "com.android.neuralnetworks.key";
    public_key = "com.android.neuralnetworks.avbpubkey";
    private_key = "com.android.neuralnetworks.pem";
};

"com.android.neuralnetworks.certificate" = android_app_certificate {
    name = "com.android.neuralnetworks.certificate";
    certificate = "com.android.neuralnetworks";
};

"com.android.neuralnetworks-androidManifest" = filegroup {
    name = "com.android.neuralnetworks-androidManifest";
    srcs = ["AndroidManifest.xml"];
};

"com.android.neuralnetworks-defaults" = apex_defaults {
    name = "com.android.neuralnetworks-defaults";
    updatable = true;
    min_sdk_version = "R";
    androidManifest = ":com.android.neuralnetworks-androidManifest";
    native_shared_libs = ["libneuralnetworks"];
    compile_multilib = "both";
    key = "com.android.neuralnetworks.key";
    certificate = ":com.android.neuralnetworks.certificate";
};

"com.android.neuralnetworks" = apex {
    name = "com.android.neuralnetworks";
    defaults = ["com.android.neuralnetworks-defaults"];
    manifest = "manifest.json";
};

in { inherit "com.android.neuralnetworks" "com.android.neuralnetworks-androidManifest" "com.android.neuralnetworks-defaults" "com.android.neuralnetworks.certificate" "com.android.neuralnetworks.key"; }
