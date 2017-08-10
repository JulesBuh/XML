<xsl:stylesheet 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    exclude-result-prefixes="xs">
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
					width: 800px;
					padding: 10px;
					margin: 0;
					color:#39444c;
					background-color:#FFFFFF;
				}
				div.Benefits {
					width: 800px;
					padding: 10px;
					margin: 0;
					color:#39444c;
					background-color:#FFFFFF;
				}
				div.Context {
					width: 800px;
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
				<xsl:apply-templates select="*//Section" mode="assessmentView"/>
			</body>
		</html>
	</xsl:template>
	<!-- Section Object -->
	<xsl:template match="Section" mode="assessmentView">
		<div class="Section">
			<h2 class="Section">
				<xsl:apply-templates select="@id" mode="SectionTitle"/>
			</h2>
			<xsl:apply-templates select="Category" mode="assessmentView"/>  
		</div>		
	</xsl:template>
	<!-- Category Object -->
	<xsl:template match="Category" mode="assessmentView">
		<div class="Category">
			<h3 class="Category">
				<xsl:apply-templates select="@id" mode="Title"/>
			</h3>
			<xsl:apply-templates select="Issue"/> 
		</div>
	</xsl:template>
	<!-- Issue Object -->
	<xsl:template match="Issue">
		<div class="Issue" background="{img/@src}" >
			<h1 class="Issue">
				<xsl:apply-templates select="@seq_id" mode="IssueTitle"/>
			</h1>
			<xsl:apply-templates select="Aim"/> 
			<xsl:apply-templates select="Benefits"/> 
			<xsl:apply-templates select="Context"/>
			<!--<xsl:apply-templates select="Credits" mode="Credits"/>-->
			<xsl:element name="img">
				<xsl:attribute name="src"><xsl:value-of select="img/@src"/></xsl:attribute>
				<xsl:attribute name="width"><xsl:text>800</xsl:text></xsl:attribute>
			</xsl:element>
			<!--<xsl:apply-templates select="." mode="CreditSummary" />-->
			<!--<xsl:apply-templates select="." mode="Criteria" />-->
		</div>
	</xsl:template>
	<!-- Criteria Summary Object -->
	<xsl:template match="Issue" mode="CreditSummary">
		<h2>Credit Summary</h2>
		<table class="Summary" width="800" bgcolor="#003552">
			<tr valign="bottom" >
				<th class="Summary" align="left">Criterion Number</th>
				<th class="Summary" >Title</th>
				<th class="Summary">Credits</th>
			</tr>
			<xsl:for-each select="Criteria">
				<tr>
					<td align="left">
						<xsl:for-each select="Criterion">
							<xsl:apply-templates select="@id" mode="CriterionTitle"/>,</xsl:for-each>
					</td>
					<td>
						<div>
							<xsl:value-of select="@id"/> - <xsl:value-of select="name"/>
						</div>
					</td>
					<td align="right">
						<div>
							<xsl:value-of select="sum(Credits/credit)"/>
						</div>
					</td>
				</tr>
			</xsl:for-each>
			<tr>
				<td>
					<b>Total credits availalble</b>
				</td>
				<td align="right">
					<b>
						<xsl:value-of select="Criteria//Credits/credit"/>
					</b>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!--Title Object -->
	<xsl:template match="name">
		<span> 
			<xsl:value-of select="."/>
		</span>
	</xsl:template>
	<xsl:template match="@id" mode="Title">
		<span>
			<xsl:value-of select="."/> | <xsl:apply-templates select="../name"/>
		</span>
	</xsl:template>
	<xsl:template match="@id" mode="SectionTitle">
		<span>
			<img width="40" src="{../icon/@src}"/>  |  <xsl:value-of select="."/> | <xsl:apply-templates select="../name"/>
		</span>
	</xsl:template>
	<xsl:template match="@seq_id" mode="IssueTitle">
		<span>
			<xsl:value-of select="."/> | <xsl:apply-templates select="../name"/>
		</span>
	</xsl:template>
	<xsl:template match="@id" mode="CriteriaTitle">
		<span>
			<xsl:value-of select="."/> | <xsl:apply-templates select="../name"/>
		</span>
	</xsl:template>
	<xsl:template match="@id" mode="CriterionTitle">
		<span>
			 crit. <xsl:value-of select="."/>
		</span>
	</xsl:template>
	<!--Aim Object -->
	<xsl:template match="Aim">
		<div class="Aim">
			<h2>Aim</h2>
			<xsl:value-of select="text()"/>
		</div>
	</xsl:template>
	<!--Benefit Object -->
	<xsl:template match="Benefits">
		<div class="Benefits">
			<h2>Benefits</h2>
			<xsl:for-each select="Benefit">
				<li>
					<xsl:value-of select="."/>
				</li>
			</xsl:for-each>
		</div>
	</xsl:template>
	<!--Context Object -->
	<xsl:template match="Context">
		<div class="Context">
			<h2>Context</h2>
			<xsl:for-each select=".">
				<xsl:value-of select="."/>
			</xsl:for-each>
		</div>
	</xsl:template>
	<!--Credits Object -->
	<xsl:template match="Credits" mode="Credits">
		<div class="Credits">
			<h2 class="Credits" >Max Credits</h2>
			<div class="Credit">
				<xsl:value-of select="sum(../Criteria/Credits/credit)" />
			</div>
			<h2 class="Credits" >Indicators (Average)</h2>
			<table>
				<tr height="200px" valign="bottom">
					<xsl:for-each select="Indicators/Indicator/@name">
						<td>
							<img width="100px" height="{sum(../@weight) div count(../@weight) * 200}" src="icon\bar.png" />
						</td>
					</xsl:for-each>
				</tr>
				<tr>
					<xsl:for-each select="//part/Indicator">
						<td>
							<img width="80" src="{icon/@src}" />
						</td>
					</xsl:for-each>
				</tr>
				<tr>
					<xsl:for-each select="Indicators/Indicator/@name">
						<td style="color:#FFFFFF">
							<xsl:value-of select="."/>
						</td>
					</xsl:for-each>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="Issue" mode="Criteria">
		<h2>Criteria</h2>
		<xsl:for-each select="Criteria">
			<h3>
				<xsl:value-of select="@id"/> - <xsl:value-of select="name"/>
			</h3>
			<xsl:for-each select="Criterion">
				<p>
					<!--<xsl:apply-templates select="@id" mode="CriterionTitle" />-->
				</p>
				<p>
					<xsl:value-of select="description"/>
				</p>
			</xsl:for-each>	
		</xsl:for-each>	
	</xsl:template>
</xsl:stylesheet>