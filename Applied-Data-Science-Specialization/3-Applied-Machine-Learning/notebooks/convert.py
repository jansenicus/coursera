#!/usr/bin/python

print "Converting all of the .dav files in this current directory into .mp4 files using ffmpeg"	
import os
from subprocess import call

files = [f for f in os.listdir('.') if os.path.isfile(f)]
for f in files:
    ext = f.split(".")[-1]
    if ext == "dav" or ext == "DAV":
    	mp4Name = f.replace("dav", "mp4")
    	print "Converting: " + f
    	call(['ffmpeg', '-y', '-i', f, "-vcodec", "libx264", "-crf", "24", mp4Name])
    	print "Converted: " + f
