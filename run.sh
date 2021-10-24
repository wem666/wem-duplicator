#/bin/bash
clear
echo "######################################################"
echo "#                                                    #"
echo "#                    SUPER RENAME                    #"
echo "#                    BY WMD & OKL                    #"
echo "#                    © 2021                          #"
echo "#                                                    #"
echo "######################################################"

echo ""
echo ""
echo ""

echo "👨‍🔬 Jag behöver en sökväg till ljudfilen: "
read AUDIOPATH

if [ ! -d "$AUDIOPATH" ]; then
  echo "⚠️  Sökvägen $AUDIOPATH finns inte, kontrollera och försök igen"
fi
