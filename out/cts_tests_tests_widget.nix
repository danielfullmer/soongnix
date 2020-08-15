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

CtsWidgetTestCases = android_test {
    name = "CtsWidgetTestCases";
    defaults = ["cts_defaults"];

    static_libs = [
        "androidx.annotation_annotation"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "android-common"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "platform-test-annotations"
        "truth-prebuilt"
    ];

    libs = ["android.test.runner.stubs"];

    srcs = [
        "src/android/widget/cts/AbsListViewTest.java"
        "src/android/widget/cts/AbsListView_LayoutParamsTest.java"
        "src/android/widget/cts/AbsListView_ScrollTest.java"
        "src/android/widget/cts/AbsSeekBarCtsActivity.java"
        "src/android/widget/cts/AbsSeekBarTest.java"
        "src/android/widget/cts/AbsSpinnerTest.java"
        "src/android/widget/cts/AbsoluteLayoutCtsActivity.java"
        "src/android/widget/cts/AbsoluteLayoutTest.java"
        "src/android/widget/cts/AbsoluteLayout_LayoutParamsTest.java"
        "src/android/widget/cts/ActionMenuViewCtsActivity.java"
        "src/android/widget/cts/ActionMenuViewTest.java"
        "src/android/widget/cts/AdapterViewCtsActivity.java"
        "src/android/widget/cts/AdapterViewTest.java"
        "src/android/widget/cts/AdapterView_AdapterContextMenuInfoTest.java"
        "src/android/widget/cts/AlphabetIndexerTest.java"
        "src/android/widget/cts/AnalogClockTest.java"
        "src/android/widget/cts/ArrayAdapterTest.java"
        "src/android/widget/cts/AttachDetachAwareView.java"
        "src/android/widget/cts/AutoCompleteCtsActivity.java"
        "src/android/widget/cts/AutoCompleteTextViewNoIme.java"
        "src/android/widget/cts/AutoCompleteTextViewTest.java"
        "src/android/widget/cts/BaseAdapterTest.java"
        "src/android/widget/cts/BaseExpandableListAdapterTest.java"
        "src/android/widget/cts/ButtonTest.java"
        "src/android/widget/cts/CalendarViewCtsActivity.java"
        "src/android/widget/cts/CalendarViewTest.java"
        "src/android/widget/cts/CheckBoxCtsActivity.java"
        "src/android/widget/cts/CheckBoxTest.java"
        "src/android/widget/cts/CheckedTextViewCtsActivity.java"
        "src/android/widget/cts/CheckedTextViewTest.java"
        "src/android/widget/cts/ChronometerCtsActivity.java"
        "src/android/widget/cts/ChronometerTest.java"
        "src/android/widget/cts/CompoundButtonCtsActivity.java"
        "src/android/widget/cts/CompoundButtonTest.java"
        "src/android/widget/cts/CtsActivity.java"
        "src/android/widget/cts/CursorAdapterTest.java"
        "src/android/widget/cts/CursorTreeAdapterTest.java"
        "src/android/widget/cts/DatePickerCtsActivity.java"
        "src/android/widget/cts/DatePickerDialogCtsActivity.java"
        "src/android/widget/cts/DatePickerDialogTest.java"
        "src/android/widget/cts/DatePickerTest.java"
        "src/android/widget/cts/DialerFilterCtsActivity.java"
        "src/android/widget/cts/DialerFilterTest.java"
        "src/android/widget/cts/DigitalClockCtsActivity.java"
        "src/android/widget/cts/DigitalClockTest.java"
        "src/android/widget/cts/DummyAdapter.java"
        "src/android/widget/cts/EditTextCtsActivity.java"
        "src/android/widget/cts/EditTextTest.java"
        "src/android/widget/cts/EmptyCtsActivity.java"
        "src/android/widget/cts/ExpandableList.java"
        "src/android/widget/cts/ExpandableListBasic.java"
        "src/android/widget/cts/ExpandableListTester.java"
        "src/android/widget/cts/ExpandableListViewBasicTest.java"
        "src/android/widget/cts/ExpandableListViewTest.java"
        "src/android/widget/cts/ExpandableListViewWithHeadersTest.java"
        "src/android/widget/cts/ExpandableListView_ExpandableListContextMenuInfoTest.java"
        "src/android/widget/cts/ExpandableListWithHeaders.java"
        "src/android/widget/cts/FilterTest.java"
        "src/android/widget/cts/FrameLayoutCtsActivity.java"
        "src/android/widget/cts/FrameLayoutTest.java"
        "src/android/widget/cts/FrameLayout_LayoutParamsTest.java"
        "src/android/widget/cts/GalleryCtsActivity.java"
        "src/android/widget/cts/GalleryTest.java"
        "src/android/widget/cts/Gallery_LayoutParamsTest.java"
        "src/android/widget/cts/GridLayoutCtsActivity.java"
        "src/android/widget/cts/GridLayoutTest.java"
        "src/android/widget/cts/GridViewCtsActivity.java"
        "src/android/widget/cts/GridViewTest.java"
        "src/android/widget/cts/HeaderViewListAdapterTest.java"
        "src/android/widget/cts/HorizontalScrollViewCtsActivity.java"
        "src/android/widget/cts/HorizontalScrollViewTest.java"
        "src/android/widget/cts/ImageButtonCtsActivity.java"
        "src/android/widget/cts/ImageButtonTest.java"
        "src/android/widget/cts/ImageSwitcherCtsActivity.java"
        "src/android/widget/cts/ImageSwitcherTest.java"
        "src/android/widget/cts/ImageViewCtsActivity.java"
        "src/android/widget/cts/ImageViewTest.java"
        "src/android/widget/cts/LayoutDirectionCtsActivity.java"
        "src/android/widget/cts/LayoutDirectionTest.java"
        "src/android/widget/cts/LinearLayoutCtsActivity.java"
        "src/android/widget/cts/LinearLayoutTest.java"
        "src/android/widget/cts/LinearLayout_LayoutParamsTest.java"
        "src/android/widget/cts/ListPopupWindowCtsActivity.java"
        "src/android/widget/cts/ListPopupWindowTest.java"
        "src/android/widget/cts/ListViewCtsActivity.java"
        "src/android/widget/cts/ListViewFixedCtsActivity.java"
        "src/android/widget/cts/ListViewTest.java"
        "src/android/widget/cts/MagnifierCtsActivity.java"
        "src/android/widget/cts/MagnifierTest.java"
        "src/android/widget/cts/MediaControllerCtsActivity.java"
        "src/android/widget/cts/MediaControllerTest.java"
        "src/android/widget/cts/MockApplication.java"
        "src/android/widget/cts/MockTextView.java"
        "src/android/widget/cts/MockURLSpanTestActivity.java"
        "src/android/widget/cts/MockViewForListPopupWindow.java"
        "src/android/widget/cts/MultiAutoCompleteTextViewCtsActivity.java"
        "src/android/widget/cts/MultiAutoCompleteTextViewTest.java"
        "src/android/widget/cts/MultiAutoCompleteTextView_CommaTokenizerTest.java"
        "src/android/widget/cts/MyRemotableView.java"
        "src/android/widget/cts/NumberPickerCtsActivity.java"
        "src/android/widget/cts/NumberPickerTest.java"
        "src/android/widget/cts/PointerIconCtsActivity.java"
        "src/android/widget/cts/PointerIconTest.java"
        "src/android/widget/cts/PopupMenuCtsActivity.java"
        "src/android/widget/cts/PopupMenuTest.java"
        "src/android/widget/cts/PopupWindowCtsActivity.java"
        "src/android/widget/cts/PopupWindowTest.java"
        "src/android/widget/cts/PositionTesterContextMenuListener.java"
        "src/android/widget/cts/ProgressBarCtsActivity.java"
        "src/android/widget/cts/ProgressBarDrawableContainerTest.java"
        "src/android/widget/cts/ProgressBarTest.java"
        "src/android/widget/cts/QuickContactBadgeTest.java"
        "src/android/widget/cts/RadioButtonCtsActivity.java"
        "src/android/widget/cts/RadioButtonTest.java"
        "src/android/widget/cts/RadioGroupCtsActivity.java"
        "src/android/widget/cts/RadioGroupTest.java"
        "src/android/widget/cts/RadioGroup_LayoutParamsTest.java"
        "src/android/widget/cts/RatingBarCtsActivity.java"
        "src/android/widget/cts/RatingBarTest.java"
        "src/android/widget/cts/RelativeLayoutCtsActivity.java"
        "src/android/widget/cts/RelativeLayoutTest.java"
        "src/android/widget/cts/RelativeLayout_LayoutParamsTest.java"
        "src/android/widget/cts/RemoteViewsActivityTest.java"
        "src/android/widget/cts/RemoteViewsCtsActivity.java"
        "src/android/widget/cts/RemoteViewsTest.java"
        "src/android/widget/cts/RemoteViews_ActionExceptionTest.java"
        "src/android/widget/cts/ResourceCursorAdapterTest.java"
        "src/android/widget/cts/ResourceCursorTreeAdapterTest.java"
        "src/android/widget/cts/ScrollViewCtsActivity.java"
        "src/android/widget/cts/ScrollViewTest.java"
        "src/android/widget/cts/ScrollerTest.java"
        "src/android/widget/cts/SearchViewCtsActivity.java"
        "src/android/widget/cts/SearchViewTest.java"
        "src/android/widget/cts/SearchView_CursorTest.java"
        "src/android/widget/cts/SeekBarCtsActivity.java"
        "src/android/widget/cts/SeekBarTest.java"
        "src/android/widget/cts/SimpleAdapterTest.java"
        "src/android/widget/cts/SimpleCursorAdapterTest.java"
        "src/android/widget/cts/SimpleCursorTreeAdapterTest.java"
        "src/android/widget/cts/SimpleExpandableListAdapterTest.java"
        "src/android/widget/cts/SlidingDrawerCtsActivity.java"
        "src/android/widget/cts/SlidingDrawerTest.java"
        "src/android/widget/cts/SpaceTest.java"
        "src/android/widget/cts/SpinnerCtsActivity.java"
        "src/android/widget/cts/SpinnerTest.java"
        "src/android/widget/cts/SwitchCtsActivity.java"
        "src/android/widget/cts/SwitchTest.java"
        "src/android/widget/cts/TabHostCtsActivity.java"
        "src/android/widget/cts/TabHostTest.java"
        "src/android/widget/cts/TabHost_TabSpecTest.java"
        "src/android/widget/cts/TabWidgetTest.java"
        "src/android/widget/cts/TableCtsActivity.java"
        "src/android/widget/cts/TableLayoutTest.java"
        "src/android/widget/cts/TableLayout_LayoutParamsTest.java"
        "src/android/widget/cts/TableRowTest.java"
        "src/android/widget/cts/TableRow_LayoutParamsTest.java"
        "src/android/widget/cts/TextClockCtsActivity.java"
        "src/android/widget/cts/TextClockTest.java"
        "src/android/widget/cts/TextSwitcherCtsActivity.java"
        "src/android/widget/cts/TextSwitcherTest.java"
        "src/android/widget/cts/TextViewCtsActivity.java"
        "src/android/widget/cts/TextViewFadingEdgeTest.java"
        "src/android/widget/cts/TextViewFontVariationTest.java"
        "src/android/widget/cts/TextViewFontWeightTest.java"
        "src/android/widget/cts/TextViewIsHorizontallyScrollableTest.java"
        "src/android/widget/cts/TextViewPrecomputedTextTest.java"
        "src/android/widget/cts/TextViewTest.java"
        "src/android/widget/cts/TimePickerCtsActivity.java"
        "src/android/widget/cts/TimePickerTest.java"
        "src/android/widget/cts/ToastTest.java"
        "src/android/widget/cts/ToggleButtonCtsActivity.java"
        "src/android/widget/cts/ToggleButtonTest.java"
        "src/android/widget/cts/ToolbarCtsActivity.java"
        "src/android/widget/cts/ToolbarTest.java"
        "src/android/widget/cts/ToolbarWithMarginsCtsActivity.java"
        "src/android/widget/cts/ToolbarWithMarginsTest.java"
        "src/android/widget/cts/TwoLineListItemCtsActivity.java"
        "src/android/widget/cts/TwoLineListItemTest.java"
        "src/android/widget/cts/VideoViewCtsActivity.java"
        "src/android/widget/cts/VideoViewTest.java"
        "src/android/widget/cts/ViewAnimatorCtsActivity.java"
        "src/android/widget/cts/ViewAnimatorTest.java"
        "src/android/widget/cts/ViewFlipperCtsActivity.java"
        "src/android/widget/cts/ViewFlipperTest.java"
        "src/android/widget/cts/ViewSwitcherTest.java"
        "src/android/widget/cts/ZoomButtonCtsActivity.java"
        "src/android/widget/cts/ZoomButtonTest.java"
        "src/android/widget/cts/ZoomControlsTest.java"
        "src/android/widget/cts/util/ExpandableListScenario.java"
        "src/android/widget/cts/util/ListItemFactory.java"
        "src/android/widget/cts/util/ListScenario.java"
        "src/android/widget/cts/util/ListUtil.java"
        "src/android/widget/cts/util/TestUtils.java"
        "src/android/widget/cts/util/TestUtilsMatchers.java"
        "src/android/widget/cts/util/XmlUtils.java"
        "src/android/widget/cts/WidgetAttributeTest.kt"
    ];

    #  TODO: Move away from using hidden platform APIs b/72044662
    platform_apis = true;

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "cts_instant"
    ];

};

in { inherit CtsWidgetTestCases; }
