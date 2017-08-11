<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!--project-->
	<!-- finds the first BREARN to Test against -->
	<xsl:param name="BREARN" select="//BREARN[1]"/>
	<xsl:template match="/" mode="BREARN">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="*//ProjectDetails">
				<xsl:choose>
					<xsl:when test="count(BREARN[contains(text(),$BREARN)])">
						<tr class="valid">
							<td>Valid Issue</td>
							<td>
								<xsl:value-of select="BREARN"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="invalid" >
							<td>Invalid Issue</td>
							<td>
								<xsl:value-of select="BREARN"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- finds the first Project Name to Test against -->
	<xsl:param name="ProjectName" select="//ProjectName[1]"/>
	<xsl:template match="/" mode="ProjectName">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="*//ProjectDetails">
				<xsl:choose>

					<xsl:when test="count(ProjectName[contains(text(),$ProjectName)])">
						<tr class="valid">
							<td>Valid Issue</td>
							<td>
								<xsl:value-of select="ProjectName"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="invalid" >
							<td >Invalid Issue</td>
							<td>
								<xsl:value-of select="ProjectName"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- finds the first Assessment Stage to Test against -->
	<xsl:param name="AssessmentStage" select="//AssessmentStage[1]"/>
	<xsl:template match="/" mode="AssessmentStage">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="*//ProjectDetails">
				<xsl:choose>
					<xsl:when test="count(AssessmentStage[contains(text(),$AssessmentStage)])">
						<tr class="valid">
							<td>Valid Issue</td>
							<td>
								<xsl:value-of select="AssessmentStage"/> Stage Assessment
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="invalid" >
							<td>Invalid Issue</td>
							<td>
								<xsl:value-of select="AssessmentStage"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:template match="/" mode="ProjectDetails">
		<h2>
			<img src="https://julesbuh.github.io/XML/icon/Phases.png" width="50px"/>Project Information
		</h2>
		<table class="validity">	
			<tr>
				<td>BRE Assessment Registration Number:</td>

				<td width = "200px">
					<b>
						<xsl:value-of select="$BREARN"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">validity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="BREARN"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Project Name:</td>
				<td>
					<b>
						<xsl:value-of select="$ProjectName"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">validity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="ProjectName"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Assessment Stage:</td>
				<td>
					<b>
						<xsl:value-of select="$AssessmentStage"/> Stage Assessment
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">validity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="AssessmentStage"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Assessor:</td>
				<td>
					<b>
						<xsl:value-of select="$HQMAssessor"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="HQMAssessor"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>

	<!--people-->
	<xsl:param name="HQMAssessor" select="//HQMAssessor/person/Name[1]"/>
	<xsl:template match="/" mode="HQMAssessor">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//ProjectDetails">
				<xsl:choose>
					<xsl:when test="count(Roles/HQMAssessor/person/Name[contains(text(),$HQMAssessor)])">
						<tr class="valid">
							<td>Continuous</td>
							<td>
								<xsl:value-of select="Roles/HQMAssessor/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="Roles/HQMAssessor/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:param name="Developer" select="//Developer/person/Name[1]"/>
	<xsl:template match="/" mode="Developer">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//ProjectDetails">
				<xsl:choose>
					<xsl:when test="count(Roles/Developer/person/Name[contains(text(),$Developer)])">
						<tr class="valid">
							<td>Continuous</td>
							<td>
								<xsl:value-of select="Roles/Developer/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="Roles/Developer/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:param name="Constructor" select="//Constructor/person/Name[1]"/>
	<xsl:template match="/" mode="Constructor">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//ProjectDetails">
				<xsl:choose>
					<xsl:when test="count(Roles/Constructor/person/Name[contains(text(),$Constructor)])">
						<tr class="valid">
							<td>Continuous</td>
							<td>
								<xsl:value-of select="Roles/Constructor/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="Roles/Constructor/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:param name="Designer" select="//Designer/person/Name[1]"/>
	<xsl:template match="/" mode="Designer">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//ProjectDetails">
				<xsl:choose>
					<xsl:when test="count(Roles/Designer/person/Name[contains(text(),$Designer)])">
						<tr class="valid">
							<td>Continuous</td>
							<td>
								<xsl:value-of select="Roles/Designer/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="Roles/Designer/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:param name="StructuralEngineer" select="//StructuralEngineer/person/Name[1]"/>
	<xsl:template match="/" mode="StructuralEngineer">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//ProjectDetails">
				<xsl:choose>
					<xsl:when test="count(Roles/StructuralEngineer/person/Name[contains(text(),$StructuralEngineer)])">
						<tr class="valid">
							<td>Continuous</td>
							<td>
								<xsl:value-of select="Roles/StructuralEngineer/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="Roles/StructuralEngineer/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:param name="Ecologist" select="//Ecologist/person/Name[1]"/>
	<xsl:template match="/" mode="Ecologist">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//ProjectDetails">
				<xsl:choose>
					<xsl:when test="count(Roles/Ecologist/person/Name[contains(text(),$Ecologist)])">
						<tr class="valid">
							<td>Continuous</td>
							<td>
								<xsl:value-of select="Roles/Ecologist/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="Roles/Ecologist/person/Name"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:variable name="others" select="person/Name" />
	<xsl:template match="/" mode="Others">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="$others">
				<xsl:if test="generate-id() = generate-id($others[. = current()][1])">
					<tr>
						<td>
							<xsl:value-of select="." />
						</td>
					</tr>
					<br />
				</xsl:if>
			</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:template match="/" mode="TeamDetails">
		<h2>
			<img src="https://julesbuh.github.io/XML/icon/logo-breeam.png" width="50px"/>Project Team Information
		</h2>
		<table class="validity">	
			<tr>
				<td>Assessor:</td>

				<td width = "200px">
					<b>
						<xsl:value-of select="$HQMAssessor"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="HQMAssessor"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Developer:</td>
				<td>
					<b>
						<xsl:value-of select="$Developer"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="Developer"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Constructor:</td>
				<td>
					<b>
						<xsl:value-of select="$Constructor"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="Constructor"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Designer:</td>
				<td>
					<b>
						<xsl:value-of select="$Designer"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="Designer"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>StructuralEngineer:</td>
				<td>
					<b>
						<xsl:value-of select="$StructuralEngineer"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="StructuralEngineer"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Ecologist:</td>
				<td>
					<b>
						<xsl:value-of select="$Ecologist"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="Ecologist"/>
						</div>
					</div>
				</td>
				<tr>
				</tr>
				<td>Others:</td>
				<td>
					<b>
						<xsl:for-each select="$others">
							<xsl:if test="generate-id() = generate-id($others[. = current()][1])">
								<tr>
									<td>
										<xsl:value-of select="." />
									</td>
								</tr>
								<br />
							</xsl:if>
						</xsl:for-each>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="Others"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>

	<!--site-->
	<xsl:param name="siteLocation" select="//inputs/siteDetails/Address/Address[1]"/>
	<xsl:template match="/" mode="siteLocation">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//inputs">
				<xsl:choose>
					<xsl:when test="count(siteDetails/Address/Address[.=$siteLocation])">
						<tr class="valid">
							<td>Continuous</td>
							<td>
								<xsl:value-of select="siteDetails/Address/Address"/>
							</td>
							<td>
								<xsl:value-of select="../../@id"/>.<xsl:value-of select="../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="siteDetails/Address/Address"/>
							</td>
							<td>
								<xsl:value-of select="../../@id"/>.<xsl:value-of select=" ../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:param name="terrainType" select="//terrainType[1]"/>
	<xsl:template match="/" mode="terrainType">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//siteDetails">
				<xsl:choose>
					<xsl:when test="count(terrainType[contains(text(),$terrainType)])">
						<tr class="valid">
							<td>Continuous</td>
							<td>
								<xsl:value-of select="terrainType"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="terrainType"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:param name="surroundingsHighAlbedo" select="//@surroundingsHighAlbedo[1]"/>
	<xsl:template match="/" mode="surroundingsHighAlbedo">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//siteDetails">
				<xsl:choose>
					<xsl:when test="count(@surroundingsHighAlbedo[.=$surroundingsHighAlbedo])">
						<tr class="valid">
							<td>Valid</td>
							<td>
								<xsl:value-of select="@surroundingsHighAlbedo"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="@surroundingsHighAlbedo"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:param name="highAlbedoLocal" select="//@highAlbedoLocal[1]"/>
	<xsl:template match="/" mode="highAlbedoLocal">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//siteDetails">
				<xsl:choose>
					<xsl:when test="count(@highAlbedoLocal[.=$highAlbedoLocal])">
						<tr class="valid">
							<td>Valid</td>
							<td>
								<xsl:value-of select="@highAlbedoLocal"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="@highAlbedoLocal"/>
							</td>
							<td>
								<xsl:value-of select="../../../@id"/>.<xsl:value-of select="../../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:param name="BuildScale" select="//BuildScale[1]"/>
	<xsl:template match="/" mode="BuildScale">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//inputs">
				<xsl:choose>
					<xsl:when test="count(//BuildScale[text()=$BuildScale])">
						<tr class="valid">
							<td>Valid</td>
							<td>
								<xsl:value-of select="//BuildScale"/>
							</td>
							<td>
								<xsl:value-of select="../../@id"/>.<xsl:value-of select="../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="//BuildScale"/>
							</td>
							<td>
								<xsl:value-of select="../../@id"/>.<xsl:value-of select=" ../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:param name="FloodRisks" select="//FloodRisks[1]"/>
	<xsl:template match="/" mode="FloodRisks">
		<table class="validity">
			<tr>
				<th>Validity</th>
				<th>Value</th>
				<th>In Issue</th>
			</tr>
			<xsl:for-each select="//inputs">
				<xsl:choose>
					<xsl:when test="count(//FloodRisks[text()=$FloodRisks])">
						<tr class="valid">
							<td>Continuous</td>
							<td>
								<xsl:value-of select="//FloodRisks"/>
							</td>
							<td>
								<xsl:value-of select="../../@id"/>.<xsl:value-of select="../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr class="mismatch" >
							<td>Discontinuous</td>
							<td>
								<xsl:value-of select="//FloodRisks"/>
							</td>
							<td>
								<xsl:value-of select="../../@id"/>.<xsl:value-of select=" ../@id"/>
								<br/>
							</td>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:template match="/" mode="SiteDetails">
		<h2>
			<img src="https://julesbuh.github.io/XML/icon/Site.png" width="50px"/>Site Information
		</h2>
		<table class="validity">	
			<tr>
				<td>Site Location:</td>
				<td width = "200px">
					<b>
						<xsl:value-of select="$siteLocation"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="siteLocation"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>TerrainType:</td>
				<td width = "200px">
					<b>
						<xsl:value-of select="$terrainType"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="terrainType"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Building Height:</td>
				<td width = "200px">
					<b>
						<xsl:value-of select="$BuildScale"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="BuildScale"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>High Albedo:</td>
				<td width = "200px">
					<b>
						<xsl:value-of select="$surroundingsHighAlbedo"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="surroundingsHighAlbedo"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Local Albedo:</td>
				<td width = "200px">
					<b>
						<xsl:value-of select="$highAlbedoLocal"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="highAlbedoLocal"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Flood Risks:</td>
				<td width = "200px">
					<b>
						<xsl:value-of select="$FloodRisks"/>
						<xsl:value-of select="../../@id"/>
					</b>
				</td>
				<td width = "50px">
					<div id="DivForHoverItem">continuity
						<div id="HiddenText">
							<xsl:apply-templates select="/" mode="FloodRisks"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</xsl:template>


	<xsl:template match="/" mode="ProjectView">
		<xsl:apply-templates select="/" mode="ProjectDetails"/>
		<xsl:apply-templates select="/" mode="TeamDetails"/>
		<xsl:apply-templates select="/" mode="SiteDetails"/>



		<h2>
			<img src="https://julesbuh.github.io/XML/icon/Block.png" width="50px"/>Block Information
		</h2>
		<xsl:for-each select="*//Issue">
			<xsl:sort select="../../Issue//@id"/>
			<p>
				<xsl:value-of select="//PropertyPosition"/> - (<xsl:value-of select="@id"/>)</p>
			<p>
				<xsl:value-of select="//BuiltForm"/> - (<xsl:value-of select="@id"/>)</p>
		</xsl:for-each>

		<h2>
			<img src="https://julesbuh.github.io/XML/icon/Dwelling.png" width="50px"/>Dwelling Information
		</h2>
		<xsl:for-each select="*//PropertyType">
			<p>
				<xsl:value-of select="."/> - (<xsl:value-of select="../../../..//@id"/>)</p>
		</xsl:for-each>
		<xsl:for-each select="*//PropertyDetails">
			<p>
				<xsl:value-of select="."/> - (<xsl:value-of select="../../..//@id"/>)</p>
		</xsl:for-each>
		<h2>
			<img src="https://julesbuh.github.io/XML/icon/Room.png" width="50px"/>Space Information
		</h2>
		<xsl:for-each select="*//Issue">

			<xsl:sort select="@id"/>
			<xsl:value-of select="@id"/>
			<xsl:for-each select="//space">
				<xsl:sort select="."/>
				<table>
					<tr>
						<td>
							<xsl:value-of select="."/>
						</td>
					</tr>
				</table>
			</xsl:for-each>
			<xsl:for-each select="//Location">
				<xsl:sort select="."/>
				<table>
					<tr>
						<td>
							<xsl:value-of select="."/>
						</td>
					</tr>
				</table>
			</xsl:for-each>
		</xsl:for-each>
		<h2>
			<img src="https://julesbuh.github.io/XML/icon/constructions.png" width="50px"/>Construction Information
		</h2>
		<xsl:for-each select="*//system">
			<p>
				<xsl:value-of select="."/> - (<xsl:value-of select="../../../..//@id"/>)</p>
		</xsl:for-each>
		<xsl:for-each select="*//product">
			<p>
				<xsl:value-of select="."/> - (<xsl:value-of select="../../../..//@id"/>)</p>
		</xsl:for-each>

	</xsl:template>	




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
				This xml file is a hypothetical merged file containing 4 out of 36 issues that assessment information has been entered for. The xsl file transforms the data to a project orientated view to be able to compare discrepancies from a project perspective
				<img src="http://www.homequalitymark.com/images/home_quality_mark_logo.png"/>
				<h2>HQM XML Inputs</h2>
				<h1>Project Object View</h1>
				<xsl:apply-templates select="/" mode="ProjectView"/>
				<h1>HQM Assessment View</h1>
				<xsl:apply-templates select="*//Section" mode="assessmentView"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="Section" mode="assessmentView">

		<xsl:apply-templates select="Category" mode="assessmentView"/>   

	</xsl:template>

	<xsl:template match="Category" mode="assessmentView">
		<h1>
			<xsl:apply-templates select="../@id"/>
			<xsl:apply-templates select="../@name"/> 	 
			<xsl:apply-templates select="@id"/>
			<xsl:apply-templates select="@name"/>
		</h1>
		<xsl:apply-templates select="Issue"/>  
	</xsl:template>

	<xsl:template match="Issue">

		<xsl:apply-templates select="Criterion/inputs"/> 
	</xsl:template>

	<xsl:template match="name">
		<span>
			<xsl:value-of select="."/>
		</span>
	</xsl:template>

	<xsl:template match="@id">
		<span>
			<xsl:value-of select="."/> - <xsl:apply-templates select="../name"/> |
		</span>
	</xsl:template>

	<xsl:template match="inputs">
		<h2>
			<img src="https://julesbuh.github.io/XML/icon/home_quality_mark_logo3.png" height="40px"/>
			<xsl:value-of select="../../@id"/> - <xsl:apply-templates select="../../name"/> | Inputs
		</h2>

		<xsl:apply-templates select="siteDetails"/>
		<xsl:apply-templates select="PropertyDetails"/> 
		<xsl:apply-templates select="constructionSystems"/>
		<xsl:apply-templates select="constructionProducts"/>
		<xsl:apply-templates select="Spaces"/>
	</xsl:template>

	<xsl:template match="ProjectDetails">
		<h4>
			<img src="https://julesbuh.github.io/XML/icon/phases.png" width="20px"/>Project Information
		</h4>
		<span>
			<xsl:for-each select=".">
				<p>
					<xsl:value-of select="."/> - (<xsl:value-of select="../../..//@id"/>)</p>
			</xsl:for-each>
		</span>
	</xsl:template>

	<xsl:template match="siteDetails">
		<h4>
			<img src="https://julesbuh.github.io/XML/icon/Site.png" width="20px"/>Site Information
		</h4>
		<span>
			<xsl:for-each select=".">
				<p>
					<xsl:value-of select="."/> - (<xsl:value-of select="../../..//@id"/>)</p>
			</xsl:for-each>
		</span>
	</xsl:template>


	<xsl:template match="PropertyDetails">
		<h4>
			<img src="https://julesbuh.github.io/XML/icon/Dwelling.png" width="20px"/>Dwelling Information
		</h4>
		<span>
			<xsl:for-each select=".">
				<p>
					<xsl:value-of select="."/> - (<xsl:value-of select="../../..//@id"/>)</p>
			</xsl:for-each>
		</span>
		<xsl:apply-templates select="../dwellingTypeDetails"/>  
	</xsl:template>

	<xsl:template match="dwellingTypeDetails">
		<h4>
			<img src="https://julesbuh.github.io/XML/icon/Dwelling.png" width="20px"/>Dwelling Type Information
		</h4> 
		<span>

			<xsl:for-each select=".">
				<p>
					<xsl:value-of select="."/> - (<xsl:value-of select="../../..//@id"/>)</p>
			</xsl:for-each>
		</span>
	</xsl:template>

	<xsl:template match="constructionSystems">
		<h4>
			<img src="https://julesbuh.github.io/XML/icon/constructions.png" width="20px"/>Construction Information
		</h4>
		<span>
			<xsl:for-each select="system">
				<p>
					<xsl:value-of select="."/> - (<xsl:value-of select="../../..//@id"/>)</p>
			</xsl:for-each>
			<xsl:apply-templates select="../constructionProducts"/> 
			<br/>
			<br/>
		</span>
	</xsl:template>

	<xsl:template match="constructionProducts">
		<h4>
			<img src="https://julesbuh.github.io/XML/icon/constructions.png" width="20px"/>Product Information
		</h4>
		<span>
			<xsl:for-each select="product">
				<p>
					<xsl:value-of select="."/> - (<xsl:value-of select="../../..//@id"/>)</p>
			</xsl:for-each>
			<br/>
			<br/>
		</span>
	</xsl:template>

	<xsl:template match="Spaces">
		<h4>
			<img src="https://julesbuh.github.io/XML/icon/Room.png" width="20px"/>Spatial Information
		</h4>
		<span>
			<xsl:value-of select="."/> (<xsl:value-of select="../../..//@id"/>)
		</span>
	</xsl:template>
</xsl:stylesheet>