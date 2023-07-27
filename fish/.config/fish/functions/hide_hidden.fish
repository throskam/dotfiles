function hide_hidden
	defaults write com.apple.Finder AppleShowAllFiles NO; and killall Finder
end
