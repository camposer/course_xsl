<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml"/>
	<xsl:template match="beatles">
		<beatles>
			<xsl:apply-templates/>
		</beatles>
	</xsl:template>
	<xsl:template match="beatle">
		<beatle>
			<xsl:apply-templates/>
		</beatle>
	</xsl:template>
	<xsl:template match="name">
		<name>
			<!-- split the name into first and last names -->
			<xsl:variable name="name" select="tokenize(., ' ')"/>
			<firstname><xsl:value-of select="$name[1]"/></firstname>
			<lastname><xsl:value-of select="$name[2]"/></lastname>

			<!--xsl:analyze-string select="." regex="([A-Z][a-z]+)\s([A-Z][a-z]+)">
				<xsl:matching-substring>
					<firstname><xsl:value-of select="regex-group(1)"/></firstname>
					<lastname><xsl:value-of select="regex-group(2)"/></lastname>
				</xsl:matching-substring>
			</xsl:analyze-string-->
		</name>
	</xsl:template>
	<xsl:template match="dobDesc">
		<dob>
			<!-- extract the date of birth (if any) from the dobDesc element -->
			<xsl:analyze-string select="." regex="(\d{{1,2}})/(\d{{1,2}})/(\d{{2,4}})">
				<xsl:matching-substring>
					<xsl:value-of select="if (string-length(regex-group(3)) = 4)
												 then regex-group(3)
												 else concat('19',regex-group(3))"/>
					<xsl:text>-</xsl:text>
					<xsl:value-of select="if (string-length(regex-group(1)) = 2)
												 then regex-group(1)
												 else concat('0',regex-group(1))"/>
					<xsl:text>-</xsl:text>
					<xsl:value-of select="if (string-length(regex-group(2)) = 2)
												 then regex-group(2)
												 else concat('0',regex-group(2))"/>
				</xsl:matching-substring>
			</xsl:analyze-string>
		</dob>
	</xsl:template>
</xsl:stylesheet>

