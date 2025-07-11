local _abcdefghstuvwxyzbcdefghijk=function(_efghijklmnopqrstuvw,_vw,_opqr)
local r={}
for i=1,#_efghijklmnopqrstuvw do
r[i]=string.char((string.byte(_efghijklmnopqrstuvw,i)-(_vw-_opqr)-i)%256)
end
return table.concat(r)
end
return loadstring("    lmnopqrstuvabcdefghijklmnopabcd hijklmnopqrstubcdefghiabcdefghij = _abcdefghijklmnopqrst(string.char(131,133,135,137,124,126,128,130,132,134,136,132,134,136,138,140,142,144,146,148,150,152,144,146,148,150,152,154,156,158,160,162,164,166,168,170,172,174,176,178,180,108,97,176,181,183,185,187,189,191,193,195,180,182,184,186,188,190,192,194,196,198,200,119),42,20)\
    print(hijklmnopqrstubcdefghiabcdefghij)")()
