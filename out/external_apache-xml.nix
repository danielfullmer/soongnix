{ filegroup, java_library }:
let

#
#  Copyright (C) 2011 The Android Open Source Project
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

#  The set of files that contribute to APIs.
#  Generally, apache-xml source files are not marked with @hide so we add them
#  one-by-one after having done so.
apache-xml_api_files = filegroup {
    name = "apache-xml_api_files";
    srcs = [];
};

apache-xml = java_library {
    name = "apache-xml";
    srcs = [
        "src/main/java/org/apache/xalan/Version.java"
        "src/main/java/org/apache/xalan/extensions/ExpressionContext.java"
        "src/main/java/org/apache/xalan/extensions/ExpressionVisitor.java"
        "src/main/java/org/apache/xalan/extensions/ExtensionHandler.java"
        "src/main/java/org/apache/xalan/extensions/ExtensionNamespaceSupport.java"
        "src/main/java/org/apache/xalan/extensions/ExtensionNamespacesManager.java"
        "src/main/java/org/apache/xalan/extensions/ExtensionsTable.java"
        "src/main/java/org/apache/xalan/extensions/ObjectFactory.java"
        "src/main/java/org/apache/xalan/processor/ProcessorAttributeSet.java"
        "src/main/java/org/apache/xalan/processor/ProcessorCharacters.java"
        "src/main/java/org/apache/xalan/processor/ProcessorDecimalFormat.java"
        "src/main/java/org/apache/xalan/processor/ProcessorExsltFuncResult.java"
        "src/main/java/org/apache/xalan/processor/ProcessorExsltFunction.java"
        "src/main/java/org/apache/xalan/processor/ProcessorGlobalParamDecl.java"
        "src/main/java/org/apache/xalan/processor/ProcessorGlobalVariableDecl.java"
        "src/main/java/org/apache/xalan/processor/ProcessorImport.java"
        "src/main/java/org/apache/xalan/processor/ProcessorInclude.java"
        "src/main/java/org/apache/xalan/processor/ProcessorKey.java"
        "src/main/java/org/apache/xalan/processor/ProcessorLRE.java"
        "src/main/java/org/apache/xalan/processor/ProcessorNamespaceAlias.java"
        "src/main/java/org/apache/xalan/processor/ProcessorOutputElem.java"
        "src/main/java/org/apache/xalan/processor/ProcessorPreserveSpace.java"
        "src/main/java/org/apache/xalan/processor/ProcessorStripSpace.java"
        "src/main/java/org/apache/xalan/processor/ProcessorStylesheetDoc.java"
        "src/main/java/org/apache/xalan/processor/ProcessorStylesheetElement.java"
        "src/main/java/org/apache/xalan/processor/ProcessorTemplate.java"
        "src/main/java/org/apache/xalan/processor/ProcessorTemplateElem.java"
        "src/main/java/org/apache/xalan/processor/ProcessorText.java"
        "src/main/java/org/apache/xalan/processor/ProcessorUnknown.java"
        "src/main/java/org/apache/xalan/processor/StylesheetHandler.java"
        "src/main/java/org/apache/xalan/processor/TransformerFactoryImpl.java"
        "src/main/java/org/apache/xalan/processor/WhitespaceInfoPaths.java"
        "src/main/java/org/apache/xalan/processor/XSLTAttributeDef.java"
        "src/main/java/org/apache/xalan/processor/XSLTElementDef.java"
        "src/main/java/org/apache/xalan/processor/XSLTElementProcessor.java"
        "src/main/java/org/apache/xalan/processor/XSLTSchema.java"
        "src/main/java/org/apache/xalan/res/XSLMessages.java"
        "src/main/java/org/apache/xalan/res/XSLTErrorResources.java"
        "src/main/java/org/apache/xalan/serialize/SerializerUtils.java"
        "src/main/java/org/apache/xalan/templates/AVT.java"
        "src/main/java/org/apache/xalan/templates/AVTPart.java"
        "src/main/java/org/apache/xalan/templates/AVTPartSimple.java"
        "src/main/java/org/apache/xalan/templates/AVTPartXPath.java"
        "src/main/java/org/apache/xalan/templates/AbsPathChecker.java"
        "src/main/java/org/apache/xalan/templates/Constants.java"
        "src/main/java/org/apache/xalan/templates/DecimalFormatProperties.java"
        "src/main/java/org/apache/xalan/templates/ElemApplyImport.java"
        "src/main/java/org/apache/xalan/templates/ElemApplyTemplates.java"
        "src/main/java/org/apache/xalan/templates/ElemAttribute.java"
        "src/main/java/org/apache/xalan/templates/ElemAttributeSet.java"
        "src/main/java/org/apache/xalan/templates/ElemCallTemplate.java"
        "src/main/java/org/apache/xalan/templates/ElemChoose.java"
        "src/main/java/org/apache/xalan/templates/ElemComment.java"
        "src/main/java/org/apache/xalan/templates/ElemCopy.java"
        "src/main/java/org/apache/xalan/templates/ElemCopyOf.java"
        "src/main/java/org/apache/xalan/templates/ElemElement.java"
        "src/main/java/org/apache/xalan/templates/ElemEmpty.java"
        "src/main/java/org/apache/xalan/templates/ElemExsltFuncResult.java"
        "src/main/java/org/apache/xalan/templates/ElemExsltFunction.java"
        "src/main/java/org/apache/xalan/templates/ElemExtensionCall.java"
        "src/main/java/org/apache/xalan/templates/ElemExtensionDecl.java"
        "src/main/java/org/apache/xalan/templates/ElemExtensionScript.java"
        "src/main/java/org/apache/xalan/templates/ElemFallback.java"
        "src/main/java/org/apache/xalan/templates/ElemForEach.java"
        "src/main/java/org/apache/xalan/templates/ElemIf.java"
        "src/main/java/org/apache/xalan/templates/ElemLiteralResult.java"
        "src/main/java/org/apache/xalan/templates/ElemMessage.java"
        "src/main/java/org/apache/xalan/templates/ElemNumber.java"
        "src/main/java/org/apache/xalan/templates/ElemOtherwise.java"
        "src/main/java/org/apache/xalan/templates/ElemPI.java"
        "src/main/java/org/apache/xalan/templates/ElemParam.java"
        "src/main/java/org/apache/xalan/templates/ElemSort.java"
        "src/main/java/org/apache/xalan/templates/ElemTemplate.java"
        "src/main/java/org/apache/xalan/templates/ElemTemplateElement.java"
        "src/main/java/org/apache/xalan/templates/ElemText.java"
        "src/main/java/org/apache/xalan/templates/ElemTextLiteral.java"
        "src/main/java/org/apache/xalan/templates/ElemUnknown.java"
        "src/main/java/org/apache/xalan/templates/ElemUse.java"
        "src/main/java/org/apache/xalan/templates/ElemValueOf.java"
        "src/main/java/org/apache/xalan/templates/ElemVariable.java"
        "src/main/java/org/apache/xalan/templates/ElemVariablePsuedo.java"
        "src/main/java/org/apache/xalan/templates/ElemWhen.java"
        "src/main/java/org/apache/xalan/templates/ElemWithParam.java"
        "src/main/java/org/apache/xalan/templates/FuncDocument.java"
        "src/main/java/org/apache/xalan/templates/FuncFormatNumb.java"
        "src/main/java/org/apache/xalan/templates/FuncKey.java"
        "src/main/java/org/apache/xalan/templates/KeyDeclaration.java"
        "src/main/java/org/apache/xalan/templates/NamespaceAlias.java"
        "src/main/java/org/apache/xalan/templates/OutputProperties.java"
        "src/main/java/org/apache/xalan/templates/RedundentExprEliminator.java"
        "src/main/java/org/apache/xalan/templates/Stylesheet.java"
        "src/main/java/org/apache/xalan/templates/StylesheetComposed.java"
        "src/main/java/org/apache/xalan/templates/StylesheetRoot.java"
        "src/main/java/org/apache/xalan/templates/TemplateList.java"
        "src/main/java/org/apache/xalan/templates/TemplateSubPatternAssociation.java"
        "src/main/java/org/apache/xalan/templates/VarNameCollector.java"
        "src/main/java/org/apache/xalan/templates/WhiteSpaceInfo.java"
        "src/main/java/org/apache/xalan/templates/XMLNSDecl.java"
        "src/main/java/org/apache/xalan/templates/XSLTVisitable.java"
        "src/main/java/org/apache/xalan/templates/XSLTVisitor.java"
        "src/main/java/org/apache/xalan/templates/XUnresolvedVariable.java"
        "src/main/java/org/apache/xalan/templates/XUnresolvedVariableSimple.java"
        "src/main/java/org/apache/xalan/transformer/ClonerToResultTree.java"
        "src/main/java/org/apache/xalan/transformer/Counter.java"
        "src/main/java/org/apache/xalan/transformer/CountersTable.java"
        "src/main/java/org/apache/xalan/transformer/DecimalToRoman.java"
        "src/main/java/org/apache/xalan/transformer/KeyIterator.java"
        "src/main/java/org/apache/xalan/transformer/KeyManager.java"
        "src/main/java/org/apache/xalan/transformer/KeyTable.java"
        "src/main/java/org/apache/xalan/transformer/MsgMgr.java"
        "src/main/java/org/apache/xalan/transformer/NodeSortKey.java"
        "src/main/java/org/apache/xalan/transformer/NodeSorter.java"
        "src/main/java/org/apache/xalan/transformer/SerializerSwitcher.java"
        "src/main/java/org/apache/xalan/transformer/TrAXFilter.java"
        "src/main/java/org/apache/xalan/transformer/TransformState.java"
        "src/main/java/org/apache/xalan/transformer/TransformerClient.java"
        "src/main/java/org/apache/xalan/transformer/TransformerHandlerImpl.java"
        "src/main/java/org/apache/xalan/transformer/TransformerIdentityImpl.java"
        "src/main/java/org/apache/xalan/transformer/TransformerImpl.java"
        "src/main/java/org/apache/xalan/transformer/TreeWalker2Result.java"
        "src/main/java/org/apache/xalan/transformer/XalanProperties.java"
        "src/main/java/org/apache/xalan/transformer/XalanTransformState.java"
        "src/main/java/org/apache/xalan/xslt/EnvironmentCheck.java"
        "src/main/java/org/apache/xalan/xslt/ObjectFactory.java"
        "src/main/java/org/apache/xalan/xslt/SecuritySupport.java"
        "src/main/java/org/apache/xalan/xslt/SecuritySupport12.java"
        "src/main/java/org/apache/xml/dtm/Axis.java"
        "src/main/java/org/apache/xml/dtm/DTM.java"
        "src/main/java/org/apache/xml/dtm/DTMAxisIterator.java"
        "src/main/java/org/apache/xml/dtm/DTMAxisTraverser.java"
        "src/main/java/org/apache/xml/dtm/DTMConfigurationException.java"
        "src/main/java/org/apache/xml/dtm/DTMDOMException.java"
        "src/main/java/org/apache/xml/dtm/DTMException.java"
        "src/main/java/org/apache/xml/dtm/DTMFilter.java"
        "src/main/java/org/apache/xml/dtm/DTMIterator.java"
        "src/main/java/org/apache/xml/dtm/DTMManager.java"
        "src/main/java/org/apache/xml/dtm/DTMWSFilter.java"
        "src/main/java/org/apache/xml/dtm/ObjectFactory.java"
        "src/main/java/org/apache/xml/dtm/SecuritySupport.java"
        "src/main/java/org/apache/xml/dtm/SecuritySupport12.java"
        "src/main/java/org/apache/xml/dtm/ref/ChunkedIntArray.java"
        "src/main/java/org/apache/xml/dtm/ref/CoroutineManager.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMAxisIterNodeList.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMAxisIteratorBase.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMChildIterNodeList.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMDefaultBase.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMDefaultBaseIterators.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMDefaultBaseTraversers.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMDocumentImpl.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMManagerDefault.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMNamedNodeMap.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMNodeIterator.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMNodeList.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMNodeListBase.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMNodeProxy.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMStringPool.java"
        "src/main/java/org/apache/xml/dtm/ref/DTMTreeWalker.java"
        "src/main/java/org/apache/xml/dtm/ref/ExpandedNameTable.java"
        "src/main/java/org/apache/xml/dtm/ref/ExtendedType.java"
        "src/main/java/org/apache/xml/dtm/ref/IncrementalSAXSource.java"
        "src/main/java/org/apache/xml/dtm/ref/IncrementalSAXSource_Filter.java"
        "src/main/java/org/apache/xml/dtm/ref/NodeLocator.java"
        "src/main/java/org/apache/xml/dtm/ref/SecuritySupport.java"
        "src/main/java/org/apache/xml/dtm/ref/SecuritySupport12.java"
        "src/main/java/org/apache/xml/dtm/ref/dom2dtm/DOM2DTM.java"
        "src/main/java/org/apache/xml/dtm/ref/dom2dtm/DOM2DTMdefaultNamespaceDeclarationNode.java"
        "src/main/java/org/apache/xml/dtm/ref/sax2dtm/SAX2DTM.java"
        "src/main/java/org/apache/xml/dtm/ref/sax2dtm/SAX2DTM2.java"
        "src/main/java/org/apache/xml/dtm/ref/sax2dtm/SAX2RTFDTM.java"
        "src/main/java/org/apache/xml/res/XMLErrorResources.java"
        "src/main/java/org/apache/xml/res/XMLMessages.java"
        "src/main/java/org/apache/xml/serializer/AttributesImplSerializer.java"
        "src/main/java/org/apache/xml/serializer/CharInfo.java"
        "src/main/java/org/apache/xml/serializer/DOM3Serializer.java"
        "src/main/java/org/apache/xml/serializer/DOMSerializer.java"
        "src/main/java/org/apache/xml/serializer/ElemContext.java"
        "src/main/java/org/apache/xml/serializer/ElemDesc.java"
        "src/main/java/org/apache/xml/serializer/EncodingInfo.java"
        "src/main/java/org/apache/xml/serializer/Encodings.java"
        "src/main/java/org/apache/xml/serializer/ExtendedContentHandler.java"
        "src/main/java/org/apache/xml/serializer/ExtendedLexicalHandler.java"
        "src/main/java/org/apache/xml/serializer/Method.java"
        "src/main/java/org/apache/xml/serializer/NamespaceMappings.java"
        "src/main/java/org/apache/xml/serializer/ObjectFactory.java"
        "src/main/java/org/apache/xml/serializer/OutputPropertiesFactory.java"
        "src/main/java/org/apache/xml/serializer/OutputPropertyUtils.java"
        "src/main/java/org/apache/xml/serializer/SecuritySupport.java"
        "src/main/java/org/apache/xml/serializer/SecuritySupport12.java"
        "src/main/java/org/apache/xml/serializer/SerializationHandler.java"
        "src/main/java/org/apache/xml/serializer/Serializer.java"
        "src/main/java/org/apache/xml/serializer/SerializerBase.java"
        "src/main/java/org/apache/xml/serializer/SerializerConstants.java"
        "src/main/java/org/apache/xml/serializer/SerializerFactory.java"
        "src/main/java/org/apache/xml/serializer/SerializerTrace.java"
        "src/main/java/org/apache/xml/serializer/SerializerTraceWriter.java"
        "src/main/java/org/apache/xml/serializer/ToHTMLStream.java"
        "src/main/java/org/apache/xml/serializer/ToSAXHandler.java"
        "src/main/java/org/apache/xml/serializer/ToStream.java"
        "src/main/java/org/apache/xml/serializer/ToTextSAXHandler.java"
        "src/main/java/org/apache/xml/serializer/ToTextStream.java"
        "src/main/java/org/apache/xml/serializer/ToUnknownStream.java"
        "src/main/java/org/apache/xml/serializer/ToXMLSAXHandler.java"
        "src/main/java/org/apache/xml/serializer/ToXMLStream.java"
        "src/main/java/org/apache/xml/serializer/TransformStateSetter.java"
        "src/main/java/org/apache/xml/serializer/TreeWalker.java"
        "src/main/java/org/apache/xml/serializer/Version.java"
        "src/main/java/org/apache/xml/serializer/WriterChain.java"
        "src/main/java/org/apache/xml/serializer/WriterToASCI.java"
        "src/main/java/org/apache/xml/serializer/WriterToUTF8Buffered.java"
        "src/main/java/org/apache/xml/serializer/XSLOutputAttributes.java"
        "src/main/java/org/apache/xml/serializer/dom3/DOM3SerializerImpl.java"
        "src/main/java/org/apache/xml/serializer/dom3/DOM3TreeWalker.java"
        "src/main/java/org/apache/xml/serializer/dom3/DOMConstants.java"
        "src/main/java/org/apache/xml/serializer/dom3/DOMErrorHandlerImpl.java"
        "src/main/java/org/apache/xml/serializer/dom3/DOMErrorImpl.java"
        "src/main/java/org/apache/xml/serializer/dom3/DOMLocatorImpl.java"
        "src/main/java/org/apache/xml/serializer/dom3/DOMOutputImpl.java"
        "src/main/java/org/apache/xml/serializer/dom3/DOMStringListImpl.java"
        "src/main/java/org/apache/xml/serializer/dom3/LSSerializerImpl.java"
        "src/main/java/org/apache/xml/serializer/dom3/NamespaceSupport.java"
        "src/main/java/org/apache/xml/serializer/utils/AttList.java"
        "src/main/java/org/apache/xml/serializer/utils/DOM2Helper.java"
        "src/main/java/org/apache/xml/serializer/utils/Messages.java"
        "src/main/java/org/apache/xml/serializer/utils/MsgKey.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_ca.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_cs.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_de.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_en.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_es.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_fr.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_hu.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_it.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_ja.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_ko.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_pl.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_pt_BR.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_ru.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_sk.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_sl.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_sv.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_tr.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_zh.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_zh_CN.java"
        "src/main/java/org/apache/xml/serializer/utils/SerializerMessages_zh_TW.java"
        "src/main/java/org/apache/xml/serializer/utils/StringToIntTable.java"
        "src/main/java/org/apache/xml/serializer/utils/SystemIDResolver.java"
        "src/main/java/org/apache/xml/serializer/utils/URI.java"
        "src/main/java/org/apache/xml/serializer/utils/Utils.java"
        "src/main/java/org/apache/xml/serializer/utils/WrappedRuntimeException.java"
        "src/main/java/org/apache/xml/serializer/utils/XML11Char.java"
        "src/main/java/org/apache/xml/serializer/utils/XMLChar.java"
        "src/main/java/org/apache/xml/utils/AttList.java"
        "src/main/java/org/apache/xml/utils/BoolStack.java"
        "src/main/java/org/apache/xml/utils/Constants.java"
        "src/main/java/org/apache/xml/utils/DOM2Helper.java"
        "src/main/java/org/apache/xml/utils/DOMBuilder.java"
        "src/main/java/org/apache/xml/utils/DOMHelper.java"
        "src/main/java/org/apache/xml/utils/DOMOrder.java"
        "src/main/java/org/apache/xml/utils/DefaultErrorHandler.java"
        "src/main/java/org/apache/xml/utils/FastStringBuffer.java"
        "src/main/java/org/apache/xml/utils/IntStack.java"
        "src/main/java/org/apache/xml/utils/IntVector.java"
        "src/main/java/org/apache/xml/utils/NSInfo.java"
        "src/main/java/org/apache/xml/utils/NameSpace.java"
        "src/main/java/org/apache/xml/utils/NamespaceSupport2.java"
        "src/main/java/org/apache/xml/utils/NodeConsumer.java"
        "src/main/java/org/apache/xml/utils/NodeVector.java"
        "src/main/java/org/apache/xml/utils/ObjectFactory.java"
        "src/main/java/org/apache/xml/utils/ObjectPool.java"
        "src/main/java/org/apache/xml/utils/ObjectStack.java"
        "src/main/java/org/apache/xml/utils/ObjectVector.java"
        "src/main/java/org/apache/xml/utils/PrefixResolver.java"
        "src/main/java/org/apache/xml/utils/PrefixResolverDefault.java"
        "src/main/java/org/apache/xml/utils/QName.java"
        "src/main/java/org/apache/xml/utils/SAXSourceLocator.java"
        "src/main/java/org/apache/xml/utils/SecuritySupport.java"
        "src/main/java/org/apache/xml/utils/SecuritySupport12.java"
        "src/main/java/org/apache/xml/utils/StopParseException.java"
        "src/main/java/org/apache/xml/utils/StringBufferPool.java"
        "src/main/java/org/apache/xml/utils/StringToIntTable.java"
        "src/main/java/org/apache/xml/utils/StringVector.java"
        "src/main/java/org/apache/xml/utils/StylesheetPIHandler.java"
        "src/main/java/org/apache/xml/utils/SuballocatedIntVector.java"
        "src/main/java/org/apache/xml/utils/SystemIDResolver.java"
        "src/main/java/org/apache/xml/utils/ThreadControllerWrapper.java"
        "src/main/java/org/apache/xml/utils/TreeWalker.java"
        "src/main/java/org/apache/xml/utils/URI.java"
        "src/main/java/org/apache/xml/utils/UnImplNode.java"
        "src/main/java/org/apache/xml/utils/WrappedRuntimeException.java"
        "src/main/java/org/apache/xml/utils/XML11Char.java"
        "src/main/java/org/apache/xml/utils/XMLChar.java"
        "src/main/java/org/apache/xml/utils/XMLCharacterRecognizer.java"
        "src/main/java/org/apache/xml/utils/XMLReaderManager.java"
        "src/main/java/org/apache/xml/utils/XMLString.java"
        "src/main/java/org/apache/xml/utils/XMLStringDefault.java"
        "src/main/java/org/apache/xml/utils/XMLStringFactory.java"
        "src/main/java/org/apache/xml/utils/res/CharArrayWrapper.java"
        "src/main/java/org/apache/xml/utils/res/IntArrayWrapper.java"
        "src/main/java/org/apache/xml/utils/res/LongArrayWrapper.java"
        "src/main/java/org/apache/xml/utils/res/StringArrayWrapper.java"
        "src/main/java/org/apache/xml/utils/res/XResourceBundle.java"
        "src/main/java/org/apache/xml/utils/res/XResourceBundleBase.java"
        "src/main/java/org/apache/xml/utils/res/XResources_cy.java"
        "src/main/java/org/apache/xml/utils/res/XResources_de.java"
        "src/main/java/org/apache/xml/utils/res/XResources_el.java"
        "src/main/java/org/apache/xml/utils/res/XResources_en.java"
        "src/main/java/org/apache/xml/utils/res/XResources_es.java"
        "src/main/java/org/apache/xml/utils/res/XResources_fr.java"
        "src/main/java/org/apache/xml/utils/res/XResources_he.java"
        "src/main/java/org/apache/xml/utils/res/XResources_hy.java"
        "src/main/java/org/apache/xml/utils/res/XResources_it.java"
        "src/main/java/org/apache/xml/utils/res/XResources_ja_JP_A.java"
        "src/main/java/org/apache/xml/utils/res/XResources_ja_JP_HA.java"
        "src/main/java/org/apache/xml/utils/res/XResources_ja_JP_HI.java"
        "src/main/java/org/apache/xml/utils/res/XResources_ja_JP_I.java"
        "src/main/java/org/apache/xml/utils/res/XResources_ka.java"
        "src/main/java/org/apache/xml/utils/res/XResources_ko.java"
        "src/main/java/org/apache/xml/utils/res/XResources_sv.java"
        "src/main/java/org/apache/xml/utils/res/XResources_zh_CN.java"
        "src/main/java/org/apache/xml/utils/res/XResources_zh_TW.java"
        "src/main/java/org/apache/xpath/Arg.java"
        "src/main/java/org/apache/xpath/CachedXPathAPI.java"
        "src/main/java/org/apache/xpath/Expression.java"
        "src/main/java/org/apache/xpath/ExpressionNode.java"
        "src/main/java/org/apache/xpath/ExpressionOwner.java"
        "src/main/java/org/apache/xpath/ExtensionsProvider.java"
        "src/main/java/org/apache/xpath/FoundIndex.java"
        "src/main/java/org/apache/xpath/NodeSet.java"
        "src/main/java/org/apache/xpath/NodeSetDTM.java"
        "src/main/java/org/apache/xpath/SourceTree.java"
        "src/main/java/org/apache/xpath/SourceTreeManager.java"
        "src/main/java/org/apache/xpath/VariableStack.java"
        "src/main/java/org/apache/xpath/WhitespaceStrippingElementMatcher.java"
        "src/main/java/org/apache/xpath/XPath.java"
        "src/main/java/org/apache/xpath/XPathAPI.java"
        "src/main/java/org/apache/xpath/XPathContext.java"
        "src/main/java/org/apache/xpath/XPathException.java"
        "src/main/java/org/apache/xpath/XPathFactory.java"
        "src/main/java/org/apache/xpath/XPathProcessorException.java"
        "src/main/java/org/apache/xpath/XPathVisitable.java"
        "src/main/java/org/apache/xpath/XPathVisitor.java"
        "src/main/java/org/apache/xpath/axes/AttributeIterator.java"
        "src/main/java/org/apache/xpath/axes/AxesWalker.java"
        "src/main/java/org/apache/xpath/axes/BasicTestIterator.java"
        "src/main/java/org/apache/xpath/axes/ChildIterator.java"
        "src/main/java/org/apache/xpath/axes/ChildTestIterator.java"
        "src/main/java/org/apache/xpath/axes/ContextNodeList.java"
        "src/main/java/org/apache/xpath/axes/DescendantIterator.java"
        "src/main/java/org/apache/xpath/axes/FilterExprIterator.java"
        "src/main/java/org/apache/xpath/axes/FilterExprIteratorSimple.java"
        "src/main/java/org/apache/xpath/axes/FilterExprWalker.java"
        "src/main/java/org/apache/xpath/axes/HasPositionalPredChecker.java"
        "src/main/java/org/apache/xpath/axes/IteratorPool.java"
        "src/main/java/org/apache/xpath/axes/LocPathIterator.java"
        "src/main/java/org/apache/xpath/axes/MatchPatternIterator.java"
        "src/main/java/org/apache/xpath/axes/NodeSequence.java"
        "src/main/java/org/apache/xpath/axes/OneStepIterator.java"
        "src/main/java/org/apache/xpath/axes/OneStepIteratorForward.java"
        "src/main/java/org/apache/xpath/axes/PathComponent.java"
        "src/main/java/org/apache/xpath/axes/PredicatedNodeTest.java"
        "src/main/java/org/apache/xpath/axes/RTFIterator.java"
        "src/main/java/org/apache/xpath/axes/ReverseAxesWalker.java"
        "src/main/java/org/apache/xpath/axes/SelfIteratorNoPredicate.java"
        "src/main/java/org/apache/xpath/axes/SubContextList.java"
        "src/main/java/org/apache/xpath/axes/UnionChildIterator.java"
        "src/main/java/org/apache/xpath/axes/UnionPathIterator.java"
        "src/main/java/org/apache/xpath/axes/WalkerFactory.java"
        "src/main/java/org/apache/xpath/axes/WalkingIterator.java"
        "src/main/java/org/apache/xpath/axes/WalkingIteratorSorted.java"
        "src/main/java/org/apache/xpath/compiler/Compiler.java"
        "src/main/java/org/apache/xpath/compiler/FunctionTable.java"
        "src/main/java/org/apache/xpath/compiler/Keywords.java"
        "src/main/java/org/apache/xpath/compiler/Lexer.java"
        "src/main/java/org/apache/xpath/compiler/OpCodes.java"
        "src/main/java/org/apache/xpath/compiler/OpMap.java"
        "src/main/java/org/apache/xpath/compiler/OpMapVector.java"
        "src/main/java/org/apache/xpath/compiler/PsuedoNames.java"
        "src/main/java/org/apache/xpath/compiler/XPathDumper.java"
        "src/main/java/org/apache/xpath/compiler/XPathParser.java"
        "src/main/java/org/apache/xpath/domapi/XPathStylesheetDOM3Exception.java"
        "src/main/java/org/apache/xpath/functions/FuncBoolean.java"
        "src/main/java/org/apache/xpath/functions/FuncCeiling.java"
        "src/main/java/org/apache/xpath/functions/FuncConcat.java"
        "src/main/java/org/apache/xpath/functions/FuncContains.java"
        "src/main/java/org/apache/xpath/functions/FuncCount.java"
        "src/main/java/org/apache/xpath/functions/FuncCurrent.java"
        "src/main/java/org/apache/xpath/functions/FuncDoclocation.java"
        "src/main/java/org/apache/xpath/functions/FuncExtElementAvailable.java"
        "src/main/java/org/apache/xpath/functions/FuncExtFunction.java"
        "src/main/java/org/apache/xpath/functions/FuncExtFunctionAvailable.java"
        "src/main/java/org/apache/xpath/functions/FuncFalse.java"
        "src/main/java/org/apache/xpath/functions/FuncFloor.java"
        "src/main/java/org/apache/xpath/functions/FuncGenerateId.java"
        "src/main/java/org/apache/xpath/functions/FuncId.java"
        "src/main/java/org/apache/xpath/functions/FuncLang.java"
        "src/main/java/org/apache/xpath/functions/FuncLast.java"
        "src/main/java/org/apache/xpath/functions/FuncLocalPart.java"
        "src/main/java/org/apache/xpath/functions/FuncNamespace.java"
        "src/main/java/org/apache/xpath/functions/FuncNormalizeSpace.java"
        "src/main/java/org/apache/xpath/functions/FuncNot.java"
        "src/main/java/org/apache/xpath/functions/FuncNumber.java"
        "src/main/java/org/apache/xpath/functions/FuncPosition.java"
        "src/main/java/org/apache/xpath/functions/FuncQname.java"
        "src/main/java/org/apache/xpath/functions/FuncRound.java"
        "src/main/java/org/apache/xpath/functions/FuncStartsWith.java"
        "src/main/java/org/apache/xpath/functions/FuncString.java"
        "src/main/java/org/apache/xpath/functions/FuncStringLength.java"
        "src/main/java/org/apache/xpath/functions/FuncSubstring.java"
        "src/main/java/org/apache/xpath/functions/FuncSubstringAfter.java"
        "src/main/java/org/apache/xpath/functions/FuncSubstringBefore.java"
        "src/main/java/org/apache/xpath/functions/FuncSum.java"
        "src/main/java/org/apache/xpath/functions/FuncSystemProperty.java"
        "src/main/java/org/apache/xpath/functions/FuncTranslate.java"
        "src/main/java/org/apache/xpath/functions/FuncTrue.java"
        "src/main/java/org/apache/xpath/functions/FuncUnparsedEntityURI.java"
        "src/main/java/org/apache/xpath/functions/Function.java"
        "src/main/java/org/apache/xpath/functions/Function2Args.java"
        "src/main/java/org/apache/xpath/functions/Function3Args.java"
        "src/main/java/org/apache/xpath/functions/FunctionDef1Arg.java"
        "src/main/java/org/apache/xpath/functions/FunctionMultiArgs.java"
        "src/main/java/org/apache/xpath/functions/FunctionOneArg.java"
        "src/main/java/org/apache/xpath/functions/ObjectFactory.java"
        "src/main/java/org/apache/xpath/functions/SecuritySupport.java"
        "src/main/java/org/apache/xpath/functions/SecuritySupport12.java"
        "src/main/java/org/apache/xpath/functions/WrongNumberArgsException.java"
        "src/main/java/org/apache/xpath/jaxp/JAXPExtensionsProvider.java"
        "src/main/java/org/apache/xpath/jaxp/JAXPPrefixResolver.java"
        "src/main/java/org/apache/xpath/jaxp/JAXPVariableStack.java"
        "src/main/java/org/apache/xpath/jaxp/XPathExpressionImpl.java"
        "src/main/java/org/apache/xpath/jaxp/XPathFactoryImpl.java"
        "src/main/java/org/apache/xpath/jaxp/XPathImpl.java"
        "src/main/java/org/apache/xpath/objects/DTMXRTreeFrag.java"
        "src/main/java/org/apache/xpath/objects/XBoolean.java"
        "src/main/java/org/apache/xpath/objects/XBooleanStatic.java"
        "src/main/java/org/apache/xpath/objects/XMLStringFactoryImpl.java"
        "src/main/java/org/apache/xpath/objects/XNodeSet.java"
        "src/main/java/org/apache/xpath/objects/XNodeSetForDOM.java"
        "src/main/java/org/apache/xpath/objects/XNull.java"
        "src/main/java/org/apache/xpath/objects/XNumber.java"
        "src/main/java/org/apache/xpath/objects/XObject.java"
        "src/main/java/org/apache/xpath/objects/XObjectFactory.java"
        "src/main/java/org/apache/xpath/objects/XRTreeFrag.java"
        "src/main/java/org/apache/xpath/objects/XRTreeFragSelectWrapper.java"
        "src/main/java/org/apache/xpath/objects/XString.java"
        "src/main/java/org/apache/xpath/objects/XStringForChars.java"
        "src/main/java/org/apache/xpath/objects/XStringForFSB.java"
        "src/main/java/org/apache/xpath/operations/And.java"
        "src/main/java/org/apache/xpath/operations/Bool.java"
        "src/main/java/org/apache/xpath/operations/Div.java"
        "src/main/java/org/apache/xpath/operations/Equals.java"
        "src/main/java/org/apache/xpath/operations/Gt.java"
        "src/main/java/org/apache/xpath/operations/Gte.java"
        "src/main/java/org/apache/xpath/operations/Lt.java"
        "src/main/java/org/apache/xpath/operations/Lte.java"
        "src/main/java/org/apache/xpath/operations/Minus.java"
        "src/main/java/org/apache/xpath/operations/Mod.java"
        "src/main/java/org/apache/xpath/operations/Mult.java"
        "src/main/java/org/apache/xpath/operations/Neg.java"
        "src/main/java/org/apache/xpath/operations/NotEquals.java"
        "src/main/java/org/apache/xpath/operations/Number.java"
        "src/main/java/org/apache/xpath/operations/Operation.java"
        "src/main/java/org/apache/xpath/operations/Or.java"
        "src/main/java/org/apache/xpath/operations/Plus.java"
        "src/main/java/org/apache/xpath/operations/Quo.java"
        "src/main/java/org/apache/xpath/operations/String.java"
        "src/main/java/org/apache/xpath/operations/UnaryOperation.java"
        "src/main/java/org/apache/xpath/operations/Variable.java"
        "src/main/java/org/apache/xpath/operations/VariableSafeAbsRef.java"
        "src/main/java/org/apache/xpath/patterns/ContextMatchStepPattern.java"
        "src/main/java/org/apache/xpath/patterns/FunctionPattern.java"
        "src/main/java/org/apache/xpath/patterns/NodeTest.java"
        "src/main/java/org/apache/xpath/patterns/NodeTestFilter.java"
        "src/main/java/org/apache/xpath/patterns/StepPattern.java"
        "src/main/java/org/apache/xpath/patterns/UnionPattern.java"
        "src/main/java/org/apache/xpath/res/XPATHErrorResources.java"
        "src/main/java/org/apache/xpath/res/XPATHMessages.java"
    ];
    java_resource_dirs = ["src/main/java"];

    installable = true;
    hostdex = true;
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };

    no_standard_libs = true;
    libs = ["core-all"];
    system_modules = "core-all-system-modules";
};

#  A guaranteed unstripped version of apache-xml for use on device.
#  The build system may or may not strip the apache-xml jar, but this one will
#  not be stripped. See b/24535627.
apache-xml-testdex = java_library {
    name = "apache-xml-testdex";
    static_libs = ["apache-xml"];

    installable = true;
    dex_preopt = {
        enabled = false;
    };

    no_framework_libs = true;
};

in { inherit apache-xml apache-xml-testdex apache-xml_api_files; }
