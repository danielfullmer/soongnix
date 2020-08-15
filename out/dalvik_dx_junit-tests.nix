{ java_test_host }:
let

#  Copyright 2011 The Android Open Source Project

dx-tests = java_test_host {
    name = "dx-tests";
    srcs = [
        "com/android/dex/EncodedValueReaderTest.java"
        "com/android/dx/merge/DexMergerTest.java"
        "com/android/dx/rop/cst/CstTypeTest.java"
        "com/android/dx/rop/type/TypeTest.java"
        "com/android/dx/util/BitIntSetTest.java"
        "com/android/dx/util/BitsTest.java"
        "com/android/dx/util/ByteArrayAnnotatedOutputTest.java"
        "com/android/dx/util/IntListTest.java"
        "com/android/dx/util/ListIntSetTest.java"
    ];
    libs = [
        "dx"
        "junit-host"
    ];
};

in { inherit dx-tests; }
