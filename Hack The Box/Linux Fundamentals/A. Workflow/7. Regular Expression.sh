1	(a)	The round brackets are used to group parts of a regex. Within the brackets, you can define further patterns which should be processed together.
2	[a-z]	The square brackets are used to define character classes. Inside the brackets, you can specify a list of characters to search for.
3	{1,10}	The curly brackets are used to define quantifiers. Inside the brackets, you can specify a number or a range that indicates how often a previous pattern should be repeated.
4	|	Also called the OR operator and shows results when one of the two expressions matches
5	.*	Also called the AND operator and displayed results only if both expressions match

grep -E "(my|false)" /etc/passwd #using the OR operator
grep -E "(my.*false)" /etc/passwd #using the AND operator
grep -E "my" /etc/passwd | grep -E "false" #using the double to grep for a line with both words in it

1	Show all lines that do not contain the # character.
grep -v '#' your_file.txt
2	Search for all lines that contain a word that starts with Permit.
grep '\<Permit' your_file.txt
    # \< is a word boundary assertion, ensuring that "Permit" is at the beginning of a word.
3	Search for all lines that contain a word ending with Authentication.
grep 'Authentication\>' your_file.txt
    # \> this is a word boundry that ensure the word is at the end
4	Search for all lines containing the word Key.
grep -i 'Key' your_file.txt
    #uing the i so the grep is not case sensitivite
5	Search for all lines beginning with Password and containing yes.
grep '^Password.*yes' your_file.txt
    #'^Password.*yes': The regular expression pattern that matches lines 
    # beginning with "Password" and containing the word "yes." The ^ asserts 
    # the beginning of a line, and .* matches any characters in between "Password" and "yes."
6	Search for all lines that end with yes.
grep 'yes\>' your_file.txt
