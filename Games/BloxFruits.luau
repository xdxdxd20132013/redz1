local a=cloneref or(function(...)return...end)

local b=delfolder or deletefolder
local c=delfile or deletefile
local d=makefolder
local e=writefile
local f=readfile

local g=setmetatable({},{
__index=function(g,h)
rawset(g,h,a(game:GetService(h)))
return rawget(g,h)
end
})

local h=g.MarketplaceService
local i=g.UserInputService
local j=g.TweenService
local k=g.HttpService
local l=g.RunService
local m=g.Players

local n=l.Heartbeat

local o=m.LocalPlayer
local p=o:GetMouse()

local q=(gethui or function()return g.CoreGui end)()

local r={
Darker={
Colors={
Background=ColorSequence.new{
ColorSequenceKeypoint.new(0.00,Color3.fromRGB(25,25,25)),
ColorSequenceKeypoint.new(0.50,Color3.fromRGB(32.5,32.5,32.5)),
ColorSequenceKeypoint.new(1.00,Color3.fromRGB(25,25,25))
},
Primary=Color3.fromRGB(88,101,242),
OnPrimary=Color3.fromRGB(61,67,135),
ScrollBar=Color3.fromRGB(1,76,105),
Stroke=Color3.fromRGB(45,45,45),

Error=Color3.fromRGB(255,102,102),
Icons=Color3.fromRGB(232,233,235),

JoinButton=Color3.fromRGB(37,128,69),
Link=Color3.fromRGB(40,150,255),

Dialog={
Background=Color3.fromRGB(28,28,28)
},
Buttons={
Holding=Color3.fromRGB(34,34,34),
Default=Color3.fromRGB(28,28,30)
},
Border={
Holding=Color3.fromRGB(60,60,60),
Default=Color3.fromRGB(38,38,38),
},
Text={
Default=Color3.fromRGB(255,255,255),
Dark=Color3.fromRGB(200,200,200),
Darker=Color3.fromRGB(175,175,175),
},
Slider={
SliderBar=Color3.fromRGB(1,76,105),
SliderNumber=Color3.fromRGB(232,233,235),
},
Dropdown={
Holder=Color3.fromRGB(30,30,30),
}
},
Icons={
Error="rbxassetid://10709752996",
Button="rbxassetid://10709791437",
Close="rbxassetid://10747384394",
TextBox="rbxassetid://15637081879",
Search="rbxassetid://10734943674",
Keybind="rbxassetid://10734982144",
Dropdown={
Open="rbxassetid://10709791523",
Close="rbxassetid://10709790948"
}
},
Font={
Normal=Enum.Font.BuilderSans,
Medium=Enum.Font.BuilderSansMedium,
Bold=Enum.Font.BuilderSansBold,
ExtraBold=Enum.Font.BuilderSansExtraBold,
SliderValue=Enum.Font.FredokaOne
},
BackgroundTransparency=0.03
}
}

for s,t in r do
t.Name=s
table.freeze(t)
end

local s={
Information={
Version="v2.0.1",
GitHubOwner="tlredz"
},
Default={
Theme="Darker",
UISize=UDim2.fromOffset(550,380),
TabSize=160
},

Themes=r,

Connections={},
Options={},
Icons={},
Tabs={}
}

