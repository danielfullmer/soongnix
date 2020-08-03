{ apex }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

"test_com.android.media" = apex {
    name = "test_com.android.media";
    manifest = "test_manifest.json";
    file_contexts = "com.android.media";
    defaults = ["com.android.media-defaults"];
    installable = false;
};

"test_com.android.media.swcodec" = apex {
    name = "test_com.android.media.swcodec";
    manifest = "test_manifest_codec.json";
    file_contexts = "com.android.media.swcodec";
    defaults = ["com.android.media.swcodec-defaults"];
    installable = false;
};

in { inherit "test_com.android.media" "test_com.android.media.swcodec"; }
