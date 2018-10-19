#!/usr/bin/env python

# todo:
# - add error and success codes

import argparse

parser = argparse.ArgumentParser()

# add arguments
parser.add_argument("mode", help="0 if mode is dynamic and 1 if it's static")
parser.add_argument("--hdmi_mode", help="The hdmi_mode in the future")

args = parser.parse_args()


# open config file and find some information
with open("/boot/config.txt", "r") as ins:
    array = []
    
    for line in ins:
    #print line
    
        # now we check if the new mode is dynamic or static
        # if the mode is static we need the hdmi_mode greater than 0
        if args.mode == "1" and args.hdmi_mode > 0:
            # at first we need to check if we are currently running on dynamic screen resolution mode or on static
            if line.find("disable_overscan") >= 0:
                # we are running on dynamic screen resolution
                # we have to change the current line and also the hdmi_mode
                if line[:1] != "#":
			line = "#" + line
                #print line

            if line.find("hdmi_mode") >= 0:
                # at first we uncomment the line
                line = line.translate(None, "#")
                #print line

                # now we try to change the hdmi_mode
                idx = line.find("=")
                line = line.replace(line[(idx+1):], args.hdmi_mode)
                
                # add a new line character
                line = line + "\n"
                #print line
                
            if line.find("hdmi_group") >= 0:
                # at first we uncomment the line
                line = line.translate(None, "#")
                
                # then we change the group to "2"
                idx = line.find("=")
                line = line.replace(line[(idx+1):], "2")
                
                # add a new line character
                line = line + "\n"
                
        # we are now change all to dynamic mode
        if args.mode == "0":
            # check the current mode is static screen resolution
            if line.find("disable_overscan") >= 0:
                line = line.translate(None, "#")
            
            if line.find("hdmi_group") >= 0:
                if line[:1] != "#":
                    line = "#" + line
                
            if line.find("hdmi_mode") >= 0:
                if line[:1] != "#":
                    line = "#" + line
        
                
        # append all the lines to an array. so it's easier to write it late back to the file
        #print line
        array.append(line)

try:
    with open("/boot/config.txt", "w") as outfile:
        for item in array:
            outfile.write("%s" % item)
    # all is running fine
    print "0"
except IOError:
    # an error occured
    print "999"
