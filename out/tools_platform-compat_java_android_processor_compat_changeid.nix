{ java_library_host, java_plugin }:
let

/*
 * Copyright (C) 2020 The Android Open Source Project
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

compat-changeid-annotation-processor-lib = java_library_host {
    name = "compat-changeid-annotation-processor-lib";

    srcs = [
        "Change.java"
        "ChangeIdProcessor.java"
        "XmlWriter.java"
    ];

    static_libs = [
        "guava"
        "//tools/platform-compat/java/android/processor/compat:compat-processor"
    ];

    openjdk9 = {
        javacflags = [
            "--add-modules=jdk.compiler"
            "--add-exports jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED"
            "--add-exports jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED"
            "--add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED"
            "--add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED"
        ];
    };

    visibility = ["//tools/platform-compat/javatest/android/processor/compat/changeid:__subpackages__"];
};

compat-changeid-annotation-processor = java_plugin {
    name = "compat-changeid-annotation-processor";
    processor_class = "android.processor.compat.changeid.ChangeIdProcessor";

    java_resources = [
        "META-INF/**/*"
    ];

    static_libs = [
        "compat-changeid-annotation-processor-lib"
    ];
    installable = false;

    use_tools_jar = true;

    visibility = [
        "//libcore:__pkg__"
        "//tools/platform-compat/java/android/compat/annotation:__subpackages__"
    ];
};

in { inherit compat-changeid-annotation-processor compat-changeid-annotation-processor-lib; }
