{ droiddoc_exported_dir, java_library_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

droiddoc-templates-sdk = droiddoc_exported_dir {
    name = "droiddoc-templates-sdk";
    path = "res/assets/templates-sdk";
};

doclava = java_library_host {
    name = "doclava";
    srcs = [
        "src/**/*.java"
    ];
    static_libs = [
        "jsilver"
        "guava"
        "antlr-runtime"
        "tagsoup"
    ];
    use_tools_jar = true;
    java_resource_dirs = ["res"];
};

doclava-no-guava = java_library_host {
    name = "doclava-no-guava";
    srcs = [
        "src/**/*.java"
    ];
    libs = [
        "guava"
    ];
    static_libs = [
        "jsilver"
        "antlr-runtime"
        "tagsoup"
    ];
    use_tools_jar = true;
    java_resource_dirs = ["res"];
};

#  TODO: add a test target.
#  For now, you can run the unit tests thus:
#  vogar --classpath /usr/lib/jvm/java-6-sun/lib/tools.jar --classpath ../../out/host/common/obj/JAVA_LIBRARIES/antlr_intermediates/javalib.jar --sourcepath src/ --sourcepath ../jsilver/src/ --mode jvm test/doclava/ApiCheckTest.java

in { inherit doclava doclava-no-guava droiddoc-templates-sdk; }
