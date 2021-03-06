#
# Copyright 2014 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name 'util-macros'
default_version 'util-macros-1.18.0'

source git: "https://gitlab.freedesktop.org/xorg/util/macros"

license 'MIT'
license_file 'COPYING'

skip_transitive_dependency_licensing true

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command './autogen.sh', env: env
  command './configure' \
          " --prefix=#{install_dir}/embedded", env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
