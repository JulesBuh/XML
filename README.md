# Hosting XML
This is a test repository for hosting xml, xsd and xsl as a webpage. 

It uses prototype schemas based on the work for HQM data exchanges used in HQM assessments.

The following xml file is a hypothetical merged file containing 4 out of 36 issues that assessment information has been entered for. The xsl file transforms the data to compare discrepancies from a project perspective. 

[`https://julesbuh.github.io/XML/ExampleMergedHQMOutputFile.xml`](https://julesbuh.github.io/XML/ExampleMergedHQMOutputFile.xml)

The following file loads the schema associated with the input file and displays dropdown liss for possible input values. The intention of this exercise this is to scrape the data from the exchange file (similar to above) and marry it to the schema on which its validated against. The xsl only goes as far as loading the xsd schema and then writing the contents of the xml below.
[`https://julesbuh.github.io/XML/InputWithSchema.xml`](https://julesbuh.github.io/XML/InputWithSchema.xml)
