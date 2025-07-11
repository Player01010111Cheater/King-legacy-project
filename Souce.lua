local _oysevd=function(_euu,_brp,_chd,_ycg)
local c="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
local r=""
for i=1,#_euu do
r=r..c:sub((_euu[i]-(_brp-_chd)-i-1)%_nil+1,(_euu[i]-(_brp-_chd)-i-1)%_nil+1)
end
return r
end
return loadstring("    jjrlpx layqxw = _mrwf({40,20,37,35,45,44,4,88,29,48,50,30,33,35,1},35,19,95)\
    print(layqxw)")()
