{ cc_defaults, cc_library, cc_library_headers, genrule, java_binary_host, java_library_host, python_binary_host }:
let

jdwpgen = java_binary_host {
    name = "jdwpgen";
    srcs = [
        "make/src/classes/build/tools/jdwpgen/AbstractCommandNode.java"
        "make/src/classes/build/tools/jdwpgen/AbstractGroupNode.java"
        "make/src/classes/build/tools/jdwpgen/AbstractNamedNode.java"
        "make/src/classes/build/tools/jdwpgen/AbstractSimpleNode.java"
        "make/src/classes/build/tools/jdwpgen/AbstractSimpleTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/AbstractTypeListNode.java"
        "make/src/classes/build/tools/jdwpgen/AbstractTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/AltNode.java"
        "make/src/classes/build/tools/jdwpgen/ArrayObjectTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/ArrayRegionTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/ArrayTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/BooleanTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/ByteTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/ClassLoaderObjectTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/ClassObjectTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/ClassTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/CommandNode.java"
        "make/src/classes/build/tools/jdwpgen/CommandSetNode.java"
        "make/src/classes/build/tools/jdwpgen/CommentNode.java"
        "make/src/classes/build/tools/jdwpgen/ConstantNode.java"
        "make/src/classes/build/tools/jdwpgen/ConstantSetNode.java"
        "make/src/classes/build/tools/jdwpgen/Context.java"
        "make/src/classes/build/tools/jdwpgen/ErrorNode.java"
        "make/src/classes/build/tools/jdwpgen/ErrorSetNode.java"
        "make/src/classes/build/tools/jdwpgen/EventNode.java"
        "make/src/classes/build/tools/jdwpgen/FieldTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/FrameTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/GroupNode.java"
        "make/src/classes/build/tools/jdwpgen/IntTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/InterfaceTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/LocationTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/LongTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/Main.java"
        "make/src/classes/build/tools/jdwpgen/MethodTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/NameNode.java"
        "make/src/classes/build/tools/jdwpgen/NameValueNode.java"
        "make/src/classes/build/tools/jdwpgen/Node.java"
        "make/src/classes/build/tools/jdwpgen/ObjectTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/OutNode.java"
        "make/src/classes/build/tools/jdwpgen/Parse.java"
        "make/src/classes/build/tools/jdwpgen/ReferenceIDTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/ReferenceTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/RepeatNode.java"
        "make/src/classes/build/tools/jdwpgen/ReplyNode.java"
        "make/src/classes/build/tools/jdwpgen/RootNode.java"
        "make/src/classes/build/tools/jdwpgen/SelectNode.java"
        "make/src/classes/build/tools/jdwpgen/StringObjectTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/StringTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/TaggedObjectTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/ThreadGroupObjectTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/ThreadObjectTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/TypeNode.java"
        "make/src/classes/build/tools/jdwpgen/UntaggedValueTypeNode.java"
        "make/src/classes/build/tools/jdwpgen/ValueTypeNode.java"
    ];
    wrapper = "etc/jdwpgen.sh";
    manifest = "etc/manifest.txt";
    java_version = "1.8";
};

jdwp_generated_headers = genrule {
    name = "jdwp_generated_headers";
    tools = ["jdwpgen"];
    cmd = "$(location jdwpgen) $(in) -include $(out)";
    srcs = ["make/data/jdwp/jdwp.spec"];
    out = ["JDWPCommands.h"];
};

