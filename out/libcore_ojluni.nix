{ phony }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

#  Phony target that causes the build to check the license file in this
#  directory, detect that it is a GPL license and then copy all the files
#  from this directory and its subdirectories in to the
#  ${OUT}/obj/PACKAGING/gpl_source_intermediates/gpl_source.tgz file.
ojluni-phony = phony {
    name = "ojluni-phony";

    #  A phony module must have at least one dependency.
    required = [
        "core-oj"
    ];
};

in { inherit ojluni-phony; }
