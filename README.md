# NHK-Radio-Broadcast

```
This is re-Broadcasting script to Shoutcast for people in outside of Japan.
You should run this script at server that located in Japan.

This scripts requires ffmpeg, perl, libshout(perl).

Shell script will run ffmpeg and send audio data to perl script with pipeline. 
Then perl script will transcode audio data to Shoutcast protocol and send to your Shoutcast server.
Please change the server url and password in perl script before you run.

You can re-use shout_nhk_r1.pl code for nhk_r2 and nhk_fm.
```

```
How to install libshout

1. Download Shout-2.1.tar.gz to your target server
2. Then un-tar the tar.gz
tar -xvf Shout-2.1.tar.gz
3. Then make and install the libperl
perl Makefile.PL
make
sudo make install

Finish!
```
