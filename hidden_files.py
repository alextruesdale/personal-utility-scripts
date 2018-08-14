#!/usr/bin/env python3
import os
import sys

val = str(sys.argv[1])

def show_hide_hidden_files(val):
	os.system("defaults write com.apple.finder AppleShowAllFiles {}".format(val))

	if val in ('TRUE','true', 'True'):
		print('Hidden files are now visible... killing finder')
	elif val in ('FALSE', 'false', 'False'):
		print('Hidden files are now hidden... killing finder')

	os.system("killall Finder")

if __name__ == "__main__":
	show_hide_hidden_files(val)
