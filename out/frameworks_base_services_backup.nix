{ filegroup, java_library_static }:
let

"services.backup-sources" = filegroup {
    name = "services.backup-sources";
    srcs = [
        "java/com/android/server/backup/BackupAgentTimeoutParameters.java"
        "java/com/android/server/backup/BackupManagerConstants.java"
        "java/com/android/server/backup/BackupManagerService.java"
        "java/com/android/server/backup/BackupPasswordManager.java"
        "java/com/android/server/backup/BackupRestoreTask.java"
        "java/com/android/server/backup/DataChangedJournal.java"
        "java/com/android/server/backup/FileMetadata.java"
        "java/com/android/server/backup/FullBackupJob.java"
        "java/com/android/server/backup/JobIdManager.java"
        "java/com/android/server/backup/KeyValueAdbBackupEngine.java"
        "java/com/android/server/backup/KeyValueAdbRestoreEngine.java"
        "java/com/android/server/backup/KeyValueBackupJob.java"
        "java/com/android/server/backup/PackageManagerBackupAgent.java"
        "java/com/android/server/backup/ProcessedPackagesJournal.java"
        "java/com/android/server/backup/UserBackupManagerFilePersistedSettings.java"
        "java/com/android/server/backup/UserBackupManagerFiles.java"
        "java/com/android/server/backup/UserBackupManagerService.java"
        "java/com/android/server/backup/UserBackupPreferences.java"
        "java/com/android/server/backup/fullbackup/AppMetadataBackupWriter.java"
        "java/com/android/server/backup/fullbackup/FullBackupEngine.java"
        "java/com/android/server/backup/fullbackup/FullBackupEntry.java"
        "java/com/android/server/backup/fullbackup/FullBackupObbConnection.java"
        "java/com/android/server/backup/fullbackup/FullBackupPreflight.java"
        "java/com/android/server/backup/fullbackup/FullBackupTask.java"
        "java/com/android/server/backup/fullbackup/PerformAdbBackupTask.java"
        "java/com/android/server/backup/fullbackup/PerformFullTransportBackupTask.java"
        "java/com/android/server/backup/internal/BackupHandler.java"
        "java/com/android/server/backup/internal/ClearDataObserver.java"
        "java/com/android/server/backup/internal/OnTaskFinishedListener.java"
        "java/com/android/server/backup/internal/Operation.java"
        "java/com/android/server/backup/internal/PerformClearTask.java"
        "java/com/android/server/backup/internal/PerformInitializeTask.java"
        "java/com/android/server/backup/internal/RunInitializeReceiver.java"
        "java/com/android/server/backup/internal/SetupObserver.java"
        "java/com/android/server/backup/keyvalue/AgentException.java"
        "java/com/android/server/backup/keyvalue/BackupException.java"
        "java/com/android/server/backup/keyvalue/BackupRequest.java"
        "java/com/android/server/backup/keyvalue/KeyValueBackupReporter.java"
        "java/com/android/server/backup/keyvalue/KeyValueBackupTask.java"
        "java/com/android/server/backup/keyvalue/TaskException.java"
        "java/com/android/server/backup/params/AdbBackupParams.java"
        "java/com/android/server/backup/params/AdbParams.java"
        "java/com/android/server/backup/params/AdbRestoreParams.java"
        "java/com/android/server/backup/params/BackupParams.java"
        "java/com/android/server/backup/params/ClearParams.java"
        "java/com/android/server/backup/params/ClearRetryParams.java"
        "java/com/android/server/backup/params/RestoreGetSetsParams.java"
        "java/com/android/server/backup/params/RestoreParams.java"
        "java/com/android/server/backup/remote/FutureBackupCallback.java"
        "java/com/android/server/backup/remote/RemoteCall.java"
        "java/com/android/server/backup/remote/RemoteCallable.java"
        "java/com/android/server/backup/remote/RemoteResult.java"
        "java/com/android/server/backup/remote/ServiceBackupCallback.java"
        "java/com/android/server/backup/restore/ActiveRestoreSession.java"
        "java/com/android/server/backup/restore/AdbRestoreFinishedLatch.java"
        "java/com/android/server/backup/restore/AdbRestoreFinishedRunnable.java"
        "java/com/android/server/backup/restore/FullRestoreEngine.java"
        "java/com/android/server/backup/restore/FullRestoreEngineThread.java"
        "java/com/android/server/backup/restore/PerformAdbRestoreTask.java"
        "java/com/android/server/backup/restore/PerformUnifiedRestoreTask.java"
        "java/com/android/server/backup/restore/RestoreDeleteObserver.java"
        "java/com/android/server/backup/restore/RestoreEngine.java"
        "java/com/android/server/backup/restore/RestoreFileRunnable.java"
        "java/com/android/server/backup/restore/RestorePolicy.java"
        "java/com/android/server/backup/restore/UnifiedRestoreState.java"
        "java/com/android/server/backup/utils/AppBackupUtils.java"
        "java/com/android/server/backup/utils/BackupManagerMonitorUtils.java"
        "java/com/android/server/backup/utils/BackupObserverUtils.java"
        "java/com/android/server/backup/utils/BytesReadListener.java"
        "java/com/android/server/backup/utils/DataStreamCodec.java"
        "java/com/android/server/backup/utils/DataStreamFileCodec.java"
        "java/com/android/server/backup/utils/FileUtils.java"
        "java/com/android/server/backup/utils/FullBackupRestoreObserverUtils.java"
        "java/com/android/server/backup/utils/FullBackupUtils.java"
        "java/com/android/server/backup/utils/PasswordUtils.java"
        "java/com/android/server/backup/utils/RandomAccessFileUtils.java"
        "java/com/android/server/backup/utils/RestoreUtils.java"
        "java/com/android/server/backup/utils/SparseArrayUtils.java"
        "java/com/android/server/backup/utils/TarBackupReader.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.backup" = java_library_static {
    name = "services.backup";
    defaults = ["services_defaults"];
    srcs = [":services.backup-sources"];
    libs = ["services.core"];
    static_libs = ["backuplib"];
};

in { inherit "services.backup" "services.backup-sources"; }
