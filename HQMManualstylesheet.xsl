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
				body,html{width:100%;
					margin:0;
					padding:0;
					font-family:Lato,sans-serif;
					color:#39444c
					z-index:-100;}
					h1{color:#50C8F5;
					font-family:FrutigerBQ-Bold,Calvert;}
					h2{color:#232D96;}
				div.disclaim{
				width: 1030px;
				}
				</style>
				<style>
				h2.Section{color:#FFFFFF;
					font-family:Rockwell,Arial-BoldMT,FrutigerBQ-Bold,Calvert;}
					div.Section {
					width: 1030px;
					padding: 10px;
					border: 5px;
					margin: 0;
					background-color:#003552;
				}
				h3.Category{color:#FFFFFF;
					font-family:Rockwell,Arial-BoldMT,FrutigerBQ-Bold,Calvert;}
				div.Category {
					width: 1000px;
					padding: 10px;
					border: 5px;
					margin: 0;
					background-color:#003552;
				}
				</style>
				<style>
				h1.Issue{color:#50C8F5;
					font-family:Rockwell,Arial-BoldMT,FrutigerBQ-Bold,Calvert;}
				div.Issue {
					width: 800px;
					padding: 100px;
					border: 5px;
					margin: 0;
					background-color:#eeeeff;
				}
				</style>
				<style>
				div.Aim {
				width: 780px;
				padding: 10px;
				margin: 0;
				color:#39444c;
				background-color:#FFFFFF;
				}
				div.Benefits {
				width: 780px;
				padding: 10px;
				margin: 0;
				color:#39444c;
				background-color:#FFFFFF;
				}
				div.Context {
				width: 780px;
				padding: 10px;
				margin: 0;
				color:#39444c;
				background-color:#FFFFFF;
				}</style>
				</head>
			<body>
				<h1><a href="http://www.homequalitymark.com/standard"><img src="http://www.homequalitymark.com/images/home_quality_mark_logo.png"/><xsl:value-of select="bre:BREEAM/Manual/Version/name/."/></a></h1>
				<div class="disclaim">THIS IS A PROTOTYPE showing how the HQM manual, stored within a BREEAM defined xml, can be transformed for display and utilised for the authoring of tools.
				<p>The content on this page is not guaranteed to match the ffficial version, To view the official HQM version visit <a href="http://www.homequalitymark.com/standard">http://www.homequalitymark.com/standard</a></p>
				
				<p>This xml file is a concept model for packaging content from authoring software as xml which can then be used to output the manual as well as drive the tools. e.g drop down lists and credit tables which are defined in each issue can be utilised within the relevant tool (both online and offline versions of the tool. Methodology and tool troubleshooting could also be defined in this way.</p></div>
				
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
			<xsl:apply-templates select="Category" mode="manualView"/>
		</div>		
	</xsl:template>
	<!-- Category Object -->
	<xsl:template match="Category" mode="manualView">
		<div class="Category">
			<h3 class="Category">
				<xsl:apply-templates select="@id" mode="CategoryTitle"/>
			</h3>
			<xsl:apply-templates select="Issue" mode="manualView"/>
		</div>
	</xsl:template>
	<!-- Issue Object -->
	<xsl:template match="Issue" mode="manualView">
		<div class="Issue" background="{img/@src}" >
			<h1 class="Issue">
				<xsl:apply-templates select="@seq_id" mode="IssueTitle"/>
			</h1>
			<xsl:apply-templates select="Aim" mode="manualView"/>
			<xsl:apply-templates select="Benefits" mode="manualView"/>
			<xsl:apply-templates select="Context" mode="manualView"/>
			<!--<xsl:apply-templates select="Credits" mode="Credits"/>-->
			<xsl:element name="img">
				<xsl:attribute name="src"><xsl:value-of select="img/@src"/></xsl:attribute>
				<xsl:attribute name="width"><xsl:text>800</xsl:text></xsl:attribute>
			</xsl:element>
			<!--<xsl:apply-templates select="." mode="CreditSummary" />-->
			<!--<xsl:apply-templates select="." mode="Criteria" />-->
		</div>
	</xsl:template>
	<!--Aim Object -->
	<xsl:template match="Aim" mode="manualView">
		<div class="Aim">
			<h2>Aim</h2>
			<xsl:for-each select="text()">
			<p><xsl:value-of select="."/></p>
			</xsl:for-each>
		</div>
	</xsl:template>
	<!--Benefit Object -->
	<xsl:template match="Benefits" mode="manualView">
		<div class="Benefits">
			<h2>Benefits</h2>
			<xsl:for-each select="Benefit">
				<li>
					<xsl:for-each select="text()">
						<xsl:value-of select="."/>
					</xsl:for-each>
				</li>
			</xsl:for-each>
		</div>
	</xsl:template>
	<!--Context Object -->
	<xsl:template match="Context" mode="manualView">
		<div class="Context">
			<h2>Context</h2>
			<xsl:for-each select="text()">
				<p><xsl:value-of select="."/></p>
			</xsl:for-each>
		</div>
	</xsl:template>

	
	<!--Title Objects -->
	<xsl:template match="@id" mode="SectionTitle">
		<span>
			<img width="40" src="{../icon/@src}"/>  |  <xsl:value-of select="."/> | <xsl:apply-templates select="../name"/>
		</span>
	</xsl:template>
	<xsl:template match="@id" mode="CategoryTitle">
		<span>
			<xsl:value-of select="."/> | <xsl:apply-templates select="../name"/>
		</span>
	</xsl:template>
	<xsl:template match="@seq_id" mode="IssueTitle">
		<span>
			<xsl:value-of select="."/> | <xsl:apply-templates select="../name"/>
		</span>
	</xsl:template>


</xsl:stylesheet>