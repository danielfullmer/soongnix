{ android_test }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

AmSlam = android_test {
    name = "AmSlam";
    srcs = [
        "src/test/amslam/MainActivity.java"
        "src/test/amslam/PingReceiver.java"
        "src/test/amslam/PongReceiver.java"
        "src/test/amslam/subreceivers/PingReceiver000.java"
        "src/test/amslam/subreceivers/PingReceiver001.java"
        "src/test/amslam/subreceivers/PingReceiver002.java"
        "src/test/amslam/subreceivers/PingReceiver003.java"
        "src/test/amslam/subreceivers/PingReceiver004.java"
        "src/test/amslam/subreceivers/PingReceiver005.java"
        "src/test/amslam/subreceivers/PingReceiver006.java"
        "src/test/amslam/subreceivers/PingReceiver007.java"
        "src/test/amslam/subreceivers/PingReceiver008.java"
        "src/test/amslam/subreceivers/PingReceiver009.java"
        "src/test/amslam/subreceivers/PingReceiver010.java"
        "src/test/amslam/subreceivers/PingReceiver011.java"
        "src/test/amslam/subreceivers/PingReceiver012.java"
        "src/test/amslam/subreceivers/PingReceiver013.java"
        "src/test/amslam/subreceivers/PingReceiver014.java"
        "src/test/amslam/subreceivers/PingReceiver015.java"
        "src/test/amslam/subreceivers/PingReceiver016.java"
        "src/test/amslam/subreceivers/PingReceiver017.java"
        "src/test/amslam/subreceivers/PingReceiver018.java"
        "src/test/amslam/subreceivers/PingReceiver019.java"
        "src/test/amslam/subreceivers/PingReceiver020.java"
        "src/test/amslam/subreceivers/PingReceiver021.java"
        "src/test/amslam/subreceivers/PingReceiver022.java"
        "src/test/amslam/subreceivers/PingReceiver023.java"
        "src/test/amslam/subreceivers/PingReceiver024.java"
        "src/test/amslam/subreceivers/PingReceiver025.java"
        "src/test/amslam/subreceivers/PingReceiver026.java"
        "src/test/amslam/subreceivers/PingReceiver027.java"
        "src/test/amslam/subreceivers/PingReceiver028.java"
        "src/test/amslam/subreceivers/PingReceiver029.java"
        "src/test/amslam/subreceivers/PingReceiver030.java"
        "src/test/amslam/subreceivers/PingReceiver031.java"
        "src/test/amslam/subreceivers/PingReceiver032.java"
        "src/test/amslam/subreceivers/PingReceiver033.java"
        "src/test/amslam/subreceivers/PingReceiver034.java"
        "src/test/amslam/subreceivers/PingReceiver035.java"
        "src/test/amslam/subreceivers/PingReceiver036.java"
        "src/test/amslam/subreceivers/PingReceiver037.java"
        "src/test/amslam/subreceivers/PingReceiver038.java"
        "src/test/amslam/subreceivers/PingReceiver039.java"
        "src/test/amslam/subreceivers/PingReceiver040.java"
        "src/test/amslam/subreceivers/PingReceiver041.java"
        "src/test/amslam/subreceivers/PingReceiver042.java"
        "src/test/amslam/subreceivers/PingReceiver043.java"
        "src/test/amslam/subreceivers/PingReceiver044.java"
        "src/test/amslam/subreceivers/PingReceiver045.java"
        "src/test/amslam/subreceivers/PingReceiver046.java"
        "src/test/amslam/subreceivers/PingReceiver047.java"
        "src/test/amslam/subreceivers/PingReceiver048.java"
        "src/test/amslam/subreceivers/PingReceiver049.java"
        "src/test/amslam/subreceivers/PingReceiver050.java"
        "src/test/amslam/subreceivers/PingReceiver051.java"
        "src/test/amslam/subreceivers/PingReceiver052.java"
        "src/test/amslam/subreceivers/PingReceiver053.java"
        "src/test/amslam/subreceivers/PingReceiver054.java"
        "src/test/amslam/subreceivers/PingReceiver055.java"
        "src/test/amslam/subreceivers/PingReceiver056.java"
        "src/test/amslam/subreceivers/PingReceiver057.java"
        "src/test/amslam/subreceivers/PingReceiver058.java"
        "src/test/amslam/subreceivers/PingReceiver059.java"
        "src/test/amslam/subreceivers/PingReceiver060.java"
        "src/test/amslam/subreceivers/PingReceiver061.java"
        "src/test/amslam/subreceivers/PingReceiver062.java"
        "src/test/amslam/subreceivers/PingReceiver063.java"
        "src/test/amslam/subreceivers/PingReceiver064.java"
        "src/test/amslam/subreceivers/PingReceiver065.java"
        "src/test/amslam/subreceivers/PingReceiver066.java"
        "src/test/amslam/subreceivers/PingReceiver067.java"
        "src/test/amslam/subreceivers/PingReceiver068.java"
        "src/test/amslam/subreceivers/PingReceiver069.java"
        "src/test/amslam/subreceivers/PingReceiver070.java"
        "src/test/amslam/subreceivers/PingReceiver071.java"
        "src/test/amslam/subreceivers/PingReceiver072.java"
        "src/test/amslam/subreceivers/PingReceiver073.java"
        "src/test/amslam/subreceivers/PingReceiver074.java"
        "src/test/amslam/subreceivers/PingReceiver075.java"
        "src/test/amslam/subreceivers/PingReceiver076.java"
        "src/test/amslam/subreceivers/PingReceiver077.java"
        "src/test/amslam/subreceivers/PingReceiver078.java"
        "src/test/amslam/subreceivers/PingReceiver079.java"
        "src/test/amslam/subreceivers/PingReceiver080.java"
        "src/test/amslam/subreceivers/PingReceiver081.java"
        "src/test/amslam/subreceivers/PingReceiver082.java"
        "src/test/amslam/subreceivers/PingReceiver083.java"
        "src/test/amslam/subreceivers/PingReceiver084.java"
        "src/test/amslam/subreceivers/PingReceiver085.java"
        "src/test/amslam/subreceivers/PingReceiver086.java"
        "src/test/amslam/subreceivers/PingReceiver087.java"
        "src/test/amslam/subreceivers/PingReceiver088.java"
        "src/test/amslam/subreceivers/PingReceiver089.java"
        "src/test/amslam/subreceivers/PingReceiver090.java"
        "src/test/amslam/subreceivers/PingReceiver091.java"
        "src/test/amslam/subreceivers/PingReceiver092.java"
        "src/test/amslam/subreceivers/PingReceiver093.java"
        "src/test/amslam/subreceivers/PingReceiver094.java"
        "src/test/amslam/subreceivers/PingReceiver095.java"
        "src/test/amslam/subreceivers/PingReceiver096.java"
        "src/test/amslam/subreceivers/PingReceiver097.java"
        "src/test/amslam/subreceivers/PingReceiver098.java"
        "src/test/amslam/subreceivers/PingReceiver099.java"
    ];
    sdk_version = "current";
    min_sdk_version = "21";
    java_version = "1.8";
};

in { inherit AmSlam; }
