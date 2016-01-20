<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<Beatles>
			<RealBeatles>
				<xsl:apply-templates select="beatles/beatle[not(@real)]"/>
			</RealBeatles>
			<FakeBeatles>
				<xsl:apply-templates select="beatles/beatle[@real='no']"/>
			</FakeBeatles>
		</Beatles>
	</xsl:template>
	<xsl:template match="beatle[not(@real='no')]">
		<Real><xsl:apply-templates/></Real>
	</xsl:template>
	<xsl:template match="beatle[@real='no']">
		<Fake><xsl:apply-templates/></Fake>
	</xsl:template>
	<xsl:template match="beatle">
		<Generic><xsl:apply-templates/></Generic>
	</xsl:template>
	<xsl:template match="firstname">
		<FirstName><xsl:apply-templates/></FirstName>
	</xsl:template>
	<xsl:template match="lastname">
		<LastName><xsl:apply-templates/></LastName>
	</xsl:template>
</xsl:stylesheet>

