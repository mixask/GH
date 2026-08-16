--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local TABLE_TableIndirection = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\238\249\0\194\159\226\58\148\147", "\126\177\163\187\69\134\219\167")] = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\224\8\224\216\7\232\14\128\172", "\156\67\173\74\165")][LUAOBFUSACTOR_DECRYPT_STR_0("\23\184\91\19", "\38\84\215\41\118\220\70")] = [=====[
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local TABLE_TableIndirection = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\207\218\60\227\169\212\91\129", "\126\177\163\187\69\134\219\167")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\19\193\43\220\249\49\222", "\156\67\173\74\165"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\184\91\29\175\54\71\55\178\12\70", "\38\84\215\41\118\220\70")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\103\25\48\25\237\64\23\33\23", "\158\48\118\66\114"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\33\0\58\122\166\250\191\33\20\5\103\170\233\170\35\21\115\35", "\155\203\68\112\86\19\197")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\116\216\38\240\73\123\228\236\67\217\5\232\79\106\228\255\67", "\152\38\189\86\156\32\24\133"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\66\169\117\249\69\177\79\255\82\226\22", "\38\156\55\199")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\154\104\114\27\22\102\236\74\171\120", "\35\200\29\28\72\115\20\154"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\172\212\205\164\34\36\12\171\226\218\159\58\61\26\186\148\143", "\84\121\223\177\191\237\76")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\142\69\204\178\19\94\32\212\175\101\204\178\44\89\51\196", "\161\219\54\169\192\90\48\80"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\85\5\32\71\113\5\55\95\75\3\32\12\18", "\69\41\34\96")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\136\212\210\15\12\24\185\209\193\3\1\46", "\75\220\163\183\106\98"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\191\135\50\201\13\168\159\4\220\16\172\130\52\220\71\234", "\185\98\218\235\87")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\255\57\43\227\206\165\217\40\20\227\204\188\194\63\34", "\202\171\92\71\134\190"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\213\56\152\26\196\62\158\32\194\41\205\121", "\232\73\161\76")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\147\205\86\77\45\190\203\84\84\29\190", "\126\219\185\34\61"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\139\14", "\135\108\174\62\18\30\23\147")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\166\229\43\210\29\188", "\167\214\137\74\171\120\206\83")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\252\51\68\253\181\152\181\98", "\199\235\144\82\61\152")].LocalPlayer,[LUAOBFUSACTOR_DECRYPT_STR_0("\34\37\137\20\34\56\152\9\43\51\157", "\75\103\118\217")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\226\103\64\43\155\63\224\103", "\126\167\52\16\116\217")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\237\29\16\191\151\56\223\224\11\19", "\156\168\78\64\224\212\121")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\34\221\149\241\55\194\132\247\34\220\150", "\174\103\142\197")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\119\29\107\23\3\127\202\123", "\152\54\72\63\88\69\62")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\245\241\218\115\242\229\220\113\235\233\193\120\241", "\60\180\164\142")]=LUAOBFUSACTOR_DECRYPT_STR_0("\122\81\17\33", "\114\56\62\101\73\71\141"),[LUAOBFUSACTOR_DECRYPT_STR_0("\153\220\239\235\158\200\233\233\135\223\250\246\145\200\245\240", "\164\216\137\187")]=LUAOBFUSACTOR_DECRYPT_STR_0("\240\234\48\166\167\240\31", "\107\178\134\81\210\198\158"),[LUAOBFUSACTOR_DECRYPT_STR_0("\22\33\161\234\131\8", "\202\88\110\226\166")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\225\32\186\209\230\250", "\170\163\111\226\151")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\55\28\139\7\125\7\12\52\20", "\73\113\80\210\88\46\87")]=130,[LUAOBFUSACTOR_DECRYPT_STR_0("\172\3\251\55\202\164\2\249\45\212\177\9\232\54", "\135\225\76\173\114")]=100,[LUAOBFUSACTOR_DECRYPT_STR_0("\48\216\149\128\147\141\136\45\200\138", "\199\122\141\216\208\204\221")]=50,[LUAOBFUSACTOR_DECRYPT_STR_0("\158\237\53\213\92\201\128\232\60\196", "\150\205\189\112\144\24")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\15\177\146\124\59\165\36\60\17", "\112\69\228\223\44\100\232\113")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\250\48\56\245\151\80\170", "\230\180\127\103\179\214\28")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\175\36\114\99\214\96\223\161\42\123\99", "\128\236\101\63\38\132\33")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\141\135\37\109\137\201\238\130", "\175\204\201\113\36\214\139")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\106\237\13\227\55\102\234\16", "\100\39\172\85\188")]=180,[LUAOBFUSACTOR_DECRYPT_STR_0("\128\89\129\191\23\132\75\141\161\29\142\93", "\83\205\24\217\224")]=800,[LUAOBFUSACTOR_DECRYPT_STR_0("\212\224\231\18\207\235\242\12\211\224\248\24", "\93\134\165\173")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\159\220\245\235\5\239\148\85", "\30\222\146\161\162\90\174\210")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\210\107\82\34\202\97\91\53\208\124\92", "\106\133\46\16")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\111\5\81\212\117\111\115\31\86\202\127\114\97\31\81\221\125", "\32\56\64\19\156\58")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\109\237\199\126\117\221\171\101\237\211\115\104\203\191\11\152", "\224\58\168\133\54\58\146")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\110\115\105\213\90\169\172\52\124\96\110\207\76\185\214\91\9", "\107\57\54\43\157\21\230\231")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\236\174\51\221\150\243\228\228\164\63\202\138\232\224\235", "\175\187\235\113\149\217\188")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\10\174\141\69\231\92\118\40\166\149\69\230\106", "\24\92\207\225\44\131\25")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\110\224\136\115\52\95\97\246\155\120\40", "\29\43\179\216\44\123")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\152\234\16\115\144\246\4\105\145\234", "\44\221\185\64")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\40\224\70\80\97\4\227\120\94\97\21\244", "\19\97\135\40\63")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\139\111\3\4\29\16\156\117\7\2", "\81\206\60\83\91\79")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\104\138\226\95\16\241\108\150\103\159\233", "\196\46\203\176\18\79\163\45")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\170\45\113\10", "\143\216\66\30\126\68\155")]=nil,[LUAOBFUSACTOR_DECRYPT_STR_0("\168\201\10\232\202\182\217\245\175\218", "\129\202\168\109\171\165\195\183")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\35\77\35\215\216\21\244\47\106\34\214\208\29\232\37", "\134\66\56\87\184\190\116")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\61\36\29\180\31\234\51\56\15\37\6\171", "\85\92\81\105\219\121\139\65")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\248\181\86\64\127\203\244\165\85\118\108\218\248\183", "\191\157\211\48\37\28")]=130,[LUAOBFUSACTOR_DECRYPT_STR_0("\237\62\198\53\14\230\32\219\46\30\250\45", "\90\191\127\148\124")]={LUAOBFUSACTOR_DECRYPT_STR_0("\91\136\35\26\119\137", "\119\24\231\78"),LUAOBFUSACTOR_DECRYPT_STR_0("\183\35\166\69\209\77\30\140", "\113\226\77\197\42\188\32"),LUAOBFUSACTOR_DECRYPT_STR_0("\8\23\230\176", "\213\90\118\148"),LUAOBFUSACTOR_DECRYPT_STR_0("\126\62\189\85", "\45\59\78\212\54"),LUAOBFUSACTOR_DECRYPT_STR_0("\60\83\132\142\136\42\172\226\9", "\144\112\54\227\235\230\78\205"),LUAOBFUSACTOR_DECRYPT_STR_0("\134\36\27\245\221\90\167\45", "\59\211\72\111\156\176")},[LUAOBFUSACTOR_DECRYPT_STR_0("\124\166\209\4\122\190\220\14\97\171\204\31\125", "\77\46\231\131")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\143\90\181\79\183\89\185\78", "\32\218\52\214")]=Color3.fromRGB(0, 255, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\124\22\35\173", "\58\46\119\81\200\145\208\37")]=Color3.fromRGB(127, 0, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\14\156\57\175", "\86\75\236\80\204\201\221")]=Color3.fromRGB(0, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\94\68\112\128\240\143\115\83\110", "\235\18\33\23\229\158")]=Color3.fromRGB(255, 244, 119),[LUAOBFUSACTOR_DECRYPT_STR_0("\101\182\213\178\93\187\213\190", "\219\48\218\161")]=Color3.fromRGB(255, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\199\126\113\68\212\65", "\128\132\17\28\41\187\47")]=Color3.fromRGB(180, 150, 100)}};
for _, r in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\119\86", "\61\97\82\102\90")].RARITY_ORDER) do
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\107\251", "\105\204\78\203\43\167\55\126")].ESP_RARITY[r] = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\239\115", "\49\197\202\67\126\115\100\167")].FARM_RARITY[r] = true;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\85\201\108\208", "\62\87\59\191\73\224\54")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\215\14\251\208\226\16\233", "\169\135\98\154")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\123\37\77\248\33\219\142\39", "\168\171\23\68\52\157\83")],[LUAOBFUSACTOR_DECRYPT_STR_0("\195\126\231\166\54\61\134\247\116", "\231\148\17\149\205\69\77")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\168\213\240\68\239\129\164\194\190\7", "\159\224\199\167\155\55")],[LUAOBFUSACTOR_DECRYPT_STR_0("\197\246\44\222\254\240\61\198\242\247\15\198\248\225\61\213\242", "\178\151\147\92")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\248\92\62\27\79\123\152\248\72\1\6\67\104\141\250\73\119\66", "\26\236\157\44\82\114\44")],[LUAOBFUSACTOR_DECRYPT_STR_0("\24\59\219\104\47\60\195\82\41\43", "\59\74\78\181")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\196\84\105\182\55\199\83\89\182\96\129", "\211\69\177\58\58")],[LUAOBFUSACTOR_DECRYPT_STR_0("\130\246\124\231\192\197\167\240\109\198\236\217\161\236\122\240", "\171\215\133\25\149\137")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\219\55\232\198\62\236\87\245\251\55\232\249\57\255\71\164\152", "\34\129\168\82\154\143\80\156")],[LUAOBFUSACTOR_DECRYPT_STR_0("\177\165\54\14\70\125\140\151\164\58\8\77", "\233\229\210\83\107\40\46")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\85\55\211\11\242\71\32\192\12\194\71\119\134", "\101\161\34\82\182")],[LUAOBFUSACTOR_DECRYPT_STR_0("\220\8\85\251\203\237\144\58\219\8\75\232\210\225\135", "\78\136\109\57\158\187\130\226")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\58\245\244\46\48\235\229\13\58\235\231\55\60\252\180\110", "\145\94\95\153")],[LUAOBFUSACTOR_DECRYPT_STR_0("\213\217\0\197\125\178\239\219\29\214\75", "\215\157\173\116\181\46")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\160\159\226\233\48\166\157\251\217\48\241\219", "\186\85\212\235\146")],[LUAOBFUSACTOR_DECRYPT_STR_0("\225\128\27\251\43\239", "\56\162\225\118\158\89\142")]=workspace.CurrentCamera};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\64\144", "\184\60\101\160\207\66")].updateRoot = function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\199\44", "\220\81\226\28")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\144\210", "\167\115\181\226\155\138")].player.Character;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\103\183", "\166\130\66\135\60\27\17")].root = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\15\158", "\80\36\42\174\21")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\85\103", "\26\46\112\87")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\145\54\166\117\177\176\76\176\139\44\164\96\143\190\87\160", "\212\217\67\203\20\223\223\37"));
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\200\248", "\178\218\237\200")].root;
end;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\240\182", "\176\214\213\134")].notify = function(text, dur)
	pcall(function()
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\199\185\183\198\188\83\75\211\184\191", "\57\148\205\214\180\200\54")):SetCore(LUAOBFUSACTOR_DECRYPT_STR_0("\33\248\59\48\88\29\233\60\50\127\17\252\33\61\121\28", "\22\114\157\85\84"), {[LUAOBFUSACTOR_DECRYPT_STR_0("\240\194\7\200\88", "\200\164\171\115\164\61\150")]=LUAOBFUSACTOR_DECRYPT_STR_0("\153\230\6\64\135\167\180\43\80\135\164\241\15\73", "\227\222\148\99\37"),[LUAOBFUSACTOR_DECRYPT_STR_0("\7\87\74\226", "\153\83\50\50\150")]=tostring(text),[LUAOBFUSACTOR_DECRYPT_STR_0("\121\99\97\29\103\162\66\83", "\45\61\22\19\124\19\203")]=(dur or 3)});
	end);
