<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/Document">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

		<fo:layout-master-set>
			<fo:simple-page-master master-name="hello"
						  >
				<fo:region-body margin-top="1in" margin-bottom=".5in"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
		  
		<fo:page-sequence master-reference="hello">
			<fo:flow flow-name="xsl-region-body">
				<fo:block font-size="18pt" text-align="center" font-weight="bold">
					<xsl:value-of select="Heading"/>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	  
		</fo:root>
	</xsl:template>
</xsl:stylesheet>

