<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<Names>
		<xsl:for-each select="//Name">
				<Name>
					<!--Modify this so that the Title element only shows up on the output if the 
						Name element in the source document has a child Title element.-->
					<Title><xsl:value-of select="@Title"/></Title>
					<FName><xsl:value-of select="FirstName"/></FName>
					<LName><xsl:value-of select="LastName"/></LName>
				</Name>
		</xsl:for-each>
		</Names>
		<Matches>
			<xsl:for-each select="//*[text()]">
				<!--This for-each loop will look at every element in the source document that contains text.  If the element contains
					 the text "Webucator", output a Match element with a Text attribute with the value of "W".
					The Match element should contain the name and text of the matched element.  

					For example, this in the source:

					<Company>Webucator, Inc.</Company>

					will return this in the output:

					<Match Text="W">Company: Webucator, Inc.</Match>

					If the element contains the text "Lockwood &amp; Lockwood", output a Match element with 
					a Text attribute with the value of "L&amp;L".  Again, the Match element should contain the
					name and text of the matched element.

					If neither string is matched, output a NoMatch element containing the
					name and text of the element with no match.

					See ConditionsOutput.xml to see what the result should look like.
				-->
			</xsl:for-each>
		</Matches>
	</xsl:template>
</xsl:stylesheet>

