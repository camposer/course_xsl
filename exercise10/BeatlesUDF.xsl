<?xml version="1.0"?>
<xsl:stylesheet version="2.0" 
				xmlns:web="http://www.webucator.com"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/">
	<html>
		<head>
			<title>Beatles</title>
		</head>
		<body>
			<table border="1">
			<xsl:for-each select="beatles/beatle">
				<tr>
					<xsl:if test="web:is-fake(.)">
						<xsl:attribute name="bgcolor" select="'red'"/>
					</xsl:if>
					<td><xsl:sequence select="web:create-link(.)"/></td>
				</tr>
			</xsl:for-each>
			</table>
		</body>
	</html>
</xsl:template>

<xsl:function name="web:is-fake" as="xs:boolean?">
	<xsl:param name="beatle" as="element(beatle)"/>
	<!--xsl:sequence select="$beatle/@real='no'"/-->
	<!--xsl:choose>
		<xsl:when test="$beatle[@real]">
			<xsl:value-of select="'true'"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="'false'"/>
		</xsl:otherwise>
	</xsl:choose-->
	<xsl:if test="$beatle[@real]">
		<xsl:value-of select="'true'"/>
	</xsl:if>
</xsl:function>

<xsl:function name="web:create-link" as="element(a)">
	<xsl:param name="beatle" as="element(beatle)"/>
	<a href="{$beatle/@link}">
		<xsl:value-of select="concat($beatle/name/firstname, ' ', $beatle/name/lastname)"/>
	</a>
</xsl:function>

</xsl:stylesheet>

