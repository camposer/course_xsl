<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:key name="keySongs" match="Song" use="@Artist"/>
	<xsl:template match="/">
		<Artists>
			<xsl:for-each select="Songs/Song">
				<xsl:sort select="count(key('keySongs',@Artist))" 
					order="descending" data-type="number"/>
				<xsl:variable name="Artist" select="@Artist"/>
				<xsl:if test="not(preceding-sibling::Song[@Artist=$Artist])">
					<Artist>
						<xsl:value-of select="@Artist"/>
						<xsl:text> songs in the top 500: </xsl:text>
						<xsl:value-of select="count(key('keySongs',@Artist))"/>
					</Artist>
				</xsl:if>
			</xsl:for-each>
		</Artists>
	</xsl:template>
</xsl:stylesheet>

