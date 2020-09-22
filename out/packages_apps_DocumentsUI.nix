{ android_app, android_library, filegroup, genrule, java_defaults, java_library, platform_compat_config }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

documentsui_defaults = java_defaults {
    name = "documentsui_defaults";

    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.legacy_legacy-support-v13"
        "androidx.legacy_legacy-support-v4"
        "androidx.recyclerview_recyclerview"
        "androidx.recyclerview_recyclerview-selection"
        "androidx.transition_transition"
        "apache-commons-compress"
        "com.google.android.material_material"
        "guava"
    ];

    libs = [
        "app-compat-annotations"
    ];

    privileged = true;

    certificate = "platform";

    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };

    sdk_version = "system_current";
    min_sdk_version = "29";

    plugins = [
        "java_api_finder"
    ];
};

documents-ui-compat-config = platform_compat_config {
    name = "documents-ui-compat-config";
    src = ":DocumentsUI";
};

DocumentsUI-srcs = filegroup {
    name = "DocumentsUI-srcs";
    srcs = [
        "src/com/android/documentsui/AbstractActionHandler.java"
        "src/com/android/documentsui/AbstractDragHost.java"
        "src/com/android/documentsui/ActionHandler.java"
        "src/com/android/documentsui/ActionModeAddons.java"
        "src/com/android/documentsui/ActionModeController.java"
        "src/com/android/documentsui/ActivityConfig.java"
        "src/com/android/documentsui/BaseActivity.java"
        "src/com/android/documentsui/BreadcrumbHolder.java"
        "src/com/android/documentsui/ContentLock.java"
        "src/com/android/documentsui/CreateDirectoryFragment.java"
        "src/com/android/documentsui/CrossProfileException.java"
        "src/com/android/documentsui/CrossProfileNoPermissionException.java"
        "src/com/android/documentsui/CrossProfileQuietModeException.java"
        "src/com/android/documentsui/DevicePolicyMetricConsts.java"
        "src/com/android/documentsui/DirectoryLoader.java"
        "src/com/android/documentsui/DirectoryResult.java"
        "src/com/android/documentsui/DocsSelectionHelper.java"
        "src/com/android/documentsui/DocumentsAccess.java"
        "src/com/android/documentsui/DocumentsApplication.java"
        "src/com/android/documentsui/DragAndDropManager.java"
        "src/com/android/documentsui/DragHoverListener.java"
        "src/com/android/documentsui/DragOverTextView.java"
        "src/com/android/documentsui/DragShadowBuilder.java"
        "src/com/android/documentsui/DrawerController.java"
        "src/com/android/documentsui/DropBadgeView.java"
        "src/com/android/documentsui/DummyProfileTabsAddons.java"
        "src/com/android/documentsui/DummySelectionTracker.java"
        "src/com/android/documentsui/FileTypeMap.java"
        "src/com/android/documentsui/FocusManager.java"
        "src/com/android/documentsui/GlobalSearchLoader.java"
        "src/com/android/documentsui/GridItemThumbnail.java"
        "src/com/android/documentsui/HorizontalBreadcrumb.java"
        "src/com/android/documentsui/IconUtils.java"
        "src/com/android/documentsui/Injector.java"
        "src/com/android/documentsui/ItemDragListener.java"
        "src/com/android/documentsui/LoadDocStackTask.java"
        "src/com/android/documentsui/LockingContentObserver.java"
        "src/com/android/documentsui/MenuManager.java"
        "src/com/android/documentsui/MetricConsts.java"
        "src/com/android/documentsui/Metrics.java"
        "src/com/android/documentsui/Model.java"
        "src/com/android/documentsui/ModelId.java"
        "src/com/android/documentsui/MultiRootDocumentsLoader.java"
        "src/com/android/documentsui/NavigationViewManager.java"
        "src/com/android/documentsui/OperationDialogFragment.java"
        "src/com/android/documentsui/PackageReceiver.java"
        "src/com/android/documentsui/PreBootReceiver.java"
        "src/com/android/documentsui/ProfileTabs.java"
        "src/com/android/documentsui/ProfileTabsAddons.java"
        "src/com/android/documentsui/ProfileTabsController.java"
        "src/com/android/documentsui/ProviderExecutor.java"
        "src/com/android/documentsui/RecentsLoader.java"
        "src/com/android/documentsui/RefreshTask.java"
        "src/com/android/documentsui/RequestQuietModeDisabledTask.java"
        "src/com/android/documentsui/RootsMonitor.java"
        "src/com/android/documentsui/ScopedAccessActivity.java"
        "src/com/android/documentsui/ScopedAccessMetrics.java"
        "src/com/android/documentsui/SharedInputHandler.java"
        "src/com/android/documentsui/ShortcutsUpdater.java"
        "src/com/android/documentsui/ThumbnailCache.java"
        "src/com/android/documentsui/ThumbnailLoader.java"
        "src/com/android/documentsui/TimeoutTask.java"
        "src/com/android/documentsui/UserIdManager.java"
        "src/com/android/documentsui/UserPackage.java"
        "src/com/android/documentsui/ViewAutoScroller.java"
        "src/com/android/documentsui/archives/Archive.java"
        "src/com/android/documentsui/archives/ArchiveEntryInputStream.java"
        "src/com/android/documentsui/archives/ArchiveHandle.java"
        "src/com/android/documentsui/archives/ArchiveId.java"
        "src/com/android/documentsui/archives/ArchiveRegistry.java"
        "src/com/android/documentsui/archives/ArchivesProvider.java"
        "src/com/android/documentsui/archives/Loader.java"
        "src/com/android/documentsui/archives/MetadataReader.java"
        "src/com/android/documentsui/archives/Proxy.java"
        "src/com/android/documentsui/archives/ReadableArchive.java"
        "src/com/android/documentsui/archives/WriteableArchive.java"
        "src/com/android/documentsui/base/ApplicationScope.java"
        "src/com/android/documentsui/base/BooleanConsumer.java"
        "src/com/android/documentsui/base/CheckedTask.java"
        "src/com/android/documentsui/base/ConfirmationCallback.java"
        "src/com/android/documentsui/base/DebugFlags.java"
        "src/com/android/documentsui/base/DebugHelper.java"
        "src/com/android/documentsui/base/Display.java"
        "src/com/android/documentsui/base/DocumentFilters.java"
        "src/com/android/documentsui/base/DocumentInfo.java"
        "src/com/android/documentsui/base/DocumentStack.java"
        "src/com/android/documentsui/base/DummyLookup.java"
        "src/com/android/documentsui/base/Durable.java"
        "src/com/android/documentsui/base/DurableUtils.java"
        "src/com/android/documentsui/base/EventHandler.java"
        "src/com/android/documentsui/base/EventListener.java"
        "src/com/android/documentsui/base/Events.java"
        "src/com/android/documentsui/base/Features.java"
        "src/com/android/documentsui/base/Files.java"
        "src/com/android/documentsui/base/FilteringCursorWrapper.java"
        "src/com/android/documentsui/base/Lookup.java"
        "src/com/android/documentsui/base/LookupApplicationName.java"
        "src/com/android/documentsui/base/Menus.java"
        "src/com/android/documentsui/base/MimeTypes.java"
        "src/com/android/documentsui/base/PairedTask.java"
        "src/com/android/documentsui/base/Procedure.java"
        "src/com/android/documentsui/base/Providers.java"
        "src/com/android/documentsui/base/RootInfo.java"
        "src/com/android/documentsui/base/Shared.java"
        "src/com/android/documentsui/base/SharedMinimal.java"
        "src/com/android/documentsui/base/State.java"
        "src/com/android/documentsui/base/UserId.java"
        "src/com/android/documentsui/clipping/ClipStorage.java"
        "src/com/android/documentsui/clipping/ClipStorageReader.java"
        "src/com/android/documentsui/clipping/ClipStore.java"
        "src/com/android/documentsui/clipping/DocumentClipper.java"
        "src/com/android/documentsui/clipping/RuntimeDocumentClipper.java"
        "src/com/android/documentsui/clipping/UrisSupplier.java"
        "src/com/android/documentsui/dirlist/AccessibilityEventRouter.java"
        "src/com/android/documentsui/dirlist/AnimationView.java"
        "src/com/android/documentsui/dirlist/AppsRowItemData.java"
        "src/com/android/documentsui/dirlist/AppsRowManager.java"
        "src/com/android/documentsui/dirlist/DirectoryAddonsAdapter.java"
        "src/com/android/documentsui/dirlist/DirectoryDragListener.java"
        "src/com/android/documentsui/dirlist/DirectoryFragment.java"
        "src/com/android/documentsui/dirlist/DirectoryItemAnimator.java"
        "src/com/android/documentsui/dirlist/DirectoryState.java"
        "src/com/android/documentsui/dirlist/DocsItemDetailsLookup.java"
        "src/com/android/documentsui/dirlist/DocsSelectionPredicate.java"
        "src/com/android/documentsui/dirlist/DocsStableIdProvider.java"
        "src/com/android/documentsui/dirlist/DocumentHolder.java"
        "src/com/android/documentsui/dirlist/DocumentItemDetails.java"
        "src/com/android/documentsui/dirlist/DocumentsAdapter.java"
        "src/com/android/documentsui/dirlist/DocumentsSwipeRefreshLayout.java"
        "src/com/android/documentsui/dirlist/DragHost.java"
        "src/com/android/documentsui/dirlist/DragStartListener.java"
        "src/com/android/documentsui/dirlist/FocusHandler.java"
        "src/com/android/documentsui/dirlist/GridDirectoryHolder.java"
        "src/com/android/documentsui/dirlist/GridDocumentHolder.java"
        "src/com/android/documentsui/dirlist/GridPhotoHolder.java"
        "src/com/android/documentsui/dirlist/HeaderMessageDocumentHolder.java"
        "src/com/android/documentsui/dirlist/IconHelper.java"
        "src/com/android/documentsui/dirlist/InflateMessageDocumentHolder.java"
        "src/com/android/documentsui/dirlist/InputHandlers.java"
        "src/com/android/documentsui/dirlist/KeyInputHandler.java"
        "src/com/android/documentsui/dirlist/KeyboardEventListener.java"
        "src/com/android/documentsui/dirlist/ListDocumentHolder.java"
        "src/com/android/documentsui/dirlist/Message.java"
        "src/com/android/documentsui/dirlist/MessageHolder.java"
        "src/com/android/documentsui/dirlist/ModelBackedDocumentsAdapter.java"
        "src/com/android/documentsui/dirlist/RefreshHelper.java"
        "src/com/android/documentsui/dirlist/RenameDocumentFragment.java"
        "src/com/android/documentsui/dirlist/ScaleHelper.java"
        "src/com/android/documentsui/dirlist/SelectionMetadata.java"
        "src/com/android/documentsui/dirlist/TransparentDividerDocumentHolder.java"
        "src/com/android/documentsui/files/ActionHandler.java"
        "src/com/android/documentsui/files/ActivityInputHandler.java"
        "src/com/android/documentsui/files/Config.java"
        "src/com/android/documentsui/files/DeleteDocumentFragment.java"
        "src/com/android/documentsui/files/FilesActivity.java"
        "src/com/android/documentsui/files/LauncherActivity.java"
        "src/com/android/documentsui/files/MenuManager.java"
        "src/com/android/documentsui/files/QuickViewIntentBuilder.java"
        "src/com/android/documentsui/inspector/DateUtils.java"
        "src/com/android/documentsui/inspector/DebugView.java"
        "src/com/android/documentsui/inspector/DetailsView.java"
        "src/com/android/documentsui/inspector/GpsCoordinatesTextClassifier.java"
        "src/com/android/documentsui/inspector/HeaderTextSelector.java"
        "src/com/android/documentsui/inspector/HeaderView.java"
        "src/com/android/documentsui/inspector/InspectorActivity.java"
        "src/com/android/documentsui/inspector/InspectorController.java"
        "src/com/android/documentsui/inspector/KeyValueRow.java"
        "src/com/android/documentsui/inspector/MediaView.java"
        "src/com/android/documentsui/inspector/MetadataLoader.java"
        "src/com/android/documentsui/inspector/MetadataUtils.java"
        "src/com/android/documentsui/inspector/RuntimeDataSupplier.java"
        "src/com/android/documentsui/inspector/TableView.java"
        "src/com/android/documentsui/inspector/actions/Action.java"
        "src/com/android/documentsui/inspector/actions/ActionView.java"
        "src/com/android/documentsui/inspector/actions/ClearDefaultAppAction.java"
        "src/com/android/documentsui/inspector/actions/ShowInProviderAction.java"
        "src/com/android/documentsui/picker/ActionHandler.java"
        "src/com/android/documentsui/picker/Config.java"
        "src/com/android/documentsui/picker/ConfirmFragment.java"
        "src/com/android/documentsui/picker/CreatePickedDocumentTask.java"
        "src/com/android/documentsui/picker/LastAccessedProvider.java"
        "src/com/android/documentsui/picker/LastAccessedStorage.java"
        "src/com/android/documentsui/picker/LoadLastAccessedStackTask.java"
        "src/com/android/documentsui/picker/MenuManager.java"
        "src/com/android/documentsui/picker/PickActivity.java"
        "src/com/android/documentsui/picker/PickCountRecordProvider.java"
        "src/com/android/documentsui/picker/PickCountRecordStorage.java"
        "src/com/android/documentsui/picker/PickFragment.java"
        "src/com/android/documentsui/picker/PickResult.java"
        "src/com/android/documentsui/picker/SaveFragment.java"
        "src/com/android/documentsui/picker/SetLastAccessedStackTask.java"
        "src/com/android/documentsui/picker/UpdatePickResultTask.java"
        "src/com/android/documentsui/prefs/BackupAgent.java"
        "src/com/android/documentsui/prefs/LocalPreferences.java"
        "src/com/android/documentsui/prefs/PreferencesMonitor.java"
        "src/com/android/documentsui/prefs/PrefsBackupHelper.java"
        "src/com/android/documentsui/queries/CommandInterceptor.java"
        "src/com/android/documentsui/queries/SearchChipData.java"
        "src/com/android/documentsui/queries/SearchChipViewManager.java"
        "src/com/android/documentsui/queries/SearchFragment.java"
        "src/com/android/documentsui/queries/SearchHistoryManager.java"
        "src/com/android/documentsui/queries/SearchViewManager.java"
        "src/com/android/documentsui/roots/BootReceiver.java"
        "src/com/android/documentsui/roots/GetRootDocumentTask.java"
        "src/com/android/documentsui/roots/LoadFirstRootTask.java"
        "src/com/android/documentsui/roots/LoadRootTask.java"
        "src/com/android/documentsui/roots/ProvidersAccess.java"
        "src/com/android/documentsui/roots/ProvidersCache.java"
        "src/com/android/documentsui/roots/RootCursorWrapper.java"
        "src/com/android/documentsui/roots/RootsLoader.java"
        "src/com/android/documentsui/services/CompressJob.java"
        "src/com/android/documentsui/services/CopyJob.java"
        "src/com/android/documentsui/services/DeleteJob.java"
        "src/com/android/documentsui/services/FileOperation.java"
        "src/com/android/documentsui/services/FileOperationService.java"
        "src/com/android/documentsui/services/FileOperations.java"
        "src/com/android/documentsui/services/Job.java"
        "src/com/android/documentsui/services/MoveJob.java"
        "src/com/android/documentsui/services/ResolvedResourcesJob.java"
        "src/com/android/documentsui/services/ResourceException.java"
        "src/com/android/documentsui/sidebar/AppItem.java"
        "src/com/android/documentsui/sidebar/DragHost.java"
        "src/com/android/documentsui/sidebar/EjectRootTask.java"
        "src/com/android/documentsui/sidebar/HeaderItem.java"
        "src/com/android/documentsui/sidebar/Item.java"
        "src/com/android/documentsui/sidebar/ProfileItem.java"
        "src/com/android/documentsui/sidebar/RootAndAppItem.java"
        "src/com/android/documentsui/sidebar/RootItem.java"
        "src/com/android/documentsui/sidebar/RootItemListBuilder.java"
        "src/com/android/documentsui/sidebar/RootItemView.java"
        "src/com/android/documentsui/sidebar/RootsAdapter.java"
        "src/com/android/documentsui/sidebar/RootsFragment.java"
        "src/com/android/documentsui/sidebar/RootsList.java"
        "src/com/android/documentsui/sidebar/SpacerItem.java"
        "src/com/android/documentsui/sidebar/UserItemsCombiner.java"
        "src/com/android/documentsui/sorting/HeaderCell.java"
        "src/com/android/documentsui/sorting/SortController.java"
        "src/com/android/documentsui/sorting/SortDimension.java"
        "src/com/android/documentsui/sorting/SortListFragment.java"
        "src/com/android/documentsui/sorting/SortModel.java"
        "src/com/android/documentsui/sorting/SortingCursorWrapper.java"
        "src/com/android/documentsui/sorting/TableHeaderController.java"
        "src/com/android/documentsui/theme/ThemeOverlayManager.java"
        "src/com/android/documentsui/ui/DialogController.java"
        "src/com/android/documentsui/ui/DocumentDebugInfo.java"
        "src/com/android/documentsui/ui/MessageBuilder.java"
        "src/com/android/documentsui/ui/OperationProgressDialog.java"
        "src/com/android/documentsui/ui/SearchBarScrollingViewBehavior.java"
        "src/com/android/documentsui/ui/Snackbars.java"
        "src/com/android/documentsui/ui/Views.java"
        "src/com/android/documentsui/util/CrossProfileUtils.java"
        "src/com/android/documentsui/util/FormatUtils.java"
        "src/com/android/documentsui/util/VersionUtils.java"
        ":statslog-docsui-java-gen"
    ];
};

