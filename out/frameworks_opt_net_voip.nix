{ filegroup, java_library }:
let

#  Copyright 2010 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

opt-net-voip-srcs = filegroup {
    name = "opt-net-voip-srcs";
    srcs = [
        "src/java/android/net/rtp/AudioCodec.java"
        "src/java/android/net/rtp/AudioGroup.java"
        "src/java/android/net/rtp/AudioStream.java"
        "src/java/android/net/rtp/RtpStream.java"
        "src/java/android/net/sip/SimpleSessionDescription.java"
        "src/java/android/net/sip/SipAudioCall.java"
        "src/java/android/net/sip/SipErrorCode.java"
        "src/java/android/net/sip/SipException.java"
        "src/java/android/net/sip/SipManager.java"
        "src/java/android/net/sip/SipProfile.java"
        "src/java/android/net/sip/SipRegistrationListener.java"
        "src/java/android/net/sip/SipSession.java"
        "src/java/android/net/sip/SipSessionAdapter.java"
    ];
};

opt-net-voip-htmls = filegroup {
    name = "opt-net-voip-htmls";
    srcs = [
        "src/java/android/net/rtp/package.html"
        "src/java/android/net/sip/package.html"
    ];
};

voip-common = java_library {
    name = "voip-common";
    installable = true;
    srcs = [
        "src/java/android/net/rtp/AudioCodec.java"
        "src/java/android/net/rtp/AudioGroup.java"
        "src/java/android/net/rtp/AudioStream.java"
        "src/java/android/net/rtp/RtpStream.java"
        "src/java/android/net/sip/SimpleSessionDescription.java"
        "src/java/android/net/sip/SipAudioCall.java"
        "src/java/android/net/sip/SipErrorCode.java"
        "src/java/android/net/sip/SipException.java"
        "src/java/android/net/sip/SipManager.java"
        "src/java/android/net/sip/SipProfile.java"
        "src/java/android/net/sip/SipRegistrationListener.java"
        "src/java/android/net/sip/SipSession.java"
        "src/java/android/net/sip/SipSessionAdapter.java"
        "src/java/com/android/server/sip/SipHelper.java"
        "src/java/com/android/server/sip/SipService.java"
        "src/java/com/android/server/sip/SipSessionGroup.java"
        "src/java/com/android/server/sip/SipSessionListenerProxy.java"
        "src/java/com/android/server/sip/SipWakeLock.java"
        "src/java/com/android/server/sip/SipWakeupTimer.java"
        "src/java/android/net/sip/ISipService.aidl"
        "src/java/android/net/sip/ISipSession.aidl"
        "src/java/android/net/sip/ISipSessionListener.aidl"
    ];
    aidl = {
        local_include_dirs = [
            "src/java"
        ];
    };
    required = ["librtp_jni"];
};

in { inherit opt-net-voip-htmls opt-net-voip-srcs voip-common; }
