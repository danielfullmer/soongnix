{ java_library_host }:
let

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

antlr-runtime = java_library_host {
    name = "antlr-runtime";
    srcs = [
        "runtime/Java/src/main/java/org/antlr/runtime/ANTLRFileStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/ANTLRInputStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/ANTLRReaderStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/ANTLRStringStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/BaseRecognizer.java"
        "runtime/Java/src/main/java/org/antlr/runtime/BitSet.java"
        "runtime/Java/src/main/java/org/antlr/runtime/BufferedTokenStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/CharStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/CharStreamState.java"
        "runtime/Java/src/main/java/org/antlr/runtime/ClassicToken.java"
        "runtime/Java/src/main/java/org/antlr/runtime/CommonToken.java"
        "runtime/Java/src/main/java/org/antlr/runtime/CommonTokenStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/DFA.java"
        "runtime/Java/src/main/java/org/antlr/runtime/EarlyExitException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/FailedPredicateException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/IntStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/LegacyCommonTokenStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/Lexer.java"
        "runtime/Java/src/main/java/org/antlr/runtime/MismatchedNotSetException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/MismatchedRangeException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/MismatchedSetException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/MismatchedTokenException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/MismatchedTreeNodeException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/MissingTokenException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/NoViableAltException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/Parser.java"
        "runtime/Java/src/main/java/org/antlr/runtime/ParserRuleReturnScope.java"
        "runtime/Java/src/main/java/org/antlr/runtime/RecognitionException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/RecognizerSharedState.java"
        "runtime/Java/src/main/java/org/antlr/runtime/RuleReturnScope.java"
        "runtime/Java/src/main/java/org/antlr/runtime/SerializedGrammar.java"
        "runtime/Java/src/main/java/org/antlr/runtime/Token.java"
        "runtime/Java/src/main/java/org/antlr/runtime/TokenRewriteStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/TokenSource.java"
        "runtime/Java/src/main/java/org/antlr/runtime/TokenStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/UnbufferedTokenStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/UnwantedTokenException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/BlankDebugEventListener.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/DebugEventHub.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/DebugEventListener.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/DebugEventRepeater.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/DebugEventSocketProxy.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/DebugParser.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/DebugTokenStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/DebugTreeAdaptor.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/DebugTreeNodeStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/DebugTreeParser.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/ParseTreeBuilder.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/Profiler.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/RemoteDebugEventSocketListener.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/TraceDebugEventListener.java"
        "runtime/Java/src/main/java/org/antlr/runtime/debug/Tracer.java"
        "runtime/Java/src/main/java/org/antlr/runtime/misc/DoubleKeyMap.java"
        "runtime/Java/src/main/java/org/antlr/runtime/misc/FastQueue.java"
        "runtime/Java/src/main/java/org/antlr/runtime/misc/IntArray.java"
        "runtime/Java/src/main/java/org/antlr/runtime/misc/LookaheadStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/misc/Stats.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/BaseTree.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/BaseTreeAdaptor.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/BufferedTreeNodeStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/CommonErrorNode.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/CommonTree.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/CommonTreeAdaptor.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/CommonTreeNodeStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/DOTTreeGenerator.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/ParseTree.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/PositionTrackingStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/RewriteCardinalityException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/RewriteEarlyExitException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/RewriteEmptyStreamException.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/RewriteRuleElementStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/RewriteRuleNodeStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/RewriteRuleSubtreeStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/RewriteRuleTokenStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/Tree.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreeAdaptor.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreeFilter.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreeIterator.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreeNodeStream.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreeParser.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreePatternLexer.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreePatternParser.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreeRewriter.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreeRuleReturnScope.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreeVisitor.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreeVisitorAction.java"
        "runtime/Java/src/main/java/org/antlr/runtime/tree/TreeWizard.java"
    ];
    # Remove DOTTreeGenerator.java, so that we don't have the StringTemplate library as a dependency
    exclude_srcs = ["runtime/Java/src/main/java/org/antlr/runtime/tree/DOTTreeGenerator.java"];
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"]; #  b/73499927
    };
};

in { inherit antlr-runtime; }