s.Info=s.Information
s.Save=s.Default
local t=workspace.CurrentCamera.ViewportSize local u=function(u,v,w)table.insert(s.Connections,u[w or"Connect"](u,v))end
local v={}v.__index=v local w=function(w,x)for y in x:gmatch"[^%.]+" do w=w[y]end return w end local x=function(x,y,z,A)if not A then A=s.CurrentTheme end x[y]=w(A,if type(z)=="function"then z()else z)end local y=function(y,z,A)for B,C in A do x(z,B,C,y)end end local z=function(z,A)if d then local B=z:split"/"B[#B]=nil local C=table.concat(B,"/")if C~=""and(isfolder==nil or not isfolder(C))then d(C)end end e(z,A)end

local A=false
local B={MAX_SCALE=1.6,MIN_SCALE=0.6,TEXTBOX={PLACEHOLDER_TEXT="Input"}}
function v:add(C,D)self.Descendants[D]=C if self.IS_RENDERING then y(s.CurrentTheme,C,D)end end
function v:update()if self.IS_RENDERING and not self.UPDATED_OBJECTS then local C=s.CurrentTheme self.UPDATED_OBJECTS=true for D,E in self.Descendants do local F=typeof(E)if F=="table"then E:update()continue end y(C,E,D)end end end
function v:destroy()local C=self.Parent and table.find(self.Parent.Descendants)if C then table.remove(self.Parent.Descendants,C)end table.clear(self.Descendants)setmetatable(self,nil)end
function v:changeRendering(C)if self.IS_RENDERING~=C then self.IS_RENDERING=C self.UPDATED_OBJECTS=false end end
function v:new()local C=setmetatable({IS_RENDERING=true,UPDATED_OBJECTS=false,Descendants={},Parent=self.Descendants~=nil and self or nil},v)if self.Descendants then table.insert(self.Descendants,C)end return C end

local C=v:new()
local D,E={}do local F={}local G={}do G.ElementsTable={Corner=function(H)return E("UICorner",{CornerRadius=H or UDim.new(0,8)})end,Stroke=function(H,I)return E("UIStroke",{Color=H or Color3.fromRGB(60,60,60),Thickness=I or 1})end,Image=function(H)return E("ImageLabel",{Image=H or"",BackgroundTransparency=1,Size=UDim2.fromScale(1,1)})end,Button=function()return E("TextButton",{Text="",Size=UDim2.fromScale(1,1),AutoButtonColor=false})end,Padding=function(H,I,J,K)return E("UIPadding",{PaddingLeft=H or UDim.new(0,10),PaddingRight=I or UDim.new(0,10),PaddingTop=J or UDim.new(0,10),PaddingBottom=K or UDim.new(0,10)})end,ListLayout=function(H)return E("UIListLayout",{Padding=H or UDim.new(0,5)})end,Text=function(H)return E("TextLabel",{BackgroundTransparency=1,Text=H or""})end,Gradient=function(H)return E("UIGradient",{Color=H})end}
function G:Create(H,I,...)local J=self.ElementsTable[I]if J then local K=J(...)K.Parent=H return K end end end
local H={}function H:Childs(I)for J=1,#I do I[J].Parent=self end end
function H:Elements(I)for J,K in pairs(I)do if type(K)=="table"then D.SetProperties(G:Create(self,J),K)else G:Create(self,J,K)end end end
function H:ThemeTag(I)local J=I.OBJECTS I.OBJECTS=nil return(J or C):add(self,I)end
function D:SetProperties(I)for J,K in pairs(I)do if H[J]then H[J](self,K)else self[J]=K end end end
function D:SetValues(...)local I=self for J,K in{...}do local L=typeof(K)if L=="table"then D.SetProperties(I,K)else I[if L=="string"then"Name"else"Parent"]=K end end return I end
local I
function D:Draggable(J,K,L)local M,N,O,P local Q=K or 0.28 local R=0 local S local T=function(T)local U=T.Position-N local V R=tick()if L then V=L(O.X.Scale,O.X.Offset+U.X/J.Scale,O.Y.Scale,O.Y.Offset+U.Y/J.Scale)else V=UDim2.new(O.X.Scale,O.X.Offset+U.X/J.Scale,O.Y.Scale,O.Y.Offset+U.Y/J.Scale)end self.Position=self.Position:Lerp(V,Q)end local U=function()while I==self do if(tick()-R)>=1 then S()break end task.wait()end end
local V={[Enum.UserInputType.MouseButton1]=true,[Enum.UserInputType.Touch]=true}local W={[Enum.UserInputType.MouseMovement]=true,[Enum.UserInputType.Touch]=true}u(self.InputBegan,function(X)if A==false and I==nil and V[X.UserInputType]then N=X.Position O=self.Position I=self R=tick()A=true local Y;function S()A=false I=nil Y:Disconnect()end task.spawn(U)Y=X.Changed:Connect(function()if X.UserInputState==Enum.UserInputState.End then S()end end)end end)u(i.InputChanged,function(X)if I==self and W[X.UserInputType]then T(X)end end)end
function D:CreateNewTemplate(J)return D.CloneObject(F[self],J)end
function D.new(J,...)return D.SetValues(Instance.new(J),...)end E=D.new end
return(function(...)local G,b do local P,Z,y,I,u=setmetatable,math,table,string,tonumber local A,l,E,n,h,H=y.concat,I.sub,I.unpack,Z.max,I.char,Z.floor local Y,p,T,N,o,K,w,O,t,e,R,i,r,x,X,F=E("iiihhhiiiiihssss","\214\154>(\203\24\204\4S\2149-\16k*\19ZD\251g0\1\255\206\136\1\216\r\145\1\a\202\154;\0\0\1\0\0\1\a\0\0\0__index\6\0\0\0__call\5\0\0\0__mul\5\0\0\0__mod")local q,s,z,Q,m,f,C,W,U,B local function M()q,z,s=(Q*q)%C,(f*z)%U,(m*s)%W return H((((((q+w)+s)+O)+z)+t)/R)%i end local function S(G)local b={}for P=1,#G,2 do b[#b+1]=h(((u(l(G,P,P+1),16)-M())+i)%i)end return b end do local function Z(b,P,Z)Q,m,f,C,W,U=N,o,K,Y,p,T q,s,z=n(H(b)%Y,1),n(H(P)%p,1),n(H(Z)%T,1)return S end G=(function(G,y,I,u,l,E,n)B=P((function(G,b)return(function()u=function(G)return H((G+42)/5-23)end return{}end)(),{[x]=b(G),[r]=l,[X]=function()return y end,[F]=function()return I end}end)({{494,"F6A2F91A68726A83782F9569"},{172,"F077644A87E68F0A3B3CF5C4D8FE005F13"},{"F62BE02C057AE93E69FFC19483",146},{"FEB1E1AB2F23B4E1287F80E914F4EEF09A3B9815809E8117444E5F4DEDD6989B02BC5279EAEC827ED3F9D000",452},{"AF4BB4F54E33AD6AA77E5C37",95},{"03182D5F9C994A257ED2884E",298},{438,"074D337AAB468C9234AF3271"},{"4EC70D67310915C317E2B47A",491},{"D288DE9004183E72",180},{"14AD6D3DD67F7E0668C8A926A9E1",507},{"3C0A1B978EE92348E1C3CB",138},{439,"7D411C663450672CDEE7A2362D78E19124"},{"35BD1A153C95CD431FA21E723F",141},{136,"E8F175ED1C9E846D1570B0F586"},{"3E7C5A6379",248},{"FC177FF72E8D550C117C011571E8B2F6",200},{339,"302899F25370E61EB493A769B077"},{344,"217D5BFB76BE"},{499,"15C35EFCED8178D1"},{"2BFE44D69F8AE886",428},{"26EDE9D057C8A0CC9FBF90",402},{"8048F75E9824",469},{302,"7051D05CE819FCD91752B0BE6E7DC1117AC9546F3274D843F0A702F8"},{14,"949A7576CDD590EFA08FE863"},{111,"16F413ACA51C5CFA3A138DC1A03F3ED5"},{279,"BE31ABD4"},{396,"2D35BF5887CB363B30854F720B0E9BE6822633"},{321,"7122F600C4B15FFA0396CD9C9663"},{467,"2D5DEDEEF366299CDED8C666"},{275,"95"},{437,"AAD65C32041E7FBDACD93DF045"},{"806D0E73E7959FEB0E43C2E2",144},{318,"39056F07E144AC2D68F05D4489898FAF706E24"},{409,"608683560C20A2D2E6F395E6E4"},{"53F28B4B992CEFE26D",115},{"599C959962C81156372C4B68B26513",91},{"08EE8AC99183E8261B7033A1BAA49CE3864E1AB770D57503952A71BB54A102E2844E",170},{479,"33F0CE602CE335CC344EE1EA80"},{397,"7CF961619C282B65B0C57890FBBA"},{"982D5845561EBBFF",85},{"84C76A6B5E992781D9F59F4ED8EA7FA8A35A1EB5",446},{466,"C1255A080DCE3BE45E16F3AAFBFCC7D5CF"},{"4D86713737C9B5DABD5FE40E",63},{475,"B3B7BB4DCFE6DB905F"},{"85A342A7915C5948",232},{"54730919173B0D992E207326",294},{357,"540D550BEBBB1EE4BABD501CEF8C33BCC6BB1F8A3DFE"},{"43236FC17538DBE9FDD4EA240E63",310},{114,"2CEE5AA05D14"},{"9E999E351420AEC220E363344B423D",68},{145,"32438CE56E40CCA99044232202"},{211,"8AF947C00BD74659C5"},{152,"831D491857"},{"8D1D24286A3732B02CD6F2BF",43},{391,"A953164D5D7C0A"},{229,"57A526427833734A2EF33CF6"},{363,"BD6CF13D43DED0"},{"69343845D375",147},{"53FF4817472C43467A2C1989705F64EECB227FCFAC6DDB137B81EFC5B46060108BE959774CC7D563",102},{"B8CCEC32",52},{477,"A7D2FC73781A2991EE6939A8AB6E"},{"7310AFD6A775",45},{"B894ACE5DFBA5E762E",39},{243,"6BFB49B578B33D9CBBE514F2395C0FEBEB5B35"},{"C86FE91A26471A96778C9318",30},{"98DD88224D8BCCAE21D0353F30F0A9EE78AD47242633495978",392},{"BC1F314D774D3741D382",331},{"8D1941",455},{"D11E93F590460AFF68BBE058DE1C5B",121},{369,"AAB49C4D4DA3184F389AB3924C9F"},{328,"AD9ADF35566CBE840FEEE9"},{129,"70D5BF3D595861ACA79E3651"},{"571D6128583A",160},{"798787984B611F3329E7B0",297},{74,"723DE3EF9EC90573C88FAF75BB07E5"},{"A114289C059D2B246BD773DFAC481E22ED74D8821234EFF869CE71AC",337},{191,"A45A8A2F0A68A3684454"},{"EF21",408},{137,"E594714ABF"},{360,"F56C355BA16483E590BAFC5BAF9E28"},{"C6D47F2D2EB03C756C0A05184128",98},{"53A7",92},{263,"E5B88C6F2957129470868A44"},{394,"FA944B25"},{472,"E5E3829DD4A84B76C00D"},{23,"C11B1E641C4DDAFF1C3BFB7078"},{383,"A6B6349DD81C27007A9D6355BC"},{345,"9DE788C4331A83C03198F131"},{"022618AB6848FB5518C741",336},{"95A0AE8288DB615B",495},{"BCCC98AEAC26A2661A183F18757ABDE677DEB80C",235},{25,"D27F0E092A6562C7748161EA559AE46CB9CA830208"},{"EA4D4F102A991B86498746AAEAFD6946E1FD797CB7AA",10},{"AB9B997443425492B4",265},{278,"0F8355BC8E90EF2EABCE1693D698"},{484,"FDB3045560869C08A53C2A4B3352D09C4628B75963907A81C0916336DE02"},{488,"C3"},{464,"D06B52904654DA1D7CEF164843E5"},{450,"2198F81DDACB7FD15C4B85B50206D9"},{77,"DA7161FC6B0B8EDE85DD2A8EC930866FB18805DCEA"},{26,"02095ED9FFEBE6A0CA"},{78,"CD6194D32B21FAE5C978F61BCBB320AC20A749C1FD"},{"392BC68343F4561614EBA1AB3A51464B8774734618ACE0",338},{"03F1D562D27D452DC367B8B8",447},{"7D4B0FADB3274C2578EFC538DDD8",69},{"F6A795B0F80D1C9FBC8FC540D2FF",273},{"24CCAFED736A69E9FEE40A64F233",215},{"22D19F6651AD40CA17EB",308},{168,"F0E795CE0DCB30E91FDD3B4DD3"},{413,"FF64AABCA96C4A078927C2C88F"},{139,"BCFDE7A94363879797E89AF8DBF5C437"},{76,"0F6D9DEDEEFBE9AE1D7092718D2EEBB1"},{120,"0B82B2D6D712A717DE0A9E623E"},{175,"E728D9"},{"218396177C93F4549C3DB09C363C06",430},{378,"D3F1C6124B3B239B905DD69507F6"},{449,"D157B14FB2696293D3D3F3C224"},{"3D65C3E3770462175FEE3821",49},{384,"CA88567BAD8D084D9B896DF981F0"},{365,"E28515D49D457C2FB78D1397092D6EAEAEDAAB99694D7D"},{"4D1B55369E5F1A381A4EF757",379},{"DE4B323100A0C7ECCB",286},{"331AC619DD1988241B",260},{"23698AFCE62B2D9F99B6",284},{207,"37F020D25FEB5D143D848B054E"},{332,"347CFACE3352B81F"},{66,"35334026CC690420980BBD0B05"},{"05FA040FCBCB331F0B2DDB1D",177},{105,"1CB6B92D33584C2C08C7F90F6BD6914029BA"},{"4ED1",325},{498,"E499884EDB3D9CAA6C6D0E0BC14FE34CBECC8E9EA48A253EF1136E3FC70B9285BF823ADE4D6A3CDA5F"},{"E8C1A720A77AAD44796F1DEF3DCB",24},{"84453A824E594862DEEAD1176462D1",435},{"00AA85660B07A194E0AE9387E9",70},{"69281045",411},{"66F89F0E7D8A8F5F55E8CBB6EE",400},{"0D0EE0187361FBB5917409256EDE9565ACEEDE5CB60AABC2D3",112},{"226D3AD00CEBAA3C058A826A5E",190},{"798DA3A9EC369BC783A5913DBA08AEB3450D121E",493},{56,"38D18B929A"},{"44EDBBA1F5A3F8F1567A8915",7},{"67CA708AD4D474594C6815",448},{"4966A5F97C8C1E95F0411A",349},{"3703FB0946CC8F10D797F995",196},{223,"5DA9E81643906F7855E1526682"},{390,"0409A35C2DE0D6920E1C21570BBF"},{"2CE990AE6AC54C31F0F23EDEB8",5},{506,"2CC808918EA7DEC71307FF79603ED7E30FB4339017"},{"0D13E6F3E09E17DC36B5DF031C9A",84},{474,"78626F35AF7288786CDE73C24C"},{221,"4F1ABAA37C4C83AE5BECC17840C72F9BA8"},{"7338193231514EB45A4F4527",88},{"72B2D987B2",150},{"3E44C2D513",269},{"40B67686B92EA62D0B490C",86},{"59B7B87B320BD55067467B77C0",106},{"6FB5B0873BCB092FAA5E871D6CF9A6",29},{511,"47355C409D59C3ADF5ED"},{"66C74734CED10B3E8E4499",47},{"A44295BAA108ED",4},{406,"890ABD72890309D67675DBD949"},{169,"5B98BB8EF3AAC2BA8C1C0DD7"},{127,"59AB3AB4DAFA62D8AC7C7B1E0887879342CC0BED71AB"},{38,"235B284C646054BABD78E1FC59B7C5347DD6E8"},{157,"355D7E7658257D1E64E17EEDB38801879B11"},{254,"879458F30C56B38BD878C30795"},{306,"37259614293B9758"},{"4B852D133A",355},{367 / B60A65589B6C362A3DA0},{470 / BABE9F0B45A729E7D8682CF029CA},{126 / A9A9F760E991BA7C81892E15DF08},{F99B0B535BF055F37496A556 ,735},{196D0EED699EAFA0B9B82BD7F9C0,420},{651,"17ABE9"},{717,"17FB3F667F86"},{987,"8B45FA8F284043CE1A4EB4A12F"},{380,"0691A220C8AE121018F8FD9B44E0B6221BE2"},{13,"D77C8533AD"},{"AACEDE52AC6BF6C4",312},{227,"F27B058EF62F9CDB26F12F48"},{1017,"83FA71F43392414445"},{"519E5099E97A",998},{"B067CA0923171A57E77B4CBF",799},{707,"546837B2FDEF0A0C24353791"},{1023,"639E2846BF53A6B7"},{572,"C6D180643F"},{"AB34016E",638},{974,"5C337BB9F9F52269410CF2AF"},{862,"4866722D8F37B3A4D39E65A0"},{826,"3C71D618E0A68475DCC7D8E1"},{20D470FEF737E5,884},{34BB244441B06AF3017E0AE806F7,514},{6E2D63EFA19AD3D8,568},{B779F852796F4671070A,1012},{551,"2312DDA5FB649D56D13808F9D148EE3B3F"},{656,"0A3144DC"},{643,"428101B9E5BCBEA3628E2A3592793FD9"},{"3D9B343DB7B0531A221AAEC8A804",718},{3,"722961ED114DD1A3418F520FF4"},{598,"EC7163B8EBCA2C04C939BBA990"},{"E8",178},{83DBA7F5BBFD9DC3D4,984},{2C834CB0963555681A6D78127B,81},{708,"B07A806DFA90075D9D3122EB83FB"},{"665AB1",687},{615,"B009E21B0703AA74DFC84F99"},{"82AF89C838DF460B5AA39EB1",604},{597,"CF3EE0FAC4F7A73F59209E600D"},{"015F01B9F43E0F4E4EA9DA5C",59},{50CD15F6AE2959748B1BC534",165},{362,"817444E014777F4F69074943F44B"},{93DAD8203A38F55E0292C1,901},{812,"7A806A42767D09202C7BC89CBE8BC2F2D876"},{997,"9AA8A6F5988FDC239A0E044E47D8"},{33FE5946A47F851AEE0F3CFD80",58},{A5A13FEB
,114},{431,"E1AB2F23B4E1287F80E914F4EEF09A3B9815809E8117444E5F4DEDD6989B02BC5279EAEC827ED3F9D000"}})local V,u=B,y local m=1 local function d()local g=V[m]if not g then return end m=m+1 local P=g[1]local n=g[2]if type(P)=="number" then return Z(P,n,g[3]or 0)else return n end end local J=d()while J do if type(J)=="table" then for g=1,#J do local P=J[g]u[P[1]]=P[2]end else table.insert(u,J)end J=d()end end b=G()end local P=G local y=b local I=y.Tabs local u=y.Options local l=y.Icons local E=y.Connections local n=y.Connections local h=y.Connections local H=y.Connections local Y=y.Connections local p=y.Connections local T=y.Connections local N=y.Connections local o=y.Connections local K=y.Connections local w=y.Connections local O=y.Connections local t=y.Connections local e=y.Connections local R=y.Connections local i=y.Connections local r=y.Connections local x=y.Connections local X=y.Connections local F=y.Connections local q=y.Connections local s=y.Connections local z=y.Connections local Q=y.Connections local m=y.Connections local f=y.Connections local C=y.Connections local W=y.Connections local U=y.Connections local B=y.Connections return P
