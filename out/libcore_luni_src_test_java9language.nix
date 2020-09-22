{ filegroup, genrule, java_library }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

#  Android tests related to Java 9 language features.

#  Use jarjar to repackage Java9LanguageFeatures, to be used in tests below.
core-java-9-language-features-repackaged-for-test = java_library {
    name = "core-java-9-language-features-repackaged-for-test";
    hostdex = true;

    srcs = [":core-java-9-language-features-source"];
    jarjar_rules = "jarjar_rules_java9_language_features.txt";
    java_version = "1.9";

    sdk_version = "none";
    system_modules = "core-all-system-modules";
    patch_module = "java.base";

    visibility = ["//visibility:private"];
};

#  Generate a clone of Java9LanguageFeaturesTest which uses a version of
#  Java9LanguageFeatures repackaged by jarjar. This ensures that jarjar is able
#  to handle a class file which must be at least v53 and includes bytecode
#  compiled from Java 9 language features.
core-rewrite-test-for-jarjar-sed-script = filegroup {
    name = "core-rewrite-test-for-jarjar-sed-script";
    srcs = ["rewrite-test-for-jarjar.sed"];
    visibility = ["//visibility:private"];
};

core-java-9-language-features-test-src = filegroup {
    name = "core-java-9-language-features-test-src";
    srcs = ["java/libcore/libcore/internal/Java9LanguageFeaturesTest.java"];
    visibility = ["//visibility:private"];
};

core-gen-test-repackaged-java-9-language-features = genrule {
    name = "core-gen-test-repackaged-java-9-language-features";
    srcs = [
        ":core-rewrite-test-for-jarjar-sed-script"
        ":core-java-9-language-features-test-src"
    ];
    out = ["libcore/libcore/internal/Java9LanguageFeaturesJarjarTest.java"];
    cmd = "sed -r -f $(location :core-rewrite-test-for-jarjar-sed-script) $(location :core-java-9-language-features-test-src) > $(out)";
    visibility = ["//visibility:private"];
};

core-java-9-language-tests = java_library {
    name = "core-java-9-language-tests";
    hostdex = true;
    srcs = [
        "java/libcore/libcore/internal/Java9LanguageFeaturesTest.java"
        ":core-gen-test-repackaged-java-9-language-features"
    ];
    sdk_version = "none";
    system_modules = "core-all-system-modules";
    static_libs = [
        "core-java-9-language-features-repackaged-for-test"
        "junit"
    ];
    visibility = ["//libcore"];
};

in { inherit core-gen-test-repackaged-java-9-language-features core-java-9-language-features-repackaged-for-test core-java-9-language-features-test-src core-java-9-language-tests core-rewrite-test-for-jarjar-sed-script; }
