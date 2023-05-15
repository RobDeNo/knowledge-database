
```Shell
$grep -c "unix" geekfile.txt #This prints only a count of the lines that match a pattern
-h #Display the matched lines, but do not display the filenames.
$grep -i "UNix" geekfile.txt #Ignores, case for matching
$grep -l "unix" * #Displays list of a filenames only.
$grep -l "unix" f1.txt f2.txt f3.xt f4.txt #Displays list of a filenames only.
grep -n "unix" geekfile.txt #Display the matched lines and their line numbers.
grep -v "unix" geekfile.txt #This prints out all the lines that do not matches the pattern
-e exp #Specifies expression with this option. Can use multiple times.
$grep –f pattern.txt  geekfile.txt #Takes patterns from file, one per line.
-E #Treats pattern as an extended regular expression (ERE)
grep -w "unix" geekfile.txt #Match whole word
grep -o "unix" geekfile.txt #Print only the matched parts of a matching line, with each such part on a separate output line.
grep "^unix" geekfile.txt #print only that start with string
grep "os$" geekfile.txt #lines that end with string

-A n #Prints searched line and nlines after the result.
-B n #Prints searched line and n line before the result.
-C n #Prints searched line and n lines after before the result.
```