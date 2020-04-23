cd src
echo "MacOS Version Info According to Python:"
python -c "import platform; print(platform.mac_ver())"
export gampath=dist/gam
rm -rf $gampath
$python -OO -m PyInstaller --clean --noupx --strip -F --distpath $gampath gam.spec
export gam="$gampath/gam"
$gam version extended
export GAMVERSION=`$gam version simple`
cp LICENSE $gampath
cp whatsnew.txt $gampath
cp GamCommands.txt $gampath
MACOSVERSION=$(defaults read loginwindow SystemVersionStampAsString)
GAM_ARCHIVE=gam-$GAMVERSION-$GAMOS-$PLATFORM-MacOS$MACOSVERSION.tar.xz
rm $gampath/lastupdatecheck.txt
# tar will cd to dist/ and tar up gam/
tar cfJ -C dist/ $GAM_ARCHIVE gam/
