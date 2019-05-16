#!/bin/bash
for filename in ./RawImageFolder/*; do
    [ -e "$filename" ] || continue
    name=${filename##*/}
    base=${name%.*}
    
    #For PNG
    optipng "./RawImageFolder/${base}.png" -out "./cleanJpg/${base}.png"

    #Convert TIF to JPG
    convert -quality 100 "./RawImageFolder/${base}.tif" "./convertedToJpg/${base}.jpg"
    #Convert JPG to MozJPG
    cjpeg -quality 75 "./convertedToJpg/${base}.jpg" > "./mozJpg/${base}.jpg"
    #Optimize images by cleaning extra metadata
    jpegtran -outfile "./cleanJpg/${base}.jpg" -optimise -copy none "./mozJpg/${base}.jpg"

    #PNG to MozJPG
    convert -quality 100 "./RawImageFolder/${base}.png" jpg:- | cjpeg -quality 75 > "./mozJpg/${base}.jpg"
    jpegtran -outfile "./cleanJpg/${base}.jpg" -optimise -copy none "./mozJpg/${base}.jpg"
    echo $base
done

#Delete the unnecessary directories
#rm -r ./mozJpg
#rm -r ./convertedToJpg