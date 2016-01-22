<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/BusinessLetter">
		<html>
			<head>
				<title>Business Letter</title>
			</head>
			<body>
				<div style="margin-bottom:10px;">
					<xsl:value-of select="Head/SendDate"/>
				</div>
				<xsl:apply-templates select="Head/Recipient"/>	
				<div style="margin-top:10px">
					Dear <xsl:value-of select="Head/Recipient/Name/@Title"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="Head/Recipient/Name/LastName"/>:
				</div>
				<xsl:apply-templates select="Body"/>
				<xsl:apply-templates select="Foot"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="Recipient | Person">
		<div>
			<xsl:if test="name() = 'Person'">
				<xsl:attribute name="style">margin-left:100px;</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="Name"/>
			<xsl:choose>
				<xsl:when test="name() = 'Person'">
					<div><xsl:value-of select="Address/Company"/></div>
				</xsl:when>
				<xsl:otherwise>
					<div><xsl:value-of select="Company"/></div>
				</xsl:otherwise>
			</xsl:choose>
			<div><xsl:value-of select="Address/Street"/></div>
			<div>
				<xsl:value-of select="Address/City"/>,
				<xsl:text> </xsl:text>
				<xsl:value-of select="Address/State"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="Address/Zip"/>
			</div>
			<div><xsl:value-of select="Address/Country"/></div>
		</div>
	</xsl:template>
	<xsl:template match="Body">
		<div style="margin-top:10px; margin-bottom:10px;">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="Para">
		<p><xsl:apply-templates/></p>
	</xsl:template>
	<xsl:template match="List">
		<ul><xsl:apply-templates/></ul>
	</xsl:template>
	<xsl:template match="ListItem">
		<li><xsl:apply-templates/></li>
	</xsl:template>
	<xsl:template match="Heading">
		<div style="font-weight:bold; margin-left:-15px;">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="Email">
		<a href="{.}"><xsl:value-of select="."/></a>
	</xsl:template>
	<xsl:template match="Phone">
		<span style="text-decoration:underline">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	
	<xsl:template match="Foot">
		<div style="margin-bottom:20px">Sincerly,</div>
		<div>
			<xsl:apply-templates select="Closing/Name"/>
			<xsl:value-of select="Closing/JobTitle"/>
		</div>
	</xsl:template>
	<xsl:template match="Name">
		<div>
			<xsl:value-of select="@Title"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="FirstName"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="LastName"/>
		</div>	
	</xsl:template>
</xsl:stylesheet>

