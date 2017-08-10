<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:bre="http://www.breeam.com/projects"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
			</head>
			<body>
				<xsl:element name="img">
					<xsl:attribute name="src">
						<xsl:text>http://www.homequalitymark.com/images/home_quality_mark_logo.png</xsl:text>
					</xsl:attribute>
				</xsl:element>
				<h1>HQM Assessment View</h1>
				<!--<xsl:apply-templates select="*//Section" mode="assessmentView"/>-->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>