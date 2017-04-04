```
 $ mkdir 101st-prime-via-epm-init && cd "$_"

 $ epm init
Package name? [default: 101st-prime-via-epm-init] 101st-prime
Package version? [default: 0.1.0.0]
Please choose a license:
 * 1) (none)
   2) GPL-2
   3) GPL-3
   4) LGPL-2.1
   5) LGPL-3
   6) AGPL-3
   7) BSD2
   8) BSD3
   9) MIT
  10) ISC
  11) MPL-2.0
  12) Apache-2.0
  13) PublicDomain
  14) AllRightsReserved
  15) Other (specify)
Your choice? [default: (none)] 9
Author name? [default: Filippo Vitale]
Maintainer email? [default: *******@gmail.com] 
Project homepage URL? https://github.com/filippovitale/eta-playground/101st-prime-via-epm-init
Project synopsis? Simplest project created with epm init
Project category:
 * 1) (none)
   2) Codec
   3) Concurrency
   4) Control
   5) Data
   6) Database
   7) Development
   8) Distribution
   9) Game
  10) Graphics
  11) Language
  12) Math
  13) Network
  14) Sound
  15) System
  16) Testing
  17) Text
  18) Web
  19) Other (specify)
Your choice? [default: (none)]
What does the package build:
   1) Library
   2) Executable
Your choice? 2
What is the main module of the executable:
 * 1) Main.hs (does not yet exist)
   2) Main.lhs (does not yet exist)
   3) Other (specify)
Your choice? [default: Main.hs (does not yet exist)]
What base language is the package written in:
 * 1) Haskell2010
   2) Haskell98
   3) Other (specify)
Your choice? [default: Haskell2010]
Include documentation on what each field means (y/n)? [default: n]
Source directory:
 * 1) (none)
   2) src
   3) Other (specify)
Your choice? [default: (none)] 2

Guessing dependencies...

Generating LICENSE...
Generating Setup.hs...
Generating 101st-prime.cabal...

You may want to edit the .cabal file and add a Description field.

$ tree
.
├── 101st-prime.cabal
├── LICENSE
├── Setup.hs
└── src
```


```
$ tree
.
├── 101st-prime.cabal
├── LICENSE
├── Setup.hs
└── src
    ├── Main.hs
    └── Primes.hs

$ git diff
diff --git a/101st-prime-via-epm-init/101st-prime.cabal b/101st-prime-via-epm-init/101st-prime.cabal
index 028fe87..2367337 100644
--- a/101st-prime-via-epm-init/101st-prime.cabal
+++ b/101st-prime-via-epm-init/101st-prime.cabal
@@ -18,7 +18,7 @@ cabal-version:       >=1.10

 executable 101st-prime
   main-is:             Main.hs
-  -- other-modules:
+  other-modules:       Primes
   -- other-extensions:
   build-depends:       base >=4.8 && <4.9
   hs-source-dirs:      src
```
