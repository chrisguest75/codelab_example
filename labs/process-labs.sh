#!/usr/bin/env bash

echo "process-labs.sh"
pwd 
ls -a
echo "root path"
ls -a /
echo "parent path"
ls -a ../

echo "Process markdown files"
for f in *.md; do 
    $GOPATH/bin/claat export $f
done

#*************************************************
# Modify the site folder below here. 
#*************************************************
echo "Modifying the site"
cp ./assets/core_platform.png ../app/images/icons/core_platform.png
cp ./assets/terraform.png ../app/images/icons/terraform.png
cp ./assets/logo.png ../app/images/logo.png
cp ./assets/modules_laboratory.png ../app/images/modules_laboratory.png

cat ./assets/extra_styles.css >> ../app/styles/_categories.scss

sed -i 's/Welcome to Codelabs!/Welcome to Chrislabs!/g' ../app/views/default/index.html
sed -i 's/Codelabs provide a guided/Chrislabs provide a guided/g' ../app/views/default/index.html

#*************************************************
# Modify the site folder above here
#*************************************************

# Build the site
echo "Building the site"
cd ../
gulp dist --codelabs-dir=codelabs

# Copy output to mounted volume.
echo "Copying to the distribution folder"
cp -RL dist/* /output
