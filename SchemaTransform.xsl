<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:bre="http://www.breeam.com/projects"
xmlns:xs="http://www.w3.org/2001/XMLSchema">

	<xsl:output method="html" indent="yes"/>

	<xsl:template match = "*" mode = "print" > 
		<xsl:value-of select = "local-name()" />
		<xsl:text >/</xsl:text>
	</xsl:template> 
	
	<xsl:variable name="header">
		<tr bgcolor="#9acd32">
			<th>path</th>
			<th>element name</th>
			<th>attribute name:value</th>
			<th>element values</th>
		</tr>
	</xsl:variable>	

	<xsl:template name="show_title" match="/">
	   <xsl:param name="title" /> <!-- input -->
	   <xsl:for-each select="catalog/cd">
		 <p>Title: <xsl:value-of select="$title" /></p> <!-- input -->
	   </xsl:for-each>
	</xsl:template>	

	
	<xsl:template name="Picklist" match="xs:restriction/xs:enumeration/@value" mode="Picklist">
		<for-each select=".">
			<xsl:element name="option">
				<xsl:attribute name="value"><xsl:value-of select ="."/></xsl:attribute>
				<xsl:value-of select ="."/>
			</xsl:element >									
		</for-each>
	</xsl:template>
	
	
	<xsl:template match="/">
		
		
		
		<xsl:variable name="xsd" select="document('HQM0.2.xsd')"/>
		<xsl:variable name="xsdelementtype"  select="$xsd//xs:element/@type|$xsd//xs:attrribute/@type"/>
		<xsl:variable name="xsdusedtypes" select="$xsd//xs:simpleType[@name=$xsdelementtype]|$xsd//xs:complexType[@name=$xsdelementtype]|$xsd//xs:union[contains(@memberTypes,'NRM')]" />
		<xsl:variable name="xsdtypes" select="$xsdusedtypes/@name" />
		
		<head/>
		<body>		
			<table>
				<xsl:copy-of select="$header" />				
				<xsl:value-of select="namespace-uri($xsd)"/>
<tr><td><h2>Defined Accepted Values</h2></td></tr>
				<xsl:for-each select="$xsdusedtypes">
				<xsl:sort select="@name"/>
					<tr>
						<td>
							<xsl:apply-templates select ="./ancestor::*" mode = "print"  />
							<xsl:value-of select ="local-name(.)"/> 
						</td>
						<td>
							<xsl:value-of select ="@name"/>  <xsl:value-of select ="@memberTypes"/> 
						</td>
						<td>	
						<xsl:choose>
						<xsl:when test="local-name(.)='simpleType'">
							<xsl:if test="count(xs:restriction/xs:enumeration/@value) &gt; 0">					
															<select>							
																<xsl:apply-templates select ="xs:restriction/xs:enumeration/@value" mode = "Picklist"  />
															</select>
															(<xsl:value-of select ="count(xs:restriction/xs:enumeration/@value)"/> possible values defined)
							</xsl:if>
							<xsl:if test="count(xs:restriction/xs:enumeration/@value)= 0">					
															<p>							
							 <xsl:value-of select ="translate(xs:restriction/@base,'','')"  /> 
							 <xsl:value-of select ="translate(*/@type,'','')"  />
							 <xsl:value-of select ="translate(*/@memberTypes,'','')" />
							 : <xsl:value-of select ="translate(*/@value,'','')"  />
															</p>
							</xsl:if>
							</xsl:when>
							<xsl:otherwise>::</xsl:otherwise>
						</xsl:choose>
						</td>
					</tr>
				</xsl:for-each>
<tr><td><h2>Defined Elements and Atrributes</h2></td></tr>
				<xsl:for-each select="$xsdelementtype/parent::*">
					<tr>
						<td>
							<xsl:apply-templates select ="./ancestor::*" mode = "print"  />
						</td>
						<td>
							<xsl:value-of select ="@name"  />
						</td>
						<td>
							<xsl:value-of select ="@type" />
						</td>
					</tr>
				</xsl:for-each>
				<xsl:for-each select="//.">
					<xsl:sort select="local-name(../ancestor/*)"/>
					<tr>

						<td>
							<p>
								<xsl:apply-templates select ="./ancestor::*" mode = "print"  />
							</p>
						</td>
						<td>
							<p>
								<span style="color:blue">
								&lt;
									<xsl:value-of select="local-name(.)"/>
								&gt;
								</span>
							</p>
						</td>
						<td>
							<p>
								<xsl:for-each select="@*">
									<span style="color:red">
										<xsl:value-of select="local-name()"/>
									</span>=<span style="color:purple">"<xsl:value-of select="."/>"</span>
									<xsl:text> </xsl:text>
								</xsl:for-each>
							</p>
						</td>
						<td>
							<p>
								<xsl:value-of select="text()"/>
								<span style="color:green">
									<xsl:value-of select="comment()"/>
								</span>
								<xsl:value-of select="processing-instruction()"/>
							</p>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</body>
	</xsl:template>
</xsl:stylesheet>