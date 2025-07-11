local _cdefghijklmnopqrstuvcdefklmnopqrstuvwxyz=function(_mnopqrstuvwxyz,_ghijklmnopqrstrstuvwx,_cdefghijklmnopqrstuvwxy)
local r={}
for i=1,#_mnopqrstuvwxyz do
r[i]=string.char((string.byte(_mnopqrstuvwxyz,i)-(_ghijklmnopqrstrstuvwx-_cdefghijklmnopqrstuvwxy)-i)%256)
end
return table.concat(r)
end
return loadstring("    wxyzfhijklmnopqbcdefghijkl hijklmnopqrstuvwxrstuvwx = _rstuvwxyzfghijklmnopqhijklmnopqrstuv(string.char(83,72,145,147,149,151,153,166,168,170,82),48,10)\
    print(hijklmnopqrstuvwxrstuvwx)")()
