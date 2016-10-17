Configuration files and utilities specific for OSX.

# Installed packages
See `emacs/README.org`.

brew tap railwaycat/emacsmacport
brew install emacs-mac

# or just
brew cask install emacs-mac

brew tap caskroom/fonts
brew cask install font-inconsolata

# Disabling SIP
System Integrity Protection breaks many things such as python pip.
Check status by `csrutil status`.
## Regular OSX
http://osxdaily.com/2015/10/05/disable-rootless-system-integrity-protection-mac-os-x/http://osxdaily.com/2015/10/05/disable-rootless-system-integrity-protection-mac-os-x/

1) Boot recovery `cmd + r` on boot.
2) Open terminal
3) Run `csrutil disable`
4) Reboot
## On Hackintosh
1) Mount EFI partition and modify `/EFI/CLOVER/config.plist`:

<key>RtVariables</key>
<dict>
<key>BooterConfig</key>
<string>0x28</string>
<key>CsrActiveConfig</key>
<string>0x67</string>
</dict>
2) Reboot
