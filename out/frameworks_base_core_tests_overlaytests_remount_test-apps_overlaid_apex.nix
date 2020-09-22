{ apex, apex_key, genrule }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

"com.android.overlaytest.overlaid.pem" = genrule {
    name = "com.android.overlaytest.overlaid.pem";
    out = ["com.android.overlaytest.overlaid.pem"];
    cmd = "openssl genrsa -out $(out) 4096";
};

"com.android.overlaytest.overlaid.pubkey" = genrule {
    name = "com.android.overlaytest.overlaid.pubkey";
    srcs = [":com.android.overlaytest.overlaid.pem"];
    out = ["com.android.overlaytest.overlaid.pubkey"];
    tools = ["avbtool"];
    cmd = "$(location avbtool) extract_public_key --key $(in) --output $(out)";
};

"com.android.overlaytest.overlaid.key" = apex_key {
    name = "com.android.overlaytest.overlaid.key";
    public_key = ":com.android.overlaytest.overlaid.pubkey";
    private_key = ":com.android.overlaytest.overlaid.pem";
};

"com.android.overlaytest.overlaid" = apex {
    name = "com.android.overlaytest.overlaid";
    manifest = "manifest.json";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.overlaytest.overlaid.key";
    apps = ["OverlayRemountedTest_Target"];
    installable = false;
};

in { inherit "com.android.overlaytest.overlaid" "com.android.overlaytest.overlaid.key" "com.android.overlaytest.overlaid.pem" "com.android.overlaytest.overlaid.pubkey"; }
