{ java_library_host }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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
#

# #############################################################

libcore-compare-upstreams = java_library_host {
    name = "libcore-compare-upstreams";
    srcs = [
        "src/main/java/libcore/CompareUpstreams.java"
        "src/main/java/libcore/CopyUpstreamFiles.java"
        "src/main/java/libcore/Lines.java"
        "src/main/java/libcore/Repository.java"
        "src/main/java/libcore/StandardRepositories.java"
        "src/main/java/libcore/Util.java"
    ];
    manifest = "src/main/libcore-compare-upstreams.mf";
};

# #############################################################

libcore-copy-upstream-files = java_library_host {
    name = "libcore-copy-upstream-files";
    srcs = [
        "src/main/java/libcore/CompareUpstreams.java"
        "src/main/java/libcore/CopyUpstreamFiles.java"
        "src/main/java/libcore/Lines.java"
        "src/main/java/libcore/Repository.java"
        "src/main/java/libcore/StandardRepositories.java"
        "src/main/java/libcore/Util.java"
    ];
    manifest = "src/main/libcore-copy-upstream-files.mf";
};

in { inherit libcore-compare-upstreams libcore-copy-upstream-files; }
