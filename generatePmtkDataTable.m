function generatePmtkDataTable()
%% Generate the PMTK data table from the meta files
% * PMTK3 must be on the MATLAB path *

dataSets = dirs(pmtkDataRoot());
perm     = sortidx(lower(dataSets));
dataSets = dataSets(perm);
googleRoot = ' http://pmtkdata.googlecode.com/svn/trunk';
colNames = {'NAME', 'DESCRIPTION', 'FILESIZE (KB)', 'SOURCE', 'TYPE'};
n = numel(dataSets);

htmlData = cell(n, numel(colNames));
for i=1:n
    meta = fullfile(pmtkDataRoot(), dataSets{i}, [dataSets{i}, '-meta.txt']);
    zip  = fullfile(pmtkDataRoot(), dataSets{i}, [dataSets{i}, '.zip']);
    link = sprintf('<a href="%s/%s/%s.zip">%s</a>', googleRoot, dataSets{i}, dataSets{i}, dataSets{i}); 
    htmlData{i, 1} = link; 
    
    
    
    [tags, lines] = tagfinder(meta);
    S = createStruct(tags, lines);
    if isfield(S, 'PMTKdescription')
        htmlData{i, 2} = S.PMTKdescription;
    end
    info = dir(zip); 
    sz = sprintf('%d', ceil(info.bytes/(1024))); 
    htmlData{i, 3} = sz; 
    if isfield(S, 'PMTKsource')
        htmlData{i, 4} = S.PMTKsource;
    end
    if isfield(S, 'PMTKtype')
        htmlData{i, 4} = S.PMTKtype;
    end
end
pmtkRed  = '#990000';

header = [...
    sprintf('<font align="left" style="color:%s"><h2>PMTK Data</h2></font>\n', pmtkRed),...
    sprintf('<br>Revision Date: %s<br>\n', date()),...
    sprintf('<br>Auto-generated by generatePmtkDataTable.m<br>\n'),...
    sprintf('<br>Click on the file name to download the data set'), ...
    sprintf('<br><br><br>\n')...
    ];

colNameColors = repmat({pmtkRed}, 1, numel(colNames));
dest = fullfile(pmtkDataRoot(), 'dataTable.hmtl'); 
htmlTable('data'          , htmlData       , ...
          'doshow'        , true           , ...
          'dosave'        , true           , ...
          'filename'      , dest           , ...
          'dataalign'     , 'left'         , ...
          'colnames'      , colNames       , ...
          'colNameColors' , colNameColors  , ...
          'header'        , header         );

end