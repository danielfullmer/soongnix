{ java_library_static }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

hamcrest-library = java_library_static {
    name = "hamcrest-library";
    host_supported = true;
    srcs = [
        "src/main/java/org/hamcrest/Matchers.java"
        "src/main/java/org/hamcrest/collection/IsArray.java"
        "src/main/java/org/hamcrest/collection/IsArrayContaining.java"
        "src/main/java/org/hamcrest/collection/IsArrayContainingInAnyOrder.java"
        "src/main/java/org/hamcrest/collection/IsArrayContainingInOrder.java"
        "src/main/java/org/hamcrest/collection/IsArrayWithSize.java"
        "src/main/java/org/hamcrest/collection/IsCollectionWithSize.java"
        "src/main/java/org/hamcrest/collection/IsEmptyCollection.java"
        "src/main/java/org/hamcrest/collection/IsEmptyIterable.java"
        "src/main/java/org/hamcrest/collection/IsIn.java"
        "src/main/java/org/hamcrest/collection/IsIterableContainingInAnyOrder.java"
        "src/main/java/org/hamcrest/collection/IsIterableContainingInOrder.java"
        "src/main/java/org/hamcrest/collection/IsIterableContainingInRelativeOrder.java"
        "src/main/java/org/hamcrest/collection/IsIterableWithSize.java"
        "src/main/java/org/hamcrest/collection/IsMapContaining.java"
        "src/main/java/org/hamcrest/collection/IsMapWithSize.java"
        "src/main/java/org/hamcrest/comparator/ComparatorMatcherBuilder.java"
        "src/main/java/org/hamcrest/io/FileMatchers.java"
        "src/main/java/org/hamcrest/number/BigDecimalCloseTo.java"
        "src/main/java/org/hamcrest/number/IsCloseTo.java"
        "src/main/java/org/hamcrest/number/IsNaN.java"
        "src/main/java/org/hamcrest/number/OrderingComparison.java"
        "src/main/java/org/hamcrest/object/HasToString.java"
        "src/main/java/org/hamcrest/object/IsCompatibleType.java"
        "src/main/java/org/hamcrest/object/IsEventFrom.java"
        "src/main/java/org/hamcrest/text/IsBlankString.java"
        "src/main/java/org/hamcrest/text/IsEmptyString.java"
        "src/main/java/org/hamcrest/text/IsEqualIgnoringCase.java"
        "src/main/java/org/hamcrest/text/IsEqualIgnoringWhiteSpace.java"
        "src/main/java/org/hamcrest/text/MatchesPattern.java"
        "src/main/java/org/hamcrest/text/StringContainsInOrder.java"
        "src/main/java/org/hamcrest/xml/HasXPath.java"
    ];

    libs = ["hamcrest"];
    sdk_version = "core_current";
};

in { inherit hamcrest-library; }
