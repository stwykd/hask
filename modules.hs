-- Haskell groups top-level bindings into modules
--   Default module name is Main, as programs start at function main in Main
--   Except for Main, a module named M must reside in a file named M.hs
--   Module names are capitalized; I use lower-case file names for Main modules

module Main where      -- redundant since Main is the default
import System.IO
-- import module - imports all symbols in module
-- import qualified module as ID - prefixes imported symbols with ID.
-- import module (function1[, function2 ...]) - imports just the named functions
-- import module hiding (function1[, function2 ...]) - imports all but the named functions

greet h = do
  hPutStrLn h "What is your name?"
  name <- hGetLine h
  hPutStrLn h $ "Hi, " ++ name

withTty = withFile "/dev/tty" ReadWriteMode

main = withTty greet
-- Greeting task requires some impure (non-functional) actions
--   Reading and writing a file handle
-- A do block lets you sequence IO actions. In a do block:
--   pat <- action - binds pat (variable or constructor pattern) to result of executing action
--   let pat = pure-value - binds pat to pure-value (no "in ..." required)
--   action - executes action and discards the result, or returns it if at end of block
-- GHCI input is like do block (i.e., can use <-, need let for bindings)
