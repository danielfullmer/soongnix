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

CtsTextTestCases = android_test {
    name = "CtsTextTestCases";
    defaults = ["cts_defaults"];
    sdk_version = "test_current";

    srcs = [
        "src/android/text/cts/AlteredCharSequenceTest.java"
        "src/android/text/cts/AndroidCharacterTest.java"
        "src/android/text/cts/AnnotationTest.java"
        "src/android/text/cts/AutoTextTest.java"
        "src/android/text/cts/BidiFormatterTest.java"
        "src/android/text/cts/BoringLayoutTest.java"
        "src/android/text/cts/BoringLayout_MetricsTest.java"
        "src/android/text/cts/ClipboardManagerTest.java"
        "src/android/text/cts/DynamicLayoutTest.java"
        "src/android/text/cts/Editable_FactoryTest.java"
        "src/android/text/cts/EmojiConstants.java"
        "src/android/text/cts/EmojiCtsActivity.java"
        "src/android/text/cts/EmojiTest.java"
        "src/android/text/cts/FontCoverageTest.java"
        "src/android/text/cts/GetCharsTest.java"
        "src/android/text/cts/HtmlTest.java"
        "src/android/text/cts/InputFilter_AllCapsTest.java"
        "src/android/text/cts/InputFilter_LengthFilterTest.java"
        "src/android/text/cts/LayoutTest.java"
        "src/android/text/cts/LoginFilterTest.java"
        "src/android/text/cts/LoginFilter_PasswordFilterGMailTest.java"
        "src/android/text/cts/LoginFilter_UsernameFilterGMailTest.java"
        "src/android/text/cts/LoginFilter_UsernameFilterGenericTest.java"
        "src/android/text/cts/MakeSafeForPresentationTest.java"
        "src/android/text/cts/MockActivity.java"
        "src/android/text/cts/MyanmarTest.java"
        "src/android/text/cts/PrecomputedTextTest.java"
        "src/android/text/cts/SelectionTest.java"
        "src/android/text/cts/SpannableStringBuilderSpanTest.java"
        "src/android/text/cts/SpannableStringBuilderTest.java"
        "src/android/text/cts/SpannableStringTest.java"
        "src/android/text/cts/Spannable_FactoryTest.java"
        "src/android/text/cts/SpannedStringTest.java"
        "src/android/text/cts/SpannedTest.java"
        "src/android/text/cts/StaticLayoutGetLineLeftRightTest.java"
        "src/android/text/cts/StaticLayoutLineBreakingTest.java"
        "src/android/text/cts/StaticLayoutLineBreakingVariantsTest.java"
        "src/android/text/cts/StaticLayoutTest.java"
        "src/android/text/cts/TextPaintTest.java"
        "src/android/text/cts/TextUtilsTest.java"
        "src/android/text/cts/TextUtils_SimpleStringSplitterTest.java"
        "src/android/text/format/cts/DateFormatTest.java"
        "src/android/text/format/cts/DateUtilsTest.java"
        "src/android/text/format/cts/FormatterTest.java"
        "src/android/text/format/cts/LocaleUtils.java"
        "src/android/text/format/cts/TimeTest.java"
        "src/android/text/method/cts/ArrowKeyMovementMethodTest.java"
        "src/android/text/method/cts/BackspaceTest.java"
        "src/android/text/method/cts/BaseKeyListenerTest.java"
        "src/android/text/method/cts/BaseMovementMethodTest.java"
        "src/android/text/method/cts/CharacterPickerDialogTest.java"
        "src/android/text/method/cts/CtsActivity.java"
        "src/android/text/method/cts/DateKeyListenerTest.java"
        "src/android/text/method/cts/DateTimeKeyListenerTest.java"
        "src/android/text/method/cts/DialerKeyListenerTest.java"
        "src/android/text/method/cts/DigitsKeyListenerTest.java"
        "src/android/text/method/cts/EditTextNoIme.java"
        "src/android/text/method/cts/EditorState.java"
        "src/android/text/method/cts/ForwardDeleteTest.java"
        "src/android/text/method/cts/HideReturnsTransformationMethodTest.java"
        "src/android/text/method/cts/KeyListenerCtsActivity.java"
        "src/android/text/method/cts/KeyListenerTestCase.java"
        "src/android/text/method/cts/LinkMovementMethodTest.java"
        "src/android/text/method/cts/MetaKeyKeyListenerTest.java"
        "src/android/text/method/cts/MultiTapKeyListenerTest.java"
        "src/android/text/method/cts/NumberKeyListenerTest.java"
        "src/android/text/method/cts/PasswordTransformationMethodTest.java"
        "src/android/text/method/cts/QwertyKeyListenerTest.java"
        "src/android/text/method/cts/ReplacementTransformationMethodTest.java"
        "src/android/text/method/cts/ScrollingMovementMethodTest.java"
        "src/android/text/method/cts/SingleLineTransformationMethodTest.java"
        "src/android/text/method/cts/TextKeyListenerTest.java"
        "src/android/text/method/cts/TextMethodUtils.java"
        "src/android/text/method/cts/TextViewNoIme.java"
        "src/android/text/method/cts/TimeKeyListenerTest.java"
        "src/android/text/method/cts/TouchTest.java"
        "src/android/text/method/cts/TransformationMethodTest.java"
        "src/android/text/style/cts/AbsoluteSizeSpanTest.java"
        "src/android/text/style/cts/AlignmentSpan_StandardTest.java"
        "src/android/text/style/cts/BackgroundColorSpanTest.java"
        "src/android/text/style/cts/BulletSpanTest.java"
        "src/android/text/style/cts/CharacterStyleTest.java"
        "src/android/text/style/cts/ClickableSpanTest.java"
        "src/android/text/style/cts/DrawableMarginSpanTest.java"
        "src/android/text/style/cts/DynamicDrawableSpanTest.java"
        "src/android/text/style/cts/EasyEditSpanTest.java"
        "src/android/text/style/cts/ForegroundColorSpanTest.java"
        "src/android/text/style/cts/IconMarginSpanTest.java"
        "src/android/text/style/cts/ImageSpanTest.java"
        "src/android/text/style/cts/LeadingMarginSpan_StandardTest.java"
        "src/android/text/style/cts/LineBackgroundSpan_StandardTest.java"
        "src/android/text/style/cts/LineHeightSpan_StandardTest.java"
        "src/android/text/style/cts/LocaleSpanTest.java"
        "src/android/text/style/cts/MaskFilterSpanTest.java"
        "src/android/text/style/cts/MetricAffectingSpanTest.java"
        "src/android/text/style/cts/MockURLSpanTestActivity.java"
        "src/android/text/style/cts/QuoteSpanTest.java"
        "src/android/text/style/cts/RelativeSizeSpanTest.java"
        "src/android/text/style/cts/ReplacementSpanTest.java"
        "src/android/text/style/cts/ScaleXSpanTest.java"
        "src/android/text/style/cts/StrikethroughSpanTest.java"
        "src/android/text/style/cts/StyleSpanTest.java"
        "src/android/text/style/cts/SubscriptSpanTest.java"
        "src/android/text/style/cts/SuggestionSpanTest.java"
        "src/android/text/style/cts/SuperscriptSpanTest.java"
        "src/android/text/style/cts/TabStopSpan_StandardTest.java"
        "src/android/text/style/cts/TextAppearanceSpanTest.java"
        "src/android/text/style/cts/TtsSpanTest.java"
        "src/android/text/style/cts/TypefaceSpanTest.java"
        "src/android/text/style/cts/URLSpanCtsActivity.java"
        "src/android/text/style/cts/URLSpanTest.java"
        "src/android/text/style/cts/UnderlineSpanTest.java"
        "src/android/text/util/cts/LinkifyTest.java"
        "src/android/text/util/cts/Rfc822TokenTest.java"
        "src/android/text/util/cts/Rfc822TokenizerTest.java"

    ];

    static_libs = [
        "compatibility-device-util-axt"
        "ctsdeviceutillegacy-axt"
        "ctstestrunner-axt"
        "mockito-target-minus-junit4"
        "androidx.test.rules"
        "ub-uiautomator"
    ];

    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];

    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "cts_instant"
        "mts"
    ];
};

in { inherit CtsTextTestCases; }
