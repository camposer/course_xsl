<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="xml" indent="yes"/>
<xsl:template match="/BusinessLetter">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<fo:layout-master-set>
		<fo:simple-page-master master-name="envelope" page-height="4.125in" 
			page-width="9.5in" margin-top=".2in" margin-bottom=".2in" 
			margin-left=".2in" margin-right=".2in">
			<fo:region-body/>
		</fo:simple-page-master>
		<fo:simple-page-master master-name="letter" page-height="11in" 
			page-width="8.5in" margin-top=".5in" margin-bottom=".5in" 
			margin-left=".5in" margin-right=".5in">
			<fo:region-body margin-top="2in" margin-bottom="1in"/>
			<fo:region-before extent="1.5in"/>
			<fo:region-after extent=".5in"/>
		</fo:simple-page-master>
	</fo:layout-master-set>
	
	<fo:page-sequence master-reference="envelope">
		<fo:flow flow-name="xsl-region-body">
			<fo:block-container>
				<fo:block><xsl:value-of select="Body//Name/Company"/></fo:block>
				<fo:block><xsl:value-of select="Body//Address/Street"/></fo:block>
				<fo:block>
					<xsl:value-of select="Body//Address/City"/>,
					<xsl:text> </xsl:text>
					<xsl:value-of select="Body//Address/State"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="Body//Address/Zip"/>
				</fo:block>
			</fo:block-container>
			<fo:block-container margin-left="3.5in" margin-top="1in">
				<fo:block>
					<xsl:value-of select="Head/Recipient/Name/@Title"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="Head/Recipient/Name/FirstName"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="Head/Recipient/Name/LastName"/>
				</fo:block>
				<fo:block><xsl:value-of select="Head/Recipient/Company"/></fo:block>
				<fo:block><xsl:value-of select="Head/Recipient/Address/Street"/></fo:block>
				<fo:block>
					<xsl:value-of select="Head/Recipient/Address/City"/>,
					<xsl:text> </xsl:text>
					<xsl:value-of select="Head/Recipient/Address/State"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="Head/Recipient/Address/Zip"/>
				</fo:block>
				<fo:block><xsl:value-of select="Head/Recipient/Address/Country"/></fo:block>
			</fo:block-container>
		</fo:flow>
	</fo:page-sequence>

	<fo:page-sequence master-reference="letter">
		
		<fo:static-content flow-name="xsl-region-before" text-align="center">
			<fo:block>
				<fo:external-graphic src="url('logo.gif')" 
					height="75px" width="300px"/>
			</fo:block>
		</fo:static-content >
		
		<fo:static-content flow-name="xsl-region-after">
			<fo:block text-align="right" font-size="9pt">
				Letter to
				<xsl:value-of select="//FirstName"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="//LastName"/>
				sent on
				<xsl:value-of select="//SendDate"/>
			</fo:block>
		</fo:static-content >

		<fo:flow flow-name="xsl-region-body">
			<fo:block font-size="12pt" font-family="Times">
				<fo:block padding-bottom="20pt">
					<xsl:value-of select="Head/SendDate"/>
				</fo:block>
				<xsl:apply-templates select="Head/Recipient"/>
				Dear <xsl:value-of select="Head/Recipient/Name/@Title"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="Head/Recipient/Name/LastName"/>:
				<xsl:apply-templates select="Body"/>
				<xsl:apply-templates select="Foot"/>
			</fo:block>
		</fo:flow>
	</fo:page-sequence>
	
	</fo:root>
</xsl:template>

<xsl:template match="Recipient | Person">
	<fo:block padding-top="10pt" padding-bottom="10pt">
		<xsl:if test="name() = 'Person'">
			<xsl:attribute name="margin-left">.5in</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates select="Name"/>
		<xsl:choose>
			<xsl:when test="name() = 'Person'">
				<fo:block><xsl:value-of select="Address/Company"/></fo:block>
			</xsl:when>
			<xsl:otherwise>
				<fo:block><xsl:value-of select="Company"/></fo:block>
			</xsl:otherwise>
		</xsl:choose>
		<fo:block><xsl:value-of select="Address/Street"/></fo:block>
		<fo:block>
			<xsl:value-of select="Address/City"/>,
			<xsl:text> </xsl:text>
			<xsl:value-of select="Address/State"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="Address/Zip"/>
		</fo:block>
		<fo:block><xsl:value-of select="Address/Country"/></fo:block>
	</fo:block>
</xsl:template>
<xsl:template match="Body">
	<fo:block padding-top="10pt" padding-bottom="10pt">
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>
<xsl:template match="Para">
	<fo:block padding-top="5pt" padding-bottom="5pt">
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>
<xsl:template match="List">
	<fo:list-block start-indent="20pt"><xsl:apply-templates/></fo:list-block>
</xsl:template>
<xsl:template match="ListItem">
	<fo:list-item>
		<fo:list-item-label end-indent="label-end()">
			<fo:block>
				<fo:character character="&#x2022;"/>
			</fo:block>
		</fo:list-item-label>
		<fo:list-item-body start-indent="body-start()">
			<fo:block><xsl:apply-templates/></fo:block>
		</fo:list-item-body>
	</fo:list-item>
</xsl:template>
<xsl:template match="Heading">
	<fo:list-item space-after="10pt">
		<fo:list-item-label>
			<fo:block/><!--No bullet for heading-->
		</fo:list-item-label>
		<fo:list-item-body>
			<fo:block><xsl:apply-templates/></fo:block>
		</fo:list-item-body>
	</fo:list-item>
</xsl:template>
<xsl:template match="Email">
	<fo:basic-link external-destination="url('mailto:{.}')" color="blue">
		<xsl:value-of select="."/>
	</fo:basic-link>
</xsl:template>
<xsl:template match="Phone">
	<fo:inline text-decoration="underline">
		<xsl:value-of select="."/>
	</fo:inline>
</xsl:template>

<xsl:template match="Foot">
	<fo:block padding-bottom="20pt">Sincerely,</fo:block>
	<fo:block>
		<xsl:apply-templates select="Closing/Name"/>
		<xsl:value-of select="Closing/JobTitle"/>
	</fo:block>
</xsl:template>
<xsl:template match="Name">
	<fo:block>
		<xsl:value-of select="@Title"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="FirstName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="LastName"/>
	</fo:block>	
</xsl:template>

</xsl:stylesheet>

