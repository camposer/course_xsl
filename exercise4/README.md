# Exercise 4 (In the book 14 Conditionals)

In this exercise, you will practice using xsl:if and xsl:choose.

1.- Open Conditions.xsl.

2.- Modify the first xsl:for-each element, so the Title element only shows up on the output if the Name element in the source has a child Title attribute.

3.- Modify the second xsl:for-each element, so that

- All elements containing the text "Webucator" output a Match element with a Text attribute with the value of "W". The Match element should contain the name and text of the matched element. As a reference see the "String Functions" table.
- All elements containing the text "Lockwood & Lockwood", output a Match element with a Text attribute with the value of "L&L". Again, the Match element should contain the name and text of the matched element.
- If neither string is matched, output a NoMatch element containing the name and text of the element with no match.

To test your solution, transform Conditions.xml against Conditions.xsl. The intended output is shown below.
