{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsDatabaseTestCases = android_test {
    name = "CtsDatabaseTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "compatibility-device-util-axt"
        "android-common"
        "ctstestrunner-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "junit"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/database/cts/AbstractCursorTest.java"
        "src/android/database/cts/AbstractCursor_SelfContentObserverTest.java"
        "src/android/database/cts/AbstractWindowedCursorTest.java"
        "src/android/database/cts/CharArrayBufferTest.java"
        "src/android/database/cts/ContentObservableTest.java"
        "src/android/database/cts/ContentObserverTest.java"
        "src/android/database/cts/CursorIndexOutOfBoundsExceptionTest.java"
        "src/android/database/cts/CursorJoinerTest.java"
        "src/android/database/cts/CursorWindowTest.java"
        "src/android/database/cts/CursorWrapperTest.java"
        "src/android/database/cts/DataSetObservableTest.java"
        "src/android/database/cts/DataSetObserverTest.java"
        "src/android/database/cts/DatabaseCursorTest.java"
        "src/android/database/cts/DatabaseUtilsTest.java"
        "src/android/database/cts/DatabaseUtils_InsertHelperTest.java"
        "src/android/database/cts/MatrixCursorTest.java"
        "src/android/database/cts/MatrixCursor_RowBuilderTest.java"
        "src/android/database/cts/MergeCursorTest.java"
        "src/android/database/cts/ObservableTest.java"
        "src/android/database/cts/SQLExceptionTest.java"
        "src/android/database/cts/SQLiteCantOpenDatabaseExceptionTest.java"
        "src/android/database/cts/StaleDataExceptionTest.java"
        "src/android/database/sqlite/cts/DatabaseStatementTest.java"
        "src/android/database/sqlite/cts/DatabaseTestUtils.java"
        "src/android/database/sqlite/cts/SQLiteAbortExceptionTest.java"
        "src/android/database/sqlite/cts/SQLiteClosableTest.java"
        "src/android/database/sqlite/cts/SQLiteConstraintExceptionTest.java"
        "src/android/database/sqlite/cts/SQLiteCursorTest.java"
        "src/android/database/sqlite/cts/SQLiteDatabaseCorruptExceptionTest.java"
        "src/android/database/sqlite/cts/SQLiteDatabaseTest.java"
        "src/android/database/sqlite/cts/SQLiteDiskIOExceptionTest.java"
        "src/android/database/sqlite/cts/SQLiteDoneExceptionTest.java"
        "src/android/database/sqlite/cts/SQLiteExceptionTest.java"
        "src/android/database/sqlite/cts/SQLiteFtsTest.java"
        "src/android/database/sqlite/cts/SQLiteFullExceptionTest.java"
        "src/android/database/sqlite/cts/SQLiteMisuseExceptionTest.java"
        "src/android/database/sqlite/cts/SQLiteOpenHelperTest.java"
        "src/android/database/sqlite/cts/SQLiteProgramTest.java"
        "src/android/database/sqlite/cts/SQLiteQueryBuilderTest.java"
        "src/android/database/sqlite/cts/SQLiteQueryTest.java"
        "src/android/database/sqlite/cts/SQLiteSecurityTest.java"
        "src/android/database/sqlite/cts/SQLiteStatementTest.java"
        "src/android/database/sqlite/cts/SQLiteWalTest.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    #  Enforce public / test api only
    sdk_version = "test_current";
};

in { inherit CtsDatabaseTestCases; }
