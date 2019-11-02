#!/usr/bin/env bash

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

cat ./assets/extra_styles.css >> ../app/styles/_categories.scss

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
