{ java_import_host, java_library_host, java_library_static }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

#  Builds the Mockito source code, but does not include any run-time
#  dependencies. Most projects should use mockito-target instead, which includes
#  everything needed to run Mockito tests.
mockito = java_library_static {
    name = "mockito";
    host_supported = true;
    hostdex = true;
    srcs = [
        "src/main/java/org/mockito/AdditionalAnswers.java"
        "src/main/java/org/mockito/AdditionalMatchers.java"
        "src/main/java/org/mockito/Answers.java"
        "src/main/java/org/mockito/ArgumentCaptor.java"
        "src/main/java/org/mockito/ArgumentMatcher.java"
        "src/main/java/org/mockito/ArgumentMatchers.java"
        "src/main/java/org/mockito/BDDMockito.java"
        "src/main/java/org/mockito/Captor.java"
        "src/main/java/org/mockito/CheckReturnValue.java"
        "src/main/java/org/mockito/InOrder.java"
        "src/main/java/org/mockito/Incubating.java"
        "src/main/java/org/mockito/InjectMocks.java"
        "src/main/java/org/mockito/Matchers.java"
        "src/main/java/org/mockito/Mock.java"
        "src/main/java/org/mockito/MockSettings.java"
        "src/main/java/org/mockito/MockingDetails.java"
        "src/main/java/org/mockito/Mockito.java"
        "src/main/java/org/mockito/MockitoAnnotations.java"
        "src/main/java/org/mockito/MockitoDebugger.java"
        "src/main/java/org/mockito/MockitoFramework.java"
        "src/main/java/org/mockito/MockitoSession.java"
        "src/main/java/org/mockito/NotExtensible.java"
        "src/main/java/org/mockito/Spy.java"
        "src/main/java/org/mockito/package-info.java"
        "src/main/java/org/mockito/codegen/InjectionBase.java"
        "src/main/java/org/mockito/configuration/AnnotationEngine.java"
        "src/main/java/org/mockito/configuration/DefaultMockitoConfiguration.java"
        "src/main/java/org/mockito/configuration/IMockitoConfiguration.java"
        "src/main/java/org/mockito/configuration/package-info.java"
        "src/main/java/org/mockito/creation/instance/InstantiationException.java"
        "src/main/java/org/mockito/creation/instance/Instantiator.java"
        "src/main/java/org/mockito/exceptions/package-info.java"
        "src/main/java/org/mockito/exceptions/base/MockitoAssertionError.java"
        "src/main/java/org/mockito/exceptions/base/MockitoException.java"
        "src/main/java/org/mockito/exceptions/base/MockitoInitializationException.java"
        "src/main/java/org/mockito/exceptions/base/MockitoSerializationIssue.java"
        "src/main/java/org/mockito/exceptions/base/package-info.java"
        "src/main/java/org/mockito/exceptions/misusing/CannotStubVoidMethodWithReturnValue.java"
        "src/main/java/org/mockito/exceptions/misusing/CannotVerifyStubOnlyMock.java"
        "src/main/java/org/mockito/exceptions/misusing/FriendlyReminderException.java"
        "src/main/java/org/mockito/exceptions/misusing/InvalidUseOfMatchersException.java"
        "src/main/java/org/mockito/exceptions/misusing/MissingMethodInvocationException.java"
        "src/main/java/org/mockito/exceptions/misusing/MockitoConfigurationException.java"
        "src/main/java/org/mockito/exceptions/misusing/NotAMockException.java"
        "src/main/java/org/mockito/exceptions/misusing/NullInsteadOfMockException.java"
        "src/main/java/org/mockito/exceptions/misusing/PotentialStubbingProblem.java"
        "src/main/java/org/mockito/exceptions/misusing/RedundantListenerException.java"
        "src/main/java/org/mockito/exceptions/misusing/UnfinishedMockingSessionException.java"
        "src/main/java/org/mockito/exceptions/misusing/UnfinishedStubbingException.java"
        "src/main/java/org/mockito/exceptions/misusing/UnfinishedVerificationException.java"
        "src/main/java/org/mockito/exceptions/misusing/UnnecessaryStubbingException.java"
        "src/main/java/org/mockito/exceptions/misusing/WrongTypeOfReturnValue.java"
        "src/main/java/org/mockito/exceptions/misusing/package-info.java"
        "src/main/java/org/mockito/exceptions/stacktrace/StackTraceCleaner.java"
        "src/main/java/org/mockito/exceptions/stacktrace/package-info.java"
        "src/main/java/org/mockito/exceptions/verification/ArgumentsAreDifferent.java"
        "src/main/java/org/mockito/exceptions/verification/MoreThanAllowedActualInvocations.java"
        "src/main/java/org/mockito/exceptions/verification/NeverWantedButInvoked.java"
        "src/main/java/org/mockito/exceptions/verification/NoInteractionsWanted.java"
        "src/main/java/org/mockito/exceptions/verification/SmartNullPointerException.java"
        "src/main/java/org/mockito/exceptions/verification/TooLittleActualInvocations.java"
        "src/main/java/org/mockito/exceptions/verification/TooManyActualInvocations.java"
        "src/main/java/org/mockito/exceptions/verification/VerificationInOrderFailure.java"
        "src/main/java/org/mockito/exceptions/verification/WantedButNotInvoked.java"
        "src/main/java/org/mockito/exceptions/verification/package-info.java"
        "src/main/java/org/mockito/exceptions/verification/junit/ArgumentsAreDifferent.java"
        "src/main/java/org/mockito/exceptions/verification/junit/package-info.java"
        "src/main/java/org/mockito/hamcrest/MockitoHamcrest.java"
        "src/main/java/org/mockito/hamcrest/package-info.java"
        "src/main/java/org/mockito/internal/InOrderImpl.java"
        "src/main/java/org/mockito/internal/InternalMockHandler.java"
        "src/main/java/org/mockito/internal/MockitoCore.java"
        "src/main/java/org/mockito/internal/package-info.java"
        "src/main/java/org/mockito/internal/configuration/CaptorAnnotationProcessor.java"
        "src/main/java/org/mockito/internal/configuration/ClassPathLoader.java"
        "src/main/java/org/mockito/internal/configuration/DefaultInjectionEngine.java"
        "src/main/java/org/mockito/internal/configuration/FieldAnnotationProcessor.java"
        "src/main/java/org/mockito/internal/configuration/GlobalConfiguration.java"
        "src/main/java/org/mockito/internal/configuration/IndependentAnnotationEngine.java"
        "src/main/java/org/mockito/internal/configuration/InjectingAnnotationEngine.java"
        "src/main/java/org/mockito/internal/configuration/MockAnnotationProcessor.java"
        "src/main/java/org/mockito/internal/configuration/SpyAnnotationEngine.java"
        "src/main/java/org/mockito/internal/configuration/package-info.java"
        "src/main/java/org/mockito/internal/configuration/injection/ConstructorInjection.java"
        "src/main/java/org/mockito/internal/configuration/injection/MockInjection.java"
        "src/main/java/org/mockito/internal/configuration/injection/MockInjectionStrategy.java"
        "src/main/java/org/mockito/internal/configuration/injection/PropertyAndSetterInjection.java"
        "src/main/java/org/mockito/internal/configuration/injection/SpyOnInjectedFieldsHandler.java"
        "src/main/java/org/mockito/internal/configuration/injection/package-info.java"
        "src/main/java/org/mockito/internal/configuration/injection/filter/MockCandidateFilter.java"
        "src/main/java/org/mockito/internal/configuration/injection/filter/NameBasedCandidateFilter.java"
        "src/main/java/org/mockito/internal/configuration/injection/filter/OngoingInjector.java"
        "src/main/java/org/mockito/internal/configuration/injection/filter/TerminalMockCandidateFilter.java"
        "src/main/java/org/mockito/internal/configuration/injection/filter/TypeBasedCandidateFilter.java"
        "src/main/java/org/mockito/internal/configuration/injection/scanner/InjectMocksScanner.java"
        "src/main/java/org/mockito/internal/configuration/injection/scanner/MockScanner.java"
        "src/main/java/org/mockito/internal/configuration/plugins/DefaultMockitoPlugins.java"
        "src/main/java/org/mockito/internal/configuration/plugins/DefaultPluginSwitch.java"
        "src/main/java/org/mockito/internal/configuration/plugins/PluginFileReader.java"
        "src/main/java/org/mockito/internal/configuration/plugins/PluginFinder.java"
        "src/main/java/org/mockito/internal/configuration/plugins/PluginInitializer.java"
        "src/main/java/org/mockito/internal/configuration/plugins/PluginLoader.java"
        "src/main/java/org/mockito/internal/configuration/plugins/PluginRegistry.java"
        "src/main/java/org/mockito/internal/configuration/plugins/Plugins.java"
        "src/main/java/org/mockito/internal/configuration/plugins/package-info.java"
        "src/main/java/org/mockito/internal/creation/DelegatingMethod.java"
        "src/main/java/org/mockito/internal/creation/MockSettingsImpl.java"
        "src/main/java/org/mockito/internal/creation/SuspendMethod.java"
        "src/main/java/org/mockito/internal/creation/package-info.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/ByteBuddyCrossClassLoaderSerializationSupport.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/ByteBuddyMockMaker.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/BytecodeGenerator.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/ClassCreatingMockMaker.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/InlineByteBuddyMockMaker.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/InlineBytecodeGenerator.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/MockAccess.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/MockFeatures.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/MockMethodAdvice.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/MockMethodDispatcher.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/MockMethodInterceptor.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/SubclassByteBuddyMockMaker.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/SubclassBytecodeGenerator.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/SubclassInjectionLoader.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/SubclassLoader.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/TypeCachingBytecodeGenerator.java"
        "src/main/java/org/mockito/internal/creation/bytebuddy/package-info.java"
        "src/main/java/org/mockito/internal/creation/instance/ConstructorInstantiator.java"
        "src/main/java/org/mockito/internal/creation/instance/DefaultInstantiatorProvider.java"
        "src/main/java/org/mockito/internal/creation/instance/InstantiationException.java"
        "src/main/java/org/mockito/internal/creation/instance/Instantiator.java"
        "src/main/java/org/mockito/internal/creation/instance/InstantiatorProvider2Adapter.java"
        "src/main/java/org/mockito/internal/creation/instance/InstantiatorProviderAdapter.java"
        "src/main/java/org/mockito/internal/creation/instance/ObjenesisInstantiator.java"
        "src/main/java/org/mockito/internal/creation/settings/CreationSettings.java"
        "src/main/java/org/mockito/internal/creation/util/MockitoMethodProxy.java"
        "src/main/java/org/mockito/internal/creation/util/package-info.java"
        "src/main/java/org/mockito/internal/debugging/FindingsListener.java"
        "src/main/java/org/mockito/internal/debugging/InvocationsPrinter.java"
        "src/main/java/org/mockito/internal/debugging/Localized.java"
        "src/main/java/org/mockito/internal/debugging/LocationImpl.java"
        "src/main/java/org/mockito/internal/debugging/LoggingListener.java"
        "src/main/java/org/mockito/internal/debugging/MockitoDebuggerImpl.java"
        "src/main/java/org/mockito/internal/debugging/VerboseMockInvocationLogger.java"
        "src/main/java/org/mockito/internal/debugging/WarningsCollector.java"
        "src/main/java/org/mockito/internal/debugging/WarningsFinder.java"
        "src/main/java/org/mockito/internal/debugging/WarningsPrinterImpl.java"
        "src/main/java/org/mockito/internal/debugging/package-info.java"
        "src/main/java/org/mockito/internal/exceptions/ExceptionIncludingMockitoWarnings.java"
        "src/main/java/org/mockito/internal/exceptions/Reporter.java"
        "src/main/java/org/mockito/internal/exceptions/VerificationAwareInvocation.java"
        "src/main/java/org/mockito/internal/exceptions/stacktrace/ConditionalStackTraceFilter.java"
        "src/main/java/org/mockito/internal/exceptions/stacktrace/DefaultStackTraceCleaner.java"
        "src/main/java/org/mockito/internal/exceptions/stacktrace/DefaultStackTraceCleanerProvider.java"
        "src/main/java/org/mockito/internal/exceptions/stacktrace/StackTraceFilter.java"
        "src/main/java/org/mockito/internal/exceptions/stacktrace/package-info.java"
        "src/main/java/org/mockito/internal/exceptions/util/ScenarioPrinter.java"
        "src/main/java/org/mockito/internal/framework/DefaultMockitoFramework.java"
        "src/main/java/org/mockito/internal/framework/DefaultMockitoSession.java"
        "src/main/java/org/mockito/internal/hamcrest/HamcrestArgumentMatcher.java"
        "src/main/java/org/mockito/internal/hamcrest/MatcherGenericTypeExtractor.java"
        "src/main/java/org/mockito/internal/handler/InvocationNotifierHandler.java"
        "src/main/java/org/mockito/internal/handler/MockHandlerFactory.java"
        "src/main/java/org/mockito/internal/handler/MockHandlerImpl.java"
        "src/main/java/org/mockito/internal/handler/NotifiedMethodInvocationReport.java"
        "src/main/java/org/mockito/internal/handler/NullResultGuardian.java"
        "src/main/java/org/mockito/internal/invocation/AbstractAwareMethod.java"
        "src/main/java/org/mockito/internal/invocation/ArgumentMatcherAction.java"
        "src/main/java/org/mockito/internal/invocation/ArgumentsProcessor.java"
        "src/main/java/org/mockito/internal/invocation/DefaultInvocationFactory.java"
        "src/main/java/org/mockito/internal/invocation/InterceptedInvocation.java"
        "src/main/java/org/mockito/internal/invocation/InvocationComparator.java"
        "src/main/java/org/mockito/internal/invocation/InvocationMarker.java"
        "src/main/java/org/mockito/internal/invocation/InvocationMatcher.java"
        "src/main/java/org/mockito/internal/invocation/InvocationsFinder.java"
        "src/main/java/org/mockito/internal/invocation/MatcherApplicationStrategy.java"
        "src/main/java/org/mockito/internal/invocation/MatchersBinder.java"
        "src/main/java/org/mockito/internal/invocation/MockitoMethod.java"
        "src/main/java/org/mockito/internal/invocation/RealMethod.java"
        "src/main/java/org/mockito/internal/invocation/SerializableMethod.java"
        "src/main/java/org/mockito/internal/invocation/StubInfoImpl.java"
        "src/main/java/org/mockito/internal/invocation/TypeSafeMatching.java"
        "src/main/java/org/mockito/internal/invocation/UnusedStubsFinder.java"
        "src/main/java/org/mockito/internal/invocation/package-info.java"
        "src/main/java/org/mockito/internal/invocation/finder/AllInvocationsFinder.java"
        "src/main/java/org/mockito/internal/invocation/finder/VerifiableInvocationsFinder.java"
        "src/main/java/org/mockito/internal/invocation/mockref/MockReference.java"
        "src/main/java/org/mockito/internal/invocation/mockref/MockStrongReference.java"
        "src/main/java/org/mockito/internal/invocation/mockref/MockWeakReference.java"
        "src/main/java/org/mockito/internal/junit/ArgMismatchFinder.java"
        "src/main/java/org/mockito/internal/junit/DefaultStubbingLookupListener.java"
        "src/main/java/org/mockito/internal/junit/DefaultTestFinishedEvent.java"
        "src/main/java/org/mockito/internal/junit/ExceptionFactory.java"
        "src/main/java/org/mockito/internal/junit/JUnitRule.java"
        "src/main/java/org/mockito/internal/junit/MismatchReportingTestListener.java"
        "src/main/java/org/mockito/internal/junit/MockitoTestListener.java"
        "src/main/java/org/mockito/internal/junit/NoOpTestListener.java"
        "src/main/java/org/mockito/internal/junit/StrictStubsRunnerTestListener.java"
        "src/main/java/org/mockito/internal/junit/StubbingArgMismatches.java"
        "src/main/java/org/mockito/internal/junit/StubbingHint.java"
        "src/main/java/org/mockito/internal/junit/TestFinishedEvent.java"
        "src/main/java/org/mockito/internal/junit/UniversalTestListener.java"
        "src/main/java/org/mockito/internal/junit/UnnecessaryStubbingsReporter.java"
        "src/main/java/org/mockito/internal/junit/UnusedStubbings.java"
        "src/main/java/org/mockito/internal/junit/UnusedStubbingsFinder.java"
        "src/main/java/org/mockito/internal/junit/VerificationCollectorImpl.java"
        "src/main/java/org/mockito/internal/junit/package-info.java"
        "src/main/java/org/mockito/internal/junit/util/JUnitFailureHacker.java"
        "src/main/java/org/mockito/internal/listeners/StubbingLookupEvent.java"
        "src/main/java/org/mockito/internal/listeners/StubbingLookupListener.java"
        "src/main/java/org/mockito/internal/listeners/StubbingLookupNotifier.java"
        "src/main/java/org/mockito/internal/listeners/VerificationStartedNotifier.java"
        "src/main/java/org/mockito/internal/matchers/And.java"
        "src/main/java/org/mockito/internal/matchers/Any.java"
        "src/main/java/org/mockito/internal/matchers/ArrayEquals.java"
        "src/main/java/org/mockito/internal/matchers/CapturesArguments.java"
        "src/main/java/org/mockito/internal/matchers/CapturingMatcher.java"
        "src/main/java/org/mockito/internal/matchers/CompareEqual.java"
        "src/main/java/org/mockito/internal/matchers/CompareTo.java"
        "src/main/java/org/mockito/internal/matchers/Contains.java"
        "src/main/java/org/mockito/internal/matchers/ContainsExtraTypeInfo.java"
        "src/main/java/org/mockito/internal/matchers/EndsWith.java"
        "src/main/java/org/mockito/internal/matchers/Equality.java"
        "src/main/java/org/mockito/internal/matchers/Equals.java"
        "src/main/java/org/mockito/internal/matchers/EqualsWithDelta.java"
        "src/main/java/org/mockito/internal/matchers/Find.java"
        "src/main/java/org/mockito/internal/matchers/GreaterOrEqual.java"
        "src/main/java/org/mockito/internal/matchers/GreaterThan.java"
        "src/main/java/org/mockito/internal/matchers/InstanceOf.java"
        "src/main/java/org/mockito/internal/matchers/LessOrEqual.java"
        "src/main/java/org/mockito/internal/matchers/LessThan.java"
        "src/main/java/org/mockito/internal/matchers/LocalizedMatcher.java"
        "src/main/java/org/mockito/internal/matchers/Matches.java"
        "src/main/java/org/mockito/internal/matchers/Not.java"
        "src/main/java/org/mockito/internal/matchers/NotNull.java"
        "src/main/java/org/mockito/internal/matchers/Null.java"
        "src/main/java/org/mockito/internal/matchers/Or.java"
        "src/main/java/org/mockito/internal/matchers/Same.java"
        "src/main/java/org/mockito/internal/matchers/StartsWith.java"
        "src/main/java/org/mockito/internal/matchers/VarargMatcher.java"
        "src/main/java/org/mockito/internal/matchers/package-info.java"
        "src/main/java/org/mockito/internal/matchers/apachecommons/EqualsBuilder.java"
        "src/main/java/org/mockito/internal/matchers/apachecommons/ReflectionEquals.java"
        "src/main/java/org/mockito/internal/matchers/apachecommons/package-info.java"
        "src/main/java/org/mockito/internal/matchers/text/FormattedText.java"
        "src/main/java/org/mockito/internal/matchers/text/MatcherToString.java"
        "src/main/java/org/mockito/internal/matchers/text/MatchersPrinter.java"
        "src/main/java/org/mockito/internal/matchers/text/ValuePrinter.java"
        "src/main/java/org/mockito/internal/progress/ArgumentMatcherStorage.java"
        "src/main/java/org/mockito/internal/progress/ArgumentMatcherStorageImpl.java"
        "src/main/java/org/mockito/internal/progress/MockingProgress.java"
        "src/main/java/org/mockito/internal/progress/MockingProgressImpl.java"
        "src/main/java/org/mockito/internal/progress/SequenceNumber.java"
        "src/main/java/org/mockito/internal/progress/ThreadSafeMockingProgress.java"
        "src/main/java/org/mockito/internal/progress/package-info.java"
        "src/main/java/org/mockito/internal/reporting/Discrepancy.java"
        "src/main/java/org/mockito/internal/reporting/Pluralizer.java"
        "src/main/java/org/mockito/internal/reporting/PrintSettings.java"
        "src/main/java/org/mockito/internal/reporting/SmartPrinter.java"
        "src/main/java/org/mockito/internal/reporting/package-info.java"
        "src/main/java/org/mockito/internal/runners/DefaultInternalRunner.java"
        "src/main/java/org/mockito/internal/runners/InternalRunner.java"
        "src/main/java/org/mockito/internal/runners/RunnerFactory.java"
        "src/main/java/org/mockito/internal/runners/StrictRunner.java"
        "src/main/java/org/mockito/internal/runners/package-info.java"
        "src/main/java/org/mockito/internal/runners/util/FailureDetector.java"
        "src/main/java/org/mockito/internal/runners/util/RunnerProvider.java"
        "src/main/java/org/mockito/internal/runners/util/TestMethodsFinder.java"
        "src/main/java/org/mockito/internal/runners/util/package-info.java"
        "src/main/java/org/mockito/internal/session/DefaultMockitoSessionBuilder.java"
        "src/main/java/org/mockito/internal/session/MockitoLoggerAdapter.java"
        "src/main/java/org/mockito/internal/session/MockitoSessionLoggerAdapter.java"
        "src/main/java/org/mockito/internal/stubbing/BaseStubbing.java"
        "src/main/java/org/mockito/internal/stubbing/ConsecutiveStubbing.java"
        "src/main/java/org/mockito/internal/stubbing/DefaultLenientStubber.java"
        "src/main/java/org/mockito/internal/stubbing/DoAnswerStyleStubbing.java"
        "src/main/java/org/mockito/internal/stubbing/InvocationContainerImpl.java"
        "src/main/java/org/mockito/internal/stubbing/OngoingStubbingImpl.java"
        "src/main/java/org/mockito/internal/stubbing/StrictnessSelector.java"
        "src/main/java/org/mockito/internal/stubbing/StubbedInvocationMatcher.java"
        "src/main/java/org/mockito/internal/stubbing/StubberImpl.java"
        "src/main/java/org/mockito/internal/stubbing/StubbingComparator.java"
        "src/main/java/org/mockito/internal/stubbing/UnusedStubbingReporting.java"
        "src/main/java/org/mockito/internal/stubbing/package-info.java"
        "src/main/java/org/mockito/internal/stubbing/answers/AnswerFunctionalInterfaces.java"
        "src/main/java/org/mockito/internal/stubbing/answers/AnswersWithDelay.java"
        "src/main/java/org/mockito/internal/stubbing/answers/CallsRealMethods.java"
        "src/main/java/org/mockito/internal/stubbing/answers/ClonesArguments.java"
        "src/main/java/org/mockito/internal/stubbing/answers/DefaultAnswerValidator.java"
        "src/main/java/org/mockito/internal/stubbing/answers/DoesNothing.java"
        "src/main/java/org/mockito/internal/stubbing/answers/InvocationInfo.java"
        "src/main/java/org/mockito/internal/stubbing/answers/Returns.java"
        "src/main/java/org/mockito/internal/stubbing/answers/ReturnsArgumentAt.java"
        "src/main/java/org/mockito/internal/stubbing/answers/ReturnsElementsOf.java"
        "src/main/java/org/mockito/internal/stubbing/answers/ThrowsException.java"
        "src/main/java/org/mockito/internal/stubbing/answers/package-info.java"
        "src/main/java/org/mockito/internal/stubbing/defaultanswers/ForwardsInvocations.java"
        "src/main/java/org/mockito/internal/stubbing/defaultanswers/GloballyConfiguredAnswer.java"
        "src/main/java/org/mockito/internal/stubbing/defaultanswers/ReturnsDeepStubs.java"
        "src/main/java/org/mockito/internal/stubbing/defaultanswers/ReturnsEmptyValues.java"
        "src/main/java/org/mockito/internal/stubbing/defaultanswers/ReturnsMocks.java"
        "src/main/java/org/mockito/internal/stubbing/defaultanswers/ReturnsMoreEmptyValues.java"
        "src/main/java/org/mockito/internal/stubbing/defaultanswers/ReturnsSmartNulls.java"
        "src/main/java/org/mockito/internal/stubbing/defaultanswers/TriesToReturnSelf.java"
        "src/main/java/org/mockito/internal/stubbing/defaultanswers/package-info.java"
        "src/main/java/org/mockito/internal/util/Checks.java"
        "src/main/java/org/mockito/internal/util/ConsoleMockitoLogger.java"
        "src/main/java/org/mockito/internal/util/DefaultMockingDetails.java"
        "src/main/java/org/mockito/internal/util/JavaEightUtil.java"
        "src/main/java/org/mockito/internal/util/MockCreationValidator.java"
        "src/main/java/org/mockito/internal/util/MockNameImpl.java"
        "src/main/java/org/mockito/internal/util/MockUtil.java"
        "src/main/java/org/mockito/internal/util/MockitoLogger.java"
        "src/main/java/org/mockito/internal/util/ObjectMethodsGuru.java"
        "src/main/java/org/mockito/internal/util/Platform.java"
        "src/main/java/org/mockito/internal/util/Primitives.java"
        "src/main/java/org/mockito/internal/util/StringUtil.java"
        "src/main/java/org/mockito/internal/util/Supplier.java"
        "src/main/java/org/mockito/internal/util/Timer.java"
        "src/main/java/org/mockito/internal/util/package-info.java"
        "src/main/java/org/mockito/internal/util/collections/HashCodeAndEqualsMockWrapper.java"
        "src/main/java/org/mockito/internal/util/collections/HashCodeAndEqualsSafeSet.java"
        "src/main/java/org/mockito/internal/util/collections/IdentitySet.java"
        "src/main/java/org/mockito/internal/util/collections/Iterables.java"
        "src/main/java/org/mockito/internal/util/collections/ListUtil.java"
        "src/main/java/org/mockito/internal/util/collections/Sets.java"
        "src/main/java/org/mockito/internal/util/concurrent/DetachedThreadLocal.java"
        "src/main/java/org/mockito/internal/util/concurrent/WeakConcurrentMap.java"
        "src/main/java/org/mockito/internal/util/concurrent/WeakConcurrentSet.java"
        "src/main/java/org/mockito/internal/util/io/IOUtil.java"
        "src/main/java/org/mockito/internal/util/reflection/AccessibilityChanger.java"
        "src/main/java/org/mockito/internal/util/reflection/BeanPropertySetter.java"
        "src/main/java/org/mockito/internal/util/reflection/FieldCopier.java"
        "src/main/java/org/mockito/internal/util/reflection/FieldInitializationReport.java"
        "src/main/java/org/mockito/internal/util/reflection/FieldInitializer.java"
        "src/main/java/org/mockito/internal/util/reflection/FieldReader.java"
        "src/main/java/org/mockito/internal/util/reflection/FieldSetter.java"
        "src/main/java/org/mockito/internal/util/reflection/Fields.java"
        "src/main/java/org/mockito/internal/util/reflection/GenericMaster.java"
        "src/main/java/org/mockito/internal/util/reflection/GenericMetadataSupport.java"
        "src/main/java/org/mockito/internal/util/reflection/GenericTypeExtractor.java"
        "src/main/java/org/mockito/internal/util/reflection/InstanceField.java"
        "src/main/java/org/mockito/internal/util/reflection/LenientCopyTool.java"
        "src/main/java/org/mockito/internal/util/reflection/SuperTypesLastSorter.java"
        "src/main/java/org/mockito/internal/util/reflection/package-info.java"
        "src/main/java/org/mockito/internal/verification/AtLeast.java"
        "src/main/java/org/mockito/internal/verification/AtMost.java"
        "src/main/java/org/mockito/internal/verification/Calls.java"
        "src/main/java/org/mockito/internal/verification/DefaultRegisteredInvocations.java"
        "src/main/java/org/mockito/internal/verification/Description.java"
        "src/main/java/org/mockito/internal/verification/InOrderContextImpl.java"
        "src/main/java/org/mockito/internal/verification/InOrderWrapper.java"
        "src/main/java/org/mockito/internal/verification/MockAwareVerificationMode.java"
        "src/main/java/org/mockito/internal/verification/NoMoreInteractions.java"
        "src/main/java/org/mockito/internal/verification/Only.java"
        "src/main/java/org/mockito/internal/verification/RegisteredInvocations.java"
        "src/main/java/org/mockito/internal/verification/SingleRegisteredInvocation.java"
        "src/main/java/org/mockito/internal/verification/Times.java"
        "src/main/java/org/mockito/internal/verification/VerificationDataImpl.java"
        "src/main/java/org/mockito/internal/verification/VerificationEventImpl.java"
        "src/main/java/org/mockito/internal/verification/VerificationModeFactory.java"
        "src/main/java/org/mockito/internal/verification/VerificationOverTimeImpl.java"
        "src/main/java/org/mockito/internal/verification/VerificationWrapper.java"
        "src/main/java/org/mockito/internal/verification/VerificationWrapperInOrderWrapper.java"
        "src/main/java/org/mockito/internal/verification/package-info.java"
        "src/main/java/org/mockito/internal/verification/api/InOrderContext.java"
        "src/main/java/org/mockito/internal/verification/api/VerificationData.java"
        "src/main/java/org/mockito/internal/verification/api/VerificationDataInOrder.java"
        "src/main/java/org/mockito/internal/verification/api/VerificationDataInOrderImpl.java"
        "src/main/java/org/mockito/internal/verification/api/VerificationInOrderMode.java"
        "src/main/java/org/mockito/internal/verification/api/package-info.java"
        "src/main/java/org/mockito/internal/verification/argumentmatching/ArgumentMatchingTool.java"
        "src/main/java/org/mockito/internal/verification/argumentmatching/package-info.java"
        "src/main/java/org/mockito/internal/verification/checkers/AtLeastDiscrepancy.java"
        "src/main/java/org/mockito/internal/verification/checkers/AtLeastXNumberOfInvocationsChecker.java"
        "src/main/java/org/mockito/internal/verification/checkers/MissingInvocationChecker.java"
        "src/main/java/org/mockito/internal/verification/checkers/NumberOfInvocationsChecker.java"
        "src/main/java/org/mockito/internal/verification/checkers/package-info.java"
        "src/main/java/org/mockito/invocation/DescribedInvocation.java"
        "src/main/java/org/mockito/invocation/Invocation.java"
        "src/main/java/org/mockito/invocation/InvocationContainer.java"
        "src/main/java/org/mockito/invocation/InvocationFactory.java"
        "src/main/java/org/mockito/invocation/InvocationOnMock.java"
        "src/main/java/org/mockito/invocation/Location.java"
        "src/main/java/org/mockito/invocation/MatchableInvocation.java"
        "src/main/java/org/mockito/invocation/MockHandler.java"
        "src/main/java/org/mockito/invocation/StubInfo.java"
        "src/main/java/org/mockito/invocation/package-info.java"
        "src/main/java/org/mockito/junit/MockitoJUnit.java"
        "src/main/java/org/mockito/junit/MockitoJUnitRunner.java"
        "src/main/java/org/mockito/junit/MockitoRule.java"
        "src/main/java/org/mockito/junit/VerificationCollector.java"
        "src/main/java/org/mockito/junit/package-info.java"
        "src/main/java/org/mockito/listeners/InvocationListener.java"
        "src/main/java/org/mockito/listeners/MethodInvocationReport.java"
        "src/main/java/org/mockito/listeners/MockCreationListener.java"
        "src/main/java/org/mockito/listeners/MockitoListener.java"
        "src/main/java/org/mockito/listeners/VerificationListener.java"
        "src/main/java/org/mockito/listeners/VerificationStartedEvent.java"
        "src/main/java/org/mockito/listeners/VerificationStartedListener.java"
        "src/main/java/org/mockito/listeners/package-info.java"
        "src/main/java/org/mockito/mock/MockCreationSettings.java"
        "src/main/java/org/mockito/mock/MockName.java"
        "src/main/java/org/mockito/mock/SerializableMode.java"
        "src/main/java/org/mockito/mock/package-info.java"
        "src/main/java/org/mockito/plugins/AnnotationEngine.java"
        "src/main/java/org/mockito/plugins/InlineMockMaker.java"
        "src/main/java/org/mockito/plugins/InstantiatorProvider.java"
        "src/main/java/org/mockito/plugins/InstantiatorProvider2.java"
        "src/main/java/org/mockito/plugins/MockMaker.java"
        "src/main/java/org/mockito/plugins/MockitoPlugins.java"
        "src/main/java/org/mockito/plugins/PluginSwitch.java"
        "src/main/java/org/mockito/plugins/StackTraceCleanerProvider.java"
        "src/main/java/org/mockito/plugins/package-info.java"
        "src/main/java/org/mockito/quality/MockitoHint.java"
        "src/main/java/org/mockito/quality/Strictness.java"
        "src/main/java/org/mockito/quality/package-info.java"
        "src/main/java/org/mockito/runners/ConsoleSpammingMockitoJUnitRunner.java"
        "src/main/java/org/mockito/runners/MockitoJUnitRunner.java"
        "src/main/java/org/mockito/runners/VerboseMockitoJUnitRunner.java"
        "src/main/java/org/mockito/runners/package-info.java"
        "src/main/java/org/mockito/session/MockitoSessionBuilder.java"
        "src/main/java/org/mockito/session/MockitoSessionLogger.java"
        "src/main/java/org/mockito/stubbing/Answer.java"
        "src/main/java/org/mockito/stubbing/Answer1.java"
        "src/main/java/org/mockito/stubbing/Answer2.java"
        "src/main/java/org/mockito/stubbing/Answer3.java"
        "src/main/java/org/mockito/stubbing/Answer4.java"
        "src/main/java/org/mockito/stubbing/Answer5.java"
        "src/main/java/org/mockito/stubbing/BaseStubber.java"
        "src/main/java/org/mockito/stubbing/LenientStubber.java"
        "src/main/java/org/mockito/stubbing/OngoingStubbing.java"
        "src/main/java/org/mockito/stubbing/Stubber.java"
        "src/main/java/org/mockito/stubbing/Stubbing.java"
        "src/main/java/org/mockito/stubbing/ValidableAnswer.java"
        "src/main/java/org/mockito/stubbing/VoidAnswer1.java"
        "src/main/java/org/mockito/stubbing/VoidAnswer2.java"
        "src/main/java/org/mockito/stubbing/VoidAnswer3.java"
        "src/main/java/org/mockito/stubbing/VoidAnswer4.java"
        "src/main/java/org/mockito/stubbing/VoidAnswer5.java"
        "src/main/java/org/mockito/stubbing/package-info.java"
        "src/main/java/org/mockito/verification/After.java"
        "src/main/java/org/mockito/verification/Timeout.java"
        "src/main/java/org/mockito/verification/VerificationAfterDelay.java"
        "src/main/java/org/mockito/verification/VerificationEvent.java"
        "src/main/java/org/mockito/verification/VerificationMode.java"
        "src/main/java/org/mockito/verification/VerificationStrategy.java"
        "src/main/java/org/mockito/verification/VerificationWithTimeout.java"
        "src/main/java/org/mockito/verification/package-info.java"
    ];

    libs = [
        "junit"
        "objenesis"
    ];

    target = {
        android = {
            #  Exclude source used to dynamically create classes since target builds use
            #  dexmaker instead and including it causes conflicts.
            exclude_srcs = [
                "src/main/java/org/mockito/internal/creation/bytebuddy/**/*.java"
            ];
        };
        host = {
            static_libs = [
                "mockito-byte-buddy"
                "mockito-byte-buddy-agent"
            ];
        };
    };
    sdk_version = "core_current";
    java_version = "1.7";

    errorprone = {
        javacflags = [
            "-Xep:CollectionIncompatibleType:WARN" #  b/74213384
        ];
    };
};

#  Compatibility library for old name of host target
mockito-host = java_library_host {
    name = "mockito-host";
    static_libs = ["mockito"];
};

#  Compatibility library for old name of api target
mockito-api = java_library_static {
    name = "mockito-api";
    hostdex = true;
    static_libs = ["mockito"];
    sdk_version = "core_current";
};

#  Compatibility library for old name of host target
mockito-inline = java_library_host {
    name = "mockito-inline";
    static_libs = ["mockito"];
    java_resource_dirs = ["subprojects/inline/src/main/resources"];
};

#  Host prebuilt dependencies.
#  ============================================================
mockito-byte-buddy = java_import_host {
    name = "mockito-byte-buddy";
    jars = ["lib/byte-buddy-1.8.15.jar"];
};

mockito-byte-buddy-agent = java_import_host {
    name = "mockito-byte-buddy-agent";
    jars = ["lib/byte-buddy-agent-1.8.15.jar"];
};

in { inherit mockito mockito-api mockito-byte-buddy mockito-byte-buddy-agent mockito-host mockito-inline; }
