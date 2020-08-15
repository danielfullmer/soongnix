{ android_library }:
let

#
#  Build the setup design library.
#

setupdesign = android_library {
    name = "setupdesign";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.appcompat_appcompat"
        "androidx.recyclerview_recyclerview"
        "setupcompat"
        "setupdesign-strings"
    ];
    manifest = "main/AndroidManifest.xml";
    resource_dirs = [
        "main/res"
    ];
    sdk_version = "current";
    srcs = [
        "main/src/com/google/android/setupdesign/DividerItemDecoration.java"
        "main/src/com/google/android/setupdesign/GlifLayout.java"
        "main/src/com/google/android/setupdesign/GlifListLayout.java"
        "main/src/com/google/android/setupdesign/GlifPatternDrawable.java"
        "main/src/com/google/android/setupdesign/GlifPreferenceLayout.java"
        "main/src/com/google/android/setupdesign/GlifRecyclerLayout.java"
        "main/src/com/google/android/setupdesign/SetupWizardItemsLayout.java"
        "main/src/com/google/android/setupdesign/SetupWizardLayout.java"
        "main/src/com/google/android/setupdesign/SetupWizardListLayout.java"
        "main/src/com/google/android/setupdesign/SetupWizardPreferenceLayout.java"
        "main/src/com/google/android/setupdesign/SetupWizardRecyclerLayout.java"
        "main/src/com/google/android/setupdesign/gesture/ConsecutiveTapsGestureDetector.java"
        "main/src/com/google/android/setupdesign/items/AbstractItem.java"
        "main/src/com/google/android/setupdesign/items/AbstractItemHierarchy.java"
        "main/src/com/google/android/setupdesign/items/ButtonBarItem.java"
        "main/src/com/google/android/setupdesign/items/ButtonItem.java"
        "main/src/com/google/android/setupdesign/items/DescriptionItem.java"
        "main/src/com/google/android/setupdesign/items/Dividable.java"
        "main/src/com/google/android/setupdesign/items/ExpandableSwitchItem.java"
        "main/src/com/google/android/setupdesign/items/IItem.java"
        "main/src/com/google/android/setupdesign/items/Item.java"
        "main/src/com/google/android/setupdesign/items/ItemAdapter.java"
        "main/src/com/google/android/setupdesign/items/ItemGroup.java"
        "main/src/com/google/android/setupdesign/items/ItemHierarchy.java"
        "main/src/com/google/android/setupdesign/items/ItemInflater.java"
        "main/src/com/google/android/setupdesign/items/ItemViewHolder.java"
        "main/src/com/google/android/setupdesign/items/ProgressBarItem.java"
        "main/src/com/google/android/setupdesign/items/RecyclerItemAdapter.java"
        "main/src/com/google/android/setupdesign/items/ReflectionInflater.java"
        "main/src/com/google/android/setupdesign/items/SimpleInflater.java"
        "main/src/com/google/android/setupdesign/items/SwitchItem.java"
        "main/src/com/google/android/setupdesign/span/LinkSpan.java"
        "main/src/com/google/android/setupdesign/span/SpanHelper.java"
        "main/src/com/google/android/setupdesign/template/HeaderMixin.java"
        "main/src/com/google/android/setupdesign/template/IconMixin.java"
        "main/src/com/google/android/setupdesign/template/ListMixin.java"
        "main/src/com/google/android/setupdesign/template/ListViewScrollHandlingDelegate.java"
        "main/src/com/google/android/setupdesign/template/NavigationBarMixin.java"
        "main/src/com/google/android/setupdesign/template/ProgressBarMixin.java"
        "main/src/com/google/android/setupdesign/template/RecyclerMixin.java"
        "main/src/com/google/android/setupdesign/template/RecyclerViewScrollHandlingDelegate.java"
        "main/src/com/google/android/setupdesign/template/RequireScrollMixin.java"
        "main/src/com/google/android/setupdesign/template/ScrollViewScrollHandlingDelegate.java"
        "main/src/com/google/android/setupdesign/util/DescriptionStyler.java"
        "main/src/com/google/android/setupdesign/util/DrawableLayoutDirectionHelper.java"
        "main/src/com/google/android/setupdesign/util/LinkAccessibilityHelper.java"
        "main/src/com/google/android/setupdesign/util/Partner.java"
        "main/src/com/google/android/setupdesign/util/PartnerStyleHelper.java"
        "main/src/com/google/android/setupdesign/util/ThemeHelper.java"
        "main/src/com/google/android/setupdesign/util/ThemeResolver.java"
        "main/src/com/google/android/setupdesign/view/BottomScrollView.java"
        "main/src/com/google/android/setupdesign/view/CheckableLinearLayout.java"
        "main/src/com/google/android/setupdesign/view/FillContentLayout.java"
        "main/src/com/google/android/setupdesign/view/HeaderRecyclerView.java"
        "main/src/com/google/android/setupdesign/view/Illustration.java"
        "main/src/com/google/android/setupdesign/view/IllustrationVideoView.java"
        "main/src/com/google/android/setupdesign/view/IntrinsicSizeFrameLayout.java"
        "main/src/com/google/android/setupdesign/view/NavigationBar.java"
        "main/src/com/google/android/setupdesign/view/NavigationBarButton.java"
        "main/src/com/google/android/setupdesign/view/RichTextView.java"
        "main/src/com/google/android/setupdesign/view/StickyHeaderListView.java"
        "main/src/com/google/android/setupdesign/view/StickyHeaderRecyclerView.java"
        "main/src/com/google/android/setupdesign/view/StickyHeaderScrollView.java"
        "main/src/com/google/android/setupdesign/view/TouchableMovementMethod.java"
    ];
    min_sdk_version = "14";
};

#
#  Strings that will not exposing.
#  If app requires these strings, please copy the string definitions directly.
#

setupdesign-strings = android_library {
    name = "setupdesign-strings";
    manifest = "main/AndroidManifest.xml";
    resource_dirs = [
        "strings/res"
    ];
    min_sdk_version = "14";
};

in { inherit setupdesign setupdesign-strings; }
