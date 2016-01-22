<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/Letter">
		<xsl:processing-instruction name="xml-stylesheet">
			type="text/xsl" href="BusinessLetter.xsl"
		</xsl:processing-instruction>
		<BusinessLetter>
			<Head>
				<SendDate><xsl:value-of select="Date"/></SendDate>
				<Recipient>
					<xsl:apply-templates select="To"/>
				</Recipient>
			</Head>
			<Body>
				<xsl:apply-templates select="List | P"/>
			</Body>
			<xsl:apply-templates select="End"/>
		</BusinessLetter>
	</xsl:template>
	
	<xsl:template match="To">
		<xsl:apply-templates select="Name"/>
		<xsl:copy-of select="Company"/>
		<xsl:copy-of select="Address"/>
	</xsl:template>
	
	<xsl:template match="List">
		<List>
			<xsl:apply-templates/>
		</List>
	</xsl:template>
	
	<xsl:template match="LI">
		<ListItem>
			<xsl:apply-templates/>
		</ListItem>
	</xsl:template>
	
	<xsl:template match="ListHead">
		<Heading>
			<xsl:apply-templates/>
		</Heading>
	</xsl:template>
	
	<xsl:template match="P">
		<Para>
			<xsl:apply-templates/>
		</Para>
	</xsl:template>
	
	<xsl:template match="Person">
		<Person>
			<xsl:apply-templates/>
		</Person>
	</xsl:template>
	
	<xsl:template match="Address | Email | Phone">
		<xsl:copy-of select="."/>
	</xsl:template>
	
	<xsl:template match="End">
		<Foot>
			<Closing>
				<xsl:apply-templates select="Name"/>
				<xsl:if test="Title">
					<JobTitle>
						<xsl:value-of select="Title"/>
					</JobTitle>
				</xsl:if>
			</Closing>
		</Foot>
	</xsl:template>
	
	<xsl:template match="Name">
		<Name>
			<xsl:if test="Title">
				<xsl:attribute name="Title">
					<xsl:value-of select="Title"/>
				</xsl:attribute>
			</xsl:if>
			<FirstName><xsl:value-of select="FName"/></FirstName>
			<LastName><xsl:value-of select="LName"/></LastName>
		</Name>
	</xsl:template>
</xsl:stylesheet>

