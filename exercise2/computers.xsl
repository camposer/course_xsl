<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes" version="1.0"  media-type="application/xml" standalone="no" omit-xml-declaration="no"/>

	<xsl:template match="computers">
		<pcs>
			<xsl:for-each select="computer">
				<pc id="{@id}">
					<xsl:attribute name="type">
						<xsl:value-of select="attribute::type"/>
					</xsl:attribute>

					<xsl:element name="nom">		
						<xsl:value-of  select="./name"/>
					</xsl:element>

					<serial>		
						<xsl:value-of  select="./serial"/>
					</serial>
				</pc>
			</xsl:for-each>
		</pcs>
	</xsl:template>

</xsl:stylesheet>

