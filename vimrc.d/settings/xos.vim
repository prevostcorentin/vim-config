if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=utf-8,latin1
end

if has("win32")
  set fileformats=dos,unix
else
  set fileformats=unix
end

