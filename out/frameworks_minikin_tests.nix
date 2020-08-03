{ filegroup }:
let

minikin-test-data = filegroup {
    name = "minikin-test-data";
    srcs = [
        "data/Arabic.ttf"
        "data/Ascii.ttf"
        "data/Bold.ttf"
        "data/BoldItalic.ttf"
        "data/Cherokee.ttf"
        "data/ColorEmojiFont.ttf"
        "data/ColorTextMixedEmojiFont.ttf"
        "data/CustomExtent.ttf"
        "data/Emoji.ttf"
        "data/Hiragana.ttf"
        "data/Italic.ttf"
        "data/Ja.ttf"
        "data/Ko.ttf"
        "data/Ligature.ttf"
        "data/LayoutTestFont.ttf"
        "data/MultiAxis.ttf"
        "data/NoCmapFormat14.ttf"
        "data/NoGlyphFont.ttf"
        "data/Regular.ttf"
        "data/TextEmojiFont.ttf"
        "data/UnicodeBMPOnly.ttf"
        "data/UnicodeBMPOnly2.ttf"
        "data/UnicodeUCS4.ttf"
        "data/VariationSelectorTest-Regular.ttf"
        "data/ZhHans.ttf"
        "data/ZhHant.ttf"
        "data/emoji.xml"
        "data/itemize.xml"
    ];
};

subdirs = [
    "perftests"
    "stresstest"
    "unittest"
    "util"
];

in { inherit minikin-test-data; }
