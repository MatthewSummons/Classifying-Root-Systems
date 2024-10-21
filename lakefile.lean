import Lake
open Lake DSL

package "Classifying-Root-Systems" where
  version := v!"0.1.0"

lean_lib «ClassifyingRootSystems» where
  -- add library configuration options here

@[default_target]
lean_exe "classifying-root-systems" where
  root := `Main

require checkdecls from git "https://github.com/PatrickMassot/checkdecls.git"

meta if get_config? env = some "dev" then
require «doc-gen4» from git
  "https://github.com/leanprover/doc-gen4" @ "main"