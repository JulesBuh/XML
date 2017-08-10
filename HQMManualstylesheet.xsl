<?xml version="1.0" ?>
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
				<h1><xsl:value-of select="bre:BREEAM/Manual/Version/name/."/></h1>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>