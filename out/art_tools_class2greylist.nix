{ java_binary_host, java_library_host }:
let

#
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
#

class2greylistlib = java_library_host {
    name = "class2greylistlib";
    srcs = [
        "src/com/android/class2greylist/AnnotatedClassContext.java"
        "src/com/android/class2greylist/AnnotatedMemberContext.java"
        "src/com/android/class2greylist/AnnotationConsumer.java"
        "src/com/android/class2greylist/AnnotationContext.java"
        "src/com/android/class2greylist/AnnotationHandler.java"
        "src/com/android/class2greylist/AnnotationPropertyWriter.java"
        "src/com/android/class2greylist/AnnotationVisitor.java"
        "src/com/android/class2greylist/Class2Greylist.java"
        "src/com/android/class2greylist/CovariantReturnTypeHandler.java"
        "src/com/android/class2greylist/HiddenapiFlagsWriter.java"
        "src/com/android/class2greylist/JarReader.java"
        "src/com/android/class2greylist/MemberDumpingVisitor.java"
        "src/com/android/class2greylist/RepeatedAnnotationHandler.java"
        "src/com/android/class2greylist/Status.java"
        "src/com/android/class2greylist/UnsupportedAppUsageAnnotationHandler.java"
    ];
    static_libs = [
        "commons-cli-1.2"
        "apache-bcel"
        "guava"
    ];
};

class2greylist = java_binary_host {
    name = "class2greylist";
    manifest = "src/class2greylist.mf";
    static_libs = [
        "class2greylistlib"
    ];
};

in { inherit class2greylist class2greylistlib; }
