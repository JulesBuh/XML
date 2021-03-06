#### [![View on github](img/gh.png) View on github](https://github.com/JulesBuh/XML)
# Hosting XML demonstrating vision for HQM tools and Technical Manual authoring
This is a prototype repository for hosting xml, xsd and xsl as a webpage. It does not attempt to match the official HQM release which can be found [http://www.homequalitymark.com/standard](http://www.homequalitymark.com/standard). The standard and trademarks belong to BRE Global Ltd. The purpose of these prototypes are to demonstrate the potential of the XML schema that has been developed by BRE for the HQM standard.

It uses prototype schemas based on the work for [HQM](http://www.homequalitymark.com/) data exchanges used in [HQM assessments](http://www.homequalitymark.com/).

1.[Example 1 xml cross-validation](#example-1-cross-assessment-discrepancy-checks-potential-for-qa-cross-validation)

2.[Example 2 xml xsd](#example-2-referencing-schemas-accessing-defined-drop-downs-for-co-ordinating-assessment-tools)

3.[Example 3 3D interaction](#example-3-visualise-tools-training-and-assessment-potential)

4.[Example 4 xml manual](#example-4-technical-manual-as-xml-potential-for-streamlining-authoring-and-presenting-information-to-third-party-apps)

5.[Example 5 kml](#example-5-google-earth-and-kmz-files-streamline-assessment-potential-for-batch-upload-and-our-surroundings-issues-evidence)

________________________________________________________________________________________________________
## [Example 1. Cross-assessment discrepancy checks (potential for QA cross validation)](https://julesbuh.github.io/XML/xml/HQMxmlAssessment-MultipleIssuesExample.xml)
The following xml file is a hypothetical merged HQMXMLfile containing 4 out of 36 issues that assessment information has been entered for. The xsl file transforms the data to a project orientated view to be able to compare discrepancies from a project perspective. e.g where different project names for an assessment have been erroneously entered. It can also accommodate different people contributing to different issues (for example where several contractors have been used at different stages of the project to provide information for a particular issue).

[`https://julesbuh.github.io/XML/xml/HQMxmlAssessment-MultipleIssuesExample.xml`](https://julesbuh.github.io/XML/xml/HQMxmlAssessment-MultipleIssuesExample.xml)

![img/XSL Diagram](img/diagram.png)

[![img/Go to example](img/btn_viewExample.png)](https://julesbuh.github.io/XML/xml/HQMxmlAssessment-MultipleIssuesExample.xml)

________________________________________________________________________________________________________
## [Example 2. Referencing Schemas (Accessing defined drop-downs for co-ordinating assessment tools)](https://julesbuh.github.io/XML/xml/HQMxmlAssessment-SingleIssueExample.xml)
The following file loads the schema associated with the input file and displays dropdown lists for possible input values. The intention of this exercise this is to scrape the data from the exchange file (similar to above) and marry it to the schema on which its validated against. The xsl only goes as far as loading the contents of the exchange file, reading the schema version and then loading the xsd schema with drop downs for defined accepted values for simple enumerator lists. There is also potential for BREEAM projects to create hqmXML files for use in offline purposes and development for reintegrating an offline hqmxml file is feasible. Other potential areas of development could be allowing the creation the suit of offline Excel/OpenofficeCalc and Word/OpenofficeWriter tools for each assessment on-the-fly, populating all of the information that has already been defined on BREEAM Projects.

[`https://julesbuh.github.io/XML/xml/HQMxmlAssessment-SingleIssueExample.xml`](https://julesbuh.github.io/XML/xml/HQMxmlAssessment-SingleIssueExample.xml)

![img/XSD Diagram](img/diagram2.png)
[![img/Go to example](img/btn_viewExample.png)](https://julesbuh.github.io/XML/xml/HQMxmlAssessment-SingleIssueExample.xml)

________________________________________________________________________________________________________
## [Example 3. Visualise tools (Training and assessment potential)](https://julesbuh.github.io/threeD.js-HQM-Daylighting)
Related Feasibility exercises for improving the communication of HQM concepts: This example builds an interactive parametric model for the daylight issue, showing how the equations relate to the geometry. This could aid training as well as be extended to be an actual tool in the online assessment. The javasript definition for this file could be hard coded into the xml manual in the relevant issue or the url to the javascript page as demonstrated in the [manual in issue 10](https://julesbuh.github.io/XML/xml/HQMManual-Example.xml#2.01.02)

[`https://julesbuh.github.io/threeD.js-HQM-Daylighting/`](https://julesbuh.github.io/threeD.js-HQM-Daylighting)

![img/InteractiveDaylightVisual](img/thumbnailPreview.png)
[![img/Go to example](img/btn_viewExample.png)](https://julesbuh.github.io/threeD.js-HQM-Daylighting)

________________________________________________________________________________________________________
## [Example 4. Technical Manual as xml (potential for streamlining authoring and presenting information to third party apps)](https://julesbuh.github.io/XML/xml/HQMManual-Example.xml)
Concept model for packaging content as xml which can then be used to output the manual as well as drive the tools. e.g drop down lists and credit tables which are defined in each issue can be utilised within the relevant tool (both online and offline versions of the tool. Methodology and tool troubleshooting could also be defined in this way.

[`https://julesbuh.github.io/XML/xml/HQMManual-Example.xml`](https://julesbuh.github.io/XML/xml/HQMManual-Example.xml)

![img/Manual as a schema Diagram](img/diagram4.png)
[![img/Go to example](img/btn_viewExample.png)](https://julesbuh.github.io/XML/xml/HQMManual-Example.xml)


________________________________________________________________________________________________________
## [Example 5. Google Earth and kmz files (Streamline Assessment Potential for Batch Upload and Our Surroundings Issues Evidence)](https://julesbuh.github.io/XML/xml/HQMxmlAssessment-ProjectExample.xml)
Concept of using icons created to facilitate data input for a large number of dwellings and getting their co-ordinates for assessing against ['Our Surroundings'](https://julesbuh.github.io/XML/xml/HQMManual-Example.xml#1) issues such as transport. The xsl file transforms the .kml file found within a kmz and where particular HQM icons have been used for the placemarker, information can be extracted.

[`https://julesbuh.github.io/XML/xml/HQMxmlAssessment-ProjectExample.xml`](https://julesbuh.github.io/XML/xml/HQMxmlAssessment-ProjectExample.xml)

![img/Manual as a schema Diagram](img/diagram5.png)
[![img/Go to example](img/btn_viewExample.png)](https://julesbuh.github.io/XML/xml/HQMxmlAssessment-ProjectExample.xml)
