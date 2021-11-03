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

# use nullglob in case there are no matching files
shopt -s nullglob

OutputDirectory="/tmp/wem-processed"
`rm -rf $OutputDirectory`
`mkdir $OutputDirectory`

Files=($(ls $FilesDirectory))

for f in "${Files[@]}"; do
   `cp $FilePath $OutputDirectory/$f`
done

NumberOfFilesCreated=$(ls $OutputDirectory/|wc -l)
echo "Created $NumberOfFilesCreated files in directory wem-processed."
