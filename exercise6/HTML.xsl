<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template name="StartHTML">
		<xsl:param name="Title" select="'Untitled'"/>
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title><xsl:value-of select="$Title"/></title>
				<style type="text/css">
				<![CDATA[
					#outline { font-size:larger }
					ul ul {font-size: smaller }
				]]>
				</style>
			</head>
			<body>
				<h1><xsl:value-of select="$Title"/></h1>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