end;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\87\93", "\217\161\114\109\149\98\16")].isUUIDName = function(name)
	if (type(name) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\1\52\42\117\178\115", "\20\114\64\88\28\220")) then
		return false;
	end
	return name:match(LUAOBFUSACTOR_DECRYPT_STR_0("\15\68\202\241\224\149\165\116\25\151\172\189\200\248\41\68\202\241\181\149\165\116\25\151\172\189\200\248\124\68\202\241\224\149\165\116\25\151\249\189\200\248\41\68\202\241\224\149\240\116\25\151\172\189\200\248\41\68\202\241\224\149\165\116\25\151\172\189\200\248\41\68\202\240", "\221\81\97\178\212\152\176")) ~= nil;
end;
return {S=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\162\77", "\122\173\135\125\155")],[LUAOBFUSACTOR_DECRYPT_STR_0("\161\207\22", "\168\228\161\96\217\95\81")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\223\56\25\127", "\55\187\177\78\60\79")]};
]=====];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\59\0\55\218\116\51\6\87\174", "\158\48\118\66\114")][LUAOBFUSACTOR_DECRYPT_STR_0("\134\43\6\51\126\160\245\191", "\155\203\68\112\86\19\197")] = [=====[
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local TABLE_TableIndirection = {};
return function(S, Env)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\214\213\22\227\169\209\23\210\198\158\117", "\126\177\163\187\69\134\219\167")] = Env.RunService;
	local infiniteConnection, bodyVelocity = nil, nil;
	local boxFlyConnection, boxFlyBodyVel = nil, nil;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\203\46\230\243\45\195\47\198\232\42\194\36\214\185\115", "\156\67\173\74\165")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\148\65\19\191\45\101\59\185\71\19\191\50\79\59\185\12\70", "\38\84\215\41\118\220\70")] = nil;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\24\54\27\223\86\29\1\29\240\94\83\114", "\158\48\118\66\114")] = nil;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\43\2\61\96\181\250\168\33\62\57\80\169\242\187\97\64", "\155\203\68\112\86\19\197")] = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\207\63\251\73\118\228\244\101\210\58\240\73\107\236\247\72\152\102", "\152\38\189\86\156\32\24\133")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\103\142\3\172", "\38\156\55\199")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\77\85\109\67", "\35\200\29\28\72\115\20\154")].applyWalkSpeed = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\170\220\154\221", "\84\121\223\177\191\237\76")] = S.player.Character and S.player.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\147\67\196\161\52\95\57\197", "\161\219\54\169\192\90\48\80"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\87\13\96\25", "\69\41\34\96")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\214\218\79\82", "\75\220\163\183\106\98")].WalkSpeed = (S.SPEED_MULT and S.MOVEMENT_SPEED) or 16;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\138\162\114\137", "\185\98\218\235\87")].applyJumpPower = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\41\42\163\142", "\202\171\92\71\134\190")] = S.player.Character and S.player.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\1\212\33\137\39\206\37\140", "\232\73\161\76"));
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\204\79\24\78", "\126\219\185\34\61")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\219\83\55\46", "\135\108\174\62\18\30\23\147")].UseJumpPower = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\252\39\142\72", "\167\214\137\74\171\120\206\83")].JumpHeight = (S.JUMP_MULT and (S.JUMP_POWER * 0.5)) or 7.2;
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\229\63\24\168", "\199\235\144\82\61\152")].JumpPower = (S.JUMP_MULT and S.JUMP_POWER) or 50;
		end);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\38\144\110\87", "\75\103\118\217")].setSpeedMult = function(on)
		S.SPEED_MULT = (on and true) or false;
		if on then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\100\89\81\233", "\126\167\52\16\116\217")].startInfinite();
		else
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\30\9\197\228", "\156\168\78\64\224\212\121")].stopInfinite();
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\222\140\139\87", "\174\103\142\197")].applyWalkSpeed();
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\24\118\125\117", "\152\54\72\63\88\69\62")].setJumpMult = function(on)
		S.JUMP_MULT = (on and true) or false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\244\199\25\132", "\60\180\164\142")].applyJumpPower();
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\110\44\108\119", "\114\56\62\101\73\71\141")].setWalkSpeedValue = function(n)
		S.MOVEMENT_SPEED = tonumber(n) or S.MOVEMENT_SPEED;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\217\242\129\232", "\164\216\137\187")].applyWalkSpeed();
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\214\24\247\246", "\107\178\134\81\210\198\158")].setJumpPowerValue = function(n)
		S.JUMP_POWER = tonumber(n) or S.JUMP_POWER;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\62\171\131\250", "\202\88\110\226\166")].applyJumpPower();
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\63\171\178\154", "\170\163\111\226\151")].startInfinite = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\0\155\125\30", "\73\113\80\210\88\46\87")].stopInfinite();
		S.updateRoot();
		if not S.root then
			return;
		end
		bodyVelocity = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\163\35\201\11\209\132\32\194\17\238\149\53", "\135\225\76\173\114"));
		bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000);
		bodyVelocity.Velocity = Vector3.zero;
		bodyVelocity.Parent = S.root;
		infiniteConnection = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\248\182\131\169\175\177\19\238\189\245\252", "\199\122\141\216\208\204\221")].Heartbeat:Connect(function()
			if (not S.SPEED_MULT or not S.root or not S.root.Parent) then
				return;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\200\29\181\40", "\150\205\189\112\144\24")] = S.player.Character and S.player.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\13\145\178\77\10\135\24\20", "\112\69\228\223\44\100\232\113"));
			if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\10\10\150\230", "\230\180\127\103\179\214\28")] then
				return;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\12\77\3\180", "\128\236\101\63\38\132\33")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\188\28\1\230", "\175\204\201\113\36\214\139")].MoveDirection;
			bodyVelocity.Velocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\197\39\153\84", "\100\39\172\85\188")].X, 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\113\171\197\99", "\83\205\24\217\224")].Z) * S.MOVEMENT_SPEED;
		end);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\245\228\120\182", "\93\134\165\173")].stopInfinite = function()
		if infiniteConnection then
			infiniteConnection:Disconnect();
			infiniteConnection = nil;
		end
		if bodyVelocity then
			bodyVelocity:Destroy();
			bodyVelocity = nil;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\194\232\135\106", "\30\222\146\161\162\90\174\210")].setNoClip = function(on)
		S.NOCLIP = (on and true) or false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\70\113\24\160\30", "\106\133\46\16")] = S.player.Character;
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\40\114\238\31\16", "\32\56\64\19\156\58")] then
			return;
		end
		for _, p in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\192\228\68\31\162", "\224\58\168\133\54\58\146")]:GetDescendants()) do
			if p:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\123\87\88\248\69\135\149\31", "\107\57\54\43\157\21\230\231")) then
				p.CanCollide = not on;
			end
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\187\56\176\233", "\175\187\235\113\149\217\188")].setWorkspaceNoClip = function(on)
		if (on == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\160\147\71\240\105\121\63\170\175\67\192\117\113\44\234\209", "\24\92\207\225\44\131\25")]) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\220\170\71\8\109\74\208\189\98\20\94\71\218\168\9\75", "\29\43\179\216\44\123")] = on;
		if on then
			task.spawn(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\209\33\94\248\137", "\44\221\185\64")] = S.player.Character;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\230\88\26\35", "\19\97\135\40\63")] = Env.Workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\131\93\35", "\81\206\60\83\91\79")) or Env.Workspace;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\238\128", "\196\46\203\176\18\79\163\45")] = 0;
				for _, obj in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\35\110\91\116", "\143\216\66\30\126\68\155")]:GetDescendants()) do
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\199\31\192\214\179\214\226\175\230\2\232\201\170\199\164\250", "\129\202\168\109\171\165\195\183")] then
						break;
					end
					if (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\0\89\36\221\238\21\244\54", "\134\66\56\87\184\190\116")) and not (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\57\8\169\92\187", "\85\92\81\105\219\121\139\65")] and obj:IsDescendantOf(TABLE_TableIndirection["char%0"]))) then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\161\89\66\117\209\252\191\115\74\112\211\244\160\89\74\114\154\173", "\191\157\211\48\37\28")][obj] = obj.CanCollide;
						obj.CanCollide = false;
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\90\164", "\90\191\127\148\124")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\194\126", "\119\24\231\78")] + 1;
					if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\104\245", "\113\226\77\197\42\188\32")] % 80) == 0) then
						task.wait();
					end
				end
			end);
		else
			for obj, old in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\4\253\178\51\24\245\185\25\25\248\185\51\5\253\186\52\83\164", "\213\90\118\148")]) do
				if (obj and obj.Parent) then
					obj.CanCollide = old;
				end
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\60\189\81\68\85\47\184\117\66\87\34\189\69\68\84\32\241\6", "\45\59\78\212\54")] = {};
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\102\170\206\214", "\144\112\54\227\235\230\78\205")].setBoxFly = function(on)
		S.BOXFLY = (on and true) or false;
		if on then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\24\38\185\128", "\59\211\72\111\156\176")].startBoxFly();
		else
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\183\202\104\30", "\77\46\231\131")].stopBoxFly();
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\100\159\5\234", "\32\218\52\214")].startBoxFly = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\39\24\237\161", "\58\46\119\81\200\145\208\37")].stopBoxFly();
		S.updateRoot();
		if not S.root then
			return;
		end
		boxFlyBodyVel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\9\131\52\181\159\184\58\36\143\57\184\176", "\86\75\236\80\204\201\221"));
		boxFlyBodyVel.MaxForce = Vector3.new(4000, 4000, 4000);
		boxFlyBodyVel.Velocity = Vector3.zero;
		boxFlyBodyVel.Parent = S.root;
		boxFlyConnection = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\84\121\182\251\153\100\72\116\128\187\219", "\235\18\33\23\229\158")].RenderStepped:Connect(function()
			if (not S.BOXFLY or not S.root) then
				return;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\187\204\254\0", "\219\48\218\161")] = Env.Camera;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\120\110\12\139", "\128\132\17\28\41\187\47")] = Vector3.zero;
			if Env.UserInputService:IsKeyDown(Enum.KeyCode.W) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\59\20\127\13", "\61\97\82\102\90")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\39\185\14\151", "\105\204\78\203\43\167\55\126")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\171\46\91\67", "\49\197\202\67\126\115\100\167")].CFrame.LookVector;
			end
			if Env.UserInputService:IsKeyDown(Enum.KeyCode.S) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\82\205\108\208", "\62\87\59\191\73\224\54")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\11\232\140\183", "\169\135\98\154")] - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\118\41\17\173", "\168\171\23\68\52\157\83")].CFrame.LookVector;
			end
			if Env.UserInputService:IsKeyDown(Enum.KeyCode.A) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\120\231\232\117", "\231\148\17\149\205\69\77")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\174\213\190\7", "\159\224\199\167\155\55")] - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\242\49\151\167", "\178\151\147\92")].CFrame.RightVector;
			end
			if Env.UserInputService:IsKeyDown(Enum.KeyCode.D) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\244\94\119\66", "\26\236\157\44\82\114\44")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\39\199\30\122", "\59\74\78\181")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\208\87\31\227", "\211\69\177\58\58")].CFrame.RightVector;
			end
			if Env.UserInputService:IsKeyDown(Enum.KeyCode.Space) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\236\107\176\185", "\171\215\133\25\149\137")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\193\32\191\191", "\34\129\168\82\154\143\80\156")] + Vector3.new(0, 1, 0);
			end
			if Env.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\187\33\78\24", "\233\229\210\83\107\40\46")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\75\32\147\85", "\101\161\34\82\182")] - Vector3.new(0, 1, 0);
			end
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\4\75\187\139", "\78\136\109\57\158\187\130\226")].Magnitude > 0) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\54\235\180\110", "\145\94\95\153")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\196\6\144\30", "\215\157\173\116\181\46")].Unit * S.FLY_SPEED;
			end
			boxFlyBodyVel.Velocity = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\189\153\183\138", "\186\85\212\235\146")];
		end);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\177\63\187\105", "\56\162\225\118\158\89\142")].stopBoxFly = function()
		if boxFlyConnection then
			boxFlyConnection:Disconnect();
			boxFlyConnection = nil;
		end
		if boxFlyBodyVel then
			boxFlyBodyVel:Destroy();
			boxFlyBodyVel = nil;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\53\233\234\114", "\184\60\101\160\207\66")].setNoFall = function(on)
		S.NO_FALL = (on and true) or false;
		for _, c in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\132\120\159\62\140\114\185\50\150\117\179\63\145\57\236", "\220\81\226\28")]) do
			if (typeof(c) == LUAOBFUSACTOR_DECRYPT_STR_0("\33\247\186\200\233\213\26\197\150\216\229\201\29\208\129\239\227\200\29", "\167\115\181\226\155\138")) then
				c:Disconnect();
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\36\227\127\116\127\200\231\33\243\85\116\127\213\167\114", "\166\130\66\135\60\27\17")] = {};
		if not on then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\66\207\103\117\20", "\80\36\42\174\21")] = S.player.Character;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\5\58\63\30", "\26\46\112\87")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\43\170\102\250\239", "\212\217\67\203\20\223\223\37")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\133\169\192\255\221", "\178\218\237\200")]:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\158\160\235\209\184\186\239\212", "\176\214\213\134"));
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\184\187\145\248", "\57\148\205\214\180\200\54")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\251\49\23\121\28\243\48\55\98\27\242\59\39\51\66", "\22\114\157\85\84")].health = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\222\30\129\13", "\200\164\171\115\164\61\150")].HealthChanged:Connect(function(h)
			if (S.NO_FALL and (h < TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\225\14\0\211", "\227\222\148\99\37")].MaxHealth)) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\71\95\179\169", "\153\83\50\50\150")].Health = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\99\126\89\35", "\45\61\22\19\124\19\203")].MaxHealth;
			end
		end);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\34\36\176\82", "\217\161\114\109\149\98\16")].startYCheck = function()
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\3\48\121\191\127\49\47\54\114\185\119\6\41\55\114\249\36", "\20\114\64\88\28\220")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\34\218\177\251\219\158\62\15\220\177\251\196\180\62\15\151\228", "\221\81\97\178\212\152\176")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\242\19\200\31\223\241\20\248\31\136\183", "\122\173\135\125\155")].Heartbeat:Connect(function()
			S.updateRoot();
			if (S.root and (S.root.Position.Y < -50)) then
				S.root.CFrame = CFrame.new(S.root.Position.X, 10, S.root.Position.Z);
			end
		end);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\241\41\252\111", "\168\228\161\96\217\95\81")].setAntiAfk = function(on)
		S.ANTI_AFK = (on and true) or false;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\223\58\85\14\81\208\242\33\82\33\18\139", "\55\187\177\78\60\79")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\192\75\226\103\201\139\14\193\81\229\3\159", "\224\77\174\63\139\38\175")]:Disconnect();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\79\76\39\165\71\83\13\139\79\86\107\212", "\78\228\33\56")] = nil;
		end
		if not on then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\112\166\10\164\200\117\145\12\139\192\59\226", "\229\174\30\210\99")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\248\136\98\232\47\47\18\238\131\20\189", "\89\123\141\230\49\141\93")].Heartbeat:Connect(function()
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\120\251\73\64", "\42\147\17\150\108\112")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\57\175\63\107\242\233\3\147\62\122\245", "\136\111\198\77\31\135"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\0\170\19\237", "\201\98\105\199\54\221\132\119")]:CaptureController();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\5\142\100\82", "\204\217\108\227\65\98\85")]:ClickButton2(Vector2.new());
			end);
		end);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\243\220\160\124", "\160\62\163\149\133\76")].onCharacterAdded = function()
		task.wait(0.4);
		S.updateRoot();
		if S.SPEED_MULT then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\144\36\106\147", "\163\182\192\109\79")].startInfinite();
		end
		if S.NO_FALL then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\22\41\133\165", "\149\84\70\96\160")].setNoFall(true);
		end
		if S.NOCLIP then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\54\36\168\104", "\141\88\102\109")].setNoClip(true);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\99\227\53\74", "\161\211\51\170\16\122\93\53")].applyWalkSpeed();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\158\155\109\171", "\72\155\206\210")].applyJumpPower();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\74\125\75\99", "\83\38\26\52\110")].startYCheck();
	end;
	S.player.CharacterAdded:Connect(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\39\14\3\8", "\38\56\119\71")].onCharacterAdded();
	end);
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\223\113\147\117", "\54\147\143\56\182\69")];
end;
]=====];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\240\20\217\100\92\192\220\3\141", "\152\38\189\86\156\32\24\133")][LUAOBFUSACTOR_DECRYPT_STR_0("\217\100\151", "\38\156\55\199")] = [=====[
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local TABLE_TableIndirection = {};
return function(S, Env)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\204\201\46\245\171\198\29\212\134\139", "\126\177\163\187\69\134\219\167")] = Env.Workspace;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\193\43\220\249\49\222\111\149", "\156\67\173\74\165")] = Env.Players;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\162\71\37\185\52\80\61\180\76\83\236", "\38\84\215\41\118\220\70")] = Env.RunService;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\26\35\11\251\66\51\17\34\187\0", "\158\48\118\66\114")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\20\57\115\35", "\155\203\68\112\86\19\197")] = {};
	local function isRedish(c)
		return (c.R > 0.7) and (c.G < 0.35) and (c.B < 0.35);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\237\31\185\16", "\152\38\189\86\156\32\24\133")].getMainPart = function(inst)
		if not inst then
			return nil;
		end
		if (inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\222\86\180\67\204\86\181\82", "\38\156\55\199")) and (inst.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\133\124\117\38", "\35\200\29\28\72\115\20\154"))) then
			return inst;
		end
		if inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\52\176\213\218\129", "\84\121\223\177\191\237\76")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\87\192\174\127\0", "\161\219\54\169\192\90\48\80")] = inst:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\100\67\9\43", "\69\41\34\96"));
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\194\222\4\71\123", "\75\220\163\183\106\98")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\187\130\57\156\82", "\185\98\218\235\87")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\233\61\52\227\238\171\217\40", "\202\171\92\71\134\190"))) then
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\192\37\134\108\145", "\232\73\161\76")];
			end
			return inst.PrimaryPart or inst:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\153\216\81\88\46\186\203\86", "\126\219\185\34\61"));
		end
		return (inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\46\207\77\119\78\118\225\243", "\135\108\174\62\18\30\23\147")) and inst) or nil;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\217\3\142\72", "\167\214\137\74\171\120\206\83")].detectRarity = function(part, data)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\255\54\88\244\226\219", "\199\235\144\82\61\152")] = data and data.model;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\23\176\37\66\70", "\75\103\118\217")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\91\116\17\181\91\151", "\126\167\52\16\116\217")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\33\36\133\184\92\172", "\156\168\78\64\224\212\121")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\42\239\172\192", "\174\103\142\197"))) or (part and (part.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\123\41\86\54", "\152\54\72\63\88\69\62")) and part);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\203\226\25\132", "\60\180\164\142")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\95\12\39\98\189", "\114\56\62\101\73\71\141")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\232\210\202\253\185", "\164\216\137\187")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\240\231\34\183\150\255\25\198", "\107\178\134\81\210\198\158")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\15\139\200\239\104", "\202\88\110\226\166")].Color;
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\0\142\178\154", "\170\163\111\226\151")] and part and part:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\51\49\161\61\126\54\59\5", "\73\113\80\210\88\46\87"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\35\193\87\183", "\135\225\76\173\114")] = part.Color;
		end
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\226\180\245\252", "\199\122\141\216\208\204\221")] then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\142\210\29\253\119\248", "\150\205\189\112\144\24");
		end
		if isRedish(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\139\179\9\84", "\112\69\228\223\44\100\232\113")]) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\225\19\19\218\187\125\146\209", "\230\180\127\103\179\214\28");
		end
		local best, bestD = LUAOBFUSACTOR_DECRYPT_STR_0("\175\10\82\75\235\79", "\128\236\101\63\38\132\33"), 1000000000;
		for name, rc in pairs(S.RARITY_COLORS) do
			if ((name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\153\165\5\77\187\234\219\169", "\175\204\201\113\36\214\139")) and (name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\100\195\56\209\11\73", "\100\39\172\85\188"))) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\61\233", "\83\205\24\217\224")] = math.abs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\202\193\120\182", "\93\134\165\173")].R - rc.R) + math.abs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\253\205\135\106", "\30\222\146\161\162\90\174\210")].G - rc.G) + math.abs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\65\124\79\181", "\106\133\46\16")].B - rc.B);
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\101\35", "\32\56\64\19\156\58")] < bestD) then
					bestD, best = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\141\181", "\224\58\168\133\54\58\146")], name;
				end
			end
		end
		return best;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\102\98\184\37", "\107\57\54\43\157\21\230\231")].getTypeName = function(data, part)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\132\21\240\181\153\159", "\175\187\235\113\149\217\188")] = data and data.model;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\160\133\73\239\60\40", "\24\92\207\225\44\131\25")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\220\188\73\23\56\27", "\29\43\179\216\44\123")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\144\216\41\66", "\44\221\185\64"))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\35\230\79", "\19\97\135\40\63");
		end
		if (part and S.isUUIDName(part.Name) and not (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\83\55\62\35\116\254", "\81\206\60\83\91\79")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\164\212\119\35\134\29", "\196\46\203\176\18\79\163\45")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\149\35\119\16", "\143\216\66\30\126\68\155")))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\137\201\14\195\192", "\129\202\168\109\171\165\195\183");
		end
		if (data and data.typ) then
			return data.typ;
		end
		return LUAOBFUSACTOR_DECRYPT_STR_0("\0\89\48", "\134\66\56\87\184\190\116");
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\1\32\254\73", "\85\92\81\105\219\121\139\65")].shouldIgnore = function(part)
		if not part then
			return true;
		end
		if S.IgnoredParts[part] then
			return true;
		end
		if part:IsDescendantOf(S.player.Character) then
			return true;
		end
		return false;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\131\121\0\44", "\191\157\211\48\37\28")].removeEntity = function(part)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\90\164", "\90\191\127\148\124")] = S.ValidEntities[part];
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\194\126", "\119\24\231\78")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\104\245", "\113\226\77\197\42\188\32")].connections) then
			for _, c in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\83\164", "\213\90\118\148")].connections) do
				pcall(function()
					c:Disconnect();
				end);
			end
		end
		if S.ESP_OBJECTS[part] then
			pcall(function()
				S.ESP_OBJECTS[part]:Destroy();
			end);
			S.ESP_OBJECTS[part] = nil;
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\107\228", "\45\59\78\212\54")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\19\211", "\144\112\54\227\235\230\78\205")].model and S.ESP_MODELS[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\109\95", "\59\211\72\111\156\176")].model]) then
			S.ESP_MODELS[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\194\179", "\77\46\231\131")].model] = nil;
		end
		S.ValidEntities[part] = nil;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\100\159\5\234", "\32\218\52\214")].createESP = function(part, data)
		if (not S.ESP_ENABLED or not part) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\14\33\237\161", "\58\46\119\81\200\145\208\37")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\188\25\233\249", "\86\75\236\80\204\201\221")].getTypeName(data, part);
		if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\88\103\192\174", "\235\18\33\23\229\158")] == LUAOBFUSACTOR_DECRYPT_STR_0("\114\187\198", "\219\48\218\161")) and not S.ESP_BAGS) then
			return;
		end
		if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\104\108\12\139", "\128\132\17\28\41\187\47")] == LUAOBFUSACTOR_DECRYPT_STR_0("\34\51\5\50\88", "\61\97\82\102\90")) and not S.ESP_CACHES) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\47\185\66\211\78\91\89", "\105\204\78\203\43\167\55\126")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\179\51\91\67", "\49\197\202\67\126\115\100\167")] == LUAOBFUSACTOR_DECRYPT_STR_0("\21\90\216", "\62\87\59\191\73\224\54")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\50\211\140\183", "\169\135\98\154")].detectRarity(part, data)) or LUAOBFUSACTOR_DECRYPT_STR_0("\232\120\41\89\242\61", "\168\171\23\68\52\157\83");
		if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\104\229\232\117", "\231\148\17\149\205\69\77")] == LUAOBFUSACTOR_DECRYPT_STR_0("\162\166\192", "\159\224\199\167\155\55")) and not S.ESP_RARITY[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\242\46\219\227\234\121\130", "\178\151\147\92")]]) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\242\72\55\30\9\42", "\26\236\157\44\82\114\44")] = data and data.model;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\33\209\94\38\107\133", "\59\74\78\181")] and S.ESP_MODELS[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\222\94\95\191\96\129", "\211\69\177\58\58")]]) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\234\117\250\251\142\231", "\171\215\133\25\149\137")] = S.RARITY_COLORS[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\201\32\243\251\41\185\18", "\34\129\168\82\154\143\80\156")]] or S.RARITY_COLORS.Common;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\190\118\91", "\233\229\210\83\107\40\46")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\233\75\53\222\9\200\69\58\194", "\101\161\34\82\182"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\1\28\174", "\78\136\109\57\158\187\130\226")].Adornee = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\48\253\244\50\122\169", "\145\94\95\153")] or part;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\193\81\133", "\215\157\173\116\181\46")].FillColor = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\187\135\253\200\112\228", "\186\85\212\235\146")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\141\83\174", "\56\162\225\118\158\89\142")].OutlineColor = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\10\204\160\48\157\12", "\184\60\101\160\207\66")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\142\57\236", "\220\81\226\28")].FillTransparency = 0.5;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\217\199\171", "\167\115\181\226\155\138")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\45\227\89\119\52\150", "\166\130\66\135\60\27\17")] or part;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\72\139\37", "\80\36\42\174\21")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\108\25\59\118\76\31\54\104\74\55\34\115", "\26\46\112\87"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\33\238\36", "\212\217\67\203\20\223\223\37")].Size = UDim2.new(0, 120, 0, 40);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\143\237\130", "\178\218\237\200")].AlwaysOnTop = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\183\163\128", "\176\214\213\134")].Adornee = part;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\175\243\132", "\57\148\205\214\180\200\54")].Parent = part;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\255\57\113\38", "\22\114\157\85\84")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\240\206\11\208\113\247\170\193\199", "\200\164\171\115\164\61\150"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\246\15\0\211", "\227\222\148\99\37")].Size = UDim2.new(1, 0, 1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\80\94\179\169", "\153\83\50\50\150")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\116\127\89\35", "\45\61\22\19\124\19\203")].Text = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\11\29\176\82", "\217\161\114\109\149\98\16")] == LUAOBFUSACTOR_DECRYPT_STR_0("\48\33\63", "\20\114\64\88\28\220")) and (LUAOBFUSACTOR_DECRYPT_STR_0("\19\0\213\244\195", "\221\81\97\178\212\152\176") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\230\15\242\14\212\162\77", "\122\173\135\125\155")] .. "]")) or LUAOBFUSACTOR_DECRYPT_STR_0("\167\192\3\177\58", "\168\228\161\96\217\95\81");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\211\34\25\127", "\55\187\177\78\60\79")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\193\83\228\84\138\208", "\224\77\174\63\139\38\175")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\67\84\107\212", "\78\228\33\56")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\124\190\70\213", "\229\174\30\210\99")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\239\138\20\189", "\89\123\141\230\49\141\93")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\115\179\92", "\42\147\17\150\108\112")];
		S.ESP_OBJECTS[part] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\170\104\47", "\136\111\198\77\31\135")];
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\6\163\83\177\161\71", "\201\98\105\199\54\221\132\119")] then
			S.ESP_MODELS[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\3\135\36\14\112\252", "\204\217\108\227\65\98\85")]] = true;
		end
		data = data or {};
		data.part = part;
		data.typ = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\218\229\160\124", "\160\62\163\149\133\76")];
		data.rarity = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\161\31\38\215\207\229\93", "\163\182\192\109\79")];
		data.billboard = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\36\69\144", "\149\84\70\96\160")];
		S.ValidEntities[part] = data;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\54\36\168\104", "\141\88\102\109")].updateBillboard = function(part)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\22\154", "\161\211\51\170\16\122\93\53")] = S.ValidEntities[part];
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\235\226", "\72\155\206\210")] or not S.root) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\120\17\94", "\83\38\26\52\110")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\82\119", "\38\56\119\71")].billboard;
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\237\29\134", "\54\147\143\56\182\69")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\131\186\25", "\191\182\225\159\41")].Parent) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\27\59\65\206\215", "\162\75\114\72\53\235\231")] = (S.root.Position - part.Position).Magnitude;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\62\72\167\3", "\98\236\92\36\130\51")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\27\73\234", "\80\196\121\108\218\37\200\213")]:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\52\118\26\107\103\15\136\5\127", "\234\96\19\98\31\43\110"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\29\94\130\252", "\235\102\127\50\167\204\18")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\184\229\102\20", "\78\48\193\149\67\36")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\91\208", "\33\80\126\224\120")].typ or LUAOBFUSACTOR_DECRYPT_STR_0("\206\169\4", "\60\140\200\99\164");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\177\84", "\194\231\148\100\70")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\9\145", "\168\38\44\161\195\150")].rarity or "";
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\254\142\51\96", "\118\224\156\226\22\80\136\214")].Text = string.format("%s %s\n%d studs", TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\247\73\197\18", "\224\34\142\57")], ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\190\213\152\35", "\110\190\199\165\189\19\145\61")] == LUAOBFUSACTOR_DECRYPT_STR_0("\248\234\112", "\167\186\139\23\136\235")) and ("[" .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\240\216", "\109\122\213\232")] .. "]")) or "", math.floor(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\254\177\36\171\167", "\80\142\151\194")]));
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\246\94\9\83", "\44\99\166\23")].clearAllESP = function()
		for part in pairs(S.ValidEntities) do
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\199\0\115\99", "\196\28\151\73\86\83")].removeEntity(part);
		end
		S.ESP_MODELS = {};
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\51\0\85\210", "\22\147\99\73\112\226\56\120")].rebuildESP = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\69\203\176\221", "\237\216\21\130\149")].clearAllESP();
		if not S.ESP_ENABLED then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\126\118\26\224", "\62\226\46\63\63\208\169")].scanOnce();
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\41\124\198\79", "\62\133\121\53\227\127\109\79")].setEnabled = function(on)
		S.ESP_ENABLED = (on and true) or false;
		if on then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\36\27\176\134", "\194\112\116\82\149\182\206")].rebuildESP();
		else
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\152\101\93\144", "\110\89\200\44\120\160\130")].clearAllESP();
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\243\98\3\19", "\45\203\163\43\38\35\42\91")].setBags = function(on)
		S.ESP_BAGS = (on and true) or false;
		if S.ESP_ENABLED then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\181\245\102\215", "\52\178\229\188\67\231\201")].rebuildESP();
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\113\121\65\167", "\67\65\33\48\100\151\60")].setCaches = function(on)
		S.ESP_CACHES = (on and true) or false;
		if S.ESP_ENABLED then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\215\135\157\163", "\147\191\135\206\184")].rebuildESP();
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\24\143\132\136", "\210\228\72\198\161\184\51")].setRarity = function(rarity, on)
		S.ESP_RARITY[rarity] = (on and true) or false;
		if S.ESP_ENABLED then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\121\218\85\35", "\174\86\41\147\112\19")].rebuildESP();
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\48\164\78\117", "\203\59\96\237\107\69\111\113")].registerEntity = function(obj)
		if (not obj or not obj.Parent) then
			return;
		end
		if (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\9\25\168\228\61", "\183\68\118\204\129\81\144")) and S.isUUIDName(obj.Name)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\172\121\234\78\210", "\226\110\205\16\132\107")] = obj:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\198\194\233\215", "\33\139\163\128\185"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\89\10\218\91\93\65\142", "\190\55\56\100")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\174\53\16\86\179", "\147\54\207\92\126\115\131")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\48\60\115\72\46", "\30\109\81\85\29\109")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\221\112\71\179\6\223\238\235", "\156\159\17\52\214\86\190")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\238\180\178\235\191", "\220\206\143\221")]) or obj.PrimaryPart or obj:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\164\124\62\18\232\205\192\146", "\178\230\29\77\119\184\172"));
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\191\4\31\123\253\176\238", "\152\149\222\106\123\23")] and not S.ValidEntities[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\39\248\71\185\216\99\166", "\213\189\70\150\35")]] and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\101\93\77\31", "\104\47\53\20")].shouldIgnore(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\77\143\24\176\10\230\28", "\111\195\44\225\124\220")])) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\71\20\114\238\251", "\203\184\38\96\19\203")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\41\114\107\85", "\174\89\19\25\33")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\19\92\74\251\130\78\127", "\107\79\114\50\46\151\231")],[LUAOBFUSACTOR_DECRYPT_STR_0("\52\169\177\44\134", "\160\89\198\213\73\234\89\215")]=obj};
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\112\160\255\128\24", "\165\40\17\212\158")].typ = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\233\33\118\118", "\70\133\185\104\83")].getTypeName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\68\80\43\140\84", "\169\100\37\36\74")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\134\172\84\12\130\231\0", "\48\96\231\194")]);
				S.ValidEntities[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\91\0\41\21\221\234\211", "\227\168\58\110\77\121\184\207")]] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\61\171\65\244\139", "\197\27\92\223\32\209\187\17")];
				if S.ESP_ENABLED then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\111\234\190\83", "\155\99\63\163")].createESP(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\208\175\137\181\129\199\129", "\228\226\177\193\237\217")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\177\55\231\113\224", "\134\84\208\67")]);
				end
			end
		elseif (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\49\173\149\89\35\173\148\72", "\60\115\204\230")) and S.isUUIDName(obj.Name)) then
			if (not S.ValidEntities[obj] and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\10\194\53\183", "\16\135\90\139")].shouldIgnore(obj)) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\117\18\50\11\4", "\24\52\20\102\83\46\52")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\212\46\51\48", "\111\164\79\65\68")]=obj};
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\216\151\223\107\186", "\138\166\185\227\190\78")].typ = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\68\236\114\2", "\121\171\20\165\87\50\67")].getTypeName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\57\173\55\252\82", "\98\166\88\217\86\217")], obj);
				S.ValidEntities[obj] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\247\109\0\195\140", "\188\150\150\25\97\230")];
				if S.ESP_ENABLED then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\185\118\71\92", "\141\186\233\63\98\108")].createESP(obj, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\235\56\183\96\161", "\69\145\138\76\214")]);
				end
			end
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\255\160\204\239", "\118\16\175\233\233\223")].scanOnce = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\133\37\254\190", "\29\235\228\85\219\142\235")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\219\168\214\100\94\38\81\56\145\234", "\50\93\180\218\189\23\46\71")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\243\165\75", "\40\190\196\59\44\36\188"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\76\207\160\191\45", "\109\92\37\188\212\154\29")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\238\180\134\97", "\58\100\143\196\163\81")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\67\51\230\111", "\110\122\34\67\195\95\41\133")]:GetDescendants()) or {};
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\244\11", "\182\21\209\59\42")] = 0;
		for _, obj in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\94\214\9\100\238", "\222\215\55\165\125\65")]) do
			if S.isUUIDName(obj.Name) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\225\239\95\162", "\42\76\177\166\122\146\161\141")].registerEntity(obj);
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\207\85", "\22\197\234\101\174\25")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\113\245", "\230\77\84\197\188\22\207\183")] + 1;
			if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\81\150", "\85\153\116\166\156\236\193\144")] % 50) == 0) then
				task.wait();
			end
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\208\100\246\180", "\96\196\128\45\211\132")].startScanLoop = function()
		task.spawn(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\140\107\26\130", "\184\85\237\27\63\178\207\212")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\86\27\84\27\73\8\92\13\28\89", "\63\104\57\105")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\38\134\180", "\36\107\231\196"));
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\180\178\194\13", "\231\61\213\194")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\172\45\54\89", "\19\105\205\93")].DescendantAdded:Connect(function(obj)
					if ((S.AUTOFARM or S.ESP_ENABLED) and S.isUUIDName(obj.Name)) then
						task.defer(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\56\247\196\111", "\95\201\104\190\225")].registerEntity, obj);
					end
				end);
			end
			while true do
				if (S.AUTOFARM or S.ESP_ENABLED) then
					pcall(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\251\232\139\255", "\174\207\171\161")].scanOnce);
					task.wait(20);
				else
					task.wait(10);
				end
			end
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\253\14\182\168", "\183\141\158\109\147\152")] = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\28\232\63\41\27\240\5\47\12\163\92", "\108\76\105\134")].Heartbeat:Connect(function(dt)
			if (not S.ESP_ENABLED or not S.root) then
				return;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\198\178\164\158", "\174\139\165\209\129")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\176\225\132\150", "\24\195\211\130\161\166\99\16")] + dt;
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\0\234\105\3", "\118\38\99\137\76\51")] < 0.8) then
				return;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\37\6\87\89", "\64\157\70\101\114\105")] = 0;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\173\170\166\64", "\112\32\200\199\131")] = {};
			for part in pairs(S.ValidEntities) do
				if (not part or not part.Parent) then
					table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\85\81\253\147", "\66\76\48\60\216\163\203")], part);
				else
					pcall(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\182\80\182\15", "\68\218\230\25\147\63\174")].updateBillboard, part);
				end
			end
			for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\47\94\9\230", "\214\205\74\51\44")]) do
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\124\203\185\39", "\23\154\44\130\156")].removeEntity(p);
			end
		end);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\150\132\235\102", "\115\113\198\205\206\86")].getClosest = function()
		S.updateRoot();
		if not S.root then
			return nil;
		end
		local best, bestD = nil, S.MAX_DISTANCE;
		for part, data in pairs(S.ValidEntities) do
			if (part and part.Parent) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\78\238\31\212", "\58\228\55\158")] = data.typ or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\185\249\107\108", "\85\212\233\176\78\92\205")].getTypeName(data, part);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\83\205\178", "\130\42\56\232")] = (S.AUTOFARM_MODE == LUAOBFUSACTOR_DECRYPT_STR_0("\200\186\48\235", "\95\138\213\68\131\32")) or ((S.AUTOFARM_MODE == LUAOBFUSACTOR_DECRYPT_STR_0("\8\41\166", "\22\74\72\193\35")) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\96\244\29\124", "\56\76\25\132")] == LUAOBFUSACTOR_DECRYPT_STR_0("\124\192\172", "\175\62\161\203\70"))) or ((S.AUTOFARM_MODE == LUAOBFUSACTOR_DECRYPT_STR_0("\31\220\192\27\48", "\85\92\189\163\115")) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\181\32\125\121", "\88\73\204\80")] == LUAOBFUSACTOR_DECRYPT_STR_0("\13\130\19\78\44", "\186\78\227\112\38\73")));
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\92\184\5", "\26\156\55\157\53\51")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\193\6\156\232", "\48\236\184\118\185\216")] == LUAOBFUSACTOR_DECRYPT_STR_0("\199\188\80", "\84\133\221\55\80\175"))) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\162\116", "\60\221\135\68\198\167")] = data.rarity or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\141\209\198\18", "\185\142\221\152\227\34")].detectRarity(part, data);
					if not S.FARM_RARITY[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\128\7", "\151\56\165\55\154\35\83")]] then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\72\64\190", "\142\192\35\101")] = false;
					end
				end
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\126\108\243", "\118\182\21\73\195\135\236\204")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\121\74", "\157\104\92\122\32\100\109")] = (S.root.Position - part.Position).Magnitude;
					if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\227\159", "\203\195\198\175\170\93\71\237")] < bestD) then
						bestD, best = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\14\110", "\156\78\43\94\181\49\113")], data;
					end
				end
			end
		end
		return best;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\216\237\230\91", "\25\18\136\164\195\107\35")].addIgnoreNearest = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\104\249", "\216\136\77\201\47\18\220\161")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\220\2\159\88", "\226\77\140\75\186\104\188")].getClosest();
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\139\128", "\47\217\174\176\95")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\152\38", "\70\216\189\22\98\210\52\24")].part) then
			S.IgnoredParts[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\154\243", "\179\186\191\195\231")].part] = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\15\49\161\169", "\132\153\95\120")].removeEntity(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\247\94", "\192\209\210\110\77\151\186")].part);
			return true;
		end
		return false;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\51\11\172\175", "\164\128\99\66\137\159")].setPlayers = function(on)
		S.ESP_PLAYERS = (on and true) or false;
		if on then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\185\192\251\80", "\222\96\233\137")].updateAllPlayers();
		else
			for plr in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\191\166\6\141\225\213\138\131\226\79", "\144\217\211\199\127\232\147")]) do
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\31\23\109\133", "\36\152\79\94\72\181\37\98")].removePlayerESP(plr);
			end
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\232\110\122\135", "\95\183\184\39")].removePlayerESP = function(plr)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\122\183", "\98\213\95\135\70\52\224")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\175\200\110\81\236\134\250\71\17\174", "\52\158\195\169\23")][plr];
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\249\98", "\235\26\220\82\20\230\85\27")] then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\228\185", "\20\232\193\137\162")]:Destroy();
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\211\196\191\226\158\50\66\18\154\149", "\17\66\191\165\198\135\236\119")][plr] = nil;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\159\135\86\175", "\177\111\207\206\115\159\136\140")].createPlayerESP = function(plr)
		if (plr == S.player) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\185\57\81\132", "\63\101\233\112\116\180\47")].removePlayerESP(plr);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\51\236\0\189\102", "\86\163\91\141\114\152")] = plr.Character;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\25\100\54\106", "\90\51\107\20\19")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\248\132\253\120\221", "\93\237\144\229\143")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\254\241\11\78\22", "\38\117\150\144\121\107")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\5\174\227\59\35\180\231\62\31\180\225\46\29\186\252\46", "\90\77\219\142"));
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\22\49\124\28", "\26\134\100\65\89\44\103")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\239\117\115", "\196\145\131\80\67")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\54\185\1\0\20\225\25\184\18", "\136\126\208\102\104\120"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\134\139\19", "\49\24\234\174\35\207\50\93")].Adornee = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\250\252\154\52\92", "\17\108\146\157\232")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\207\81\189", "\200\43\163\116\141\79")].FillColor = Color3.fromRGB(255, 200, 50);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\58\120\211", "\131\223\86\93\227\208\148")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\77\183\164\88\229", "\213\131\37\214\214\125")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\39\36\166\228\52\14\22\143\164\118", "\129\70\75\69\223")][plr] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\199\182\185", "\143\38\171\147\137\28")];
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\178\144\182\83", "\180\176\226\217\147\99\131")].updateAllPlayers = function()
		for _, plr in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\181\46\30\214\171\60\66\131", "\103\179\217\79")]:GetPlayers()) do
			if S.ESP_PLAYERS then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\135\53\144\17", "\195\42\215\124\181\33\236")].createPlayerESP(plr);
			end
		end
	end;
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\105\30\123\117", "\152\109\57\87\94\69")];
end;
]=====];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\80\94\13\55\80\223\103\237\45", "\35\200\29\28\72\115\20\154")][LUAOBFUSACTOR_DECRYPT_STR_0("\56\170\197\208\139\45\38\20", "\84\121\223\177\191\237\76")] = [=====[
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local TABLE_TableIndirection = {};
return function(S, Env, ESP)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\212\222\32\232\136\194\12\199\202\216\32\163\235", "\126\177\163\187\69\134\219\167")] = Env.TweenService;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\253\3\128\172", "\156\67\173\74\165")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\162\91\4\185\40\82\18\187\80\34\171\35\67\58\242\25", "\38\84\215\41\118\220\70")] = nil;
	local cameraFrozen, savedCF = false, nil;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\38\11\87\174", "\158\48\118\66\114")].setVariant = function(v)
		if ((v == LUAOBFUSACTOR_DECRYPT_STR_0("\152\37\22\51", "\155\203\68\112\86\19\197")) or (v == LUAOBFUSACTOR_DECRYPT_STR_0("\100\209\55\232\65\118\241", "\152\38\189\86\156\32\24\133"))) then
			S.AUTOFARM_VARIANT = v;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\103\142\3\172", "\38\156\55\199")].setMode = function(m)
		S.AUTOFARM_MODE = m;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\77\85\109\67", "\35\200\29\28\72\115\20\154")].setSpeed = function(n)
		S.FLY_SPEED = tonumber(n) or S.FLY_SPEED;
		S.effectiveSpeed = S.FLY_SPEED;
		if (S.ANTI_BAN and (S.effectiveSpeed > S.MAX_SAFE)) then
			S.effectiveSpeed = S.MAX_SAFE;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\143\248\154\221", "\84\121\223\177\191\237\76")].setFarmRarity = function(rarity, on)
		S.FARM_RARITY[rarity] = (on and true) or false;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\102\224\229\106", "\161\219\54\169\192\90\48\80")].freezeCamera = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\67\13\96\25", "\69\41\34\96")] = Env.Camera;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\194\218\79\82", "\75\220\163\183\106\98")] and not cameraFrozen) then
			savedCF = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\187\134\114\137", "\185\98\218\235\87")].CFrame;
			cameraFrozen = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\61\42\163\142", "\202\171\92\71\134\190")].CameraType = Enum.CameraType.Scriptable;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\241\5\205\121", "\232\73\161\76")].unfreezeCamera = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\216\79\24\78", "\126\219\185\34\61")] = Env.Camera;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\207\83\55\46", "\135\108\174\62\18\30\23\147")] and cameraFrozen) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\232\39\142\72", "\167\214\137\74\171\120\206\83")].CameraType = Enum.CameraType.Custom;
			cameraFrozen = false;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\192\27\24\168", "\199\235\144\82\61\152")].stop = function()
		S.autofarmStop = true;
		S.AUTOFARM = false;
		S.autofarmRunning = false;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\3\171\57\2\24\173\13\11\15\141\60\2\19\183\110\87", "\75\103\118\217")] then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\65\98\6\188\16\211\114\124\13\141\9\194\81\126\81\233", "\126\167\52\16\116\217")]:Cancel();
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\59\50\146\177\23\232\238\34\57\180\163\28\249\198\107\112", "\156\168\78\64\224\212\121")] = nil;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\222\140\139\87", "\174\103\142\197")].unfreezeCamera();
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\24\118\125\117", "\152\54\72\63\88\69\62")].moveBlatant = function(targetPos)
		S.updateRoot();
		if not S.root then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\205\253\72\145\148", "\60\180\164\142")] = (S.root.Position - targetPos).Magnitude;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\87\22\61\98\189", "\114\56\62\101\73\71\141")] < 2) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\252\201\129\232", "\164\216\137\187")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\239\34\166\227\174", "\107\178\134\81\210\198\158")] / math.max(S.effectiveSpeed, 1), 0.15);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\27\144\212\175\54\26\164\202\179\12\25\135\195\164\125\94", "\202\88\110\226\166")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\24\135\242\196\240\10\144\225\195\192\10\199\167", "\170\163\111\226\151")]:Create(S.root, TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\37\160\125\30", "\73\113\80\210\88\46\87")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\162\10\223\19\234\132", "\135\225\76\173\114")]=CFrame.new(targetPos)});
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\248\170\162\169\179\179\60\225\161\132\187\184\162\20\168\232", "\199\122\141\216\208\204\221")]:Play();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\200\2\226\125\248\185\251\28\233\76\225\168\216\30\181\40", "\150\205\189\112\144\24")].Completed:Wait();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\145\173\94\1\134\5\54\41\157\139\91\1\141\31\85\117", "\112\69\228\223\44\100\232\113")] = nil;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\47\46\150\230", "\230\180\127\103\179\214\28")].moveSafe = function(targetPos)
		S.updateRoot();
		if not S.root then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\16\77\3\180", "\128\236\101\63\38\132\33")] = S.root.Position;
		if (math.abs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\188\3\1\230", "\175\204\201\113\36\214\139")].Y - 5) > 0.5) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\222\58\201\10\67\239\19\153\84", "\100\39\172\85\188")] = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\109\171\197\99", "\83\205\24\217\224")].X, 5, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\208\223\120\182", "\93\134\165\173")].Z);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\231\211\208\63\192\166\88\178\235\245\213\63\203\188\59\238", "\30\222\146\161\162\90\174\210")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\89\117\15\235\125\117\24\243\71\115\15\160\30", "\106\133\46\16")]:Create(S.root, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\123\6\97\253\87\69", "\32\56\64\19\156\58")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\218\234\67\84\246\163\124\141\181", "\224\58\168\133\54\58\146")]});
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\67\89\239\112\136\147\45\85\79\127\234\112\131\137\78\9", "\107\57\54\43\157\21\230\231")]:Play();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\158\3\231\188\210\219\253\135\8\193\174\217\202\213\206\65", "\175\187\235\113\149\217\188")].Completed:Wait();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\186\147\94\230\119\108\26\163\152\120\244\124\125\50\234\209", "\24\92\207\225\44\131\25")] = nil;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\193\183\89\21\121\127\210\170\75\30\105\14\131", "\29\43\179\216\44\123")] = Vector3.new(targetPos.X, 5, targetPos.Z);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\203\47\89\179\221\4\69\174\205\101\28", "\44\221\185\64")] = (S.root.Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\245\71\74\125\5\211\73\77\116\4\243\13\15", "\19\97\135\40\63")]).Magnitude;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\78\60\46\33\53\138\85\32\47\106\97", "\81\206\60\83\91\79")] > 2) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\190\194\55\127", "\196\46\203\176\18\79\163\45")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\48\113\11\42\255\203\177\49\106\91\116", "\143\216\66\30\126\68\155")] / math.max(S.effectiveSpeed, 1), 0.25);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\221\31\217\192\173\195\199\166\209\57\220\192\166\217\164\250", "\129\202\168\109\171\165\195\183")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\79\50\221\208\39\227\48\78\62\219\219\81\182", "\134\66\56\87\184\190\116")]:Create(S.root, TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\36\27\254\73", "\85\92\81\105\219\121\139\65")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\222\149\66\68\113\218", "\191\157\211\48\37\28")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\13\251\9\52\219\43\245\14\61\218\11\177\76", "\90\191\127\148\124")])});
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\146\60\5\125\137\58\49\116\158\26\0\125\130\32\82\40", "\119\24\231\78")]:Play();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\56\183\88\217\78\5\164\33\188\126\203\69\20\140\104\245", "\113\226\77\197\42\188\32")].Completed:Wait();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\3\230\167\63\24\224\147\54\15\192\162\63\19\250\240\106", "\213\90\118\148")] = nil;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\34\189\91\79\127\39\167\66\8\11", "\45\59\78\212\54")] = (S.root.Position - targetPos).Magnitude;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\90\138\134\132\10\164\227\4\19\211", "\144\112\54\227\235\230\78\205")] > 2) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\61\29\185\128", "\59\211\72\111\156\176")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\139\234\32\76\163\234\62\90\194\179", "\77\46\231\131")] / math.max(S.effectiveSpeed, 1), 0.25);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\65\164\82\191\90\162\102\182\77\130\87\191\81\184\5\234", "\32\218\52\214")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\0\52\173\255\131\64\72\88\30\50\173\180\224", "\58\46\119\81\200\145\208\37")]:Create(S.root, TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\153\34\233\249", "\86\75\236\80\204\201\221")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\81\103\101\132\243\142", "\235\18\33\23\229\158")]=CFrame.new(targetPos)});
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\175\211\169\85\180\213\157\92\163\245\172\85\191\207\254\0", "\219\48\218\161")]:Play();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\100\110\91\222\65\244\194\125\101\125\204\74\229\234\52\44", "\128\132\17\28\41\187\47")].Completed:Wait();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\39\20\40\88\15\38\32\54\68\53\37\3\63\83\68\98", "\61\97\82\102\90")] = nil;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\30\130\14\151", "\105\204\78\203\43\167\55\126")].loop = function()
		S.autofarmRunning = true;
		S.autofarmStop = false;
		if (S.CAMERA_MODE == 1) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\154\10\91\67", "\49\197\202\67\126\115\100\167")].freezeCamera();
		end
		while S.AUTOFARM and not S.autofarmStop do
			S.updateRoot();
			if not S.root then
				task.wait(0.4);
			else
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\85\203\108\208", "\62\87\59\191\73\224\54")] = ESP and ESP.getClosest and ESP.getClosest();
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\12\238\140\183", "\169\135\98\154")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\121\48\17\173", "\168\171\23\68\52\157\83")].part) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\126\230\232\117", "\231\148\17\149\205\69\77")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\169\211\190\7", "\159\224\199\167\155\55")].part.Position;
					if (S.AUTOFARM_VARIANT == LUAOBFUSACTOR_DECRYPT_STR_0("\213\255\61\198\246\253\40", "\178\151\147\92")) then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\205\101\119\66", "\26\236\157\44\82\114\44")].moveBlatant(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\33\198\30\122", "\59\74\78\181")]);
					else
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\225\115\31\227", "\211\69\177\58\58")].moveSafe(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\234\106\176\185", "\171\215\133\25\149\137")]);
					end
					S.bagCounter = S.bagCounter + 1;
					task.wait(0.12);
				else
					task.wait(0.35);
				end
			end
			task.wait(0.03);
		end
		S.autofarmRunning = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\248\27\191\191", "\34\129\168\82\154\143\80\156")].unfreezeCamera();
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\130\26\78\24", "\233\229\210\83\107\40\46")].start = function()
		if S.autofarmRunning then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\114\27\147\85", "\101\161\34\82\182")].stop();
			task.wait(0.15);
		end
		S.AUTOFARM = true;
		S.effectiveSpeed = S.FLY_SPEED;
		if (S.ANTI_BAN and (S.effectiveSpeed > S.MAX_SAFE)) then
			S.effectiveSpeed = S.MAX_SAFE;
		end
		task.spawn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\61\112\187\139", "\78\136\109\57\158\187\130\226")].loop);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\15\208\180\110", "\145\94\95\153")].setEnabled = function(on)
		if on then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\253\61\144\30", "\215\157\173\116\181\46")].start();
		else
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\132\162\183\138", "\186\85\212\235\146")].stop();
		end
	end;
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\177\63\187\105", "\56\162\225\118\158\89\142")];
end;
]=====];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\123\235\133\30\116\21\229\254\6", "\161\219\54\169\192\90\48\80")][LUAOBFUSACTOR_DECRYPT_STR_0("\125\71\12\32\89\77\18\49", "\69\41\34\96")] = [=====[
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local TABLE_TableIndirection = {};
return function(S, Env, ESP)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\207\218\60\227\169\212\91\129", "\126\177\163\187\69\134\219\167")] = Env.Players;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\200\38\192\236\44\223\62\246\249\49\219\35\198\249\102\157", "\156\67\173\74\165")] = Env.TeleportService;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\135\96\83\236", "\38\84\215\41\118\220\70")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\38\11\87\174", "\158\48\118\66\114")].getPlayerList = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\97\64", "\155\203\68\112\86\19\197")] = {};
		for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\209\55\229\69\106\246\189\22", "\152\38\189\86\156\32\24\133")]:GetPlayers()) do
			if (p ~= S.player) then
				table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\18\247", "\38\156\55\199")], p.Name);
			end
		end
		table.sort(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\56\44", "\35\200\29\28\72\115\20\154")]);
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\250\129", "\84\121\223\177\191\237\76")];
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\102\224\229\106", "\161\219\54\169\192\90\48\80")].toPlayer = function(name)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\78\18\96\25", "\69\41\34\96")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\207\214\19\7\57\175\134\135", "\75\220\163\183\106\98")]:FindFirstChild(name);
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\182\153\114\137", "\185\98\218\235\87")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\48\53\163\142", "\202\171\92\71\134\190")].Character) then
			return false;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\211\60\205\121", "\232\73\161\76")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\213\80\24\78", "\126\219\185\34\61")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\36\219\83\115\112\120\250\227\62\193\81\102\78\118\225\243", "\135\108\174\62\18\30\23\147"));
		S.updateRoot();
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\251\58\142\72", "\167\214\137\74\171\120\206\83")] and S.root) then
			S.root.CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\226\34\24\168", "\199\235\144\82\61\152")].CFrame + Vector3.new(0, 3, 0);
			return true;
		end
		return false;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\38\144\110\87", "\75\103\118\217")].toNearest = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\90\100\81\233", "\126\167\52\16\116\217")] = ESP and ESP.getClosest and ESP.getClosest();
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\32\52\197\228", "\156\168\78\64\224\212\121")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\224\177\139\87", "\174\103\142\197")].part) then
			return false;
		end
		S.updateRoot();
		if S.root then
			S.root.CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\38\75\125\117", "\152\54\72\63\88\69\62")].part.Position + Vector3.new(0, 3, 0));
			return true;
		end
		return false;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\244\199\25\132", "\60\180\164\142")].serverHop = function()
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\91\9\44\55\226\0\76\109\0\59\49\228\17\93\27\85", "\114\56\62\101\73\71\141")]:Teleport(game.PlaceId, S.player);
		end);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\217\242\129\232", "\164\216\137\187")].rejoin = function()
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\227\61\183\182\241\25\198\213\52\160\176\247\8\215\163\97", "\107\178\134\81\210\198\158")]:TeleportToPlaceInstance(game.PlaceId, game.JobId, S.player);
		end);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\62\171\131\250", "\202\88\110\226\166")].spawnTour = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\0\142\243\207\209\74\210", "\170\163\111\226\151")] = Env.Workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\60\49\162", "\73\113\80\210\88\46\87"));
		folder = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\35\193\22\226\147\105\157", "\135\225\76\173\114")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\226\180\180\169\175\226\74", "\199\122\141\216\208\204\221")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\158\205\17\231\118\229", "\150\205\189\112\144\24"));
		folder = folder and folder:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\22\148\190\91\10\155", "\112\69\228\223\44\100\232\113"));
		if not folder then
			return;
		end
		task.spawn(function()
			for _, spawn in ipairs(folder:GetChildren()) do
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\90\87", "\230\180\127\103\179\214\28")] = (spawn:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\174\4\76\67\212\64\242\152", "\128\236\101\63\38\132\33")) and spawn) or spawn:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\142\168\2\65\134\234\221\184", "\175\204\201\113\36\214\139"));
				S.updateRoot();
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\137\101", "\100\39\172\85\188")] and S.root) then
					S.root.CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\61\233", "\83\205\24\217\224")].CFrame + Vector3.new(0, 4, 0);
					task.wait(0.3);
				end
			end
		end);
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\245\228\120\182", "\93\134\165\173")].getBadges = function()
		task.spawn(function()
			for _, obj in pairs(Env.Workspace:GetDescendants()) do
				if (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\138\253\212\193\50\250\160\127\176\225\204\203\46\218\183\108", "\30\222\146\161\162\90\174\210")) or (obj.Name and string.find(string.lower(obj.Name), LUAOBFUSACTOR_DECRYPT_STR_0("\231\79\116\13\224", "\106\133\46\16")))) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\33\97\232\31\16", "\32\56\64\19\156\58")] = (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\120\201\246\83\106\243\146\78", "\224\58\168\133\54\58\146")) and obj) or obj.Parent;
					if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\87\89\233\48\214", "\107\57\54\43\157\21\230\231")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\138\3\225\252\140", "\175\187\235\113\149\217\188")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\30\174\146\73\211\120\106\40", "\24\92\207\225\44\131\25"))) then
						S.updateRoot();
						if S.root then
							S.root.CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\210\170\88\94\45", "\29\43\179\216\44\123")].CFrame + Vector3.new(0, 3, 0);
							task.wait(0.45);
						end
					end
				end
			end
		end);
	end;
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\233\9\9\237", "\44\221\185\64")];
end;
]=====];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\238\245\47\38\15\153\231\146\90", "\75\220\163\183\106\98")][LUAOBFUSACTOR_DECRYPT_STR_0("\32\187\140\36", "\185\98\218\235\87")] = [=====[
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local TABLE_TableIndirection = {};
return function(S, Env)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\198\203\41\239\184\198\10\212\199\232\49\233\169\198\25\212\134\139", "\126\177\163\187\69\134\219\167")] = Env.ReplicatedStorage;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\253\3\128\172", "\156\67\173\74\165")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\167\76\24\181\40\65\113\231", "\38\84\215\41\118\220\70")] = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\6\39\28\211\95\18\39\87\174", "\158\48\118\66\114")] = LUAOBFUSACTOR_DECRYPT_STR_0("\141\37\3\34", "\155\203\68\112\86\19\197");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\237\31\185\16", "\152\38\189\86\156\32\24\133")].setMode = function(m)
		if ((m == LUAOBFUSACTOR_DECRYPT_STR_0("\207\91\168\81", "\38\156\55\199")) or (m == LUAOBFUSACTOR_DECRYPT_STR_0("\142\124\111\60", "\35\200\29\28\72\115\20\154")) or (m == LUAOBFUSACTOR_DECRYPT_STR_0("\48\177\194\203\140\34\32", "\84\121\223\177\191\237\76"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\70\204\174\23\95\52\196\254\6", "\161\219\54\169\192\90\48\80")] = m;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\114\41\96\25", "\69\41\34\96")].getMode = function()
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\211\210\4\47\36\184\198\146\90", "\75\220\163\183\106\98")];
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\138\162\114\137", "\185\98\218\235\87")].isOpening = function()
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\44\34\232\215\164\204\121\119", "\202\171\92\71\134\190")];
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\241\5\205\121", "\232\73\161\76")].stop = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\201\71\83\23\181\222\7\13", "\126\219\185\34\61")] = false;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\254\119\55\46", "\135\108\174\62\18\30\23\147")].start = function(onStatus)
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\249\47\197\17\160\52\130\230", "\167\214\137\74\171\120\206\83")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\224\55\83\241\169\140\181\98", "\199\235\144\82\61\152")] = false;
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\6\188\37\14\24\190\110\87", "\75\103\118\217")] = true;
		task.spawn(function()
			local opened, fail = 0, 0;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\77\96\17\170\91\151", "\126\167\52\16\116\217")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\235\33\45\141\187\23", "\156\168\78\64\224\212\121"),LUAOBFUSACTOR_DECRYPT_STR_0("\50\224\166\193\10\227\170\192", "\174\103\142\197"),LUAOBFUSACTOR_DECRYPT_STR_0("\100\41\77\61", "\152\54\72\63\88\69\62"),LUAOBFUSACTOR_DECRYPT_STR_0("\241\212\231\95", "\60\180\164\142"),LUAOBFUSACTOR_DECRYPT_STR_0("\116\91\2\44\41\233\19\74\71", "\114\56\62\101\73\71\141")};
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\240\203\193\145\237\195\129\232", "\164\216\137\187")] = 1;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\227\60\189\178\251\78\130", "\107\178\134\81\210\198\158")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\11\146\202\163\59\15\150\195\174\11\26\141\212\171\63\11\199\150", "\202\88\110\226\166")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\236\31\135\249\233\194\28\135", "\170\163\111\226\151"));
			if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\53\191\55\90\50\108\65", "\73\113\80\210\88\46\87")] then
				if onStatus then
					onStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\175\35\141\61\247\132\34\238\19\244\132", "\135\225\76\173\114"));
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\253\189\190\165\179\160\95\189", "\199\122\141\216\208\204\221")] = false;
				return;
			end
			while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\205\21\254\113\248\170\152\64", "\150\205\189\112\144\24")] do
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\148\186\66\41\135\21\21\96\212", "\112\69\228\223\44\100\232\113")] == LUAOBFUSACTOR_DECRYPT_STR_0("\253\17\20\199\183\114\146", "\230\180\127\103\179\214\28")) then
					for _, ty in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\28\79\67\247\4\176", "\128\236\101\63\38\132\33")]) do
						if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\185\20\74\191\229\200\233\249", "\175\204\201\113\36\214\139")] then
							break;
						end
						local ok, res = pcall(function()
							return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\201\56\211\16\66\137\101", "\100\39\172\85\188")]:InvokeServer(ty);
						end);
						if (ok and res) then
							opened = opened + 1;
							fail = 0;
						end
					end
					if onStatus then
						onStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\130\104\188\142\54\169\56", "\83\205\24\217\224") .. opened);
					end
					task.wait();
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\220\136\109", "\93\134\165\173")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\235\209\199\41\139\226", "\30\222\146\161\162\90\174\210")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\87\96\15\204\74\104\79\181", "\106\133\46\16")]];
					local ok, res = pcall(function()
						return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\37\126\243\78\69\29\112", "\32\56\64\19\156\58")]:InvokeServer(TABLE_TableIndirection["ty%0"]);
					end);
					if (ok and res) then
						opened = opened + 1;
						fail = 0;
						if onStatus then
							onStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\117\216\224\88\95\246\192", "\224\58\168\133\54\58\146") .. opened);
						end
					else
						fail = fail + 1;
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\79\91\248\92\130\159\78\9", "\107\57\54\43\157\21\230\231")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\146\1\240\144\216\215\158\219", "\175\187\235\113\149\217\188")] % #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\182\145\73\240\60\40", "\24\92\207\225\44\131\25")]) + 1;
						if onStatus then
							onStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\109\210\177\64\91", "\29\43\179\216\44\123") .. fail);
						end
						if (fail > 40) then
							break;
						end
					end
					task.wait(((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\201\37\66\144\214\36\73\248\137", "\44\221\185\64")] == LUAOBFUSACTOR_DECRYPT_STR_0("\50\235\71\72", "\19\97\135\40\63")) and 0.35) or 0.01);
				end
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\76\54\53\38\63\169\25\99", "\81\206\60\83\91\79")] = false;
			if onStatus then
				onStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\125\191\223\98\63\198\73", "\196\46\203\176\18\79\163\45"));
			end
		end);
	end;
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\18\87\91\116", "\143\216\66\30\126\68\155")];
end;
]=====];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\17\5\195\250\142\238\24\98\182", "\202\171\92\71\134\190")][LUAOBFUSACTOR_DECRYPT_STR_0("\4\200\63\155\32\206\34\155", "\232\73\161\76")] = [=====[
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local TABLE_TableIndirection = {};
return function(S, Env)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\198\203\41\239\184\198\10\212\199\232\49\233\169\198\25\212\134\139", "\126\177\163\187\69\134\219\167")] = Env.ReplicatedStorage;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\253\3\128\172", "\156\67\173\74\165")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\167\76\24\181\40\65\113\231", "\38\84\215\41\118\220\70")] = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\6\39\28\211\95\18\39\87\174", "\158\48\118\66\114")] = LUAOBFUSACTOR_DECRYPT_STR_0("\141\37\3\34", "\155\203\68\112\86\19\197");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\237\31\185\16", "\152\38\189\86\156\32\24\133")].setMode = function(m)
		if ((m == LUAOBFUSACTOR_DECRYPT_STR_0("\207\91\168\81", "\38\156\55\199")) or (m == LUAOBFUSACTOR_DECRYPT_STR_0("\142\124\111\60", "\35\200\29\28\72\115\20\154")) or (m == LUAOBFUSACTOR_DECRYPT_STR_0("\48\177\194\203\140\34\32", "\84\121\223\177\191\237\76"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\70\204\174\23\95\52\196\254\6", "\161\219\54\169\192\90\48\80")] = m;
		end
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\114\41\96\25", "\69\41\34\96")].getMode = function()
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\211\210\4\47\36\184\198\146\90", "\75\220\163\183\106\98")];
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\138\162\114\137", "\185\98\218\235\87")].isOpening = function()
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\44\34\232\215\164\204\121\119", "\202\171\92\71\134\190")];
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\241\5\205\121", "\232\73\161\76")].stop = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\201\71\83\23\181\222\7\13", "\126\219\185\34\61")] = false;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\254\119\55\46", "\135\108\174\62\18\30\23\147")].start = function(onStatus)
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\249\47\197\17\160\52\130\230", "\167\214\137\74\171\120\206\83")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\224\55\83\241\169\140\181\98", "\199\235\144\82\61\152")] = false;
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\6\188\37\14\24\190\110\87", "\75\103\118\217")] = true;
		task.spawn(function()
			local opened, fail = 0, 0;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\77\96\17\170\91\151", "\126\167\52\16\116\217")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\235\33\45\141\187\23", "\156\168\78\64\224\212\121"),LUAOBFUSACTOR_DECRYPT_STR_0("\50\224\166\193\10\227\170\192", "\174\103\142\197"),LUAOBFUSACTOR_DECRYPT_STR_0("\100\41\77\61", "\152\54\72\63\88\69\62"),LUAOBFUSACTOR_DECRYPT_STR_0("\241\212\231\95", "\60\180\164\142"),LUAOBFUSACTOR_DECRYPT_STR_0("\116\91\2\44\41\233\19\74\71", "\114\56\62\101\73\71\141")};
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\240\203\193\145\237\195\129\232", "\164\216\137\187")] = 1;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\227\60\189\178\251\78\130", "\107\178\134\81\210\198\158")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\11\146\202\163\59\15\150\195\174\11\26\141\212\171\63\11\199\150", "\202\88\110\226\166")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\236\31\135\249\233\194\28\135", "\170\163\111\226\151"));
			if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\53\191\55\90\50\108\65", "\73\113\80\210\88\46\87")] then
				if onStatus then
					onStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\175\35\141\61\247\132\34\238\19\244\132", "\135\225\76\173\114"));
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\253\189\190\165\179\160\95\189", "\199\122\141\216\208\204\221")] = false;
				return;
			end
			while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\205\21\254\113\248\170\152\64", "\150\205\189\112\144\24")] do
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\148\186\66\41\135\21\21\96\212", "\112\69\228\223\44\100\232\113")] == LUAOBFUSACTOR_DECRYPT_STR_0("\253\17\20\199\183\114\146", "\230\180\127\103\179\214\28")) then
					for _, ty in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\28\79\67\247\4\176", "\128\236\101\63\38\132\33")]) do
						if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\185\20\74\191\229\200\233\249", "\175\204\201\113\36\214\139")] then
							break;
						end
						local ok, res = pcall(function()
							return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\201\56\211\16\66\137\101", "\100\39\172\85\188")]:InvokeServer(ty);
						end);
						if (ok and res) then
							opened = opened + 1;
							fail = 0;
						end
					end
					if onStatus then
						onStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\130\104\188\142\54\169\56", "\83\205\24\217\224") .. opened);
					end
					task.wait();
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\220\136\109", "\93\134\165\173")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\235\209\199\41\139\226", "\30\222\146\161\162\90\174\210")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\87\96\15\204\74\104\79\181", "\106\133\46\16")]];
					local ok, res = pcall(function()
						return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\37\126\243\78\69\29\112", "\32\56\64\19\156\58")]:InvokeServer(TABLE_TableIndirection["ty%0"]);
					end);
					if (ok and res) then
						opened = opened + 1;
						fail = 0;
						if onStatus then
							onStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\117\216\224\88\95\246\192", "\224\58\168\133\54\58\146") .. opened);
						end
					else
						fail = fail + 1;
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\79\91\248\92\130\159\78\9", "\107\57\54\43\157\21\230\231")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\146\1\240\144\216\215\158\219", "\175\187\235\113\149\217\188")] % #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\182\145\73\240\60\40", "\24\92\207\225\44\131\25")]) + 1;
						if onStatus then
							onStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\109\210\177\64\91", "\29\43\179\216\44\123") .. fail);
						end
						if (fail > 40) then
							break;
						end
					end
					task.wait(((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\201\37\66\144\214\36\73\248\137", "\44\221\185\64")] == LUAOBFUSACTOR_DECRYPT_STR_0("\50\235\71\72", "\19\97\135\40\63")) and 0.35) or 0.01);
				end
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\76\54\53\38\63\169\25\99", "\81\206\60\83\91\79")] = false;
			if onStatus then
				onStatus(LUAOBFUSACTOR_DECRYPT_STR_0("\125\191\223\98\63\198\73", "\196\46\203\176\18\79\163\45"));
			end
		end);
	end;
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\18\87\91\116", "\143\216\66\30\126\68\155")];
end;
]=====];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\244\96\120\58\159\252\102\24\78", "\126\219\185\34\61")][LUAOBFUSACTOR_DECRYPT_STR_0("\33\199\77\113", "\135\108\174\62\18\30\23\147")] = [=====[
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local TABLE_TableIndirection = {};
return function(S, Env)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\215\207\53\213\190\213\8\216\192\222\96\182", "\126\177\163\187\69\134\219\167")] = Env.HttpService;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\253\3\128\172", "\156\67\173\74\165")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\135\96\83\236", "\38\84\215\41\118\220\70")].setWebhook = function(url)
		S.WEBHOOK_URL = tostring(url or "");
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\38\11\87\174", "\158\48\118\66\114")].sendWebhook = function(content)
		if (S.WEBHOOK_URL == "") then
			return false;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\47\85\102", "\155\203\68\112\86\19\197")] = pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\216\39\185\16", "\152\38\189\86\156\32\24\133")] = (syn and syn.request) or http_request or request;
			if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\82\182\3\172", "\38\156\55\199")] then
				return;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\120\109\109\67", "\35\200\29\28\72\115\20\154")]({[LUAOBFUSACTOR_DECRYPT_STR_0("\44\173\221", "\84\121\223\177\191\237\76")]=S.WEBHOOK_URL,[LUAOBFUSACTOR_DECRYPT_STR_0("\150\83\221\168\53\84", "\161\219\54\169\192\90\48\80")]=LUAOBFUSACTOR_DECRYPT_STR_0("\121\109\51\17", "\69\41\34\96"),[LUAOBFUSACTOR_DECRYPT_STR_0("\148\198\214\14\7\57\175", "\75\220\163\183\106\98")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\33\181\133\35\220\12\174\198\3\192\18\191", "\185\98\218\235\87")]=LUAOBFUSACTOR_DECRYPT_STR_0("\202\44\55\234\215\169\202\40\46\233\208\229\193\47\40\232", "\202\171\92\71\134\190")},[LUAOBFUSACTOR_DECRYPT_STR_0("\11\206\40\145", "\232\73\161\76")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\205\86\77\45\190\203\84\84\29\190\156\18", "\126\219\185\34\61")]:JSONEncode({[LUAOBFUSACTOR_DECRYPT_STR_0("\15\193\80\102\123\121\231", "\135\108\174\62\18\30\23\147")]=tostring(content)})});
		end);
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\226\111\155", "\167\214\137\74\171\120\206\83")];
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\192\27\24\168", "\199\235\144\82\61\152")].getExecutorInfo = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\14\188\40\66\70", "\75\103\118\217")] = LUAOBFUSACTOR_DECRYPT_STR_0("\242\90\123\26\182\9\201", "\126\167\52\16\116\217");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\47\45\133\167\92\172", "\156\168\78\64\224\212\121")] = {{LUAOBFUSACTOR_DECRYPT_STR_0("\42\239\161\199\18\227", "\174\103\142\197"),function()
			return madium or (getexecutorname and tostring(getexecutorname()):lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\91\41\91\49\48\83", "\152\54\72\63\88\69\62")));
		end},{LUAOBFUSACTOR_DECRYPT_STR_0("\240\193\226\72\213", "\60\180\164\142"),function()
			return delta or (getexecutorname and tostring(getexecutorname()):lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\92\91\9\61\38", "\114\56\62\101\73\71\141")));
		end},{LUAOBFUSACTOR_DECRYPT_STR_0("\139\240\213\197\168\250\222\132\128", "\164\216\137\187"),function()
			return syn ~= nil;
		end},{LUAOBFUSACTOR_DECRYPT_STR_0("\244\234\36\170\179\237", "\107\178\134\81\210\198\158"),function()
			return fluxus ~= nil;
		end},{LUAOBFUSACTOR_DECRYPT_STR_0("\15\15\148\195", "\202\88\110\226\166"),function()
			return wave ~= nil;
		end},{LUAOBFUSACTOR_DECRYPT_STR_0("\240\0\142\246\216\194", "\170\163\111\226\151"),function()
			return solara ~= nil;
		end}};
		for _, row in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\49\191\61\93\114\121", "\73\113\80\210\88\46\87")]) do
			local ok, yes = pcall(row[2]);
			if (ok and yes) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\52\200\17\162\209", "\135\225\76\173\114")] = row[1];
				break;
			end
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\245\189\179\233\237", "\199\122\141\216\208\204\221")] == LUAOBFUSACTOR_DECRYPT_STR_0("\152\211\27\254\119\225\163", "\150\205\189\112\144\24")) then
			pcall(function()
				if identifyexecutor then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\156\186\79\65\216", "\112\69\228\223\44\100\232\113")] = tostring(identifyexecutor());
				elseif getexecutorname then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\7\2\208\243\44", "\230\180\127\103\179\214\28")] = tostring(getexecutorname());
				end
			end);
		end
		local features, total = 0, 11;
		for _, c in ipairs({(queue_on_teleport or (syn and syn.queue_on_teleport)),hookfunction,getrawmetatable,loadstring,getgenv,getrenv,(isfile or readfile),writefile,setclipboard,(request or http_request or (syn and syn.request)),Drawing}) do
			if c then
				features = features + 1;
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\4\75\79\235\4\176", "\128\236\101\63\38\132\33")] = features / total;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\188\1\84\185\249\219\233\249", "\175\204\201\113\36\214\139")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\205\33\213\11\2\156", "\100\39\172\85\188")] >= 0.9) and (LUAOBFUSACTOR_DECRYPT_STR_0("\139\109\181\140\115\158\109\169\144\60\191\108\249\200", "\83\205\24\217\224") .. features .. "/" .. total .. ")")) or ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\196\217\52\233\128\157", "\93\134\165\173")] >= 0.6) and (LUAOBFUSACTOR_DECRYPT_STR_0("\147\247\197\203\47\195\242\77\171\226\209\205\40\218\242\54", "\30\222\146\161\162\90\174\210") .. features .. "/" .. total .. ")")) or ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\79\100\3\234\11\32", "\106\133\46\16")] >= 0.3) and (LUAOBFUSACTOR_DECRYPT_STR_0("\112\33\127\250\26\115\77\48\99\243\72\84\24\104", "\32\56\64\19\156\58") .. features .. "/" .. total .. ")")) or (LUAOBFUSACTOR_DECRYPT_STR_0("\118\199\242\22\105\231\144\74\199\247\66\26\186", "\224\58\168\133\54\58\146") .. features .. "/" .. total .. ")");
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\78\78\254\48\214", "\107\57\54\43\157\21\230\231")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\158\1\229\182\206\219\158\219", "\175\187\235\113\149\217\188")], features, total;
	end;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\159\168\9\179", "\24\92\207\225\44\131\25")].getSessionInfo = function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\246\150\122\94\45", "\29\43\179\216\44\123")] = (getgenv and getgenv()) or _G;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\204\52\68\248\137", "\44\221\185\64")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\194\102\105\54\81", "\19\97\135\40\63")].GreedyAuth;
		local keyShow, expShow = "—", "—";
		if (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\73\39\51\106\97", "\81\206\60\83\91\79")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\90\170\210\126\42", "\196\46\203\176\18\79\163\45")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\103\46", "\143\216\66\30\126\68\155")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\221\25\195\128\243", "\129\202\168\109\171\165\195\183")].key;
			if ((type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\29\103", "\134\66\56\87\184\190\116")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\47\37\27\178\23\236", "\85\92\81\105\219\121\139\65")) and (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\246\0", "\191\157\211\48\37\28")] > 4)) then
				keyShow = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\90\164", "\90\191\127\148\124")]:sub(1, 4) .. LUAOBFUSACTOR_DECRYPT_STR_0("\54\201\96", "\119\24\231\78") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\104\245", "\113\226\77\197\42\188\32")]:sub(-4);
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\14\228\240\106", "\213\90\118\148")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\59\160\94\8\11", "\45\59\78\212\54")].expires_at;
			if (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\78\147\206\214", "\144\112\54\227\235\230\78\205")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\189\61\2\254\213\73", "\59\211\72\111\156\176")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\130\229\57\11\215", "\77\46\231\131")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\76\166\5\234", "\32\218\52\214")] - os.time();
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\18\55\188\180\224", "\58\46\119\81\200\145\208\37")] < 0) then
					expShow = LUAOBFUSACTOR_DECRYPT_STR_0("\14\180\0\133\155\152\18", "\86\75\236\80\204\201\221");
				else
					expShow = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\55\69\127\197\187\143\127\1\123\128\248\159", "\235\18\33\23\229\158"), math.floor(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\191\199\175\21\234", "\219\48\218\161")] / 3600), math.floor((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\116\122\93\158\31", "\128\132\17\28\41\187\47")] % 3600) / 60));
				end
			else
				expShow = LUAOBFUSACTOR_DECRYPT_STR_0("\31\96\82\50", "\61\97\82\102\90");
			end
		end
		return keyShow, expShow;
	end;
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\30\130\14\151", "\105\204\78\203\43\167\55\126")];
end;
]=====];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\204\4\253\93\254", "\167\214\137\74\171\120\206\83")] = (getgenv and getgenv()) or _G;
local function isOfficial()
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\213\28\107\189\247", "\199\235\144\82\61\152")].GreedyOfficial == true) then
		return true;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\51\151\29\66\70", "\75\103\118\217")].GreedyLoaderAuth == true) then
		return true;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\113\94\34\252\78", "\126\167\52\16\116\217")].GreedyLoader_Done == true) then
		return true;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\11\14\182\241\73", "\156\168\78\64\224\212\121")].GreedyOfficialTag == LUAOBFUSACTOR_DECRYPT_STR_0("\0\252\160\203\3\247\173\219\3\244\160\194\11", "\174\103\142\197")) then
		return true;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\58\92\125\117", "\152\54\72\63\88\69\62")] = "";
	pcall(function()
		if (debug and debug.info) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\214\237\25\132", "\60\180\164\142")] = tostring(debug.info(1, "s") or "") .. tostring(debug.info(2, "s") or "");
		end
	end);
	src = string.lower(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\76\6\108\119", "\114\56\62\101\73\71\141")]);
	if src:find(LUAOBFUSACTOR_DECRYPT_STR_0("\191\251\222\193\188\240\211\209\188\243\222\200\180", "\164\216\137\187"), 1, true) then
		return true;
	end
	if src:find(LUAOBFUSACTOR_DECRYPT_STR_0("\223\239\41\179\181\245\68\213\238", "\107\178\134\81\210\198\158"), 1, true) then
		return true;
	end
	if src:find(LUAOBFUSACTOR_DECRYPT_STR_0("\63\28\135\195\174\33\3\141\194\191\52\11\145", "\202\88\110\226\166"), 1, true) then
		return true;
	end
	if src:find(LUAOBFUSACTOR_DECRYPT_STR_0("\196\29\135\242\206\218\7\151\243\208\198\3\142\185\210\218\21", "\170\163\111\226\151"), 1, true) then
		return true;
	end
	return false;
end
if not isOfficial() then
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\76\109\239\101\19\106\116\76\109\239\101\19\106\116\76\109\239\101\19\106\116\76\109\239\101\19\106\116\76\109\239\101\19\106\116\76\109\239\101\19\106\116\76\109\239\101\19\106\116\76\109\239\101\19\106\116\76\109\239\101", "\73\113\80\210\88\46\87"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\193\108\249\26\238\146\108\222\17\245\136\60\217\82\240\128\63\141\31\230\133\41\141\16\254\193\60\216\0\245\134\57\212", "\135\225\76\173\114"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\90\173\156\185\191\190\168\8\233\226\240\165\179\179\8\236\187\181\160\177\178\22\236\170\254\161\184\170\24\255\185\190\169\243\180\3\254\172\181\161", "\199\122\141\216\208\204\221"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\237\157\57\246\56\239\162\200\80\227\125\243\237\201\24\249\107\182\164\211\80\241\118\239\237\210\4\248\125\228\237\206\19\226\113\230\185\145\80\244\117\182\160\216", "\150\205\189\112\144\24"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\120\217\226\17\89\213\76\77\120\217\226\17\89\213\76\77\120\217\226\17\89\213\76\77\120\217\226\17\89\213\76\77\120\217\226\17\89\213\76\77\120\217\226\17\89\213\76\77\120\217\226\17\89\213\76\77\120\217\226\17", "\112\69\228\223\44\100\232\113"));
	warn("[Greedy] Unauthorized host — watermark (features still load)");
end
local function loadMod(name)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\13\4\150\230", "\230\180\127\103\179\214\28")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\40\125\99\192\101\197\168\64\15", "\128\236\101\63\38\132\33")][name];
	assert((type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\187\18\1\230", "\175\204\201\113\36\214\139")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\84\216\39\213\10\64", "\100\39\172\85\188")) and (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\106\186\197\99", "\83\205\24\217\224")] > 20), LUAOBFUSACTOR_DECRYPT_STR_0("\235\204\222\46\239\203\202\125\233\215\141\56\235\213\217\36\166\200\194\57\243\201\200\103\166", "\93\134\165\173") .. tostring(name));
	local fn, err = loadstring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\224\194\135\106", "\30\222\146\161\162\90\174\210")]);
	if not fn then
		error(name .. LUAOBFUSACTOR_DECRYPT_STR_0("\165\77\127\7\245\71\124\15\191\14", "\106\133\46\16") .. tostring(err));
	end
	return fn();
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\47\97\249\31\16", "\32\56\64\19\156\58")] = loadMod(LUAOBFUSACTOR_DECRYPT_STR_0("\121\199\247\83", "\224\58\168\133\54\58\146"));
assert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\89\89\248\48\214", "\107\57\54\43\157\21\230\231")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\132\3\240\252\140", "\175\187\235\113\149\217\188")].S and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\160\147\73\166\41", "\24\92\207\225\44\131\25")].Env, LUAOBFUSACTOR_DECRYPT_STR_0("\104\220\170\73\91\116\69\197\185\64\18\121", "\29\43\179\216\44\123"));
local S, Env = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\214\50\73\248\137", "\44\221\185\64")].S, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\232\90\90\54\81", "\19\97\135\40\63")].Env;
if not S.player then
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\12\118\107", "\81\206\60\83\91\79")] = os.clock();
	repeat
		task.wait(0.05);
		S.player = Env.Players.LocalPlayer;
	until S.player or ((os.clock() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\251\149\34", "\196\46\203\176\18\79\163\45")]) > 8) 
end
assert(S.player, LUAOBFUSACTOR_DECRYPT_STR_0("\182\45\62\50\43\248\238\180\18\114\31\61\254\253", "\143\216\66\30\126\68\155"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\199\27\206\200\166\217\245\239\152", "\129\202\168\109\171\165\195\183")] = loadMod(LUAOBFUSACTOR_DECRYPT_STR_0("\15\87\33\221\211\17\232\54", "\134\66\56\87\184\190\116"))(S, Env);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\2\57\254\73", "\85\92\81\105\219\121\139\65")] = loadMod(LUAOBFUSACTOR_DECRYPT_STR_0("\216\128\96", "\191\157\211\48\37\28"))(S, Env);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\10\224\19\60\222\13\249\89\106", "\90\191\127\148\124")] = loadMod(LUAOBFUSACTOR_DECRYPT_STR_0("\89\146\58\24\126\134\60\26", "\119\24\231\78"))(S, Env, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\30\149\15\140", "\113\226\77\197\42\188\32")]);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\19\248\176\42\25\230\161\127\70", "\213\90\118\148")] = loadMod(LUAOBFUSACTOR_DECRYPT_STR_0("\111\43\184\83\93\84\60\160", "\45\59\78\212\54"))(S, Env, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\101\179\206\214", "\144\112\54\227\235\230\78\205")]);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\41\8\239\149\11", "\59\211\72\111\156\176")] = loadMod(LUAOBFUSACTOR_DECRYPT_STR_0("\108\134\228\62", "\77\46\231\131"))(S, Env);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\93\165\83\179\91\184\83\255\4", "\32\218\52\214")] = loadMod(LUAOBFUSACTOR_DECRYPT_STR_0("\99\30\34\187\248\191\75\73", "\58\46\119\81\200\145\208\37"))(S, Env);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\133\35\175\236\237", "\86\75\236\80\204\201\221")] = loadMod(LUAOBFUSACTOR_DECRYPT_STR_0("\95\72\100\134", "\235\18\33\23\229\158"))(S, Env);
S.updateRoot();
pcall(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\181\215\190\93\191\207\175\21\234", "\219\48\218\161")].startYCheck();
end);
pcall(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\66\76\12\139", "\128\132\17\28\41\187\47")].startScanLoop();
end);
print(LUAOBFUSACTOR_DECRYPT_STR_0("\58\21\20\63\88\5\43\59\122\80\14\54\19\54\88\18\114\20\63\92\5\43", "\61\97\82\102\90"));
return {S=S,[LUAOBFUSACTOR_DECRYPT_STR_0("\137\32\189", "\105\204\78\203\43\167\55\126")]=Env,[LUAOBFUSACTOR_DECRYPT_STR_0("\136\165\53\27\30\1\201\69", "\49\197\202\67\126\115\100\167")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\84\201\44\141\83\80\35\30\143", "\62\87\59\191\73\224\54")],[LUAOBFUSACTOR_DECRYPT_STR_0("\194\49\202", "\169\135\98\154")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\68\20\17\173", "\168\171\23\68\52\157\83")],[LUAOBFUSACTOR_DECRYPT_STR_0("\213\100\225\162\35\44\149\249", "\231\148\17\149\205\69\77")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\178\211\244\81\254\146\170\130\171", "\159\224\199\167\155\55")],[LUAOBFUSACTOR_DECRYPT_STR_0("\195\246\48\215\231\252\46\198", "\178\151\147\92")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\248\64\55\2\67\104\152\184\28", "\26\236\157\44\82\114\44")],[LUAOBFUSACTOR_DECRYPT_STR_0("\8\47\210\72", "\59\74\78\181")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\208\93\73\246\117", "\211\69\177\58\58")],[LUAOBFUSACTOR_DECRYPT_STR_0("\154\236\106\230\224\196\185\246", "\171\215\133\25\149\137")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\193\33\233\230\63\242\81\164\152", "\34\129\168\82\154\143\80\156")],[LUAOBFUSACTOR_DECRYPT_STR_0("\168\187\32\8", "\233\229\210\83\107\40\46")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\75\33\213\64\145", "\101\161\34\82\182")]};
