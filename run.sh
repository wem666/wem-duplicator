#/bin/bash
clear
read -r -d '' LOGO <<'EOF'
######################################################
#                                                    #
#                  SUPER DUPLICATER                  #
#                    BY WMD & OKL                    #
#                    © 2021                          #
#                                                    #
######################################################
\n
EOF
echo "$LOGO"

echo "👨‍🔬 Jag behöver en sökväg till ljudfilen: "
read AUDIOPATH

if [ ! -d "$AUDIOPATH" ]; then
  echo "⚠️  Sökvägen $AUDIOPATH finns inte, kontrollera och försök igen"
fi
