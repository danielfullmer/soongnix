{ java_genrule, java_test }:
let

SourceDebugExtensionMockClass_gen = java_genrule {
    name = "SourceDebugExtensionMockClass_gen";
    host_supported = true;
    srcs = ["src/test/resources/org/apache/harmony/jpda/tests/jdwp/Events/SourceDebugExtensionMockClass.class"];
    tools = ["soong_zip"];
    cmd = "$(location soong_zip) -jar -o $(out) -C external/apache-harmony/jdwp/src/test/resources -f $(in)";
    out = ["SourceDebugExtensionMockClass_gen.jar"];
};

apache-harmony-jdwp-tests = java_test {
    name = "apache-harmony-jdwp-tests";
    visibility = [
        "//cts/tests/jdwp"
    ];
    hostdex = true;
    host_supported = true;
    srcs = [
        "src/test/java/org/apache/harmony/jpda/tests/framework/Breakpoint.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/DebuggeeRegister.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/DebuggeeSynchronizer.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/DebuggeeWrapper.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/LogWriter.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/StreamRedirector.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/TestErrorException.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/TestOptions.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/ArrayRegion.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/Capabilities.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/CommandPacket.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/Event.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/EventBuilder.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/EventMod.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/EventPacket.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/Field.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/Frame.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/JDWPCommands.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/JDWPConstants.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/JDWPDebuggeeWrapper.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/Location.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/Method.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/Packet.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/PacketDispatcher.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/ParsedEvent.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/ReplyPacket.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/SocketTransportWrapper.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/TaggedObject.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/TransportWrapper.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/TypesLengths.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/Value.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/VmMirror.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/exceptions/ReplyErrorCodeException.java"
        "src/test/java/org/apache/harmony/jpda/tests/framework/jdwp/exceptions/TimeoutException.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayReference/ArrayReferenceDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayReference/GetValuesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayReference/JDWPArrayReferenceTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayReference/LengthTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayReference/SetValues002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayReference/SetValues002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayReference/SetValues003Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayReference/SetValues003Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayReference/SetValuesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayType/NewInstanceDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ArrayType/NewInstanceTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassLoaderReference/VisibleClassesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassObjectReference/AbstractReflectedTypeTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassObjectReference/ReflectedType002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassObjectReference/ReflectedType002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassObjectReference/ReflectedTypeTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/AbstractNewInstanceTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/ClassTypeDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/InvokeMethod002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/InvokeMethod003Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/InvokeMethod003Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/InvokeMethodAfterMultipleThreadSuspensionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/InvokeMethodTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/InvokeMethodWithSuspensionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/JDWPClassTypeTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/NewInstance002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/NewInstance002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/NewInstanceAfterMultipleThreadSuspensionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/NewInstanceStringDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/NewInstanceStringTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/NewInstanceTagDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/NewInstanceTagTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/NewInstanceTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/NewInstanceWithSuspensionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/SetValues002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/SetValues002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/SetValuesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ClassType/SuperClassTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/DDM/DDMDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/DDM/DDMTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/DebuggerOnDemand/LaunchedDebugger.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/DebuggerOnDemand/OnthrowDebuggerLaunchDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/DebuggerOnDemand/OnthrowDebuggerLaunchTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/DebuggerOnDemand/OnthrowLaunchDebugger001.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/DebuggerOnDemand/OnthrowLaunchDebugger002.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Deoptimization/DeoptimizationWithExceptionHandlingDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Deoptimization/DeoptimizationWithExceptionHandlingTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/EventModifiers/CountModifierDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/EventModifiers/CountModifierTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/EventModifiers/InstanceOnlyModifierDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/EventModifiers/InstanceOnlyModifierTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/EventModifiers/JDWPEventModifierTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/EventModifiers/ThreadOnlyModifierDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/EventModifiers/ThreadOnlyModifierTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/Breakpoint002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/Breakpoint002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/Breakpoint003Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/Breakpoint003Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/BreakpointDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/BreakpointMultipleTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/BreakpointOnCatchDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/BreakpointOnCatchTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/BreakpointTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/Class2Prepare.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ClassPrepare002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ClassPrepare002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ClassPrepareDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ClassPrepareTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ClassUnloadDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ClassUnloadTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/CombinedEvents002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/CombinedEvents002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/CombinedEvents003Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/CombinedEvents003Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/CombinedEventsDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/CombinedEventsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/CombinedEventsTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/CombinedExceptionEventsDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/CombinedExceptionEventsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/DebuggeeException.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/EventDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/EventLocationEventTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/EventWithExceptionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/EventWithExceptionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ExceptionBaseTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ExceptionCaughtDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ExceptionCaughtTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ExceptionUncaughtDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ExceptionUncaughtTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ExceptionWithLocationDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ExceptionWithLocationTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/FieldAccessTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/FieldDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/FieldModification002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/FieldModification002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/FieldModificationTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/FieldWithLocationDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/FieldWithLocationTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/JDWPEventTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MethodEntryDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MethodEntryTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MethodExitTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MethodExitWithReturnValueDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MethodExitWithReturnValueTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MonitorContendedEnterAndEnteredDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MonitorContendedEnterTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MonitorContendedEnteredTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MonitorWaitAndWaitedDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MonitorWaitTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/MonitorWaitedTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/SingleStepDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/SingleStepTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/SingleStepThroughReflectionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/SingleStepThroughReflectionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/SingleStepWithLocationTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/SingleStepWithPendingExceptionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/SingleStepWithPendingExceptionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ThreadEndTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/ThreadStartTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/VMDeath002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Events/VMDeathTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/InterfaceType/InvokeMethodDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/InterfaceType/InvokeMethodTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/InterfaceType/InvokeMethodTestInterface.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Method/BytecodesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Method/IsObsoleteTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Method/JDWPMethodTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Method/JDWPMethodVariableTableTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Method/LineTableTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Method/MethodDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Method/MethodVariableTestDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Method/VariableTableTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/Method/VariableTableWithGenericTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/AttachConnectorTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/BreakpointTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/ClassObjectIDTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/ClassPrepareTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/ConnectorKindDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/EnableCollectionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/EnableCollectionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/EventDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/ExceptionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/ExceptionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/FieldAccessTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/FieldDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/FieldModificationTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/JDWPEventTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/ListenConnectorTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/MethodEntryExitTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/MultiSessionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/RefTypeIDTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/ResumeDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/ResumeTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/SingleStepDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/SingleStepTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/ThreadEndTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/ThreadStartTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/MultiSession/VMDeathTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/DisableCollectionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/DisableCollectionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/EnableCollectionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/EnableCollectionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/GetValues002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/GetValues002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/GetValues003Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/GetValues003Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/GetValuesDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/GetValuesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethod002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethod002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethod003Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethod003Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethodAfterMultipleThreadSuspensionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethodDefault002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethodDefault002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethodDefaultDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethodDefaultTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethodTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/InvokeMethodWithSuspensionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/IsCollectedDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/IsCollectedTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/MonitorInfoDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/MonitorInfoTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/ReferenceTypeDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/ReferenceTypeTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/ReferringObjectsDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/ReferringObjectsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/SetValues002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/SetValues002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/SetValues003Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/SetValues003Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/SetValues004Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/SetValues004Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/SetValuesDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ObjectReference/SetValuesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/ClassFileVersionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/ClassFileVersionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/ClassLoaderTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/ClassObjectDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/ClassObjectTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/ConstantPoolDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/ConstantPoolTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/FieldsDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/FieldsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/FieldsWithGenericDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/FieldsWithGenericTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues003Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues003Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues004Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues004Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues005Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues005Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues006Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues006Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues007Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValues007Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValuesDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/GetValuesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/InstancesDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/InstancesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/InterfacesDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/InterfacesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/MethodsDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/MethodsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/MethodsWithGenericDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/MethodsWithGenericTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/ModifiersTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/NestedTypesDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/NestedTypesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/Signature002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/Signature002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/SignatureTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/SignatureWithGenericDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/SignatureWithGenericTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/SourceDebugExtensionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/SourceDebugExtensionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/SourceFileDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/SourceFileTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/StatusDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/StatusTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/SyntheticFieldsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ReferenceType/SyntheticMethodsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/GetValues002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/GetValuesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/JDWPStackFrameAccessTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/JDWPStackFrameTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/JDWPStackTraceBaseTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/PopFrames002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/PopFramesDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/PopFramesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/ProxyThisObjectTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/SetValues002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/SetValuesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/StackTrace002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/StackTraceDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StackFrame/ThisObjectTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/StringReference/ValueTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadGroupReference/ChildrenDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadGroupReference/ChildrenTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadGroupReference/NameDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadGroupReference/NameTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadGroupReference/ParentTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/CurrentContendedMonitorDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/CurrentContendedMonitorTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ForceEarlyReturn002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ForceEarlyReturn003Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ForceEarlyReturn004Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ForceEarlyReturn005Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ForceEarlyReturn006Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ForceEarlyReturnDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ForceEarlyReturnTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/FrameCountTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/FramesDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/FramesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/InterruptDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/InterruptTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/NameTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/OwnedMonitorsDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/OwnedMonitorsStackDepthInfoDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/OwnedMonitorsStackDepthInfoTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/OwnedMonitorsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ResumeDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ResumeTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/Status002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/Status002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/Status003Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/Status003Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/Status004Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/Status004Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/Status005Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/Status005Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/Status006Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/Status006Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/StatusDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/StatusTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/StopDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/StopTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/SuspendCountDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/SuspendCountTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/SuspendDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/SuspendTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ThreadGroup002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ThreadGroup002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ThreadGroupDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/ThreadReference/ThreadGroupTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VMDebug/VMDebugDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VMDebug/VMDebugTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VMDebug/VMDebugTest002.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/AllClassesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/AllClassesWithGenericTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/AllThreadsDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/AllThreadsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/CapabilitiesNewTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/CapabilitiesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/ClassPathsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/ClassesBySignatureTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/CreateStringTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/DisposeDuringInvokeDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/DisposeDuringInvokeTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/DisposeObjectsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/DisposeTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/ExitTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/HoldEventsDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/HoldEventsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/IDSizesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/InstanceCountsDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/InstanceCountsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/RedefineClassesDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/RedefineClassesTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/ReleaseEventsDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/ReleaseEventsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/Resume002Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/Resume002Test.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/ResumeDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/ResumeTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/SetDefaultStratumTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/SuspendTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/TopLevelThreadGroupsTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/VirtualMachine/VersionTest.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/JDWPInvokeMethodSuspendedTwiceTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/JDWPInvokeMethodWithSuspensionTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/JDWPManualDebuggeeWrapper.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/JDWPProxyTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/JDWPRawTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/JDWPSyncTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/JDWPTestCase.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/JDWPTestConstants.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/JDWPUnitDebuggeeProcessWrapper.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/JDWPUnitDebuggeeWrapper.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/debuggee/HelloWorld.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/debuggee/InvokeMethodDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/debuggee/InvokeMethodSuspendedTwiceDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/debuggee/InvokeMethodWithSuspensionDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/debuggee/ProxyDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/debuggee/SimpleHelloWorld.java"
        "src/test/java/org/apache/harmony/jpda/tests/jdwp/share/debuggee/SyntheticMembersDebuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/share/AllTests.java"
        "src/test/java/org/apache/harmony/jpda/tests/share/Debuggee.java"
        "src/test/java/org/apache/harmony/jpda/tests/share/GcMarker.java"
        "src/test/java/org/apache/harmony/jpda/tests/share/JPDADebuggeeSynchronizer.java"
        "src/test/java/org/apache/harmony/jpda/tests/share/JPDALogWriter.java"
        "src/test/java/org/apache/harmony/jpda/tests/share/JPDATestOptions.java"
        "src/test/java/org/apache/harmony/jpda/tests/share/SyncDebuggee.java"
    ];
    static_libs = ["SourceDebugExtensionMockClass_gen"];

    libs = ["junit"];

    sdk_version = "none";
    system_modules = "core-all-system-modules";
    target = {
        host = {
            exclude_srcs = ["src/test/java/org/apache/harmony/jpda/tests/jdwp/DDM/**/*.java"];
        };
    };

    #  b/73499927
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };

    jarjar_rules = "jarjar-rules.txt";
};

in { inherit SourceDebugExtensionMockClass_gen apache-harmony-jdwp-tests; }
