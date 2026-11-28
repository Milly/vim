#!/bin/bash

# '#' inside a word is not a comment
nix build .#foo
echo foo#bar
src=$(nix eval --raw .#foo.src)
f() { nix build .#foo; }
if true; then nix build .#foo; fi
for x in a; do nix build .#foo; done
( nix build .#foo )
case $x in a) nix build .#foo ;; esac
arr=(a#b c)
touch a#b
echo "a"#b 'a'#b \#b ${x-a}#b
echo $(echo a)#b a\;#b $((1))#b
f() { nix build $(echo a)#b $((1))#b; }

# '#' at the start of a word is a comment
echo foo # comment
x=$(cmd) # comment
if true; then :;# comment
fi
case x in x)# comment
:;; esac
f() { :; } # comment
echo ${#arr[@]} $# ${var#prefix} ${var##*/}
