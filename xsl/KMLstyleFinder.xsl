<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.opengis.net/kml/2.2"
                xmlns:gx="http://www.google.com/kml/ext/2.2"
                xmlns:kml="http://www.opengis.net/kml/2.2"
                version="1.0">

	<xsl:output method="html"
               encoding="UTF-8"
               media-type="application/xml"
               standalone="yes"
               indent="yes"
               omit-xml-declaration="yes"/>

	<xsl:template match="/">
		<html>
			<head/>
			<body>
				<img src="http://www.homequalitymark.com/images/home_quality_mark_logo.png"/>
				<h2>
					<xsl:text>KML import</xsl:text>
				</h2>
				<iframe src="../xsl/PreviewKml.html" width="800" height="400"></iframe>
				<xsl:call-template name="kmlStyleMaps"/>
				<xsl:apply-templates select="/" mode="Placemark"/>
				<xsl:apply-templates select="/" mode="TransportPlacemark"/>
				<xsl:apply-templates select="/" mode="AmenityPlacemark"/>
			</body>
		</html>
	</xsl:template>
	
	<!-- processes the kml:StyleMaps -->
	<!-- overarching Table Wrapper -->
	<xsl:template name="kmlStyleMaps" match="//kml:Document" mode="UsedStyleIcons">
				<h2>
					<xsl:text>KML Styles Defined</xsl:text>
				</h2>
				<table>
					<tr>
						<th>
							<xsl:text>StyleMap</xsl:text>
						</th>
						<th>
							<xsl:text>Style Definition Normal</xsl:text>
						</th>
						<th>
							<xsl:text>Icon</xsl:text>
						</th>
						<th>
							<xsl:text>Style Definition Hover Highlight</xsl:text>
						</th>
						<th>
							<xsl:text>Icon</xsl:text>
						</th>
					</tr>
					<xsl:apply-templates select="//kml:Document" mode="UsedStyleIcons"/>
				</table>
	</xsl:template>
	<!-- Creates a row for each StyleMap -->
	<xsl:template match="//kml:Document" mode="UsedStyleIcons">
		<xsl:for-each select="kml:StyleMap">
			<tr>
				<td>
					<xsl:value-of select="@id"/>
				</td>

				<!-- gets the normal icon URL from the pair of icons assigned to the style map-->
					<xsl:for-each select="kml:Pair[1]/kml:styleUrl">
						<xsl:variable name="StyleRef">
							<xsl:call-template name="string-replace-all">
								<xsl:with-param name="text" select="text()" />
								<xsl:with-param name="replace" select="'#'" />
								<xsl:with-param name="by" select="''" />
							</xsl:call-template>
						</xsl:variable>
						<xsl:call-template name="get_imgURL">
							<xsl:with-param name="iconType" select = "'normal'" />
							<xsl:with-param name="styleID" select = "$StyleRef" />
						</xsl:call-template>
					</xsl:for-each>

				<!-- gets the hover highlight icon URL from the pair of icons assigned to the style map-->
					<xsl:for-each select="kml:Pair[2]/kml:styleUrl">
						<xsl:variable name="StyleRef">
							<xsl:call-template name="string-replace-all">
								<xsl:with-param name="text" select="text()" />
								<xsl:with-param name="replace" select="'#'" />
								<xsl:with-param name="by" select="''" />
							</xsl:call-template>
						</xsl:variable>
						<xsl:call-template name="get_imgURL">
							<xsl:with-param name="iconType" select = "'hover'" />
							<xsl:with-param name="styleID" select = "$StyleRef" />
						</xsl:call-template>
					</xsl:for-each>

			</tr>
		</xsl:for-each>
	</xsl:template>

	<!-- Find and replace function -->
	<xsl:template name="string-replace-all">
		<xsl:param name="text" />
		<xsl:param name="replace" />
		<xsl:param name="by" />
		<xsl:choose>
			<xsl:when test="contains($text, $replace)">
				<xsl:value-of select="substring-before($text,$replace)" />
				<xsl:value-of select="$by" />
				<xsl:call-template name="string-replace-all">
					<xsl:with-param name="text" select="substring-after($text,$replace)" />
					<xsl:with-param name="replace" select="$replace" />
					<xsl:with-param name="by" select="$by" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Retrieves the <kml:Style/*/Icon/href when the id is passed to the parameter -->
	<xsl:key name="StyleIndex" match="//kml:Style/kml:IconStyle/kml:Icon/kml:href" use="../../../@id"/>
	<xsl:template name = "get_imgURL" match="kml:Style/@id">
		<xsl:param name = "iconType" />
		<xsl:param name = "styleID" />
		<!-- id name -->
		<td><xsl:value-of select = "$iconType" />:styleID: <xsl:value-of select = "$styleID" />
		</td>
		<!-- returned URL -->
		<td>
		<xsl:element name="img">
			<xsl:attribute name="src">
				<xsl:apply-templates select="key('StyleIndex',$styleID)"/>
			</xsl:attribute>
			<xsl:attribute name="width">40</xsl:attribute>
		</xsl:element>
		</td>
	</xsl:template>

 	<xsl:template match="//kml:Document" mode="Placemark">
		    <h2>
			      <xsl:text>Dwelling Information</xsl:text>
		    </h2>
		    <table>
				<th>
					<xsl:text>icon</xsl:text>
				</th>
		       <th>
					<xsl:text>kml Path</xsl:text>
				</th>
		       <th>
					<xsl:text>name</xsl:text>
				</th>
				<th>
					<xsl:text>lon coordinate</xsl:text>
				</th>
				<th>
					<xsl:text>lat coordinate</xsl:text>
				</th>
				<th>
					<xsl:text>alt coordinate</xsl:text>
				</th>
		       <xsl:for-each select="*//kml:Placemark/kml:styleUrl[contains(text(),'Dwelling')or contains(text(),'shapes/realestate') or contains(text(),'shapes/homegardenbusiness') or contains(text(),'shapes/ranger_station') or contains(text(),'shapes/lodgings')]">
			         <tr>
				           <td>
				              <xsl:choose>
					                <xsl:when test="contains(text(),'Dwelling')or contains(text(),'shapes/realestate') or contains(text(),'shapes/homegardenbusiness') or contains(text(),'shapes/ranger_station') or contains(text(),'shapes/lodgings')">
						                  <img src="files/Dwelling.png" width="40px"/>
					                </xsl:when>
					                <xsl:otherwise>
						                  <img src="files/hqm_logo.png" width="20px"/>
					                </xsl:otherwise>
				              </xsl:choose>
				           </td>
				           <td>	
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-xmlStructure"/>
       				       </xsl:for-each>
        		     </td>
				           <td>	
					             <xsl:value-of select="../kml:name"/>
					             <xsl:text>-</xsl:text>
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-kmlName"/>
       				       </xsl:for-each>
				           </td>
                  <td>
				  <xsl:value-of select="number(substring-before(../kml:Point/kml:coordinates/text(),','))"/></td>
				  <td><lat><xsl:value-of select="number(substring-before(substring-after(../kml:Point/kml:coordinates/text(),','),','))"/></lat></td>
				  <td><lat><xsl:value-of select="number(substring-after(substring-after(../kml:Point/kml:coordinates/text(),','),','))"/></lat></td>
			         </tr>
		       </xsl:for-each>
		    </table>
	</xsl:template>	
 	<xsl:template match="//kml:Document" mode="TransportPlacemark">
		    <h2>
		       <xsl:text>Transport Information</xsl:text>
		    </h2>
		    <table>
		       <th>
            <xsl:text>icon</xsl:text>
         </th>
		       <th>
            <xsl:text>kml Path</xsl:text>
         </th>
		       <th>
            <xsl:text>Train Nodes</xsl:text>
         </th>
		       <th>
            <xsl:text>coordinate</xsl:text>
         </th>
		       <xsl:for-each select="*//kml:Placemark/kml:styleUrl[contains(text(),'Train') or contains(text(),'subway') or contains(text(),'rail')]">
			         <tr>
				           <td>
				              <xsl:choose>
					                <xsl:when test="contains(text(),'Train') or contains(text(),'subway') or contains(text(),'rail')">
						                  <img src="files/Node_Train.png" width="40px"/>
					                </xsl:when>			
					                <xsl:otherwise>
						                  <img src="files/hqm_logo.png" width="20px"/>
					                </xsl:otherwise>
				              </xsl:choose>
				           </td>
				           <td>	
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-xmlStructure"/>
       				       </xsl:for-each>
        		     </td>
				           <td>	
					             <xsl:value-of select="../kml:name"/>
					             <xsl:text>-</xsl:text>
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-kmlName"/>
       				       </xsl:for-each>
				           </td>
				           <td>	
                  <xsl:value-of select="../kml:Point/kml:coordinates"/>
               </td>
			         </tr>
		       </xsl:for-each>

		       <th>
            <xsl:text>icon</xsl:text>
         </th>
		       <th>
            <xsl:text>kml Path</xsl:text>
         </th>
		       <th>
            <xsl:text>Bus Nodes</xsl:text>
         </th>
		       <th>
            <xsl:text>coordinate</xsl:text>
         </th>
		       <xsl:for-each select="*//kml:Placemark/kml:styleUrl[contains(text(),'Bus') or contains(text(),'shapes/bus')]">
			         <tr>
				           <td>
				              <xsl:choose>
					                <xsl:when test="contains(text(),'Bus') or contains(text(),'bus')">
						                  <img src="files/Node_Bus.png" width="40px"/>
					                </xsl:when>			
					                <xsl:otherwise>
						                  <img src="files/hqm_logo.png" width="20px"/>
					                </xsl:otherwise>
				              </xsl:choose>
				           </td>
				           <td>	
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-xmlStructure"/>
       				       </xsl:for-each>
        		     </td>
				           <td>	
					             <xsl:value-of select="../kml:name"/>
					             <xsl:text>-</xsl:text>
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-kmlName"/>
       				       </xsl:for-each>
				           </td>
				           <td>	
                  <xsl:value-of select="../kml:Point/kml:coordinates"/>
               </td>
			         </tr>
		       </xsl:for-each>
				       <th>
            <xsl:text>icon</xsl:text>
         </th>
		       <th>
            <xsl:text>kml Path</xsl:text>
         </th>
		       <th>
            <xsl:text>Bike Storage</xsl:text>
         </th>
		       <th>
            <xsl:text>coordinate</xsl:text>
         </th>
		       <xsl:for-each select="*//kml:Placemark/kml:styleUrl[contains(text(),'Bike') or contains(text(),'cycling')]">
			         <tr>
				           <td>
				              <xsl:choose>
					                <xsl:when test="contains(text(),'Bike')">
						                  <img src="files/Node_Bike.png" width="40px"/>
					                </xsl:when>			
					                <xsl:otherwise>
						                  <img src="files/Node_Bike.png" width="20px"/>
					                </xsl:otherwise>
				              </xsl:choose>
				           </td>
				           <td>	
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-xmlStructure"/>
       				       </xsl:for-each>
        		     </td>
				           <td>	
					             <xsl:value-of select="../kml:name"/>
					             <xsl:text>-</xsl:text>
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-kmlName"/>
       				       </xsl:for-each>
				           </td>
				           <td>	
                  <xsl:value-of select="../kml:Point/kml:coordinates"/>
               </td>
			         </tr>
		       </xsl:for-each>
			   		       <th>
            <xsl:text>icon</xsl:text>
         </th>
		       <th>
            <xsl:text>kml Path</xsl:text>
         </th>
		       <th>
            <xsl:text>Car charging Points</xsl:text>
         </th>
		       <th>
            <xsl:text>coordinate</xsl:text>
         </th>
		       <xsl:for-each select="*//kml:Placemark/kml:styleUrl[contains(text(),'CarCharge') or contains(text(),'gas_stations')]">
			         <tr>
				           <td>
				              <xsl:choose>
					                <xsl:when test="contains(text(),'CarCharge') or contains(text(),'gas_stations')">
						                  <img src="files/Node_CarCharge.png" width="40px"/>
					                </xsl:when>			
					                <xsl:otherwise>
						                  <img src="files/hqm_logo.png" width="20px"/>
					                </xsl:otherwise>
				              </xsl:choose>
				           </td>
				           <td>	
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-xmlStructure"/>
       				       </xsl:for-each>
        		     </td>
				           <td>	
					             <xsl:value-of select="../kml:name"/>
					             <xsl:text>-</xsl:text>
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-kmlName"/>
       				       </xsl:for-each>
				           </td>
				           <td>	
                  <xsl:value-of select="../kml:Point/kml:coordinates"/>
               </td>
			         </tr>
		       </xsl:for-each>
			<th>
            <xsl:text>icon</xsl:text>
         </th>
		       <th>
            <xsl:text>kml Path</xsl:text>
         </th>
		       <th>
            <xsl:text>Car Pool</xsl:text>
         </th>
		       <th>
            <xsl:text>coordinate</xsl:text>
         </th>
		       <xsl:for-each select="*//kml:Placemark/kml:styleUrl[contains(text(),'CarPool')or contains(text(),'shapes/cabs')]">
			         <tr>
				           <td>
				              <xsl:choose>
					                <xsl:when test="contains(text(),'CarPool') or contains(text(),'cabs')">
						                  <img src="files/Node_CarPool.png" width="40px"/>
					                </xsl:when>			
					                <xsl:otherwise>
						                  <img src="files/hqm_logo.png" width="20px"/>
					                </xsl:otherwise>
				              </xsl:choose>
				           </td>
				           <td>	
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-xmlStructure"/>
       				       </xsl:for-each>
        		     </td>
				           <td>	
					             <xsl:value-of select="../kml:name"/>
					             <xsl:text>-</xsl:text>
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-kmlName"/>
       				       </xsl:for-each>
				           </td>
				           <td>	
                  <xsl:value-of select="../kml:Point/kml:coordinates"/>
               </td>
			         </tr>
		       </xsl:for-each>
		    </table>
	  </xsl:template>	
	<xsl:template match="//kml:Document" mode="AmenityPlacemark">
		    <h2>
			      <xsl:text>Other Placemark Information</xsl:text>
		    </h2>
		    <table>
		       <th>icon</th>
		       <th>
            <xsl:text>kml Path</xsl:text>
         </th>
		       <th>Other Nodes</th>
		       <th>coordinate</th>
		       <xsl:for-each select="*//kml:Placemark/kml:styleUrl[contains(text(),'site')]">
			         <tr>
				           <td>
				              <xsl:choose>
					                <xsl:when test="contains(text(),'site')">
						                  <img src="files/site.png" width="40px"/>
					                </xsl:when>			
					                <xsl:otherwise>
						                  <img src="files/hqm_logo.png" width="40px"/>
					                </xsl:otherwise>
				              </xsl:choose>
				           </td>
				           <td>	
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-xmlStructure"/>
       				       </xsl:for-each>
        		     </td>
				           <td>	
					             <xsl:value-of select="../kml:name"/>
					             <xsl:text>-</xsl:text>
					             <xsl:for-each select="ancestor::*">
            			      <xsl:call-template name="print-kmlName"/>
       				       </xsl:for-each>
				           </td>
				           <td>	
                  <xsl:value-of select="../kml:Point/kml:coordinates"/>
               </td>
			         </tr>
		       </xsl:for-each>
		    </table>
	  </xsl:template>	



	<!-- template that creates Xpaths -->
	<xsl:template name="print-xmlStructure">
		<xsl:text>/</xsl:text>
		<xsl:value-of select="name()"/>
		<xsl:text>[</xsl:text>
		<xsl:value-of select="1+count(preceding-sibling::*)"/>
		<xsl:text>]</xsl:text>
	</xsl:template>
	<!-- template that creates Xpaths by userdefined names -->
	<xsl:template name="print-kmlName">
		<xsl:text>/</xsl:text>
		<xsl:value-of select="../kml:name"/>
	</xsl:template>

</xsl:stylesheet>