<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Hits By Artist</title>
			</head>
			<body>
				<xsl:for-each-group select="//Song" group-by="@Artist">
					<!--xsl:sort select="current-grouping-key()" /-->
					<xsl:sort select="(current-group()/@Artist)[1]" />
					<h2>
						<xsl:value-of select="position()"/>
						<xsl:text>. </xsl:text>
						<xsl:value-of select="current-grouping-key()"/>
						<xsl:text> - </xsl:text>
						<xsl:value-of select="count(current-group())"/>
						<xsl:text> Song(s)</xsl:text>
					</h2>

					<ol>
						<xsl:for-each select="current-group()">
							<li><xsl:apply-templates/></li>
						</xsl:for-each>
					</ol>
				</xsl:for-each-group>				


			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>

