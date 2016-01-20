<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="HTML.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:template match="/">
	<xsl:call-template name="StartHTML">
		<xsl:with-param  name="Title" select="course/head/title"/>
	</xsl:call-template>
</xsl:template>

<xsl:template match="course">
	<div id="courseNum"><xsl:value-of select="/course/head/course_num"/></div>
	<div id="courseLength">
		<xsl:value-of select="/course/head/course_length"/>
	</div>
	<xsl:apply-templates select="/course/body/prerequisites"/>
	<xsl:apply-templates select="/course/body/outline"/>
</xsl:template>

<xsl:template match="prerequisites">
	<h2>Prerequisites</h2>
	<ul>
	<xsl:for-each select="prereq">
		<li>
			<xsl:value-of select="." />
			<xsl:if test="@optional = 'true'">
				(optional, but recommended)
			</xsl:if>
		</li>
	</xsl:for-each>
	</ul>
</xsl:template>

<xsl:template match="outline">
	<h2>Course Outline</h2>
	<div id="outline">
		<xsl:apply-templates />
	</div>
</xsl:template>

<xsl:template match="topics">
	<ul>
		<xsl:apply-templates />
	</ul>
</xsl:template>

<xsl:template match="title">
	<li><xsl:apply-templates /></li>
</xsl:template>
</xsl:stylesheet>

