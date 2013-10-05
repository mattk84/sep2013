04-data-manipulation
====================

Okay, time for a real world problem.  

Let's say you have a bunch of media files, some of which work and some of which don't.
You don't have a detailed specification for the media files, but you think you should be
able to work one out, based on the attributes of the files that work and the ones that don't.

So you dump the attributes of each file, using JSON, into two directories:

* working
* not_working

Here's the question:  
--
  
   
Given media files with the following attributes, would we expect them to play or not?

`{
	"fps": 23.976,
	"v_codec": "h264",
	"bitrate": 4900,
	"a_codec": "mp3"
}`

`{
	"fps": 24,
	"v_codec": "mpeg2",
	"bitrate": 4100,
	"a_codec": "mp3"
}`

`{
	"fps": 30,
	"v_codec": "h264",
	"bitrate": 4400,
	"a_codec": "mp3"
}`

`{
	"fps": 25,
	"v_codec": "h264",
	"bitrate": 4100,
	"a_codec": "aac"
}`

`{
	"fps": 24,
	"v_codec": "h264",
	"bitrate": 5200,
	"a_codec": "mp3"
}`
