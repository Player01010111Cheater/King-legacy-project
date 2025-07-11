local _xljvkw=function(_pua,_vgi,_bvw,_yqh)
local c={'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9',' ','!','"','#','$','%','&','\'','(',')','*','+',',','-','.','/',':',';','<','=','>','?','@','[','\\',']','^','_','`','{','|','}','~'}
local r={}
for i=1,#_pua do
r[i]=c[(_pua[i]-(_vgi-_bvw)-i-1)%_yqh+1]
end
return table.concat(r)
end
return loadstring("    ynbzxy mukefl = _mvlj({85,85,94,95,10,8,63,52,2,9,2,8,2,4,60},94,19,95)\
    print(mukefl)")()
