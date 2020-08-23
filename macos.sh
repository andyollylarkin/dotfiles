#!/bin/zsh

# Disable create .DS_Store and e.g. folders on removable media
defaults write com.apple.desktopservices DSDontWriteNetworkStores false

# Automatically hide Dock
defaults write com.apple.dock autohide -bool true

# Save screenshot to desktop
defaults write com.apple.screencapture location -string “$HOME/Desktop”

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string “png”

# notifications(){
#     print "\033[41mDisable or enable notifications?\033[49m"
#     read $REPLY
#     case "$REPLY" in
#         disable)
#             launchctl load -w ~/Library/Preferences/ByHost/com.apple.notificationcenterui.669AF6AE-81B9-5D32-98DB-CB6F170725D3.plist
#             killall NotificationCenter;
#             ;;
#         enable)
#             launchctl load -w ~/Library/Preferences/ByHost/com.apple.notificationcenterui.669AF6AE-81B9-5D32-98DB-CB6F170725D3.plist
#             killall NotificationCenter;
#             ;;
#         *)
#             echo "Usage:\ndisable - for disable notifications\nenable - for enable notifications\033[49m";
#             ;;
#     esac
# }
# notifications