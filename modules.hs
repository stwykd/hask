-- Haskell groups top-level bindings into modules
--   Default module name is Main, as programs start at function main in Main
--   Except for Main, a module named M must reside in a file named M.hs
--   Module names are capitalized; use lower-case file names for Main modules

-- Start module with "module name where" or "module name (exported-symbol[, ...]) where"
module Main where      -- redundant since Main is the default
import System.IO
-- import module - imports all symbols in module
-- import qualified module as ID - prefixes imported symbols with ID.
-- import module (function1[, function2 ...]) - imports just the named functions
-- import module hiding (function1[, function2 ...]) - imports all but the named functions
