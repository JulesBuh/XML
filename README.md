# Hosting XML demonstrating vision for HQM tools and Technical Manual authoring
This is a prototype repository for hosting xml, xsd and xsl as a webpage. It does not attempt to match the official HQM release which can be found [http://www.homequalitymark.com/standard](http://www.homequalitymark.com/standard). The standard and trademarks belong to BRE Global Ltd. The purpose of these prototypes are to demonstrate the potential of the XML schema that has been developed by BRE for the HQM standard.

It uses prototype schemas based on the work for [HQM](http://www.homequalitymark.com/) data exchanges used in [HQM assessments](http://www.homequalitymark.com/).

## Cross-assessment discrepancy checks (QA)
The following xml file is a hypothetical merged file containing 4 out of 36 issues that assessment information has been entered for. The xsl file transforms the data to a project orientated view to be able to compare discrepancies from a project perspective. 

[`https://julesbuh.github.io/XML/ExampleMergedHQMOutputFile.xml`](https://julesbuh.github.io/XML/ExampleMergedHQMOutputFile.xml)

## Referencing Schemas (Accessing defined drop-downs for co-ordinating assessment tools)
The following file loads the schema associated with the input file and displays dropdown lists for possible input values. The intention of this exercise this is to scrape the data from the exchange file (similar to above) and marry it to the schema on which its validated against. The xsl only goes as far as loading the contents of the exchange file, reading the schema version and then loading the xsd schema with drop downs for defined accepted values for simple enumerator lists.

[`https://julesbuh.github.io/XML/InputWithSchema.xml`](https://julesbuh.github.io/XML/InputWithSchema.xml)

## Visualise tools
Related Feasibility exercises for improving the communication of HQM concepts: This example builds an interactive parametric model for the daylight issue, showing how the equations relate to the geometry. This could aid training as well as be extended to be an actual tool in the online assessment. The javasript definition for this file could be hard coded into the xml manual in the relevant issue or the url to the javascript page as demonstrated in the [manual in issue 10](https://julesbuh.github.io/XML/HQMManual.xml#2.01.02)

[`https://julesbuh.github.io/threeD.js-HQM-Daylighting/`](https://julesbuh.github.io/threeD.js-HQM-Daylighting)

## Technical Manual as xml
Concept model for packaging content as xml which can then be used to output the manual as well as drive the tools. e.g drop down lists and credit tables which are defined in each issue can be utilised within the relevant tool (both online and offline versions of the tool. Methodology and tool troubleshooting could also be defined in this way.
[`https://julesbuh.github.io/XML/HQMManual.xml`](https://julesbuh.github.io/XML/HQMManual.xml)
