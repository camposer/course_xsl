<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:key name="keySong" match="Song" use="@Artist"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Hits By Artist</title>
			</head>
			<body>
			<xsl:for-each-group 
				select="Songs/Song" group-by="@Artist">
				<h2>
					<xsl:value-of select="position()"/>.  
					<xsl:value-of select="current-grouping-key()"/> -
					<xsl:value-of select="count(current-group())"/> Song(s)
				</h2>
				<ol>
					<xsl:for-each select="current-group()">
						<li><xsl:value-of select="."/></li>
					</xsl:for-each>
				</ol>
			</xsl:for-each-group>
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>

