#/bin/bash
clear
read -r -d '' LOGO <<'EOF'
######################################################
#                                                    #
#                  SUPER DUPLICATOR                  #
#                    BY WMD & OKL                    #
#                       © 2021                       #
#                                                    #
######################################################
\n
EOF
echo "$LOGO"

echo "👨‍🔬 I need a path to the file: "
read -e AUDIOPATH

if [ ! -f "$AUDIOPATH" ]
then
  echo "⚠️  File:"
  echo " $AUDIOPATH"
  echo "No such file or file does not exist."
  echo "Check your path and try again!"
  break
fi

clear
echo "$LOGO"
echo "👨‍🔬 Enter a path to a directory  "
echo "containing the files you want use: "
read -e FILESPATH

if [ ! -d "$FILESPATH" ]; then
  echo "⚠️  Path: $FILESPATH does not exist or "
  echo "is not an absolute path, try again!"
fi

# use nullglob in case there are no matching files
shopt -s nullglob

`rm -rf wem-processed`
`mkdir wem-processed`

FILES=($(ls $FILESPATH))

for f in "${FILES[@]}"; do
   `cp $AUDIOPATH ./wem-processed/$f`
done

NUMBFILES=$(ls ./wem-processed/|wc -l)
echo "Created $NUMBFILES files in directory wem-processed."
