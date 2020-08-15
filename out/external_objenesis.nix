{ java_library_host, java_library_static }:
let

#  Copyright (C) 2013 The Android Open Source Project
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
#

objenesis = java_library_static {
    name = "objenesis";
    host_supported = true;
    hostdex = true;
    srcs = [
        "main/src/main/java/org/objenesis/Objenesis.java"
        "main/src/main/java/org/objenesis/ObjenesisBase.java"
        "main/src/main/java/org/objenesis/ObjenesisException.java"
        "main/src/main/java/org/objenesis/ObjenesisHelper.java"
        "main/src/main/java/org/objenesis/ObjenesisSerializer.java"
        "main/src/main/java/org/objenesis/ObjenesisStd.java"
        "main/src/main/java/org/objenesis/instantiator/ObjectInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/SerializationInstantiatorHelper.java"
        "main/src/main/java/org/objenesis/instantiator/android/Android10Instantiator.java"
        "main/src/main/java/org/objenesis/instantiator/android/Android17Instantiator.java"
        "main/src/main/java/org/objenesis/instantiator/android/Android18Instantiator.java"
        "main/src/main/java/org/objenesis/instantiator/android/AndroidSerializationInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/annotations/Instantiator.java"
        "main/src/main/java/org/objenesis/instantiator/annotations/Typology.java"
        "main/src/main/java/org/objenesis/instantiator/basic/AccessibleInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/basic/ClassDefinitionUtils.java"
        "main/src/main/java/org/objenesis/instantiator/basic/ConstructorInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/basic/FailingInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/basic/NewInstanceInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/basic/NullInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/basic/ObjectInputStreamInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/basic/ObjectStreamClassInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/basic/ProxyingInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/gcj/GCJInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/gcj/GCJInstantiatorBase.java"
        "main/src/main/java/org/objenesis/instantiator/gcj/GCJSerializationInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/perc/PercInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/perc/PercSerializationInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/sun/MagicInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/sun/SunReflectionFactoryHelper.java"
        "main/src/main/java/org/objenesis/instantiator/sun/SunReflectionFactoryInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/sun/SunReflectionFactorySerializationInstantiator.java"
        "main/src/main/java/org/objenesis/instantiator/sun/UnsafeFactoryInstantiator.java"
        "main/src/main/java/org/objenesis/strategy/BaseInstantiatorStrategy.java"
        "main/src/main/java/org/objenesis/strategy/InstantiatorStrategy.java"
        "main/src/main/java/org/objenesis/strategy/PlatformDescription.java"
        "main/src/main/java/org/objenesis/strategy/SerializingInstantiatorStrategy.java"
        "main/src/main/java/org/objenesis/strategy/SingleInstantiatorStrategy.java"
        "main/src/main/java/org/objenesis/strategy/StdInstantiatorStrategy.java"
    ];
    sdk_version = "core_current";
};

#  Compatibility library for old name of host target
objenesis-host = java_library_host {
    name = "objenesis-host";
    static_libs = ["objenesis"];
};

# --------------------------------
#  Builds the Objenesis TCK as a device-targeted library

objenesis-tck = java_library_static {
    name = "objenesis-tck";
    no_framework_libs = true;
    sdk_version = "current";

    static_libs = ["objenesis"];
    srcs = [
        "tck/src/main/java/org/objenesis/tck/CandidateLoader.java"
        "tck/src/main/java/org/objenesis/tck/Main.java"
        "tck/src/main/java/org/objenesis/tck/Reporter.java"
        "tck/src/main/java/org/objenesis/tck/TCK.java"
        "tck/src/main/java/org/objenesis/tck/TextReporter.java"
        "tck/src/main/java/org/objenesis/tck/candidates/ConstructorThrowingException.java"
        "tck/src/main/java/org/objenesis/tck/candidates/ConstructorWithArguments.java"
        "tck/src/main/java/org/objenesis/tck/candidates/ConstructorWithMandatoryArguments.java"
        "tck/src/main/java/org/objenesis/tck/candidates/DefaultPackageConstructor.java"
        "tck/src/main/java/org/objenesis/tck/candidates/DefaultPrivateConstructor.java"
        "tck/src/main/java/org/objenesis/tck/candidates/DefaultProtectedConstructor.java"
        "tck/src/main/java/org/objenesis/tck/candidates/DefaultPublicConstructor.java"
        "tck/src/main/java/org/objenesis/tck/candidates/NoConstructor.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableConstructorThrowingException.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableConstructorWithArguments.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableConstructorWithMandatoryArguments.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableDefaultPackageConstructor.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableDefaultPrivateConstructor.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableDefaultProtectedConstructor.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableDefaultPublicConstructor.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableNoConstructor.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableReplacer.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableResolver.java"
        "tck/src/main/java/org/objenesis/tck/candidates/SerializableWithAncestorThrowingException.java"
        "tck/src/main/java/org/objenesis/tck/search/ClassEnumerator.java"
        "tck/src/main/java/org/objenesis/tck/search/SearchWorkingInstantiator.java"
        "tck/src/main/java/org/objenesis/tck/search/SearchWorkingInstantiatorListener.java"
        "tck/src/main/java/org/objenesis/tck/search/SystemOutListener.java"
    ];
    java_resource_dirs = ["tck/src/main/resources"];
};

in { inherit objenesis objenesis-host objenesis-tck; }
