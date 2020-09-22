{ java_binary_host, java_library_host }:
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

#  apksig library, for signing APKs and verifying signatures of APKs
#  ============================================================
apksig = java_library_host {
    name = "apksig";
    srcs = [
        "src/main/java/com/android/apksig/ApkSigner.java"
        "src/main/java/com/android/apksig/ApkSignerEngine.java"
        "src/main/java/com/android/apksig/ApkVerifier.java"
        "src/main/java/com/android/apksig/DefaultApkSignerEngine.java"
        "src/main/java/com/android/apksig/Hints.java"
        "src/main/java/com/android/apksig/SigningCertificateLineage.java"
        "src/main/java/com/android/apksig/apk/ApkFormatException.java"
        "src/main/java/com/android/apksig/apk/ApkSigningBlockNotFoundException.java"
        "src/main/java/com/android/apksig/apk/ApkUtils.java"
        "src/main/java/com/android/apksig/apk/CodenameMinSdkVersionException.java"
        "src/main/java/com/android/apksig/apk/MinSdkVersionException.java"
        "src/main/java/com/android/apksig/internal/apk/AndroidBinXmlParser.java"
        "src/main/java/com/android/apksig/internal/apk/ApkSigningBlockUtils.java"
        "src/main/java/com/android/apksig/internal/apk/ContentDigestAlgorithm.java"
        "src/main/java/com/android/apksig/internal/apk/SignatureAlgorithm.java"
        "src/main/java/com/android/apksig/internal/apk/SignatureInfo.java"
        "src/main/java/com/android/apksig/internal/apk/stamp/SourceStampVerifier.java"
        "src/main/java/com/android/apksig/internal/apk/stamp/V1SourceStampSigner.java"
        "src/main/java/com/android/apksig/internal/apk/stamp/V1SourceStampVerifier.java"
        "src/main/java/com/android/apksig/internal/apk/stamp/V2SourceStampSigner.java"
        "src/main/java/com/android/apksig/internal/apk/stamp/V2SourceStampVerifier.java"
        "src/main/java/com/android/apksig/internal/apk/v1/DigestAlgorithm.java"
        "src/main/java/com/android/apksig/internal/apk/v1/V1SchemeSigner.java"
        "src/main/java/com/android/apksig/internal/apk/v1/V1SchemeVerifier.java"
        "src/main/java/com/android/apksig/internal/apk/v2/V2SchemeSigner.java"
        "src/main/java/com/android/apksig/internal/apk/v2/V2SchemeVerifier.java"
        "src/main/java/com/android/apksig/internal/apk/v3/V3SchemeSigner.java"
        "src/main/java/com/android/apksig/internal/apk/v3/V3SchemeVerifier.java"
        "src/main/java/com/android/apksig/internal/apk/v3/V3SigningCertificateLineage.java"
        "src/main/java/com/android/apksig/internal/apk/v4/V4SchemeSigner.java"
        "src/main/java/com/android/apksig/internal/apk/v4/V4SchemeVerifier.java"
        "src/main/java/com/android/apksig/internal/apk/v4/V4Signature.java"
        "src/main/java/com/android/apksig/internal/asn1/Asn1BerParser.java"
        "src/main/java/com/android/apksig/internal/asn1/Asn1Class.java"
        "src/main/java/com/android/apksig/internal/asn1/Asn1DecodingException.java"
        "src/main/java/com/android/apksig/internal/asn1/Asn1DerEncoder.java"
        "src/main/java/com/android/apksig/internal/asn1/Asn1EncodingException.java"
        "src/main/java/com/android/apksig/internal/asn1/Asn1Field.java"
        "src/main/java/com/android/apksig/internal/asn1/Asn1OpaqueObject.java"
        "src/main/java/com/android/apksig/internal/asn1/Asn1TagClass.java"
        "src/main/java/com/android/apksig/internal/asn1/Asn1Tagging.java"
        "src/main/java/com/android/apksig/internal/asn1/Asn1Type.java"
        "src/main/java/com/android/apksig/internal/asn1/ber/BerDataValue.java"
        "src/main/java/com/android/apksig/internal/asn1/ber/BerDataValueFormatException.java"
        "src/main/java/com/android/apksig/internal/asn1/ber/BerDataValueReader.java"
        "src/main/java/com/android/apksig/internal/asn1/ber/BerEncoding.java"
        "src/main/java/com/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader.java"
        "src/main/java/com/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader.java"
        "src/main/java/com/android/apksig/internal/jar/ManifestParser.java"
        "src/main/java/com/android/apksig/internal/jar/ManifestWriter.java"
        "src/main/java/com/android/apksig/internal/jar/SignatureFileWriter.java"
        "src/main/java/com/android/apksig/internal/oid/OidConstants.java"
        "src/main/java/com/android/apksig/internal/pkcs7/AlgorithmIdentifier.java"
        "src/main/java/com/android/apksig/internal/pkcs7/Attribute.java"
        "src/main/java/com/android/apksig/internal/pkcs7/ContentInfo.java"
        "src/main/java/com/android/apksig/internal/pkcs7/EncapsulatedContentInfo.java"
        "src/main/java/com/android/apksig/internal/pkcs7/IssuerAndSerialNumber.java"
        "src/main/java/com/android/apksig/internal/pkcs7/Pkcs7Constants.java"
        "src/main/java/com/android/apksig/internal/pkcs7/Pkcs7DecodingException.java"
        "src/main/java/com/android/apksig/internal/pkcs7/SignedData.java"
        "src/main/java/com/android/apksig/internal/pkcs7/SignerIdentifier.java"
        "src/main/java/com/android/apksig/internal/pkcs7/SignerInfo.java"
        "src/main/java/com/android/apksig/internal/util/AndroidSdkVersion.java"
        "src/main/java/com/android/apksig/internal/util/ByteArrayDataSink.java"
        "src/main/java/com/android/apksig/internal/util/ByteBufferDataSource.java"
        "src/main/java/com/android/apksig/internal/util/ByteBufferSink.java"
        "src/main/java/com/android/apksig/internal/util/ByteBufferUtils.java"
        "src/main/java/com/android/apksig/internal/util/ByteStreams.java"
        "src/main/java/com/android/apksig/internal/util/ChainedDataSource.java"
        "src/main/java/com/android/apksig/internal/util/DelegatingX509Certificate.java"
        "src/main/java/com/android/apksig/internal/util/FileChannelDataSource.java"
        "src/main/java/com/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate.java"
        "src/main/java/com/android/apksig/internal/util/InclusiveIntRange.java"
        "src/main/java/com/android/apksig/internal/util/MessageDigestSink.java"
        "src/main/java/com/android/apksig/internal/util/OutputStreamDataSink.java"
        "src/main/java/com/android/apksig/internal/util/Pair.java"
        "src/main/java/com/android/apksig/internal/util/RandomAccessFileDataSink.java"
        "src/main/java/com/android/apksig/internal/util/TeeDataSink.java"
        "src/main/java/com/android/apksig/internal/util/VerityTreeBuilder.java"
        "src/main/java/com/android/apksig/internal/util/X509CertificateUtils.java"
        "src/main/java/com/android/apksig/internal/x509/AttributeTypeAndValue.java"
        "src/main/java/com/android/apksig/internal/x509/Certificate.java"
        "src/main/java/com/android/apksig/internal/x509/Extension.java"
        "src/main/java/com/android/apksig/internal/x509/Name.java"
        "src/main/java/com/android/apksig/internal/x509/RSAPublicKey.java"
        "src/main/java/com/android/apksig/internal/x509/RelativeDistinguishedName.java"
        "src/main/java/com/android/apksig/internal/x509/SubjectPublicKeyInfo.java"
        "src/main/java/com/android/apksig/internal/x509/TBSCertificate.java"
        "src/main/java/com/android/apksig/internal/x509/Time.java"
        "src/main/java/com/android/apksig/internal/x509/Validity.java"
        "src/main/java/com/android/apksig/internal/zip/CentralDirectoryRecord.java"
        "src/main/java/com/android/apksig/internal/zip/EocdRecord.java"
        "src/main/java/com/android/apksig/internal/zip/LocalFileRecord.java"
        "src/main/java/com/android/apksig/internal/zip/ZipUtils.java"
        "src/main/java/com/android/apksig/util/DataSink.java"
        "src/main/java/com/android/apksig/util/DataSinks.java"
        "src/main/java/com/android/apksig/util/DataSource.java"
        "src/main/java/com/android/apksig/util/DataSources.java"
        "src/main/java/com/android/apksig/util/ReadableDataSink.java"
        "src/main/java/com/android/apksig/util/RunnablesExecutor.java"
        "src/main/java/com/android/apksig/util/RunnablesProvider.java"
        "src/main/java/com/android/apksig/zip/ZipFormatException.java"
    ];
};

#  apksigner command-line tool for signing APKs and verifying their signatures
#  ============================================================
apksigner = java_binary_host {
    name = "apksigner";
    srcs = [
        "src/apksigner/java/com/android/apksigner/ApkSignerTool.java"
        "src/apksigner/java/com/android/apksigner/HexEncoding.java"
        "src/apksigner/java/com/android/apksigner/OptionsParser.java"
        "src/apksigner/java/com/android/apksigner/ParameterException.java"
        "src/apksigner/java/com/android/apksigner/PasswordRetriever.java"
        "src/apksigner/java/com/android/apksigner/SignerParams.java"
    ];
    java_resource_dirs = ["src/apksigner/java"];
    wrapper = "etc/apksigner";
    manifest = "src/apksigner/apksigner.mf";
    static_libs = [
        "apksig"
        "conscrypt-unbundled"
    ];
    required = ["libconscrypt_openjdk_jni"];
};

in { inherit apksig apksigner; }
