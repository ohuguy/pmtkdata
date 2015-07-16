As of January 2014,  a copy of this site is available at https://github.com/probml/pmtkdata

This site contains datasets for machine learning in matlab format.
Click [here](http://pmtkdata.googlecode.com/svn/trunk/docs/dataTable.html) for a list of the data sets. Each folder contains a datafile in matlab format, a text 'meta file' describing the data, and possibly other auxiliary files e.g., the data in its original text or binary format, parsing functions, etc.

These datasets are used by some of the demos in <a href='http://code.google.com/p/pmtk3/'>Probabilistic modeling toolkit (PMTK) </a>. You do not need pmtk to use this data. However,  the pmtk function [loadData.m](http://pmtk3.googlecode.com/svn/trunk/pmtkTools/dataTools/loadData.m)  can automatically download data on demand from this web site, avoiding the need to manually download anything.

You can also use the [pmtk](http://pmtk3.googlecode.com) command [downloadAllData](http://code.google.com/p/pmtk3/source/browse/trunk/pmtkTools/dataTools/downloadAllData.m) to download all of the data sets at once, although this is slow. If you do download directly, you should edit the [config.txt](http://pmtk3.googlecode.com/svn/trunk/config.txt) file (or create local-config.txt) to specify the location of the data directories.

Contributors of data to this site should follow the guidelines [here](http://code.google.com/p/pmtkdata/wiki/GuidelinesForContributors) to ensure their data is easily accessible by others.