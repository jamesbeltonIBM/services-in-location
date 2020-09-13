# services-in-location

A colleague asked me if there was a way to determine which services were available from a particular IBM Cloud location.

The answer is that there's no one commenand which gives you this information - there's a command to tell you what services are available in the catalog and then another which tells you about a particular service and where it's available, assuming you know the service ID first.

So this script is an attempt to help my colleague out. 

If you run this shell script - and provide it the IBM location that you are interested in (e.g. region or DC location), then it will write out a file listing with some details, the IBM Cloud services that are available there. 

The script comes with no support or warranty. Installation of the IBM Cloud CLI is a pre-requisite to run it locally, though it can also be run in the IBM Cloud Shell.

Cheers

James
