{ android_library }:
let

#
#  Build the platform version of setup wizard library.
#

setup-wizard-lib = android_library {
    name = "setup-wizard-lib";

    libs = ["androidx.annotation_annotation"];
    manifest = "main/AndroidManifest.xml";
    resource_dirs = [
        "main/res"
        "platform/res"
    ];
    sdk_version = "current";
    srcs = [
        "main/src/com/android/setupwizardlib/GlifLayout.java"
        "main/src/com/android/setupwizardlib/GlifListLayout.java"
        "main/src/com/android/setupwizardlib/GlifPatternDrawable.java"
        "main/src/com/android/setupwizardlib/SetupWizardItemsLayout.java"
        "main/src/com/android/setupwizardlib/SetupWizardLayout.java"
        "main/src/com/android/setupwizardlib/SetupWizardListLayout.java"
        "main/src/com/android/setupwizardlib/TemplateLayout.java"
        "main/src/com/android/setupwizardlib/gesture/ConsecutiveTapsGestureDetector.java"
        "main/src/com/android/setupwizardlib/items/AbstractItem.java"
        "main/src/com/android/setupwizardlib/items/AbstractItemHierarchy.java"
        "main/src/com/android/setupwizardlib/items/ButtonBarItem.java"
        "main/src/com/android/setupwizardlib/items/ButtonItem.java"
        "main/src/com/android/setupwizardlib/items/IItem.java"
        "main/src/com/android/setupwizardlib/items/Item.java"
        "main/src/com/android/setupwizardlib/items/ItemAdapter.java"
        "main/src/com/android/setupwizardlib/items/ItemGroup.java"
        "main/src/com/android/setupwizardlib/items/ItemHierarchy.java"
        "main/src/com/android/setupwizardlib/items/ItemInflater.java"
        "main/src/com/android/setupwizardlib/items/ReflectionInflater.java"
        "main/src/com/android/setupwizardlib/items/SimpleInflater.java"
        "main/src/com/android/setupwizardlib/span/LinkSpan.java"
        "main/src/com/android/setupwizardlib/span/SpanHelper.java"
        "main/src/com/android/setupwizardlib/template/ButtonFooterMixin.java"
        "main/src/com/android/setupwizardlib/template/ColoredHeaderMixin.java"
        "main/src/com/android/setupwizardlib/template/HeaderMixin.java"
        "main/src/com/android/setupwizardlib/template/IconMixin.java"
        "main/src/com/android/setupwizardlib/template/ListMixin.java"
        "main/src/com/android/setupwizardlib/template/ListViewScrollHandlingDelegate.java"
        "main/src/com/android/setupwizardlib/template/Mixin.java"
        "main/src/com/android/setupwizardlib/template/NavigationBarMixin.java"
        "main/src/com/android/setupwizardlib/template/ProgressBarMixin.java"
        "main/src/com/android/setupwizardlib/template/RequireScrollMixin.java"
        "main/src/com/android/setupwizardlib/template/ScrollViewScrollHandlingDelegate.java"
        "main/src/com/android/setupwizardlib/util/DrawableLayoutDirectionHelper.java"
        "main/src/com/android/setupwizardlib/util/FallbackThemeWrapper.java"
        "main/src/com/android/setupwizardlib/util/Partner.java"
        "main/src/com/android/setupwizardlib/util/ResultCodes.java"
        "main/src/com/android/setupwizardlib/util/SystemBarHelper.java"
        "main/src/com/android/setupwizardlib/util/ThemeResolver.java"
        "main/src/com/android/setupwizardlib/util/WizardManagerHelper.java"
        "main/src/com/android/setupwizardlib/view/BottomScrollView.java"
        "main/src/com/android/setupwizardlib/view/ButtonBarLayout.java"
        "main/src/com/android/setupwizardlib/view/CheckableLinearLayout.java"
        "main/src/com/android/setupwizardlib/view/FillContentLayout.java"
        "main/src/com/android/setupwizardlib/view/Illustration.java"
        "main/src/com/android/setupwizardlib/view/IllustrationVideoView.java"
        "main/src/com/android/setupwizardlib/view/IntrinsicSizeFrameLayout.java"
        "main/src/com/android/setupwizardlib/view/NavigationBar.java"
        "main/src/com/android/setupwizardlib/view/StatusBarBackgroundLayout.java"
        "main/src/com/android/setupwizardlib/view/StickyHeaderListView.java"
        "main/src/com/android/setupwizardlib/view/StickyHeaderScrollView.java"
        "main/src/com/android/setupwizardlib/view/TouchableMovementMethod.java"
        "platform/src/com/android/setupwizardlib/view/NavigationBarButton.java"
        "platform/src/com/android/setupwizardlib/view/RichTextView.java"
    ];
    min_sdk_version = "23";
};

#
#  Build gingerbread-compat library, which uses AppCompat support library to provide backwards
#  compatibility back to SDK v9.
#

