{ java_library }:
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
#
#

easymock = java_library {
    name = "easymock";
    host_supported = true;
    srcs = [
        "src/org/easymock/AbstractMatcher.java"
        "src/org/easymock/ArgumentsMatcher.java"
        "src/org/easymock/Capture.java"
        "src/org/easymock/CaptureType.java"
        "src/org/easymock/EasyMock.java"
        "src/org/easymock/EasyMockSupport.java"
        "src/org/easymock/IAnswer.java"
        "src/org/easymock/IArgumentMatcher.java"
        "src/org/easymock/IExpectationSetters.java"
        "src/org/easymock/IMocksControl.java"
        "src/org/easymock/LogicalOperator.java"
        "src/org/easymock/MockControl.java"
        "src/org/easymock/internal/AlwaysMatcher.java"
        "src/org/easymock/internal/ArgumentToString.java"
        "src/org/easymock/internal/ArrayMatcher.java"
        "src/org/easymock/internal/AssertionErrorWrapper.java"
        "src/org/easymock/internal/EasyMockProperties.java"
        "src/org/easymock/internal/EqualsMatcher.java"
        "src/org/easymock/internal/ErrorMessage.java"
        "src/org/easymock/internal/ExpectedInvocation.java"
        "src/org/easymock/internal/ExpectedInvocationAndResult.java"
        "src/org/easymock/internal/ExpectedInvocationAndResults.java"
        "src/org/easymock/internal/ILegacyMatcherMethods.java"
        "src/org/easymock/internal/ILegacyMethods.java"
        "src/org/easymock/internal/IMocksBehavior.java"
        "src/org/easymock/internal/IMocksControlState.java"
        "src/org/easymock/internal/IProxyFactory.java"
        "src/org/easymock/internal/Invocation.java"
        "src/org/easymock/internal/JavaProxyFactory.java"
        "src/org/easymock/internal/LastControl.java"
        "src/org/easymock/internal/LegacyMatcherProvider.java"
        "src/org/easymock/internal/MethodSerializationWrapper.java"
        "src/org/easymock/internal/MockInvocationHandler.java"
        "src/org/easymock/internal/MocksBehavior.java"
        "src/org/easymock/internal/MocksControl.java"
        "src/org/easymock/internal/ObjectMethodsFilter.java"
        "src/org/easymock/internal/Range.java"
        "src/org/easymock/internal/RecordState.java"
        "src/org/easymock/internal/ReplayState.java"
        "src/org/easymock/internal/Result.java"
        "src/org/easymock/internal/Results.java"
        "src/org/easymock/internal/RuntimeExceptionWrapper.java"
        "src/org/easymock/internal/ThrowableWrapper.java"
        "src/org/easymock/internal/UnorderedBehavior.java"
        "src/org/easymock/internal/matchers/And.java"
        "src/org/easymock/internal/matchers/Any.java"
        "src/org/easymock/internal/matchers/ArrayEquals.java"
        "src/org/easymock/internal/matchers/Captures.java"
        "src/org/easymock/internal/matchers/Compare.java"
        "src/org/easymock/internal/matchers/CompareEqual.java"
        "src/org/easymock/internal/matchers/CompareTo.java"
        "src/org/easymock/internal/matchers/Contains.java"
        "src/org/easymock/internal/matchers/EndsWith.java"
        "src/org/easymock/internal/matchers/Equals.java"
        "src/org/easymock/internal/matchers/EqualsWithDelta.java"
        "src/org/easymock/internal/matchers/Find.java"
        "src/org/easymock/internal/matchers/GreaterOrEqual.java"
        "src/org/easymock/internal/matchers/GreaterThan.java"
        "src/org/easymock/internal/matchers/InstanceOf.java"
        "src/org/easymock/internal/matchers/LessOrEqual.java"
        "src/org/easymock/internal/matchers/LessThan.java"
        "src/org/easymock/internal/matchers/Matches.java"
        "src/org/easymock/internal/matchers/Not.java"
        "src/org/easymock/internal/matchers/NotNull.java"
        "src/org/easymock/internal/matchers/Null.java"
        "src/org/easymock/internal/matchers/Or.java"
        "src/org/easymock/internal/matchers/Same.java"
        "src/org/easymock/internal/matchers/StartsWith.java"
    ];
    sdk_version = "9";
};

easymocklib = java_library {
    name = "easymocklib";
    static_libs = ["easymock"];
    sdk_version = "9";
};

in { inherit easymock easymocklib; }
