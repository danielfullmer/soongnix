{ java_library }:
let

#
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
#

mockftpserver = java_library {
    name = "mockftpserver";
    hostdex = true;
    srcs = [
        "MockFtpServer/src/main/java/org/mockftpserver/core/CommandSyntaxException.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/IllegalStateException.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/MockFtpServerException.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/NotLoggedInException.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/AbstractCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/AbstractStaticReplyCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/AbstractTrackingCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/Command.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/CommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/CommandNames.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/ConnectCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/InvocationHistory.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/InvocationRecord.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/ReplyCodes.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/ReplyTextBundleAware.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/ReplyTextBundleUtil.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/SimpleCompositeCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/StaticReplyCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/command/UnsupportedCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/server/AbstractFtpServer.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/session/DefaultSession.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/session/Session.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/session/SessionKeys.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/socket/DefaultServerSocketFactory.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/socket/DefaultSocketFactory.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/socket/ServerSocketFactory.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/socket/SocketFactory.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/util/Assert.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/util/AssertFailedException.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/util/HostAndPort.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/util/IoUtil.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/util/PatternUtil.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/util/PortParser.java"
        "MockFtpServer/src/main/java/org/mockftpserver/core/util/StringUtil.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/FakeFtpServer.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/ServerConfiguration.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/ServerConfigurationAware.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/UserAccount.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/AborCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/AbstractFakeCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/AbstractStoreFileCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/AcctCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/AlloCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/AppeCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/CdupCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/CwdCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/DeleCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/EprtCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/EpsvCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/HelpCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/ListCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/MkdCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/ModeCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/NlstCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/NoopCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/PassCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/PasvCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/PortCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/PwdCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/QuitCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/ReinCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/RestCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/RetrCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/RmdCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/RnfrCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/RntoCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/SiteCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/SmntCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/StatCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/StorCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/StouCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/StruCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/SystCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/TypeCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/command/UserCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/AbstractFakeFileSystem.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/AbstractFileSystemEntry.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/DirectoryEntry.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/DirectoryListingFormatter.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/FileEntry.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/FileSystem.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/FileSystemEntry.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/FileSystemException.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/InvalidFilenameException.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/Permissions.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/UnixDirectoryListingFormatter.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/UnixFakeFileSystem.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/WindowsDirectoryListingFormatter.java"
        "MockFtpServer/src/main/java/org/mockftpserver/fake/filesystem/WindowsFakeFileSystem.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/StubFtpServer.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/AborCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/AbstractStorCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/AbstractStubCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/AbstractStubDataCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/AcctCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/AlloCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/AppeCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/CdupCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/CwdCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/DeleCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/EprtCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/EpsvCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/FileRetrCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/HelpCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/ListCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/MkdCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/ModeCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/NlstCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/NoopCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/PassCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/PasvCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/PortCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/PwdCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/QuitCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/ReinCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/RestCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/RetrCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/RmdCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/RnfrCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/RntoCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/SiteCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/SmntCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/StatCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/StorCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/StouCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/StruCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/SystCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/TypeCommandHandler.java"
        "MockFtpServer/src/main/java/org/mockftpserver/stub/command/UserCommandHandler.java"
    ];
    java_resource_dirs = ["MockFtpServer/src/main/resources"];

    libs = ["slf4j-jdk14"];

    sdk_version = "core_current";
};

in { inherit mockftpserver; }
