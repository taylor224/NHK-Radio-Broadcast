ffmpeg -d -re -i "mmsh://210.105.237.100/mbcam" -vn -c:a mp3 -b:a 256k -f mp3 - | ./shout_mbc_fm.pl
