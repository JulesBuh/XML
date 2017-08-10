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
					       <xsl:apply-templates select="/" mode="Placemark"/>
					       <xsl:apply-templates select="/" mode="TransportPlacemark"/>
					       <xsl:apply-templates select="/" mode="AmenityPlacemark"/>
					       <xsl:apply-templates select="/" mode="UsedStyleIcons"/>
			      </body>
		    </html>
	  </xsl:template>

   <xsl:template match="//kml:Document" mode="UsedStyleIcons">
      <h2>
         <xsl:text>KML Styles Defined</xsl:text>
      </h2>
	     <table>
		       <tr>
			         <th>
               <xsl:text>Icon</xsl:text>
			         </th>
			   	         <th>
               <xsl:text>Style Name</xsl:text>
			         </th>
		       </tr>
		       <xsl:apply-templates select="kml:Style/*/kml:Icon/kml:href" mode="UsedStyleIcons"/>
	     </table>
   </xsl:template>
	  <xsl:template match="kml:StyleMap" mode="UsedStyleIcons"/>
	  <xsl:template match="kml:Style/*/kml:Icon/kml:href" mode="UsedStyleIcons">
	     <tr>
				     <td>
					       <xsl:element name="img">
					          <xsl:attribute name="src">
                  <xsl:value-of select="text()"/>
               </xsl:attribute>
					          <xsl:attribute name="width">20px</xsl:attribute>
					       </xsl:element>
				     </td>
				     <td>
					       <xsl:value-of select="../../../@id"/>
				     </td>
			   </tr>
	  </xsl:template>
	  <!-- Syles are written at the top level and refernced, Anything within the kml/Document/Folder and its children are ignored -->
	  <xsl:template match="//kml:Folder/*" mode="UsedStyleIcons"/>



    <xsl:template name="print-xmlStructure">
        <xsl:text>/</xsl:text>
        <xsl:value-of select="name()"/>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="1+count(preceding-sibling::*)"/>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template name="print-kmlName">
        <xsl:text>/</xsl:text>
        <xsl:value-of select="../kml:name"/>
    </xsl:template>


 	<xsl:template match="/" mode="Placemark">
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
            <xsl:text>coordinate</xsl:text>
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
                  <xsl:value-of select="../kml:Point/kml:coordinates"/>
               </td>
			         </tr>
		       </xsl:for-each>
		    </table>
	  </xsl:template>	
	
 	<xsl:template match="/" mode="TransportPlacemark">
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
	
		<xsl:template match="/" mode="AmenityPlacemark">
		    <h2>
			      <xsl:text>Amenity Information</xsl:text>
		    </h2>
		    <table>
		       <th>icon</th>
		       <th>
            <xsl:text>kml Path</xsl:text>
         </th>
		       <th>Amenity Nodes</th>
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


</xsl:stylesheet>
