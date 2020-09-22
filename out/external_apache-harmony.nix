{ java_test, package }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

_missingName = package {
    default_visibility = ["//visibility:private"];
};

apache-harmony-tests = java_test {
    name = "apache-harmony-tests";
    visibility = [
        "//cts/tests/libcore/luni"
    ];
    hostdex = true;
    srcs = [
        "beans/src/test/java/org/apache/harmony/beans/tests/java/beans/PropertyChangeEventTest.java"
        "beans/src/test/java/org/apache/harmony/beans/tests/java/beans/PropertyChangeListenerProxyTest.java"
        "beans/src/test/java/org/apache/harmony/beans/tests/java/beans/PropertyChangeSupportTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/ConsoleHandlerTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/ErrorManagerTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/FileHandlerTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/FilterTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/FormatterTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/HandlerTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/LevelTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/LevelTestResource.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/LogManagerTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/LogRecordTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/LoggerTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/MemoryHandlerTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/SimpleFormatterTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/SocketHandlerTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/StreamHandlerTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/XMLFormatterTest.java"
        "logging/src/test/java/org/apache/harmony/logging/tests/java/util/logging/util/EnvironmentHelper.java"

        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/BatchUpdateExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/ConnectionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/DataTruncationTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/DatabaseMetaDataTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/DateTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/DriverPropertyInfoTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/ParameterMetaDataTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/ResultSetMetaDataTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/ResultSetTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLClientInfoExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLDataExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLFeatureNotSupportedExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLIntegrityConstraintViolationExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLInvalidAuthorizationSpecExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLNonTransientConnectionExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLNonTransientExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLRecoverableExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLSyntaxErrorExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLTimeoutExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLTransactionRollbackExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLTransientConnectionExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLTransientExceptionTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/SQLWarningTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/StatementTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TestHelper_ClassLoader.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TestHelper_Connection1.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TestHelper_Driver1.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TestHelper_Driver2.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TestHelper_Driver3.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TestHelper_Driver4.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TestHelper_Driver5.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TestHelper_DriverManager.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TimeTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TimestampTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/java/sql/TypesTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/javax/sql/ConnectionEventTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/javax/sql/Impl_PooledConnection.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/javax/sql/Impl_RowSet.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/javax/sql/RowSetEventTest.java"
        "sql/src/test/java/org/apache/harmony/sql/tests/javax/sql/StatementEventTest.java"
        "support/src/test/java/tests/resources/subfolder/tests/resources/hyts_resource_fr_FR.java"
        "support/src/test/java/tests/support/Support_DummyPKCS12Keystore.java"
        "support/src/test/java/tests/support/Support_HttpConnector.java"
        "support/src/test/java/tests/support/Support_HttpServer.java"
        "support/src/test/java/tests/support/Support_HttpServerSocket.java"
        "support/src/test/java/tests/support/Support_HttpSocket.java"
        "support/src/test/java/tests/support/Support_Jetty.java"
        "support/src/test/java/tests/support/Support_NetworkInterface.java"
        "support/src/test/java/tests/support/Support_PlatformFile.java"
        "support/src/test/java/tests/support/Support_ProcessReadWriteTest.java"
        "support/src/test/java/tests/support/Support_ProviderJCE.java"
        "support/src/test/java/tests/support/Support_ProviderRSA.java"
        "support/src/test/java/tests/support/Support_ServerSocket.java"
        "support/src/test/java/tests/support/Support_Socket.java"
        "support/src/test/java/tests/support/Support_URLConnector.java"
        "support/src/test/java/tests/support/Support_UnmodifiableMapTest.java"
        "support/src/test/java/tests/util/CallVerificationStack.java"

        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/NonSerializablePropertyChangeListener.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/SerializableBean.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/SerializablePropertyChangeListener.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/StandardBean.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/StandardBean2.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/beancontext/mock/MockPropertyChangeListener.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/beancontext/mock/MockPropertyChangeListenerS.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/mock/MockFakeEvent.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/mock/MockPropertyChangeEvent.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/mock/MockPropertyChangeListener.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/mock/MockPropertyChangeListener2.java"
        "beans/src/test/support/java/org/apache/harmony/beans/tests/support/mock/MockPropertyChangeValidListener.java"

        "luni/src/test/api/common/Proxy2Test.java"
        "luni/src/test/api/common/org/apache/harmony/luni/tests/internal/net/www/protocol/file/FileURLConnectionTest.java"
        "luni/src/test/api/common/org/apache/harmony/luni/tests/java/net/ExcludedProxyTest.java"
        "luni/src/test/api/common/org/apache/harmony/luni/tests/java/net/URLClassLoaderTest.java"
        "luni/src/test/api/common/org/apache/harmony/luni/tests/support/A.java"
        "luni/src/test/api/common/org/apache/harmony/luni/tests/support/B.java"
        "luni/src/test/api/common/org/apache/harmony/luni/tests/support/I.java"
        "luni/src/test/api/common/org/apache/harmony/luni/tests/support/P.java"
        "luni/src/test/api/unix/org/apache/harmony/luni/tests/java/io/UnixFileTest.java"
        "luni/src/test/api/unix/org/apache/harmony/luni/tests/java/net/UnixNetworkInterfaceTest.java"
        "luni/src/test/api/unix/org/apache/harmony/luni/tests/java/net/UnixSocketTest.java"
        "luni/src/test/impl/common/org/apache/harmony/luni/tests/java/net/URLClassLoaderImplTest.java"

    ];
    java_resource_dirs = [
        "beans/src/test/resources"
        "logging/src/test/resources"
        "sql/src/test/resources"
        "support/src/test/resources"
    ];
    sdk_version = "none";
    system_modules = "core-all-system-modules";
    libs = [
        "junit"
    ];
    static_libs = [
        "core-tests-support"
    ];
    javacflags = ["-Xmaxwarns 9999999"];
    #  Pin java_version until jarjar is certified to support later versions. http://b/72703434
    java_version = "1.8";

    #  b/73499927
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };
};

in { inherit _missingName apache-harmony-tests; }
