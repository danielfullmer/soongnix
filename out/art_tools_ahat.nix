{ droiddoc_host, java_library_host }:
let

#  Copyright 2018 Google Inc. All rights reserved.
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

ahat-docs = droiddoc_host {
    name = "ahat-docs";
    srcs = [
        "src/main/**/*.java"
    ];
    custom_template = "droiddoc-templates-sdk";
    args = "-stubpackages com.android.ahat:com.android.ahat.*";
    api_tag_name = "AHAT";
    api_filename = "ahat_api.txt";
    removed_api_filename = "ahat_removed_api.txt";
    check_api = {
        current = {
            api_file = "etc/ahat_api.txt";
            removed_api_file = "etc/ahat_removed_api.txt";
        };
    };
};

#  --- ahat.jar ----------------
ahat = java_library_host {
    name = "ahat";
    srcs = ["src/main/**/*.java"];
    manifest = "etc/ahat.mf";
    java_resources = ["etc/style.css"];
    javacflags = ["-Xdoclint:all/protected"];
};

in { inherit ahat ahat-docs; }
