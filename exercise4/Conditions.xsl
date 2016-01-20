<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<Names>
		<xsl:for-each select="//Name">
				<Name>
					<xsl:if test="@Title">
						<Title><xsl:value-of select="@Title"/></Title>
					</xsl:if>
					<FName><xsl:value-of select="FirstName"/></FName>
					<LName><xsl:value-of select="LastName"/></LName>
				</Name>
		</xsl:for-each>
		</Names>
		<Matches>
			<xsl:for-each select="//*[text()]">
				<xsl:choose>
					<xsl:when test="text()[contains(.,'Webucator')]">
						<Match Text="W"><xsl:value-of select="name()"/><xsl:text>: </xsl:text> 
						<xsl:value-of select="text()"/></Match>
					</xsl:when>
					<xsl:when test="text()[contains(.,'Lockwood &amp; Lockwood')]">
						<Match Text="L&amp;L"><xsl:value-of select="name()"/><xsl:text>: </xsl:text> 
						<xsl:value-of select="text()"/></Match>
					</xsl:when>
					<xsl:otherwise>
						<NoMatch><xsl:value-of select="name()"/><xsl:text>: </xsl:text> 
						<xsl:value-of select="text()"/></NoMatch>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</Matches>
	</xsl:template>
</xsl:stylesheet>

