{ java_library_host }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

antlr-runtime = java_library_host {
    name = "antlr-runtime";
    srcs = ["runtime/Java/src/main/java/**/*.java"];
    # Remove DOTTreeGenerator.java, so that we don't have the StringTemplate library as a dependency
    exclude_srcs = ["runtime/Java/src/main/java/org/antlr/runtime/tree/DOTTreeGenerator.java"];
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"]; #  b/73499927
    };
};

in { inherit antlr-runtime; }
