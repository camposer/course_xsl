<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
			xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/Document">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

		<fo:layout-master-set>
			<fo:simple-page-master master-name="all"
						  page-height="11in"  page-width="8.5in" margin-top="1in" 
						  margin-bottom="1in" margin-left="1in" margin-right="1in">
				<fo:region-body margin-top="1in" margin-bottom=".5in"/>
				<fo:region-before extent=".5in" background-color="silver"/>
				<fo:region-after extent=".5in" background-color="silver"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
		  
		<fo:page-sequence master-reference="all">
			<fo:static-content flow-name="xsl-region-before">
				<fo:block font-size="12pt"><xsl:value-of select="Title"/></fo:block>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after">
				<fo:block font-size="12pt" text-align="right">
					Page <fo:page-number/> of 
						<fo:page-number-citation ref-id="last-page"/>
				</fo:block>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body">
				<fo:block>
					<xsl:value-of select="Title"/>
				</fo:block>
				<fo:block>
					<xsl:value-of select="SubTitle"/>
				</fo:block>
				<xsl:apply-templates select="Body"/>
				<fo:block id="last-page"/>
			</fo:flow>
		</fo:page-sequence>
	  
		</fo:root>
	</xsl:template>
	
	<xsl:template match="Para">
		<fo:block>
			<xsl:value-of select="."/>
		</fo:block>
	</xsl:template>
	<xsl:template match="Poem">
		<fo:block>
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>
	<xsl:template match="Line">
		<fo:block>
			<xsl:apply-templates/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>

