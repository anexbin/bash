#!/bin/bash
# This creates a hidden file (the dot at the start of the name hides it)
touch .file.text
# This shows all files including hidden ones (-a = all)
ls -a
# This creates a new directory
mkdir anex
# This moves into the new directory
cd anex
# This moves back to the parent directory
cd ..
# This moves back into the anex directory
cd anex
# This uses cd - to go back to the previous directory (the parent)
cd -
# This removes the hidden file
rm .file.text
