{ java_library }:
let

ksoap2 = java_library {
    name = "ksoap2";
    sdk_version = "system_current";
    srcs = [
        "kobjects/org/ksoap2/kobjects/base64/Base64.java"
        "kobjects/org/ksoap2/kobjects/isodate/IsoDate.java"
        "kobjects/org/ksoap2/kobjects/mime/Decoder.java"
        "ksoap2-base/src/main/java/org/ksoap2/HeaderProperty.java"
        "ksoap2-base/src/main/java/org/ksoap2/SoapEnvelope.java"
        "ksoap2-base/src/main/java/org/ksoap2/SoapFault.java"
        "ksoap2-base/src/main/java/org/ksoap2/SoapFault12.java"
        "ksoap2-base/src/main/java/org/ksoap2/kdom/Document.java"
        "ksoap2-base/src/main/java/org/ksoap2/kdom/Element.java"
        "ksoap2-base/src/main/java/org/ksoap2/kdom/Node.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/AttributeContainer.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/AttributeInfo.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/DM.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/FwdRef.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/HasAttributes.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/HasInnerText.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/KvmSerializable.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/Marshal.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/MarshalBase64.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/MarshalDate.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/MarshalHashtable.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/NullSoapObject.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/PropertyInfo.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/SoapObject.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/SoapPrimitive.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/SoapSerializationEnvelope.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/SppPropertyInfo.java"
        "ksoap2-base/src/main/java/org/ksoap2/serialization/ValueWriter.java"
        "ksoap2-base/src/main/java/org/ksoap2/transport/ServiceConnection.java"
        "ksoap2-base/src/main/java/org/ksoap2/transport/Transport.java"
        "ksoap2-j2se/src/main/java/org/ksoap2/serialization/MarshalFloat.java"
        "ksoap2-j2se/src/main/java/org/ksoap2/transport/HttpResponseException.java"
        "ksoap2-j2se/src/main/java/org/ksoap2/transport/HttpTransportSE.java"
        "ksoap2-j2se/src/main/java/org/ksoap2/transport/HttpsServiceConnectionSE.java"
        "ksoap2-j2se/src/main/java/org/ksoap2/transport/HttpsServiceConnectionSEIgnoringConnectionClose.java"
        "ksoap2-j2se/src/main/java/org/ksoap2/transport/HttpsTransportSE.java"
        "ksoap2-j2se/src/main/java/org/ksoap2/transport/KeepAliveHttpsTransportSE.java"
        "ksoap2-j2se/src/main/java/org/ksoap2/transport/ServiceConnectionSE.java"
    ];
};

in { inherit ksoap2; }
