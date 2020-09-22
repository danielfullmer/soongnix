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

"com.android.overlaytest.overlay.pem" = genrule {
    name = "com.android.overlaytest.overlay.pem";
    out = ["com.android.overlaytest.overlay.pem"];
    cmd = "openssl genrsa -out $(out) 4096";
};

"com.android.overlaytest.overlay.pubkey" = genrule {
    name = "com.android.overlaytest.overlay.pubkey";
    srcs = [":com.android.overlaytest.overlay.pem"];
    out = ["com.android.overlaytest.overlay.pubkey"];
    tools = ["avbtool"];
    cmd = "$(location avbtool) extract_public_key --key $(in) --output $(out)";
};

"com.android.overlaytest.overlay.key" = apex_key {
    name = "com.android.overlaytest.overlay.key";
    public_key = ":com.android.overlaytest.overlay.pubkey";
    private_key = ":com.android.overlaytest.overlay.pem";
};

"com.android.overlaytest.overlay" = apex {
    name = "com.android.overlaytest.overlay";
    manifest = "manifest.json";
    file_contexts = ":apex.test-file_contexts";
    key = "com.android.overlaytest.overlay.key";
    apps = ["OverlayRemountedTest_Overlay"];
    installable = false;
};

in { inherit "com.android.overlaytest.overlay" "com.android.overlaytest.overlay.key" "com.android.overlaytest.overlay.pem" "com.android.overlaytest.overlay.pubkey"; }