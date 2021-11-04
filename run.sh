#/bin/bash
clear
read -r -d '' LOGO <<'EOF'
######################################################
#                                                    #
#                  SUPER DUPLICATOR                  #
#                    BY WEM & OKL                    #
#                       © 2021                       #
#                                                    #
######################################################
\n
EOF
echo "$LOGO"

echo "👨‍🔬 I need a path to the file: "
read -e FilePath

if [ ! -f "$FilePath" ]
then
  echo "⚠️  File:"
  echo " $FilePath"
  echo "No such file or file does not exist."
  echo "Check your path and try again!"
  break
fi

clear
echo "$LOGO"
echo "👨‍🔬 Enter a path to a directory  "
echo "containing the files you want use: "
read -e FilesDirectory

if [ ! -d "$FilesDirectory" ]; then
  echo "⚠️  Path: $FilesDirectory does not exist or "
  echo "is not an absolute path, try again!"
fi

OutputDirectory="/tmp/wem-processed"
`rm -rf $OutputDirectory`
`mkdir $OutputDirectory`

# save and change IFS
OLDIFS=$IFS
IFS=$'\n'

fileArray=($(find $FilesDirectory -type f -exec basename {} ';'))

# restore it
IFS=$OLDIFS

# get length of an array
tLen=${#fileArray[@]}

# use for loop read all filenames
for (( i=0; i<${tLen}; i++ ));
do
  file=${fileArray[$i]}
  `cp $FilePath "$OutputDirectory/$file"`
done

NumberOfFilesCreated=$(ls $OutputDirectory/|wc -l)
echo "Created $NumberOfFilesCreated files in directory wem-processed."
