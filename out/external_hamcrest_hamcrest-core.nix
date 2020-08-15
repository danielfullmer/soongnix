{ java_library_static }:
let

#  Copyright (C) 2012 The Android Open Source Project
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
#

hamcrest = java_library_static {
    name = "hamcrest";
    host_supported = true;
    hostdex = true;
    srcs = [
        "src/main/java/org/hamcrest/BaseDescription.java"
        "src/main/java/org/hamcrest/BaseMatcher.java"
        "src/main/java/org/hamcrest/Condition.java"
        "src/main/java/org/hamcrest/CoreMatchers.java"
        "src/main/java/org/hamcrest/CustomMatcher.java"
        "src/main/java/org/hamcrest/CustomTypeSafeMatcher.java"
        "src/main/java/org/hamcrest/Description.java"
        "src/main/java/org/hamcrest/DiagnosingMatcher.java"
        "src/main/java/org/hamcrest/Factory.java"
        "src/main/java/org/hamcrest/FeatureMatcher.java"
        "src/main/java/org/hamcrest/Matcher.java"
        "src/main/java/org/hamcrest/MatcherAssert.java"
        "src/main/java/org/hamcrest/SelfDescribing.java"
        "src/main/java/org/hamcrest/StringDescription.java"
        "src/main/java/org/hamcrest/TypeSafeDiagnosingMatcher.java"
        "src/main/java/org/hamcrest/TypeSafeMatcher.java"
        "src/main/java/org/hamcrest/core/AllOf.java"
        "src/main/java/org/hamcrest/core/AnyOf.java"
        "src/main/java/org/hamcrest/core/CombinableMatcher.java"
        "src/main/java/org/hamcrest/core/DescribedAs.java"
        "src/main/java/org/hamcrest/core/Every.java"
        "src/main/java/org/hamcrest/core/Is.java"
        "src/main/java/org/hamcrest/core/IsAnything.java"
        "src/main/java/org/hamcrest/core/IsCollectionContaining.java"
        "src/main/java/org/hamcrest/core/IsEqual.java"
        "src/main/java/org/hamcrest/core/IsInstanceOf.java"
        "src/main/java/org/hamcrest/core/IsNot.java"
        "src/main/java/org/hamcrest/core/IsNull.java"
        "src/main/java/org/hamcrest/core/IsSame.java"
        "src/main/java/org/hamcrest/core/ShortcutCombination.java"
        "src/main/java/org/hamcrest/core/StringContains.java"
        "src/main/java/org/hamcrest/core/StringEndsWith.java"
        "src/main/java/org/hamcrest/core/StringStartsWith.java"
        "src/main/java/org/hamcrest/core/SubstringMatcher.java"
        "src/main/java/org/hamcrest/internal/ArrayIterator.java"
        "src/main/java/org/hamcrest/internal/NullSafety.java"
        "src/main/java/org/hamcrest/internal/ReflectiveTypeFinder.java"
        "src/main/java/org/hamcrest/internal/SelfDescribingValue.java"
        "src/main/java/org/hamcrest/internal/SelfDescribingValueIterator.java"
    ];
    sdk_version = "core_current";
};

in { inherit hamcrest; }
