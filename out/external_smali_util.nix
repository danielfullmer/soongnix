{ java_library_host }:
let

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

smali-util = java_library_host {
    name = "smali-util";
    srcs = [
        "src/main/java/org/jf/util/AbstractForwardSequentialList.java"
        "src/main/java/org/jf/util/AbstractListIterator.java"
        "src/main/java/org/jf/util/AlignmentUtils.java"
        "src/main/java/org/jf/util/ArraySortedSet.java"
        "src/main/java/org/jf/util/BitSetUtils.java"
        "src/main/java/org/jf/util/BlankReader.java"
        "src/main/java/org/jf/util/CharSequenceUtils.java"
        "src/main/java/org/jf/util/ClassFileNameHandler.java"
        "src/main/java/org/jf/util/CollectionUtils.java"
        "src/main/java/org/jf/util/ConsoleUtil.java"
        "src/main/java/org/jf/util/ExceptionWithContext.java"
        "src/main/java/org/jf/util/Hex.java"
        "src/main/java/org/jf/util/ImmutableConverter.java"
        "src/main/java/org/jf/util/ImmutableUtils.java"
        "src/main/java/org/jf/util/IndentingWriter.java"
        "src/main/java/org/jf/util/LinearSearch.java"
        "src/main/java/org/jf/util/NakedByteArrayOutputStream.java"
        "src/main/java/org/jf/util/NibbleUtils.java"
        "src/main/java/org/jf/util/NumberUtils.java"
        "src/main/java/org/jf/util/OldWrappedIndentingWriter.java"
        "src/main/java/org/jf/util/PathUtil.java"
        "src/main/java/org/jf/util/RandomAccessFileInputStream.java"
        "src/main/java/org/jf/util/RandomAccessFileOutputStream.java"
        "src/main/java/org/jf/util/SparseArray.java"
        "src/main/java/org/jf/util/SparseIntArray.java"
        "src/main/java/org/jf/util/StringUtils.java"
        "src/main/java/org/jf/util/StringWrapper.java"
        "src/main/java/org/jf/util/TextUtils.java"
        "src/main/java/org/jf/util/TwoColumnOutput.java"
        "src/main/java/org/jf/util/Utf8Utils.java"
        "src/main/java/org/jf/util/WrappedIndentingWriter.java"
        "src/main/java/org/jf/util/jcommander/ColonParameterSplitter.java"
        "src/main/java/org/jf/util/jcommander/Command.java"
        "src/main/java/org/jf/util/jcommander/ExtendedCommands.java"
        "src/main/java/org/jf/util/jcommander/ExtendedParameter.java"
        "src/main/java/org/jf/util/jcommander/ExtendedParameters.java"
        "src/main/java/org/jf/util/jcommander/HelpFormatter.java"
    ];
    libs = [
        "guava"
        "jcommander"
        "jsr305"
    ];
};

in { inherit smali-util; }
