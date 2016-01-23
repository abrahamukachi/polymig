#!/bin/bash -e
#
# Copyright (c) 2016 Ukachi Abraham - abrahamukachi@gmail.com. All rights reserved.

# version 0.1

# polymig
## Polymer Manifest Icons Generator

# A simple tool that resizes, creates, converts and renames your app's icon into 8
# different image files required by Polymer Start Kit(http://polymer-starter-kit),
# in your manifest.json file.
#
# Note: These generated image files will be saved in `[<your-current-directory>]/polymig/images/touch`.
#
# ### Install
#
# ### Bower
#
# ```bash
# $ bower install --save abilasco/polymig
# ```
#
# ### NPM
#
# ```bash
# $ npm install -g polymig
# ```
#
# ### Usage
#
# ```bash
# $ polymig app-icon.jpeg
# ```

# clearing the shell
clear

echo -e "\e[1mPolymig \e[21mv0.1  \e[31m[new]"
sleep 0.3;
echo -e "\e[34mauthor: \e[39mUkachi Abraham \e[4;5m<abrahamukachi@gmail.com>\e[0m\n"
sleep 1;

# assigning file names (from manifest.json) to a variable (FILE_NAMES)
FILE_NAMES=('ms-touch-icon' 'apple-touch-icon' 'chrome-touch-icon' 'chrome-splashscreen')

SIZES=(144 152 192 384 512 72 96 128)

args=("$@")

main() {
  # TODO: Check if $1 is a valid file name

  type convert >/dev/null 2>&1 || {echo -e >&2 "polymig depends on 'convert'\ninstall it by typing: \e[1msudo apt-get install convert\e[0m"

  mkdir -p polymig/images/touch

  echo -e "\e[32;23mSelected File: \e[1m${args[0]}\e[0m"

  for ((i=0;i<${#SIZES[@]};i++)); do
    echo
    size="${SIZES[${i}]}"
    format="${size}x${size}"

    if [[ $i -lt ${#FILE_NAMES[@]} ]]; then
      name=${FILE_NAMES[${i}]}
    else
      name="icon"
    fi


    file_name="$name-$format.png"


    echo -e "\e[1m[polymig]:($((i+1))/8)-->\e[0m generating $file_name..."
    sleep 1;

    convert ${args[0]} -resize ${format}! polymig/images/touch/$file_name
    echo -e "\e[1;32m<-generated\e[0m"
  done


}

main

echo -e "\n\e[0;1m[polymig]:-->\e[36;1mall files were generated successfully!"
echo -e "\e[0;1m[polymig]:(\e[31mimportant\e[39m)--> \e[0msaved in \e[1;36mpolymig/images/touch \e[0mdirectory.\n"
echo -e "\e[0;1m[polymig]:(\e[32mhappy coding!\e[39m)-->\e[1m There is an element for that! :)\n\e[0m"