upstream-jdwp-defaults = cc_defaults {
    name = "upstream-jdwp-defaults";
    host_supported = true;
    device_supported = true;
    cflags = [
        #  Every supported android platform is little-endian.
        "-D_LITTLE_ENDIAN"
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    notice = "LICENSE";
    target = {
        darwin = {
            enabled = false;
        };
    };
};

javavm_headers = cc_library_headers {
    name = "javavm_headers";
    export_include_dirs = [
        "src/share/javavm/export"
        "src/solaris/javavm/export"
    ];
    host_supported = true;
    device_supported = true;
};

libnpt_headers = cc_library_headers {
    name = "libnpt_headers";
    export_include_dirs = [
        "src/share/npt"
        "src/solaris/npt"
    ];
    defaults = ["upstream-jdwp-defaults"];
};

libnpt = cc_library {
    name = "libnpt";
    srcs = [
        "src/share/npt/npt.c"
        "src/share/npt/utf.c"
        "src/solaris/npt/utf_md.c"
    ];
    header_libs = [
        "javavm_headers"
        "libnpt_headers"
    ];
    defaults = ["upstream-jdwp-defaults"];
};

libjdwp_headers = cc_library_headers {
    name = "libjdwp_headers";
    export_include_dirs = [
        "src/share/back"
        "src/share/back/export"
        "src/solaris/back"
    ];
    generated_headers = ["jdwp_generated_headers"];
    export_generated_headers = ["jdwp_generated_headers"];
    defaults = ["upstream-jdwp-defaults"];
};

libjdwp = cc_library {
    name = "libjdwp";
    srcs = [
        "src/share/back/ArrayReferenceImpl.c"
        "src/share/back/ArrayTypeImpl.c"
        "src/share/back/ClassLoaderReferenceImpl.c"
        "src/share/back/ClassObjectReferenceImpl.c"
        "src/share/back/ClassTypeImpl.c"
        "src/share/back/DDMImpl.c"
        "src/share/back/EventRequestImpl.c"
        "src/share/back/FieldImpl.c"
        "src/share/back/FrameID.c"
        "src/share/back/InterfaceTypeImpl.c"
        "src/share/back/MethodImpl.c"
        "src/share/back/ObjectReferenceImpl.c"
        "src/share/back/ReferenceTypeImpl.c"
        "src/share/back/SDE.c"
        "src/share/back/StackFrameImpl.c"
        "src/share/back/StringReferenceImpl.c"
        "src/share/back/ThreadGroupReferenceImpl.c"
        "src/share/back/ThreadReferenceImpl.c"
        "src/share/back/VirtualMachineImpl.c"
        "src/share/back/bag.c"
        "src/share/back/classTrack.c"
        "src/share/back/commonRef.c"
        "src/share/back/debugDispatch.c"
        "src/share/back/debugInit.c"
        "src/share/back/debugLoop.c"
        "src/share/back/error_messages.c"
        "src/share/back/eventFilter.c"
        "src/share/back/eventHandler.c"
        "src/share/back/eventHelper.c"
        "src/share/back/inStream.c"
        "src/share/back/invoker.c"
        "src/share/back/log_messages.c"
        "src/share/back/outStream.c"
        "src/share/back/standardHandlers.c"
        "src/share/back/stepControl.c"
        "src/share/back/stream.c"
        "src/share/back/threadControl.c"
        "src/share/back/transport.c"
        "src/share/back/util.c"
        "src/share/back/vmDebug.c"
        "src/solaris/back/exec_md.c"
        "src/solaris/back/linker_md.c"
    ];
    cflags = [
        "-DLINUX"
        "-DJDWP_LOGGING"
        "-Wno-switch"
        "-Wno-logical-op-parentheses"
        "-Wno-logical-not-parentheses"
        "-Wno-sometimes-uninitialized"
        "-Wno-self-assign"
        "-Wno-unused-variable"
        "-Wno-unused-function"
    ];
    header_libs = [
        "javavm_headers"
        "libjdwp_headers"
        "libnpt_headers"
    ];
    required = [
        "libnpt"
        "libdt_socket"
    ];
    defaults = ["upstream-jdwp-defaults"];
};

libdt_socket = cc_library {
    name = "libdt_socket";
    srcs = [
        "src/share/transport/socket/socketTransport.c"
        "src/solaris/transport/socket/socket_md.c"
    ];
    local_include_dirs = [
        "src/share/transport/socket"
        "src/solaris/transport/socket"
    ];
    header_libs = [
        "javavm_headers"
        "libjdwp_headers"
        "libnpt_headers"
    ];
    required = ["libnpt"];
    defaults = ["upstream-jdwp-defaults"];
};

jdwp_generated_java = genrule {
    name = "jdwp_generated_java";
    tools = ["jdwpgen"];
    cmd = "$(location jdwpgen) $(in) -jdi $(out)";
    srcs = ["make/data/jdwp/jdwp.spec"];
    out = ["JDWP.java"];
};

jdi_prop_gen = python_binary_host {
    name = "jdi_prop_gen";
    srcs = ["etc/jdigen.py"];
    main = "etc/jdigen.py";
};

jdi_generated_properties = genrule {
    name = "jdi_generated_properties";
    tools = ["jdi_prop_gen"];
    cmd = "$(location jdi_prop_gen) $(in) $(out)";
    out = ["jdi.java"];
    srcs = ["src/share/classes/com/sun/tools/jdi/resources/jdi.properties"];
};

#  The classes needed to support JDI and debug remote processes.
jdi-support = java_library_host {
    name = "jdi-support";
    srcs = [
        #  The JDI interface definition.
        "src/share/classes/com/sun/jdi/AbsentInformationException.java"
        "src/share/classes/com/sun/jdi/Accessible.java"
        "src/share/classes/com/sun/jdi/ArrayReference.java"
        "src/share/classes/com/sun/jdi/ArrayType.java"
        "src/share/classes/com/sun/jdi/BooleanType.java"
        "src/share/classes/com/sun/jdi/BooleanValue.java"
        "src/share/classes/com/sun/jdi/Bootstrap.java"
        "src/share/classes/com/sun/jdi/ByteType.java"
        "src/share/classes/com/sun/jdi/ByteValue.java"
        "src/share/classes/com/sun/jdi/CharType.java"
        "src/share/classes/com/sun/jdi/CharValue.java"
        "src/share/classes/com/sun/jdi/ClassLoaderReference.java"
        "src/share/classes/com/sun/jdi/ClassNotLoadedException.java"
        "src/share/classes/com/sun/jdi/ClassNotPreparedException.java"
        "src/share/classes/com/sun/jdi/ClassObjectReference.java"
        "src/share/classes/com/sun/jdi/ClassType.java"
        "src/share/classes/com/sun/jdi/DoubleType.java"
        "src/share/classes/com/sun/jdi/DoubleValue.java"
        "src/share/classes/com/sun/jdi/Field.java"
        "src/share/classes/com/sun/jdi/FloatType.java"
        "src/share/classes/com/sun/jdi/FloatValue.java"
        "src/share/classes/com/sun/jdi/IncompatibleThreadStateException.java"
        "src/share/classes/com/sun/jdi/InconsistentDebugInfoException.java"
        "src/share/classes/com/sun/jdi/IntegerType.java"
        "src/share/classes/com/sun/jdi/IntegerValue.java"
        "src/share/classes/com/sun/jdi/InterfaceType.java"
        "src/share/classes/com/sun/jdi/InternalException.java"
        "src/share/classes/com/sun/jdi/InvalidCodeIndexException.java"
        "src/share/classes/com/sun/jdi/InvalidLineNumberException.java"
        "src/share/classes/com/sun/jdi/InvalidStackFrameException.java"
        "src/share/classes/com/sun/jdi/InvalidTypeException.java"
        "src/share/classes/com/sun/jdi/InvocationException.java"
        "src/share/classes/com/sun/jdi/JDIPermission.java"
        "src/share/classes/com/sun/jdi/LocalVariable.java"
        "src/share/classes/com/sun/jdi/Locatable.java"
        "src/share/classes/com/sun/jdi/Location.java"
        "src/share/classes/com/sun/jdi/LongType.java"
        "src/share/classes/com/sun/jdi/LongValue.java"
        "src/share/classes/com/sun/jdi/Method.java"
        "src/share/classes/com/sun/jdi/Mirror.java"
        "src/share/classes/com/sun/jdi/MonitorInfo.java"
        "src/share/classes/com/sun/jdi/NativeMethodException.java"
        "src/share/classes/com/sun/jdi/ObjectCollectedException.java"
        "src/share/classes/com/sun/jdi/ObjectReference.java"
        "src/share/classes/com/sun/jdi/PathSearchingVirtualMachine.java"
        "src/share/classes/com/sun/jdi/PrimitiveType.java"
        "src/share/classes/com/sun/jdi/PrimitiveValue.java"
        "src/share/classes/com/sun/jdi/ReferenceType.java"
        "src/share/classes/com/sun/jdi/ShortType.java"
        "src/share/classes/com/sun/jdi/ShortValue.java"
        "src/share/classes/com/sun/jdi/StackFrame.java"
        "src/share/classes/com/sun/jdi/StringReference.java"
        "src/share/classes/com/sun/jdi/ThreadGroupReference.java"
        "src/share/classes/com/sun/jdi/ThreadReference.java"
        "src/share/classes/com/sun/jdi/Type.java"
        "src/share/classes/com/sun/jdi/TypeComponent.java"
        "src/share/classes/com/sun/jdi/VMCannotBeModifiedException.java"
        "src/share/classes/com/sun/jdi/VMDisconnectedException.java"
        "src/share/classes/com/sun/jdi/VMMismatchException.java"
        "src/share/classes/com/sun/jdi/VMOutOfMemoryException.java"
        "src/share/classes/com/sun/jdi/Value.java"
        "src/share/classes/com/sun/jdi/VirtualMachine.java"
        "src/share/classes/com/sun/jdi/VirtualMachineManager.java"
        "src/share/classes/com/sun/jdi/VoidType.java"
        "src/share/classes/com/sun/jdi/VoidValue.java"
        "src/share/classes/com/sun/jdi/package-info.java"
        "src/share/classes/com/sun/jdi/connect/AttachingConnector.java"
        "src/share/classes/com/sun/jdi/connect/Connector.java"
        "src/share/classes/com/sun/jdi/connect/IllegalConnectorArgumentsException.java"
        "src/share/classes/com/sun/jdi/connect/LaunchingConnector.java"
        "src/share/classes/com/sun/jdi/connect/ListeningConnector.java"
        "src/share/classes/com/sun/jdi/connect/Transport.java"
        "src/share/classes/com/sun/jdi/connect/TransportTimeoutException.java"
        "src/share/classes/com/sun/jdi/connect/VMStartException.java"
        "src/share/classes/com/sun/jdi/connect/package-info.java"
        "src/share/classes/com/sun/jdi/connect/spi/ClosedConnectionException.java"
        "src/share/classes/com/sun/jdi/connect/spi/Connection.java"
        "src/share/classes/com/sun/jdi/connect/spi/TransportService.java"
        "src/share/classes/com/sun/jdi/connect/spi/package-info.java"
        "src/share/classes/com/sun/jdi/event/AccessWatchpointEvent.java"
        "src/share/classes/com/sun/jdi/event/BreakpointEvent.java"
        "src/share/classes/com/sun/jdi/event/ClassPrepareEvent.java"
        "src/share/classes/com/sun/jdi/event/ClassUnloadEvent.java"
        "src/share/classes/com/sun/jdi/event/Event.java"
        "src/share/classes/com/sun/jdi/event/EventIterator.java"
        "src/share/classes/com/sun/jdi/event/EventQueue.java"
        "src/share/classes/com/sun/jdi/event/EventSet.java"
        "src/share/classes/com/sun/jdi/event/ExceptionEvent.java"
        "src/share/classes/com/sun/jdi/event/LocatableEvent.java"
        "src/share/classes/com/sun/jdi/event/MethodEntryEvent.java"
        "src/share/classes/com/sun/jdi/event/MethodExitEvent.java"
        "src/share/classes/com/sun/jdi/event/ModificationWatchpointEvent.java"
        "src/share/classes/com/sun/jdi/event/MonitorContendedEnterEvent.java"
        "src/share/classes/com/sun/jdi/event/MonitorContendedEnteredEvent.java"
        "src/share/classes/com/sun/jdi/event/MonitorWaitEvent.java"
        "src/share/classes/com/sun/jdi/event/MonitorWaitedEvent.java"
        "src/share/classes/com/sun/jdi/event/StepEvent.java"
        "src/share/classes/com/sun/jdi/event/ThreadDeathEvent.java"
        "src/share/classes/com/sun/jdi/event/ThreadStartEvent.java"
        "src/share/classes/com/sun/jdi/event/VMDeathEvent.java"
        "src/share/classes/com/sun/jdi/event/VMDisconnectEvent.java"
        "src/share/classes/com/sun/jdi/event/VMStartEvent.java"
        "src/share/classes/com/sun/jdi/event/WatchpointEvent.java"
        "src/share/classes/com/sun/jdi/event/package-info.java"
        "src/share/classes/com/sun/jdi/request/AccessWatchpointRequest.java"
        "src/share/classes/com/sun/jdi/request/BreakpointRequest.java"
        "src/share/classes/com/sun/jdi/request/ClassPrepareRequest.java"
        "src/share/classes/com/sun/jdi/request/ClassUnloadRequest.java"
        "src/share/classes/com/sun/jdi/request/DuplicateRequestException.java"
        "src/share/classes/com/sun/jdi/request/EventRequest.java"
        "src/share/classes/com/sun/jdi/request/EventRequestManager.java"
        "src/share/classes/com/sun/jdi/request/ExceptionRequest.java"
        "src/share/classes/com/sun/jdi/request/InvalidRequestStateException.java"
        "src/share/classes/com/sun/jdi/request/MethodEntryRequest.java"
        "src/share/classes/com/sun/jdi/request/MethodExitRequest.java"
        "src/share/classes/com/sun/jdi/request/ModificationWatchpointRequest.java"
        "src/share/classes/com/sun/jdi/request/MonitorContendedEnterRequest.java"
        "src/share/classes/com/sun/jdi/request/MonitorContendedEnteredRequest.java"
        "src/share/classes/com/sun/jdi/request/MonitorWaitRequest.java"
        "src/share/classes/com/sun/jdi/request/MonitorWaitedRequest.java"
        "src/share/classes/com/sun/jdi/request/StepRequest.java"
        "src/share/classes/com/sun/jdi/request/ThreadDeathRequest.java"
        "src/share/classes/com/sun/jdi/request/ThreadStartRequest.java"
        "src/share/classes/com/sun/jdi/request/VMDeathRequest.java"
        "src/share/classes/com/sun/jdi/request/WatchpointRequest.java"
        "src/share/classes/com/sun/jdi/request/package-info.java"
        #  The JDI interface implementation
        "src/share/classes/com/sun/tools/jdi/AbstractLauncher.java"
        "src/share/classes/com/sun/tools/jdi/ArrayReferenceImpl.java"
        "src/share/classes/com/sun/tools/jdi/ArrayTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/BaseLineInfo.java"
        "src/share/classes/com/sun/tools/jdi/BooleanTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/BooleanValueImpl.java"
        "src/share/classes/com/sun/tools/jdi/ByteTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/ByteValueImpl.java"
        "src/share/classes/com/sun/tools/jdi/CharTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/CharValueImpl.java"
        "src/share/classes/com/sun/tools/jdi/ClassLoaderReferenceImpl.java"
        "src/share/classes/com/sun/tools/jdi/ClassObjectReferenceImpl.java"
        "src/share/classes/com/sun/tools/jdi/ClassTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/CommandSender.java"
        "src/share/classes/com/sun/tools/jdi/ConcreteMethodImpl.java"
        "src/share/classes/com/sun/tools/jdi/ConnectorImpl.java"
        "src/share/classes/com/sun/tools/jdi/DoubleTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/DoubleValueImpl.java"
        "src/share/classes/com/sun/tools/jdi/EventQueueImpl.java"
        "src/share/classes/com/sun/tools/jdi/EventRequestManagerImpl.java"
        "src/share/classes/com/sun/tools/jdi/EventSetImpl.java"
        "src/share/classes/com/sun/tools/jdi/FieldImpl.java"
        "src/share/classes/com/sun/tools/jdi/FloatTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/FloatValueImpl.java"
        "src/share/classes/com/sun/tools/jdi/GenericAttachingConnector.java"
        "src/share/classes/com/sun/tools/jdi/GenericListeningConnector.java"
        "src/share/classes/com/sun/tools/jdi/IntegerTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/IntegerValueImpl.java"
        "src/share/classes/com/sun/tools/jdi/InterfaceTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/InternalEventHandler.java"
        "src/share/classes/com/sun/tools/jdi/InvokableTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/JDWPException.java"
        "src/share/classes/com/sun/tools/jdi/JNITypeParser.java"
        "src/share/classes/com/sun/tools/jdi/LineInfo.java"
        "src/share/classes/com/sun/tools/jdi/LocalVariableImpl.java"
        "src/share/classes/com/sun/tools/jdi/LocationImpl.java"
        "src/share/classes/com/sun/tools/jdi/LockObject.java"
        "src/share/classes/com/sun/tools/jdi/LongTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/LongValueImpl.java"
        "src/share/classes/com/sun/tools/jdi/MethodImpl.java"
        "src/share/classes/com/sun/tools/jdi/MirrorImpl.java"
        "src/share/classes/com/sun/tools/jdi/MonitorInfoImpl.java"
        "src/share/classes/com/sun/tools/jdi/NonConcreteMethodImpl.java"
        "src/share/classes/com/sun/tools/jdi/ObjectReferenceImpl.java"
        "src/share/classes/com/sun/tools/jdi/ObsoleteMethodImpl.java"
        "src/share/classes/com/sun/tools/jdi/Packet.java"
        "src/share/classes/com/sun/tools/jdi/PacketStream.java"
        "src/share/classes/com/sun/tools/jdi/PrimitiveTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/PrimitiveValueImpl.java"
        "src/share/classes/com/sun/tools/jdi/ProcessAttachingConnector.java"
        "src/share/classes/com/sun/tools/jdi/RawCommandLineLauncher.java"
        "src/share/classes/com/sun/tools/jdi/ReferenceTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/SDE.java"
        "src/share/classes/com/sun/tools/jdi/ShortTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/ShortValueImpl.java"
        "src/share/classes/com/sun/tools/jdi/SocketAttachingConnector.java"
        "src/share/classes/com/sun/tools/jdi/SocketListeningConnector.java"
        "src/share/classes/com/sun/tools/jdi/SocketTransportService.java"
        "src/share/classes/com/sun/tools/jdi/StackFrameImpl.java"
        "src/share/classes/com/sun/tools/jdi/StratumLineInfo.java"
        "src/share/classes/com/sun/tools/jdi/StringReferenceImpl.java"
        "src/share/classes/com/sun/tools/jdi/SunCommandLineLauncher.java"
        "src/share/classes/com/sun/tools/jdi/TargetVM.java"
        "src/share/classes/com/sun/tools/jdi/ThreadAction.java"
        "src/share/classes/com/sun/tools/jdi/ThreadGroupReferenceImpl.java"
        "src/share/classes/com/sun/tools/jdi/ThreadListener.java"
        "src/share/classes/com/sun/tools/jdi/ThreadReferenceImpl.java"
        "src/share/classes/com/sun/tools/jdi/TypeComponentImpl.java"
        "src/share/classes/com/sun/tools/jdi/TypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/VMAction.java"
        "src/share/classes/com/sun/tools/jdi/VMListener.java"
        "src/share/classes/com/sun/tools/jdi/VMModifiers.java"
        "src/share/classes/com/sun/tools/jdi/VMState.java"
        "src/share/classes/com/sun/tools/jdi/ValueContainer.java"
        "src/share/classes/com/sun/tools/jdi/ValueImpl.java"
        "src/share/classes/com/sun/tools/jdi/VirtualMachineImpl.java"
        "src/share/classes/com/sun/tools/jdi/VirtualMachineManagerImpl.java"
        "src/share/classes/com/sun/tools/jdi/VirtualMachineManagerService.java"
        "src/share/classes/com/sun/tools/jdi/VoidTypeImpl.java"
        "src/share/classes/com/sun/tools/jdi/VoidValueImpl.java"
        #  The JDWP.java file that contains all the constants.
        ":jdwp_generated_java"
        #  The properties class which holds information about the various connectors.
        ":jdi_generated_properties"
    ];
    exclude_srcs = [
        #  We don't support process attachment and lack some of the classes to even compile this file.
        "src/share/classes/com/sun/tools/jdi/ProcessAttachingConnector.java"
    ];
    services = ["etc/com.sun.jdi.connect.Connector"];
    javacflags = ["-g"];
    notice = "LICENSE";
};

in { inherit javavm_headers jdi-support jdi_generated_properties jdi_prop_gen jdwp_generated_headers jdwp_generated_java jdwpgen libdt_socket libjdwp libjdwp_headers libnpt libnpt_headers upstream-jdwp-defaults; }
