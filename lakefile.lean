import Lake
open Lake DSL

package "Classifying-Root-Systems" where
  version := v!"0.1.0"

lean_lib «ClassifyingRootSystems» where
  -- add library configuration options here

@[default_target]
lean_exe "classifying-root-systems" where
  root := `Main
