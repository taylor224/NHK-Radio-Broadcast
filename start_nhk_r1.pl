#!/usr/bin/perl -w

use strict;
use Shout;
use bytes;

###############################################################################
###  C O N F I G U R A T I O N
###############################################################################

# shoutcast DNAS version 1 or 2
my $version = 2;

# shoutcast v2 stream id
my $stream_name = 'nhk_r1';

# hostname or ip address without http://
my $host = 'Your Shoutcast Server IP';                        # CHANGE THIS !!!!!!!!!!!!!!

# port
my $port = 8000;

# password
my $password = 'your broadcast password of Shoutcast server'; # CHANGE THIS !!!!!!!!!!!!!!

# stream name
my $name = 'NHK R1 Radio';

# stream url
my $url = 'strean url info';

# stream genre
my $genre = 'radio';

# 1 for public, 0 for private
my $public = 0;

# bitrate
my $bitrate = 256;

# samplerate
my $samplerate = 44100;

###############################################################################
###  M A I N   P R O G R A M
###############################################################################

my $streamer = new Shout
  host          => $host,
  port          => $port,
  password      => $password,
  name          => $name,
  url           => $url,
  bitrate  => $bitrate,
  genre         => $genre,
  format        => SHOUT_FORMAT_MP3,
  protocol      => SHOUT_PROTOCOL_ICY,
  mount         => $stream_name,
  public        => $public;

$streamer->set_audio_info(SHOUT_AI_BITRATE => $bitrate, SHOUT_AI_SAMPLERATE => $samplerate);

if ($streamer->open) {
  print "connected\n";
  print "host: $host\n";
  print "port: $port\n";
  print "password: $password\n";
  print "name: $name\n";
  print "url: $url\n";
  print "bitrate: $bitrate\n";
  print "genre: $genre\n";
  print "format: SHOUT_FORMAT_MP3\n";
  print "public: $public\n";
  print "Streaming from STDIN...\n";

  $streamer->set_metadata("song" => "NHK R1");

  my ($buff, $len);
    while (($len = sysread(STDIN, $buff, 4096)) > 0) {
  unless ($streamer->send($buff)) {
      print "Error while sending: " . $streamer->get_error . "\n";
      last;
  }
  $streamer->sync;
    }
    $streamer->close;
} else {
    print "failed... "  . $streamer->get_error . "\n";
}
