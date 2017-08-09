# Hosting XML
This is a test repository for hosting xml, xsd and xsl as a webpage. 

It uses prototype schemas based on the work for HQM data exchanges used in HQM assessments.

The following xml file is a hypothetical merged file containing 4 out of 36 issues that assessment information has been entered for. The xsl file transforms the data to compare discrepancies from a project perspective. 

[`https://julesbuh.github.io/XML/ExampleMergedHQMOutputFile.xml`](https://julesbuh.github.io/XML/ExampleMergedHQMOutputFile.xml)

The following file loads the schema associated with the input file and displays dropdown lists for possible input values. The intention of this exercise this is to scrape the data from the exchange file (similar to above) and marry it to the schema on which its validated against. The xsl only goes as far as loading the contents of the exchange file, reading the schema version and then loading the xsd schema below with drop downs for defined accepted values for simple lists.

[`https://julesbuh.github.io/XML/InputWithSchema.xml`](https://julesbuh.github.io/XML/InputWithSchema.xml)

Related Feasibility exercises for improving the communication of HQM concepts:

[`https://julesbuh.github.io/threeD.js-HQM-Daylighting/`](https://julesbuh.github.io/threeD.js-HQM-Daylighting)
