{ cc_test }:
let

/*
 * Copyright (C) 2018 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

MtsHidlC2V1_0TargetVideoDecTest = cc_test {
    name = "MtsHidlC2V1_0TargetVideoDecTest";
    defaults = ["MtsMediaC2V1_0Defaults"];
    srcs = ["MtsHidlC2V1_0TargetVideoDecTest.cpp"];
};

MtsHidlC2V1_0TargetVideoEncTest = cc_test {
    name = "MtsHidlC2V1_0TargetVideoEncTest";
    defaults = ["MtsMediaC2V1_0Defaults"];
    srcs = ["MtsHidlC2V1_0TargetVideoEncTest.cpp"];
};

in { inherit MtsHidlC2V1_0TargetVideoDecTest MtsHidlC2V1_0TargetVideoEncTest; }
