echomsg "Loading UI ..."
if filereadable($MYLOOKFILE)
  echomsg "Loading alternative look & feel ..."
  source $MYLOOKFILE
else
  echomsg "Loading default UI look & feel ..."
  source ui/default.vim
endif
