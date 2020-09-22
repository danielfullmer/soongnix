{ android_app, android_test_helper_app, java_defaults }:
let

#  Copyright (c) 2015, Motorola Mobility LLC
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are met:
#      - Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      - Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      - Neither the name of Motorola Mobility nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
#  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
#  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL MOTOROLA MOBILITY LLC BE LIABLE
#  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
#  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
#  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
#  DAMAGE.

presence_polling_defaults = java_defaults {
    name = "presence_polling_defaults";
    srcs = [
        "src/com/android/service/ims/presence/AlarmBroadcastReceiver.java"
        "src/com/android/service/ims/presence/CapabilityPolling.java"
        "src/com/android/service/ims/presence/ContactDbUtil.java"
        "src/com/android/service/ims/presence/Contacts.java"
        "src/com/android/service/ims/presence/DatabaseContentProvider.java"
        "src/com/android/service/ims/presence/DeviceBoot.java"
        "src/com/android/service/ims/presence/DeviceShutdown.java"
        "src/com/android/service/ims/presence/EABContactManager.java"
        "src/com/android/service/ims/presence/EABDbUtil.java"
        "src/com/android/service/ims/presence/EABProvider.java"
        "src/com/android/service/ims/presence/EABService.java"
        "src/com/android/service/ims/presence/LauncherUtils.java"
        "src/com/android/service/ims/presence/PersistService.java"
        "src/com/android/service/ims/presence/PollingAction.java"
        "src/com/android/service/ims/presence/PollingService.java"
        "src/com/android/service/ims/presence/PollingTask.java"
        "src/com/android/service/ims/presence/PollingsQueue.java"
        "src/com/android/service/ims/presence/PresenceContact.java"
        "src/com/android/service/ims/presence/PresencePreferences.java"
        "src/com/android/service/ims/presence/PresenceSetting.java"
        "src/com/android/service/ims/presence/SharedPrefUtil.java"
    ];
    static_libs = ["com.android.ims.rcsmanager"];
    platform_apis = true;
    certificate = "platform";
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

PresencePolling = android_app {
    name = "PresencePolling";
    defaults = ["presence_polling_defaults"];
};

PresencePollingTestHelper = android_test_helper_app {
    name = "PresencePollingTestHelper";
    defaults = ["presence_polling_defaults"];
    test_suites = ["device-tests"];
};

in { inherit PresencePolling PresencePollingTestHelper presence_polling_defaults; }
