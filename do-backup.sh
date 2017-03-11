# Add path to this array
Paths=( ~/nrc.vim ~/.config/compton.conf ~/.config/i3/config ~/.zshrc )

todayday=$(date +%d-%m-%y)
timenow=$(date +%s)
mkdir $todayday
echo Timestamp for backup: $todayday $timenow
cd $(pwd)/$todayday
echo "CURRENT DIRECTORY: $(pwd) "
for file in ${Paths[*]}
do
    #path=$(echo $path | sed "s/.*\///")
    echo OLD: $file
    filename=$(echo $file | sed -r "s,\/,-,g")
    echo NEW: $filename
    cp $file ./${filename}
done
echo "ALL FILES: "
ls
