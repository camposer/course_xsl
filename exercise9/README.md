# Exercise 9

In this exercise, you will practice using regular expressions and xsl:analyze-string.

1.- Open BeatlesAnalyzeString.xml and review the document. You will see that it contains a list of beatle elements, each of which has a name (first and last) and a dobDesc (a textual description containing the date of birth.

2.- Open BeatlesAnalyzeString.xsl for editing.

3.- Write code that splits up the name element value into firstname and lastname elements, based on the location of the space. You can use the xsl:analyze-string instruction for this, or the tokenize or replace function.

4.- Write code that finds the date of birth in the dobDesc element and inserts it into the new dob element. The text around the date of birth should be discarded.

5.- To test your solution, transform BeatlesAnalyzeString.xml against BeatlesAnalyzeString.xsl.
