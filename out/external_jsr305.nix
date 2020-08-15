{ java_library_host, java_library_static }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

jsr305 = java_library_static {
    name = "jsr305";
    host_supported = true;
    hostdex = true;
    sdk_version = "core_current";
    srcs = [
        "ri/src/main/java/javax/annotation/CheckForNull.java"
        "ri/src/main/java/javax/annotation/CheckForSigned.java"
        "ri/src/main/java/javax/annotation/CheckReturnValue.java"
        "ri/src/main/java/javax/annotation/Detainted.java"
        "ri/src/main/java/javax/annotation/MatchesPattern.java"
        "ri/src/main/java/javax/annotation/Nonnegative.java"
        "ri/src/main/java/javax/annotation/Nonnull.java"
        "ri/src/main/java/javax/annotation/Nullable.java"
        "ri/src/main/java/javax/annotation/OverridingMethodsMustInvokeSuper.java"
        "ri/src/main/java/javax/annotation/ParametersAreNonnullByDefault.java"
        "ri/src/main/java/javax/annotation/ParametersAreNullableByDefault.java"
        "ri/src/main/java/javax/annotation/PropertyKey.java"
        "ri/src/main/java/javax/annotation/RegEx.java"
        "ri/src/main/java/javax/annotation/Signed.java"
        "ri/src/main/java/javax/annotation/Syntax.java"
        "ri/src/main/java/javax/annotation/Tainted.java"
        "ri/src/main/java/javax/annotation/Untainted.java"
        "ri/src/main/java/javax/annotation/WillClose.java"
        "ri/src/main/java/javax/annotation/WillCloseWhenClosed.java"
        "ri/src/main/java/javax/annotation/WillNotClose.java"
        "ri/src/main/java/javax/annotation/concurrent/GuardedBy.java"
        "ri/src/main/java/javax/annotation/concurrent/Immutable.java"
        "ri/src/main/java/javax/annotation/concurrent/NotThreadSafe.java"
        "ri/src/main/java/javax/annotation/concurrent/ThreadSafe.java"
        "ri/src/main/java/javax/annotation/meta/Exclusive.java"
        "ri/src/main/java/javax/annotation/meta/Exhaustive.java"
        "ri/src/main/java/javax/annotation/meta/TypeQualifier.java"
        "ri/src/main/java/javax/annotation/meta/TypeQualifierDefault.java"
        "ri/src/main/java/javax/annotation/meta/TypeQualifierNickname.java"
        "ri/src/main/java/javax/annotation/meta/TypeQualifierValidator.java"
        "ri/src/main/java/javax/annotation/meta/When.java"
    ];
};

#  Compatibility name
jsr305lib = java_library_host {
    name = "jsr305lib";
    static_libs = ["jsr305"];
};

in { inherit jsr305 jsr305lib; }