setup-wizard-lib-gingerbread-compat = android_library {
    name = "setup-wizard-lib-gingerbread-compat";
    manifest = "main/AndroidManifest.xml";
    resource_dirs = [
        "main/res"
        "gingerbread/res"
        "recyclerview/res"
    ];
    sdk_version = "current";
    srcs = [
        "main/src/com/android/setupwizardlib/GlifLayout.java"
        "main/src/com/android/setupwizardlib/GlifListLayout.java"
        "main/src/com/android/setupwizardlib/GlifPatternDrawable.java"
        "main/src/com/android/setupwizardlib/SetupWizardItemsLayout.java"
        "main/src/com/android/setupwizardlib/SetupWizardLayout.java"
        "main/src/com/android/setupwizardlib/SetupWizardListLayout.java"
        "main/src/com/android/setupwizardlib/TemplateLayout.java"
        "main/src/com/android/setupwizardlib/gesture/ConsecutiveTapsGestureDetector.java"
        "main/src/com/android/setupwizardlib/items/AbstractItem.java"
        "main/src/com/android/setupwizardlib/items/AbstractItemHierarchy.java"
        "main/src/com/android/setupwizardlib/items/ButtonBarItem.java"
        "main/src/com/android/setupwizardlib/items/ButtonItem.java"
        "main/src/com/android/setupwizardlib/items/IItem.java"
        "main/src/com/android/setupwizardlib/items/Item.java"
        "main/src/com/android/setupwizardlib/items/ItemAdapter.java"
        "main/src/com/android/setupwizardlib/items/ItemGroup.java"
        "main/src/com/android/setupwizardlib/items/ItemHierarchy.java"
        "main/src/com/android/setupwizardlib/items/ItemInflater.java"
        "main/src/com/android/setupwizardlib/items/ReflectionInflater.java"
        "main/src/com/android/setupwizardlib/items/SimpleInflater.java"
        "main/src/com/android/setupwizardlib/span/LinkSpan.java"
        "main/src/com/android/setupwizardlib/span/SpanHelper.java"
        "main/src/com/android/setupwizardlib/template/ButtonFooterMixin.java"
        "main/src/com/android/setupwizardlib/template/ColoredHeaderMixin.java"
        "main/src/com/android/setupwizardlib/template/HeaderMixin.java"
        "main/src/com/android/setupwizardlib/template/IconMixin.java"
        "main/src/com/android/setupwizardlib/template/ListMixin.java"
        "main/src/com/android/setupwizardlib/template/ListViewScrollHandlingDelegate.java"
        "main/src/com/android/setupwizardlib/template/Mixin.java"
        "main/src/com/android/setupwizardlib/template/NavigationBarMixin.java"
        "main/src/com/android/setupwizardlib/template/ProgressBarMixin.java"
        "main/src/com/android/setupwizardlib/template/RequireScrollMixin.java"
        "main/src/com/android/setupwizardlib/template/ScrollViewScrollHandlingDelegate.java"
        "main/src/com/android/setupwizardlib/util/DrawableLayoutDirectionHelper.java"
        "main/src/com/android/setupwizardlib/util/FallbackThemeWrapper.java"
        "main/src/com/android/setupwizardlib/util/Partner.java"
        "main/src/com/android/setupwizardlib/util/ResultCodes.java"
        "main/src/com/android/setupwizardlib/util/SystemBarHelper.java"
        "main/src/com/android/setupwizardlib/util/ThemeResolver.java"
        "main/src/com/android/setupwizardlib/util/WizardManagerHelper.java"
        "main/src/com/android/setupwizardlib/view/BottomScrollView.java"
        "main/src/com/android/setupwizardlib/view/ButtonBarLayout.java"
        "main/src/com/android/setupwizardlib/view/CheckableLinearLayout.java"
        "main/src/com/android/setupwizardlib/view/FillContentLayout.java"
        "main/src/com/android/setupwizardlib/view/Illustration.java"
        "main/src/com/android/setupwizardlib/view/IllustrationVideoView.java"
        "main/src/com/android/setupwizardlib/view/IntrinsicSizeFrameLayout.java"
        "main/src/com/android/setupwizardlib/view/NavigationBar.java"
        "main/src/com/android/setupwizardlib/view/StatusBarBackgroundLayout.java"
        "main/src/com/android/setupwizardlib/view/StickyHeaderListView.java"
        "main/src/com/android/setupwizardlib/view/StickyHeaderScrollView.java"
        "main/src/com/android/setupwizardlib/view/TouchableMovementMethod.java"
        "gingerbread/src/com/android/setupwizardlib/items/ExpandableSwitchItem.java"
        "gingerbread/src/com/android/setupwizardlib/items/SwitchItem.java"
        "gingerbread/src/com/android/setupwizardlib/util/LinkAccessibilityHelper.java"
        "gingerbread/src/com/android/setupwizardlib/view/NavigationBarButton.java"
        "gingerbread/src/com/android/setupwizardlib/view/RichTextView.java"
        "recyclerview/src/com/android/setupwizardlib/DividerItemDecoration.java"
        "recyclerview/src/com/android/setupwizardlib/GlifPreferenceLayout.java"
        "recyclerview/src/com/android/setupwizardlib/GlifRecyclerLayout.java"
        "recyclerview/src/com/android/setupwizardlib/SetupWizardPreferenceLayout.java"
        "recyclerview/src/com/android/setupwizardlib/SetupWizardRecyclerLayout.java"
        "recyclerview/src/com/android/setupwizardlib/items/ItemViewHolder.java"
        "recyclerview/src/com/android/setupwizardlib/items/RecyclerItemAdapter.java"
        "recyclerview/src/com/android/setupwizardlib/template/RecyclerMixin.java"
        "recyclerview/src/com/android/setupwizardlib/template/RecyclerViewScrollHandlingDelegate.java"
        "recyclerview/src/com/android/setupwizardlib/view/HeaderRecyclerView.java"
        "recyclerview/src/com/android/setupwizardlib/view/StickyHeaderRecyclerView.java"
    ];

    libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.appcompat_appcompat"
        "androidx.recyclerview_recyclerview"
    ];

    min_sdk_version = "14";
};

in { inherit setup-wizard-lib setup-wizard-lib-gingerbread-compat; }
