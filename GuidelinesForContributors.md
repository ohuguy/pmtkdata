The PMTK3 [loadData](http://pmtk3.googlecode.com/svn/trunk/toolbox/metatools/dataTools/loadData.m) function automatically downloads required data sets from the [pmtkData website](http://code.google.com/p/pmtkdata/). To ensure that this works for new data sets, please follow these guidelines:

  * Each data set must live in in its own folder and have exactly one .mat file. Store any processing scripts and source data in this folder as well.

  * The name of the .mat file and the folder must be the same.

  * Each data set must have a foo-meta.m file stored in the [pmtkData/meta](http://pmtkdata.googlecode.com/svn/trunk/meta/) directory, where "foo" is the name of the data set. This file stores "meta" information used to generate [this table](http://pmtkdata.googlecode.com/svn/trunk/docs/dataTable.html).

  * Each line of the foo-meta.m file begins with a % followed by a space, and contains a [PMTK tag](http://code.google.com/p/pmtk3/wiki/PMTKtags) along with its data. [Here](http://pmtkdata.googlecode.com/svn/trunk/meta/20news_w1000-meta.m) is an example.

  * Check the folder in to svn.

  * Zip up the new folder by running the following PMTK command:

```
  refreshZipFiles('data' 'foo'); 
```

> The [refreshZipFiles](http://code.google.com/p/pmtk3/source/browse/trunk/localUtil/supportTools/refreshZipFiles.m) function automatically excludes .svn directories before creating the zip file, which is stored inside the foo directory. If you are zipping up a folder manually, make sure not to include the svn info, either by doing this before you check the folder in, or by running ` svn export `.

  * Check the folder in to svn again, to include the .zip file.

  * Test auto-downloding with `loadData('foo') ` making sure the folder you just created is not on your MATLAB path.

  * Run `generatePmtkDataTable` to update the [list of datasets](http://pmtkdata.googlecode.com/svn/trunk/docs/dataTable.html).

  * That's it