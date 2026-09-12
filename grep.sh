#!/bin/bash
# This creates an empty file called file.txt
touch file.txt
# This writes the text "am anex" into file.txt
echo "am anex" > file.txt
# This appends a description of cybersecurity to file.txt (>> appends instead of overwriting)
echo "Cybersecurity is the practice of protecting systems, networks, programs, and data from digital attacks, unauthorized access, damage, or theft. It covers areas like network security, application security, information security, and operational security, with the goal of keeping confidentiality, integrity, and availability (the CIA triad) intact." >> file.txt
# This appends a simple explanation of binary exploits to file.txt
echo "A binary exploit is a way of tricking a program into doing something it was not meant to do, by feeding it carefully crafted input that takes advantage of a bug in the compiled code. In simple terms: the program has a flaw, and the attacker knows exactly how to poke that flaw to make the program misbehave, crash, or run the attacker's own code." >> file.txt
# This prints the contents of file.txt to the terminal
cat file.txt
# This searches for the word "security" inside file.txt
grep "security" file.txt
# This searches for lines that START with "sec"
grep "^sec" file.txt
# This searches for lines that END with "ty"
grep "ty$" file.txt
# This searches for lines that START with "Cyb"
grep "^Cyb" file.txt
# This prints the line starting with "sec" plus the line after it (-A1 = 1 line After)
grep -A1 "^sec" file.txt
# This prints the line ending with "ty" plus the line before it (-B1 = 1 line Before)
grep -B1 "ty$" file.txt
# This prints only the matched words: a word starting with "sec" plus the next word
grep -oE "\bsec[a-zA-Z]*[^a-zA-Z]+\b[a-zA-Z]+\b" file.txt
# This prints only the matched words: a word ending in "ty" plus the word before it
grep -oE "\b[a-zA-Z]+[^a-zA-Z]+\b[a-zA-Z]+ty\b" file.txt
# This searches for "security" ignoring case (-i = case-insensitive)
grep -i "security" file.txt
# This prints only the part of the word matching "sec" + any single character (-o = only match, . = any char)
grep -o "sec." file.txt
# Same as above but case-insensitive (-i), so it also catches "Sec..." like in "Cybersecurity"
grep -oi "sec." file.txt
# This pipes the output of cat into grep using the pipe |, so grep reads from standard input instead of a file
cat file.txt | grep "sec."
