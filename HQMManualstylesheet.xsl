<xsl:stylesheet 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    exclude-result-prefixes="xs">
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
				<style>
				h2.Credits{color:#FFFFFF;}
				div.Credits {
					width: 800px;
					height: 400px;
					padding: 10px;
					border: 5px;
					margin: 0;
					color:#FFFFFF;
					background-color:#003552;
				}
				div.Credit {
					width: 100px;
					height: 100px;
					padding: 2px;
					border: 5px;
					margin: 0;
					color:#69C8F3;
					font-size:50pt;
				}
				div.Indicator {
					width: 20px;
					padding: 2px;
					border: 5px;
					margin: 0;
					color:#FFFFFF;
					background-color:#003552;
				}				</style>
				<style>
				h1.Issue{color:#50C8F5;
					font-family:Rockwell,Arial-BoldMT,FrutigerBQ-Bold,Calvert;}
				div.Issue {
					width: 1000px;
					padding: 100px;
					border: 5px;
					margin: 0;
					background-color:#eeeeff;
				}
				</style>
				<style>
				h3.Category{color:#FFFFFF;
					font-family:Rockwell,Arial-BoldMT,FrutigerBQ-Bold,Calvert;}
				div.Category {
					width: 1200px;
					padding: 10px;
					border: 5px;
					margin: 0;
					background-color:#003552;
				}
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
				<style>
				table.Summary {
					background-color:#FFFFFF;
					border="0"
					}
				th.Summary {
					background-color:#003552;
					color:#FFFFFF;
					}
				</style>
				<style>
				table.validity{
					width:400px;
					border:0;}
					tr.invalid{
					color:#AA0000;
					background-color:#FFCCDD;
					}
				tr.valid{
					color:#00AA00;
					background-color:#CCFFDD;
				}
				tr.mismatch{
					color:#0000AA;
					background-color:#DDCCFF;
				}
				#DivForHoverItem {
					height: 20px;
					width:  90px;
					background-color:#DCDCDC;
				}
				#HiddenText {
					display: none;
					z-index:100;
				}
				#DivForHoverItem:hover #HiddenText {
					display:block;
					z-index:100;
				}
				</style>
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