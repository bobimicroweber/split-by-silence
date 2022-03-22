outputDir="./output/"
if [ -d "$outputDir" ]; then
  ### Take action if $outputDir exists ###
  echo "Starting..."
else
mkdir $outputDir
fi

yourFileNames=`ls ./*.wav`
for eachFile in $yourFileNames
do

 realpathFile=`realpath $eachFile`
 basenameFile=`basename $eachFile`
 outputFilePath=$outputDir$basenameFile

 echo "Spliting audio file: " $realpathFile
 trim=`sox $realpathFile $outputFilePath silence 1 0.1 1% 1 0.1 1%`
 echo "Export audio file: " $outputFilePath
done
