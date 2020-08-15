{ java_library_host }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

jdiff = java_library_host {
    name = "jdiff";
    srcs = [
        "src/jdiff/API.java"
        "src/jdiff/APIComparator.java"
        "src/jdiff/APIDiff.java"
        "src/jdiff/APIHandler.java"
        "src/jdiff/ClassAPI.java"
        "src/jdiff/ClassDiff.java"
        "src/jdiff/Comments.java"
        "src/jdiff/CommentsHandler.java"
        "src/jdiff/CompareClassPdiffs.java"
        "src/jdiff/ComparePkgPdiffs.java"
        "src/jdiff/ConstructorAPI.java"
        "src/jdiff/Diff.java"
        "src/jdiff/DiffMyers.java"
        "src/jdiff/DiffOutput.java"
        "src/jdiff/FieldAPI.java"
        "src/jdiff/HTMLFiles.java"
        "src/jdiff/HTMLIndexes.java"
        "src/jdiff/HTMLReportGenerator.java"
        "src/jdiff/HTMLStatistics.java"
        "src/jdiff/JDiff.java"
        "src/jdiff/MemberDiff.java"
        "src/jdiff/MergeChanges.java"
        "src/jdiff/MethodAPI.java"
        "src/jdiff/Modifiers.java"
        "src/jdiff/Options.java"
        "src/jdiff/PackageAPI.java"
        "src/jdiff/PackageDiff.java"
        "src/jdiff/ParamAPI.java"
        "src/jdiff/RootDocToXML.java"
        "src/jdiff/SingleComment.java"
        "src/jdiff/StreamReader.java"
        "src/jdiff/XMLToAPI.java"
    ];

    use_tools_jar = true;
};

in { inherit jdiff; }
