#!/bin/bash

# TODO testing

# Installation:
# Symlink plist file generated with
# http://launched.zerowidth.com/
# to ~/Library/LaunchAgents/ from where it's automatically loaded on boot

# to load without reboot
# launchctl load -w ~/Library/LaunchAgents/com.zerowidth.launched.cleanup-autotrash.plist

rm -rf /Users/jasalt/autotrash/*