docsui-statsd = java_library {
    name = "docsui-statsd";
    srcs = [
        ":statslog-docsui-java-gen"
    ];
};

statslog-docsui-java-gen = genrule {
    name = "statslog-docsui-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module docsui --javaPackage com.android.documentsui --javaClass DocumentsStatsLog --supportQ";
    out = ["com/android/documentsui/DocumentsStatsLog.java"];
};

DocumentsUI-res-lib = android_library {
    name = "DocumentsUI-res-lib";

    manifest = "AndroidManifest.xml";

    static_libs = [
        "androidx.appcompat_appcompat"
        "com.google.android.material_material"
    ];

    resource_dirs = [
        "res"
    ];

    aaptflags = [
        "--auto-add-overlay"
    ];

    sdk_version = "system_current";
    min_sdk_version = "29";
};

DocumentsUIUnitTests-res-lib = android_library {
    name = "DocumentsUIUnitTests-res-lib";

    manifest = "AndroidManifestForUnitTests.xml";

    static_libs = [
        "androidx.appcompat_appcompat"
        "com.google.android.material_material"
    ];

    resource_dirs = [
        "res"
    ];

    aaptflags = [
        "--auto-add-overlay"
    ];

    sdk_version = "system_current";
    min_sdk_version = "29";
};

DocumentsUI = android_app {
    name = "DocumentsUI";

    defaults = ["documentsui_defaults"];

    manifest = "AndroidManifest.xml";

    srcs = [
        ":DocumentsUI-srcs"
    ];

    resource_dirs = [
        "res"
    ];

    required = ["privapp_whitelist_com.android.documentsui"];

    min_sdk_version = "29";
};

in { inherit DocumentsUI DocumentsUI-res-lib DocumentsUI-srcs DocumentsUIUnitTests-res-lib docsui-statsd documents-ui-compat-config documentsui_defaults statslog-docsui-java-gen; }
