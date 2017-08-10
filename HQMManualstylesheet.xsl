<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:bre="http://www.breeam.com/projects"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<style>
				h2.Section{color:#FFFFFF;
					font-family:Rockwell,Arial-BoldMT,FrutigerBQ-Bold,Calvert;}
					div.Section {
					width: 1230px;
					padding: 10px;
					border: 5px;
					margin: 0;
					background-color:#003552;
				}
				</style>
			</head>
			<body>
				<h1><xsl:value-of select="bre:BREEAM/Manual/Version/name/."/></h1>
				<xsl:apply-templates select="*//Section" mode="manualView"/>
			</body>
		</html>
	</xsl:template>
	
	<!-- Section Object -->
	<xsl:template match="Section" mode="manualView">
		<div class="Section">
			<h2 class="Section">
				<xsl:apply-templates select="@id" mode="SectionTitle"/>
			</h2>
			<!--<xsl:apply-templates select="Category" mode="manualView"/>-->
		</div>		
	</xsl:template>
	
	<xsl:template match="@id" mode="SectionTitle">
		<span>
			<img width="40" src="{../icon/@src}"/>  |  <xsl:value-of select="."/> | <xsl:apply-templates select="../name"/>
		</span>
	</xsl:template>

</xsl:stylesheet>