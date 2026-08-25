-- 1
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
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\234\245\1\201\140\248\42\248\247\247\0\163\235", "\126\177\163\187\69\134\219\167")] = LUAOBFUSACTOR_DECRYPT_STR_0("\4\223\47\192\248\58\141\2\208\248\57\200\38\201", "\156\67\173\74\165");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\158\125\51\131\19\116\24\242\25", "\38\84\215\41\118\220\70")] = LUAOBFUSACTOR_DECRYPT_STR_0("\88\2\54\2\237\10\89\109\21\236\85\19\38\11\246\69\18\56\23\242\92\88\58\11\228", "\158\48\118\66\114");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\13\35\21\92\151\223\148\3\56\115\35", "\155\203\68\112\86\19\197")] = LUAOBFUSACTOR_DECRYPT_STR_0("\78\201\34\236\83\34\170\183\66\212\37\255\79\106\225\182\65\218\121\239\66\78\240\249\114\132\55\174\116", "\152\38\189\86\156\32\24\133");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\114\137\112\185\7", "\38\156\55\199")] = (getgenv and getgenv()) or _G;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\88\82\30\86\36", "\35\200\29\28\72\115\20\154")].GreedyHudzell_Ready = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\154\255\233\200\124", "\84\121\223\177\191\237\76")].GreedyHudzell_JobId = game.JobId;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\115\231\150\127\0", "\161\219\54\169\192\90\48\80")].GreedyTowerRunning = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\103\46\19\12\18", "\69\41\34\96")].GreedyMonkeyRunning = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\230\249\60\71\123", "\75\220\163\183\106\98")].AutoOpenBags = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\159\165\1\156\82", "\185\98\218\235\87")].AutoRerollMissions = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\40\51\246\237\175\217\42\46\229\219\239\155", "\202\171\92\71\134\190")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\1\213\56\152\26\196\62\158\32\194\41", "\232\73\161\76"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\213\67\68\27\169\202\7\13", "\126\219\185\34\61")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\60\194\95\107\123\101\224", "\135\108\174\62\18\30\23\147"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\230\56\192\11\190\50\196\179\172\122", "\167\214\137\74\171\120\206\83")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\188\255\32\86\235\183\138\243\55", "\199\235\144\82\61\152"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\19\169\39\14\21\184\63\2\18\138\63\8\4\184\44\2\83\233", "\75\103\118\217")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\245\81\96\24\176\29\198\64\117\16\138\10\200\70\113\19\188", "\126\167\52\16\116\217"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\59\46\179\177\11\234\193\45\37\197\228", "\156\168\78\64\224\212\121")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\53\251\171\253\2\252\179\199\4\235", "\174\103\142\197"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\59\90\42\12\80\232\67\60\108\61\55\72\241\85\45\26\104", "\152\54\72\63\88\69\62")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\225\215\235\78\253\202\254\73\192\247\235\78\194\205\237\89", "\60\180\164\142"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\73\0\44\41\222\23\74\72\12\42\34\168\66", "\114\56\62\101\73\71\141")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\140\254\222\193\182\218\222\214\174\224\216\193", "\164\216\137\187"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\239\54\186\178\247\5\213\163\97", "\107\178\134\81\210\198\158")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\20\7\133\206\190\49\0\133", "\202\88\110\226\166"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\10\142\242\218\204\29\150\196\207\209\25\139\244\207\134\95", "\170\163\111\226\151")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\37\53\190\61\94\56\59\5\3\183\42\88\62\42\20", "\73\113\80\210\88\46\87"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\32\204\11\226\147\105\157", "\135\225\76\173\114")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\225\185\169\169\175\180\95\189", "\199\122\141\216\208\204\221")].LocalPlayer;
if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\209\17\233\125\228\232\141", "\150\205\189\112\144\24")] then
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\212\250\28", "\112\69\228\223\44\100\232\113")] = os.clock();
	repeat
		task.wait(0.05);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\19\6\202\179\110\195\132", "\230\180\127\103\179\214\28")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\9\94\95\225\83\243\201\85", "\128\236\101\63\38\132\33")].LocalPlayer;
	until TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\165\16\93\179\249\138\252", "\175\204\201\113\36\214\139")] or ((os.clock() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\156\112\140", "\100\39\172\85\188")]) > 8) 
end
if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\116\184\153\54\191\61\233", "\83\205\24\217\224")] then
	return;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\196\192\56\244\196\136\109", "\93\134\165\173")] = workspace.CurrentCamera;
local function __gh_typeof(v)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\244\132\146", "\30\222\146\161\162\90\174\210")] = rawget(_G, LUAOBFUSACTOR_DECRYPT_STR_0("\241\87\96\15\234\72", "\106\133\46\16"));
	if (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\38\54\172", "\32\56\64\19\156\58")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\92\221\235\85\78\251\143\84", "\224\58\168\133\54\58\146")) then
		local ok, ty = pcall(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\80\14\173", "\107\57\54\43\157\21\230\231")], v);
		if (ok and (type(ty) == LUAOBFUSACTOR_DECRYPT_STR_0("\200\159\3\252\183\219", "\175\187\235\113\149\217\188"))) then
			return ty;
		end
	end
	return type(v);
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\128\166\99\220\80\92\121\255", "\24\92\207\225\44\131\25")] = LUAOBFUSACTOR_DECRYPT_STR_0("\89\209\160\77\8\110\78\199\177\72\65\50\4\130\232\28\66\44\27\131\232\24\79\45\25\134\235\25", "\29\43\179\216\44\123");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\248\14\98\152\235\31\101\153\156\112", "\44\221\185\64")] = LUAOBFUSACTOR_DECRYPT_STR_0("\19\229\80\94\96\18\226\92\86\119\91\168\7\14\33\89\179\26\8\33\87\191\28\13\34\86\177\25", "\19\97\135\40\63");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\84\54\54\42\116\254", "\81\206\60\83\91\79")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\108\170\211\121\40\209\66\177\64\175", "\196\46\203\176\18\79\163\45")]=Color3.fromRGB(12, 10, 5),[LUAOBFUSACTOR_DECRYPT_STR_0("\139\43\122\27\38\250\253", "\143\216\66\30\126\68\155")]=Color3.fromRGB(18, 15, 6),[LUAOBFUSACTOR_DECRYPT_STR_0("\158\193\25\199\192\129\214\243", "\129\202\168\109\171\165\195\183")]=Color3.fromRGB(22, 18, 8),[LUAOBFUSACTOR_DECRYPT_STR_0("\0\77\35\204\209\26", "\134\66\56\87\184\190\116")]=Color3.fromRGB(45, 36, 12),[LUAOBFUSACTOR_DECRYPT_STR_0("\29\50\10\190\23\255", "\85\92\81\105\219\121\139\65")]=Color3.fromRGB(255, 195, 30),[LUAOBFUSACTOR_DECRYPT_STR_0("\201\182\72\81", "\191\157\211\48\37\28")]=Color3.fromRGB(255, 235, 190),[LUAOBFUSACTOR_DECRYPT_STR_0("\235\26\236\8\30\214\18", "\90\191\127\148\124")]=Color3.fromRGB(190, 170, 120),[LUAOBFUSACTOR_DECRYPT_STR_0("\75\146\45\20\125\148\61", "\119\24\231\78")]=Color3.fromRGB(80, 170, 70),[LUAOBFUSACTOR_DECRYPT_STR_0("\166\44\171\77\217\82", "\113\226\77\197\42\188\32")]=Color3.fromRGB(190, 45, 45),[LUAOBFUSACTOR_DECRYPT_STR_0("\9\2\230\186\49\19", "\213\90\118\148")]=Color3.fromRGB(90, 70, 20)};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\15\134\127\121\98\17\151\121\97\116\28\135\19\29", "\45\59\78\212\54")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\37\88\128\132\139\35\162\254", "\144\112\54\227\235\230\78\205")]=Color3.fromRGB(0, 255, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\129\41\29\249", "\59\211\72\111\156\176")]=Color3.fromRGB(127, 0, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\107\151\234\46", "\77\46\231\131")]=Color3.fromRGB(0, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\150\81\177\69\180\80\183\82\163", "\32\218\52\214")]=Color3.fromRGB(255, 244, 119),[LUAOBFUSACTOR_DECRYPT_STR_0("\123\27\37\161\252\177\81\95", "\58\46\119\81\200\145\208\37")]=Color3.fromRGB(255, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\8\131\61\161\166\179", "\86\75\236\80\204\201\221")]=Color3.fromRGB(180, 150, 100)};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\96\69\172\202\178\77\110\69\161\219\185\55\17", "\235\18\33\23\229\158")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\115\181\204\182\95\180", "\219\48\218\161"),LUAOBFUSACTOR_DECRYPT_STR_0("\209\127\127\70\214\66\239\234", "\128\132\17\28\41\187\47"),LUAOBFUSACTOR_DECRYPT_STR_0("\51\51\20\63", "\61\97\82\102\90"),LUAOBFUSACTOR_DECRYPT_STR_0("\137\62\162\72", "\105\204\78\203\43\167\55\126"),LUAOBFUSACTOR_DECRYPT_STR_0("\137\175\36\27\29\0\198\67\188", "\49\197\202\67\126\115\100\167"),LUAOBFUSACTOR_DECRYPT_STR_0("\2\87\203\32\141\87\74\50", "\62\87\59\191\73\224\54")};
local function isUUIDName(name)
	if (type(name) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\244\22\232\192\233\5", "\169\135\98\154")) then
		return false;
	end
	return string.match(name, LUAOBFUSACTOR_DECRYPT_STR_0("\245\50\60\17\229\118\208\142\111\97\76\184\43\141\211\50\60\17\176\118\208\142\111\97\76\184\43\141\134\50\60\17\229\118\208\142\111\97\25\184\43\141\211\50\60\17\229\118\133\142\111\97\76\184\43\141\211\50\60\17\229\118\208\142\111\97\76\184\43\141\211\50\60\16", "\168\171\23\68\52\157\83")) ~= nil;
end
local function isRedish(color)
	return (color.R > 0.7) and (color.G < 0.35) and (color.B < 0.35);
end
local function getMainPart(inst)
	if not inst then
		return nil;
	end
	if (inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\214\112\230\168\21\44\149\224", "\231\148\17\149\205\69\77")) and (inst.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\173\166\206\245", "\159\224\199\167\155\55"))) then
		return inst;
	end
	if inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\218\252\56\215\251", "\178\151\147\92")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\252\69\60\87\28", "\26\236\157\44\82\114\44")] = inst:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\7\47\220\85", "\59\74\78\181"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\208\83\84\246\117", "\211\69\177\58\58")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\228\112\251\172\155", "\171\215\133\25\149\137")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\195\201\33\255\223\49\238\86", "\34\129\168\82\154\143\80\156"))) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\179\58\5\13\30", "\233\229\210\83\107\40\46")];
		end
		return inst.PrimaryPart or inst:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\227\67\33\211\53\192\80\38", "\101\161\34\82\182"));
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\2\93\251\215\167\210", "\78\136\109\57\158\187\130\226")] = inst.Parent;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\48\253\244\50\122\169", "\145\94\95\153")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\204\29\219\11\231", "\215\157\173\116\181\46")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\187\143\247\214\112\228", "\186\85\212\235\146")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\239\128\31\240", "\56\162\225\118\158\89\142"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\4\201\161\103\136", "\184\60\101\160\207\66")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\131\117\178\116\210", "\220\81\226\28")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\49\212\145\254\218\198\1\193", "\167\115\181\226\155\138"))) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\35\238\82\62\33", "\166\130\66\135\60\27\17")];
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\69\202\112\60\1\26", "\80\36\42\174\21")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\99\31\51\127\66", "\26\46\112\87")) and isUUIDName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\44\175\113\179\250\21", "\212\217\67\203\20\223\223\37")].Name)) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\130\172\215\182\200\248", "\178\218\237\200")].PrimaryPart or inst;
		end
	end
	if inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\148\180\245\213\134\180\244\196", "\176\214\213\134")) then
		return inst;
	end
	return nil;
end
local function getBagModel(inst)
	if not inst then
		return nil;
	end
	if (inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\217\162\178\209\164", "\57\148\205\214\180\200\54")) and isUUIDName(inst.Name)) then
		return inst;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\184\101", "\22\114\157\85\84")] = inst.Parent;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\142\67", "\200\164\171\115\164\61\150")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\177\83", "\227\222\148\99\37")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\30\93\86\243\245", "\153\83\50\50\150")) and isUUIDName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\51\35", "\45\61\22\19\124\19\203")].Name)) then
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\87\93", "\217\161\114\109\149\98\16")];
	end
	return nil;
end
local function detectRarity(part, data)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\47\52\115\174\68\19\50\44\57\236", "\20\114\64\88\28\220")] = getMainPart(part);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\14\214\177\244\149\237", "\221\81\97\178\212\152\176")] = getBagModel(part) or (part and isUUIDName(part.Name) and part);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\232\17\244\8\253\230\15\239\95\157", "\122\173\135\125\155")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\206\4\188\51\116\152", "\168\228\161\96\217\95\81")] and isUUIDName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\222\42\89\35\18\139", "\55\187\177\78\60\79")].Name) and isRedish(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\193\83\228\84\255\129\63\218\26\187", "\224\77\174\63\139\38\175")].Color)) then
		return LUAOBFUSACTOR_DECRYPT_STR_0("\177\77\76\39\137\64\76\43", "\78\228\33\56");
	end
	if data then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\59\226", "\229\174\30\210\99")] = data.rarity or data.Rarity or data.tier or data.Tier;
		if (__gh_typeof(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\168\214", "\89\123\141\230\49\141\93")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\224\101\228\5\30\77", "\42\147\17\150\108\112")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\169\58\58\183", "\136\111\198\77\31\135")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\76\247", "\201\98\105\199\54\221\132\119")]:lower();
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\3\148\100\82", "\204\217\108\227\65\98\85")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\75\207\225\236\33", "\160\62\163\149\133\76")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\227\172\25\38\206\215\180\8", "\163\182\192\109\79");
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\41\23\133\165", "\149\84\70\96\160")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\52\3\10\232\54\2", "\141\88\102\109")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\159\86\205\117\20\57\84\211\170", "\161\211\51\170\16\122\93\53");
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\161\165\109\171", "\72\155\206\210")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\67\106\93\13", "\83\38\26\52\110")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\125\7\46\69", "\38\56\119\71");
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\224\79\147\117", "\54\147\143\56\182\69")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\196\128\237\76", "\191\182\225\159\41")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\25\19\58\80", "\162\75\114\72\53\235\231");
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\51\83\167\3", "\98\236\92\36\130\51")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\177\23\15\181\72\165\186\62", "\80\196\121\108\218\37\200\213")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\53\125\1\112\70\3\133\14", "\234\96\19\98\31\43\110");
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\16\69\130\252", "\235\102\127\50\167\204\18")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\83\174\248\46\75\32", "\78\48\193\149\67\36")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\19\17\141\21\78\62", "\33\80\126\224\120");
			end
		end
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\167\15\203\78\220\169\17\208\25\188", "\60\140\200\99\164")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\177\84", "\194\231\148\100\70")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\67\205\172\228\248\71\94\213\230\166", "\168\38\44\161\195\150")].Color;
		local best, bestDist = LUAOBFUSACTOR_DECRYPT_STR_0("\163\243\143\123\63\230", "\118\224\156\226\22\80\136\214"), 0.12;
		for name, col in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\207\107\169\118\215\102\163\109\194\118\178\113\171\9", "\224\34\142\57")]) do
			if ((name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\253\168\200\208\124\255", "\110\190\199\165\189\19\145\61")) and (name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\239\231\99\225\134\198\206\238", "\167\186\139\23\136\235"))) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\240\216", "\109\122\213\232")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\178\242", "\80\142\151\194")].R - col.R) ^ 2) + ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\131\39", "\44\99\166\23")].G - col.G) ^ 2) + ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\178\121", "\196\28\151\73\86\83")].B - col.B) ^ 2);
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\70\121", "\22\147\99\73\112\226\56\120")] < bestDist) then
					bestDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\48\178", "\237\216\21\130\149")];
					best = name;
				end
			end
		end
		return best;
	end
	return LUAOBFUSACTOR_DECRYPT_STR_0("\161\65\82\82\191\199", "\62\226\46\63\63\208\169");
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\42\101\188\58\35\14\124\201\60\113\198\79", "\62\133\121\53\227\127\109\79")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\39\2\202\244\143\133\35\43\23\219\247\140\142\53\48\119\165", "\194\112\116\82\149\182\206")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\155\124\39\227\195\45\17\141\127\39\229\204\47\27\132\105\60\133\178", "\110\89\200\44\120\160\130")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\240\123\121\115\102\26\116\142\241\120\121\102\100\26\111\135\230\111\3\19", "\45\203\163\43\38\35\42\91")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\176\232\12\161\136\102\255\186\249\13\166\139\120\247\161\153\115", "\52\178\229\188\67\231\201")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\116\100\43\209\125\17\12\126\125\43\211\121\102\113", "\67\65\33\48\100\151\60")] = LUAOBFUSACTOR_DECRYPT_STR_0("\253\232\186\208", "\147\191\135\206\184");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\29\146\238\254\114\128\169\23\144\224\234\122\147\170\28\227\145", "\210\228\72\198\161\184\51")] = LUAOBFUSACTOR_DECRYPT_STR_0("\20\69\242\4\114\192\34", "\174\86\41\147\112\19");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\47\174\39\12\63\46\142\117\33\175\39\0\43\84\251", "\203\59\96\237\107\69\111\113")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\57\148\199\29\201\232\1\56\141\195\29\213\243\97\70", "\183\68\118\204\129\81\144")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\140\72\219\47\171\61\153\81\202\40\167\75\253", "\226\110\205\16\132\107")] = 800;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\239\217\230\114\219\230\197\253\4\187", "\33\139\163\128\185")] = 130;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\119\50\251\122\125\42\234\104\107\52\251\114\124\65\142", "\190\55\56\100")] = 100;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\154\17\46\44\211\220\97\138\14\91\67", "\147\54\207\92\126\115\131")] = 50;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\1\16\88\41\65\32\4\25\73\50\81\35\116\101", "\30\109\81\85\29\109")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\68\121\134\9\243\201\211\69\107\153\24\155\172", "\156\159\17\52\214\86\190")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\192\130\154\143\195\145\131\138\206\144\157\137\202\130\153\128\206\159\144\139\203\248\236", "\220\206\143\221")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\92\0\50\234\237\237\171\82\9\50\157\156", "\178\230\29\77\119\184\172")] = 1;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\144\62\50\72\218\212\144\53\62\89\217\215\146\47\63\50\168", "\152\149\222\106\123\23")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\7\206\124\134\252\0\211\124\134\237\3\211\103\240\141", "\213\189\70\150\35")] = 180;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\112\94\39\102\123\75\57\122\112\65\45\112\112\90\41\109\121\81\44\10\5", "\104\47\53\20")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\105\163\52\147\32\136\115\180\46\144\74\243", "\111\195\44\225\124\220")] = "";
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\104\52\90\148\138\254\109\63\86\133\138\250\106\37\87\238\251", "\203\184\38\96\19\203")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\64\73\126\252\24\65\80\117\247\124\35", "\174\89\19\25\33")] = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\51\96\99\200\181\42\29\59\102\119\178\215", "\107\79\114\50\46\151\231")] = {};
for _, r in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\135\135\0\190\0\136\239\11\130\144\27\207\105", "\160\89\198\213\73\234\89\215")]) do
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\66\132\193\247\105\67\157\202\252\13\33", "\165\40\17\212\158")][r] = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\248\58\30\25\215\248\58\26\18\220\156\88", "\70\133\185\104\83")][r] = true;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\68\67\9\198\17\75\80\47\219\65\21", "\169\100\37\36\74")] = 0;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\136\171\94\20\148\129\95\21\137\182\85\18\194\242", "\48\96\231\194")] = 0;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\79\26\34\31\217\189\142\251\78\15\63\13\236\166\142\205\31\94", "\227\168\58\110\77\121\184\207")] = os.time();
local ESP_OBJECTS, ValidEntities, IgnoredParts = {}, {}, {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\15\143\127\156\244\85\128\87\15\250\16", "\197\27\92\223\32\209\187\17")] = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\80\204\239\70\15", "\155\99\63\163")] = nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\221\160\148\188\150\167\226\145\200\233", "\228\226\177\193\237\217")] = {};
local infiniteConnection, bodyVelocity = nil, nil;
local boxFlyConnection, boxFlyBodyVel = nil, nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\177\42\232\19\165\42\163\100", "\134\84\208\67")] = nil;
local autofarmThread, autofarmRunning, autofarmStopRequested = nil, false, false;
local isSearching, searchTween, currentFlyTween = false, nil, nil;
local cameraFrozen, savedCameraCFrame = false, nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\170\128\89\16\184\143\74\22\159\150\89\22\168\195\12", "\60\115\204\230")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\22\210\79\212\10\206\85\195\127\187", "\16\135\90\139")];
local statsLabel, runtimeLabel = nil, nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\117\4\17\91\64\108\91\122\21\118\30", "\24\52\20\102\83\46\52")] = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\46\38\33\28\129\127", "\111\164\79\65\68")] = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\201\134\208\10\248\201\201\135\209\57\228\131\137", "\138\166\185\227\190\78")] = nil;
local function clamp(n, lo, hi)
	n = tonumber(n) or 0;
	if (n < lo) then
		return lo;
	end
	if (n > hi) then
		return hi;
	end
	return n;
end
local function showNotification(text, duration)
	duration = duration or 2.5;
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\117\204\57\117\54\16\142\36", "\121\171\20\165\87\50\67")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\52\189\115\233", "\98\166\88\217\86\217")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\247\112\15\161\201\255\179\41", "\188\150\150\25\97\230")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\253\155\90\7\8\244\244\134\75\11\10", "\141\186\233\63\98\108"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\230\40\243\117", "\69\145\138\76\214")] then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\195\141\204\239", "\118\16\175\233\233\223")]:Destroy();
		end);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\139\33\178\232\206\45", "\29\235\228\85\219\142\235")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\9\209\162\201\91\79\37\87\49", "\50\93\180\218\189\23\46\71"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\171\79\69\66\153\24", "\40\190\196\59\44\36\188")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\27\87\217\177\254\100\35\51\81\213\178", "\109\92\37\188\212\154\29");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\224\176\202\55\31\84", "\58\100\143\196\163\81")].Size = UDim2.new(0, 320, 0, 40);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\77\55\170\57\12\181", "\110\122\34\67\195\95\41\133")].Position = UDim2.new(0.5, -160, 0.88, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\190\79\67\208\48\225", "\182\21\209\59\42")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\95\192\16\36\251\231", "\222\215\55\165\125\65")].Button;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\222\210\19\244\132\189", "\42\76\177\166\122\146\161\141")].BackgroundTransparency = 0.15;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\133\17\199\127\51\245", "\22\197\234\101\174\25")].Text = tostring(text);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\59\177\213\112\234\135", "\230\77\84\197\188\22\207\183")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\28\195\241\137\228\160", "\85\153\116\166\156\236\193\144")].Text;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\239\89\186\226\69\244", "\96\196\128\45\211\132")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\130\111\86\212\234\228", "\184\85\237\27\63\178\207\212")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\86\29\86\14\28\89", "\63\104\57\105")].ZIndex = 500;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\136\176\77\13\194\244", "\36\107\231\196")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\180\171\137\122\160\171\194\13", "\231\61\213\194")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\60\132\30\124\27\163\56\97", "\19\105\205\93"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\7\202\136\57\236\88", "\95\201\104\190\225")]).CornerRadius = UDim.new(0, 8);
	task.delay(duration, function()
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\196\213\199\169\142\145", "\174\207\171\161")] then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\241\25\250\254\146\189", "\183\141\158\109\147\152")]:Destroy();
			end);
		end
	end);
end
local function updateRoot()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\5\231\21\41\27\163\92", "\108\76\105\134")].Character then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\202\190\245\139\187", "\174\139\165\209\129")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\191\227\216\195\17\53\40", "\24\195\211\130\161\166\99\16")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\110\22\228\45\93\25\79\7\219\35\92\2\118\2\251\56", "\118\38\99\137\76\51")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\42\4\11\12\50\184\118", "\64\157\70\101\114\105")].Character:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\104\189\170\226\30\79\161\163\209\31\79\188\151\226\2\84", "\112\32\200\199\131"), 3);
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\95\83\172\134\251", "\66\76\48\60\216\163\203")] = nil;
	end
end
local function safeTeleport(targetCFrame)
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\138\120\234\90\220\97\234", "\68\218\230\25\147\63\174")].Character then
		return;
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\38\82\85\179\191\111\3", "\214\205\74\51\44")].Character.PrimaryPart then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\64\227\229\114\232\9\178", "\23\154\44\130\156")].Character:PivotTo(targetCFrame);
	elseif TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\169\162\186\115\67", "\115\113\198\205\206\86")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\88\241\78\193\7", "\58\228\55\158")].CFrame = targetCFrame;
	end
end
local function freezeCamera()
	if cameraFrozen then
		return;
	end
	savedCameraCFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\136\221\43\46\172\112\228", "\85\212\233\176\78\92\205")].CFrame;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\89\133\231\88\89\205\178", "\130\42\56\232")].CameraType = Enum.CameraType.Scriptable;
	cameraFrozen = true;
end
local function unfreezeCamera()
	if not cameraFrozen then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\180\41\230\82\62\175\229", "\95\138\213\68\131\32")].CameraType = Enum.CameraType.Custom;
	if savedCameraCFrame then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\41\172\70\100\43\109\241", "\22\74\72\193\35")].CFrame = savedCameraCFrame;
	end
	cameraFrozen = false;
	savedCameraCFrame = nil;
end
local function toggleNoClip(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\86\199\116\5\73\219\125\2\88\198\116\9\93\161\8", "\56\76\25\132")] = state;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\205\170\63\202\76\132\251", "\175\62\161\203\70")].Character then
		for _, p in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\209\194\10\48\46\152\147", "\85\92\189\163\115")].Character:GetDescendants()) do
			if p:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\11\173\35\61\25\173\34\44", "\88\73\204\80")) then
				p.CanCollide = not state;
			end
		end
	end
end
local function applyWalkSpeed()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\150\29\3\121", "\186\78\227\112\38\73")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\91\252\76\86\104\185\7", "\26\156\55\157\53\51")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\212\23\192\189\66\201\136", "\48\236\184\118\185\216")].Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\205\168\90\49\193\59\236\185", "\84\133\221\55\80\175"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\242\41\227\151", "\60\221\135\68\198\167")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\168\245\198\18", "\185\142\221\152\227\34")].WalkSpeed = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\245\114\223\103\12\218\109\233\99\197\108\29\178\8", "\151\56\165\55\154\35\83")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\108\51\203\141\102\43\218\159\112\53\203\133\103\64\190", "\142\192\35\101")] * 2)) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\90\31\134\202\169\130\34\233\70\25\134\194\168\233\70", "\118\182\21\73\195\135\236\204")];
	end
end
local function applyJumpPower()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\41\23\5\84", "\157\104\92\122\32\100\109")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\170\206\211\56\53\200\251", "\203\195\198\175\170\93\71\237")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\71\63\204\84\3\185\126", "\156\78\43\94\181\49\113")].Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\90\253\201\162\5\76\112\118", "\25\18\136\164\195\107\35"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\56\164\10\34", "\216\136\77\201\47\18\220\161")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\249\38\159\88", "\226\77\140\75\186\104\188")].UseJumpPower = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\219\221\122\31", "\47\217\174\176\95")].JumpHeight = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\232\91\50\141\121\77\10\140\226\89\44\247\4", "\70\216\189\22\98\210\52\24")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\234\142\183\236\234\240\148\162\225\159\143", "\179\186\191\195\231")] * 2)) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\10\53\212\198\15\55\211\220\13\93\180", "\132\153\95\120")];
	end
end
local function startInfinite()
	if infiniteConnection then
		return;
	end
	infiniteConnection = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\167\0\30\242\200\182\184\177\11\104\167", "\192\209\210\110\77\151\186")].Heartbeat:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\51\7\204\219\251\205\54\14\221\192\235\206\70\114", "\164\128\99\66\137\159")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\129\232\172\69\217", "\222\96\233\137")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\191\166\6\141\225\181\233", "\144\217\211\199\127\232\147")].Character;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\58\51\109\133", "\36\152\79\94\72\181\37\98")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\208\70\45\146\136", "\95\183\184\39")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\55\230\52\17\208", "\98\213\95\135\70\52\224")]:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\214\182\196\118\90\241\170\205", "\52\158\195\169\23"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\172\119\36", "\235\26\220\82\20\230\85\27")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\169\232\208\49\216", "\20\232\193\137\162")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\215\196\180\162\220", "\17\66\191\165\198\135\236\119")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\39\186\163\18\241\231\229\213\61\160\161\7\207\233\254\197", "\177\111\207\206\115\159\136\140"));
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\156\29\81\132", "\63\101\233\112\116\180\47")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\43\168\66", "\86\163\91\141\114\152")]) then
			return;
		end
		if (not bodyVelocity or not bodyVelocity.Parent) then
			bodyVelocity = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\113\4\112\106\12\86\7\123\112\51\71\18", "\90\51\107\20\19"));
			bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000);
			bodyVelocity.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\224\192\191", "\93\237\144\229\143")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\224\181\73", "\38\117\150\144\121\107")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\174\227\127\125", "\90\77\219\142")].MoveDirection * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\43\23\28\97\34\84\210\59\18\9\105\34\94\163\84", "\26\134\100\65\89\44\103")] * 2;
		bodyVelocity.Velocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\245\117\115", "\196\145\131\80\67")].X, 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\166\67\88", "\136\126\208\102\104\120")].Z);
	end);
end
local function stopInfinite()
	if infiniteConnection then
		infiniteConnection:Disconnect();
		infiniteConnection = nil;
	end
	if bodyVelocity then
		bodyVelocity:Destroy();
		bodyVelocity = nil;
	end
	applyWalkSpeed();
end
local function shouldIgnore(part)
	if (not part or not part.Parent) then
		return true;
	end
	if IgnoredParts[part] then
		return true;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\133\220\72\188\66\60\82\125\207\158", "\49\24\234\174\35\207\50\93")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\14\243\243\134\112\14\254\248\138\112\11\225\237\137\102\2\225", "\17\108\146\157\232")) and part:IsDescendantOf(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\204\6\230\60\184\74\192\17\168\127", "\200\43\163\116\141\79")].bannablebagspawns)) then
		return true;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\57\47\136\163\228\226\188\51\120\211", "\131\223\86\93\227\208\148")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\193\80\191\186\25\188\237\66\165", "\213\131\37\214\214\125")) and part:IsDescendantOf(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\36\55\180\242\54\42\38\186\164\118", "\129\70\75\69\223")].Buildings)) then
		return true;
	end
	return false;
end
local function removeEntity(part)
	if ESP_OBJECTS[part] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\142\163", "\143\38\171\147\137\28")] = ESP_OBJECTS[part];
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\199\233", "\180\176\226\217\147\99\131")].highlight then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\252\127", "\103\179\217\79")].highlight:Destroy();
			end);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\242\76", "\195\42\215\124\181\33\236")].billboard then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\28\103", "\152\109\57\87\94\69")].billboard:Destroy();
			end);
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\146\90", "\200\153\183\106\195\222\178\52")].model and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\208\184\2\100\117\22\198\164\14\12\10", "\58\82\131\232\93\41")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\18\128", "\95\227\55\176\117\61")].model] == part)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\77\19\116\134\55\90\6\103\152\93\46", "\203\120\30\67\43")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\96\29", "\185\145\69\45\143")].model] = nil;
		end
		ESP_OBJECTS[part] = nil;
	end
	ValidEntities[part] = nil;
end
local function getTypeName(data, part)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\90\73", "\188\234\127\121\198")] = data and (data.typ or data.type or data.Type);
	if (__gh_typeof(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\119\67", "\227\88\82\115")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\80\11\168\174\12\116", "\19\35\127\218\199\98")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\244\29\167\76", "\130\124\155\106")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\142\166", "\223\181\171\150\207\195\150\28")]:lower();
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\53\244\235\89", "\105\44\90\131\206")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\253\225\181", "\94\159\128\210\217\104")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\246\17\250\15", "\26\48\153\102\223\63\31\153")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\23\78\228\252\12", "\147\98\32\141"))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\58\66\228", "\43\120\35\131\170\102\54");
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\9\144\243\245", "\228\52\102\231\214\197\208")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\29\225\118\194\239", "\182\126\128\21\170\138\235\121")) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\168\219\54\238\131", "\102\235\186\85\134\230\115\80");
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\3\58\90\126\145\114", "\66\55\108\94\63\18\180")] = getBagModel(part);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\140\140\57\98\9", "\57\116\237\229\87\71")] = getMainPart(part);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\190\233\226\123\171\23", "\39\202\209\141\135\23\142")] or (part and isUUIDName(part.Name))) then
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\50\0\4\119\168", "\152\159\83\105\106\82")] and isRedish(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\199\88\252\140\12", "\60\225\166\49\146\169")].Color)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\13\31\40", "\103\79\126\79\74\97");
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\58\131", "\122\218\31\179\19\62")] = detectRarity(part, data);
		if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\147\157", "\37\211\182\173\161\169\193")] == LUAOBFUSACTOR_DECRYPT_STR_0("\194\52\78\214\37\118\182\249", "\217\151\90\45\185\72\27")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\57\183", "\54\163\28\135\114")] == LUAOBFUSACTOR_DECRYPT_STR_0("\26\218\79\135", "\31\72\187\61\226\46")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\67\19", "\68\163\102\35\178\39\30")] == LUAOBFUSACTOR_DECRYPT_STR_0("\155\96\211\196", "\113\222\16\186\167\99\213\227")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\75\171", "\150\78\110\155")] == LUAOBFUSACTOR_DECRYPT_STR_0("\169\192\32\228\170\26\190\82\156", "\32\229\165\71\129\196\126\223")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\204\148", "\181\163\233\164\225\225")] == LUAOBFUSACTOR_DECRYPT_STR_0("\101\135\42\126\93\138\42\114", "\23\48\235\94"))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\94\219\223", "\178\28\186\184\61\55\83");
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\194\67\57\254\75\165", "\149\164\173\39\92\146\110")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\40\20\26\22\94\163", "\123\147\71\112\127\122")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\225\204\139\127", "\38\172\173\226\17"))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\111\16\43", "\143\45\113\76");
		end
		return LUAOBFUSACTOR_DECRYPT_STR_0("\155\185\31\52\189", "\92\216\216\124");
	end
	return LUAOBFUSACTOR_DECRYPT_STR_0("\120\51\175\72\248", "\157\59\82\204\32");
end
local function createESP(part, data)
	if (not part or not part.Parent or ESP_OBJECTS[part] or shouldIgnore(part)) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\49\231\255\229\193\214\168\125\110", "\209\88\94\131\154\137\138\179")] = getBagModel(part) or (data and data.model) or part;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\146\244\67\51\12\21\7\4\146\129\44", "\66\72\193\164\28\126\67\81")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\35\172\93\42\93\226\53\237\8", "\22\135\76\200\56\70")]] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\41\232\97\13", "\129\237\80\152\68\61")] = getTypeName(data, part);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\169\22\250\8\14\29\1", "\56\49\200\100\147\124\119")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\39\175\181\156", "\144\172\94\223")] == LUAOBFUSACTOR_DECRYPT_STR_0("\6\14\165", "\39\68\111\194")) and detectRarity(part, data)) or nil;
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\191\247\130\41", "\215\182\198\135\167\25")] == LUAOBFUSACTOR_DECRYPT_STR_0("\175\72\237", "\40\237\41\138")) and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\71\202\199\104\230\83\201\199\111\233\85\216\212\111\227\49\170", "\42\167\20\154\152")]) then
		return;
	end
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\231\178\7\33", "\65\42\158\194\34\17")] == LUAOBFUSACTOR_DECRYPT_STR_0("\57\38\81\4\40", "\142\122\71\50\108\77\141\123")) and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\145\207\39\24\52\129\215\61\8\42\135\209\57\25\57\135\219\93\107", "\91\117\194\159\120")]) then
		return;
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\46\14\39\16\223\5\56\49\27\60\112\161", "\68\122\125\94\120\85\145")] then
		return;
	end
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\5\223\27\152", "\218\119\124\175\62\168\185")] == LUAOBFUSACTOR_DECRYPT_STR_0("\135\241\79", "\164\197\144\40")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\241\184\130\201\175\198\160", "\214\227\144\202\235\189")] and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\150\183\68\34\146\97\21\217\156\194\43", "\92\141\197\231\27\112\211\51")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\254\152\170\197\255\186\218", "\177\134\159\234\195")]]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\228\51\175\219\248\187", "\169\221\139\95\192")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\146\111\122\114", "\70\190\235\31\95\66")] == LUAOBFUSACTOR_DECRYPT_STR_0("\153\227\25\238\224", "\133\218\130\122\134")) and Color3.fromRGB(0, 220, 140)) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\254\241\205\200\186\125\108", "\88\92\159\131\164\188\195")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\15\141\98\227\210\226\163\1\147\100\229\216\152\208", "\189\224\78\223\43\183\139")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\253\152\31\213\55\185\218", "\161\78\156\234\118")]]) or Color3.fromRGB(0, 255, 120);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\187\140\140", "\188\199\215\169")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\212\0\88\115\228\245\14\87\111", "\136\156\105\63\27"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\128\60\100", "\84\123\236\25")].Adornee = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\135\239\71", "\213\144\235\202\119\204")].FillColor = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\23\210\37\58\102\29", "\45\67\120\190\74\72\67")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\46\168\245", "\137\64\66\141\197\153\232\142")].OutlineColor = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\220\103\246", "\232\99\176\66\198")].FillTransparency = 0.5;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\45\109\86", "\76\140\65\72\102\27\237\153")].DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\214\83\130", "\222\42\186\118\178\183\97")].Parent = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\238\1\218", "\234\61\140\36")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\3\212\182\126\13\46\220\168\118\40\52\212", "\111\65\189\218\18"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\73\94\101", "\207\35\43\123\85\107\60")].Adornee = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\114\168\229\186", "\25\16\202\192\138")].Size = UDim2.new(0, 170, 0, 70);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\201\232\178", "\148\157\171\205\130\201")].StudsOffset = Vector3.new(0, 4, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\214\49\121", "\150\67\180\20\73\177")].AlwaysOnTop = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\26\95\29", "\45\237\120\122")].MaxDistance = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\201\154\19\243\193\145\24\246\198\129\9\146\184", "\76\183\136\194")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\228\160\104", "\116\26\134\133\88\48\47")].Parent = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\217\180\161\237", "\18\126\161\192\132\221")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\107\45\182\16\122\94\42\171\8", "\54\63\72\206\100"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\65\81\63\181", "\27\168\57\37\26\133")].Size = UDim2.new(1, 0, 1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\178\104\237\135", "\183\77\202\28\200")].BackgroundTransparency = 0.4;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\43\157\77\71", "\104\119\83\233")].BackgroundColor3 = Color3.new(0, 0, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\224\51\103\19", "\35\149\152\71\66")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\231\78\191\40\92\184", "\90\121\136\34\208")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\22\65\91\151", "\126\167\110\53")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\8\58\189\140", "\95\93\112\78\152\188")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\237\145\80\180", "\178\161\149\229\117\132\222")].Text = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\194\205\233\241", "\67\232\187\189\204\193\118\198")] == LUAOBFUSACTOR_DECRYPT_STR_0("\168\47\182\40\62", "\143\235\78\213\64\91\98")) and LUAOBFUSACTOR_DECRYPT_STR_0("\174\73\135\225\117", "\214\237\40\228\137\16")) or string.format("Bag\n[%s]", TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\226\253\208\23\191\192\179", "\198\229\131\143\185\99")] or LUAOBFUSACTOR_DECRYPT_STR_0("\114\131\165\126\94\130", "\19\49\236\200"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\47\226\242\180", "\218\158\87\150\215\132")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\28\156\178", "\173\155\126\185\130\86\66")];
	ESP_OBJECTS[part] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\237\175\189\207\132\229\226\174\174", "\140\133\198\218\167\232")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\34\241\45", "\228\213\78\212\29")],[LUAOBFUSACTOR_DECRYPT_STR_0("\133\69\186\9\233\136\77\164\1", "\139\231\44\214\101")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\237\67\14", "\118\185\143\102\62\112\209\81")],[LUAOBFUSACTOR_DECRYPT_STR_0("\72\117\49\242", "\88\60\16\73\134\197\117\124")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\242\236\141\17", "\33\48\138\152\168")],[LUAOBFUSACTOR_DECRYPT_STR_0("\96\23\34\88\213\46", "\87\18\118\80\49\161")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\31\200\169\164\85\91\138", "\208\44\126\186\192")],[LUAOBFUSACTOR_DECRYPT_STR_0("\227\3\180", "\46\151\122\196\166\116\156\169")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\244\86\95\171", "\155\133\141\38\122")],[LUAOBFUSACTOR_DECRYPT_STR_0("\40\37\168\68\67", "\197\69\74\204\33\47\31")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\64\94\130\252\100\95\158\181\31", "\231\144\47\58")]};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\235\234\74\53\18\235\28\158\235\159\37", "\89\210\184\186\21\120\93\175")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\92\120\208\117\17\180\74\57\133", "\90\209\51\28\181\25")]] = part;
end
local function clearAllESP()
	for p in pairs(ESP_OBJECTS) do
		removeEntity(p);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\72\103\209\146\255\95\114\194\140\149\43", "\223\176\27\55\142")] = {};
end
local function getClosestEntity()
	updateRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\180\193\161\97\235", "\213\68\219\174")] then
		return nil;
	end
	local closest, minDist = nil, math.huge;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\239\39\226\111\149", "\31\107\128\67\135\74\165\95")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\221\200\98\103\144\234\197\195\96\110\149\253\173\172", "\209\184\136\156\45\33")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\199\122\28\136\8\219\48\88", "\216\103\168\21\104")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\162\76\176\61\253", "\196\24\205\35")].Position;
	for part, data in pairs(ValidEntities) do
		if (part and part.Parent and not IgnoredParts[part]) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\146\243\67\126", "\102\78\235\131")] = data._typ or getTypeName(data, part);
			data._typ = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\55\36\1\23", "\84\154\78\84\36\39\89\215")];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\234\123\87\1\248\164\6", "\101\157\129\54\56")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\166\142\174\102\41", "\25\125\201\234\203\67")] == LUAOBFUSACTOR_DECRYPT_STR_0("\91\251\12\11", "\115\25\148\120\99\116\71")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\50\189\33\4\92", "\33\108\93\217\68")] == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\82\177\232\139", "\205\187\43\193")]);
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\121\40\208\250\119\64\143", "\191\158\18\101")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\218\151\242\255", "\207\165\163\231\215")] == LUAOBFUSACTOR_DECRYPT_STR_0("\228\248\254", "\16\166\153\153\54\68"))) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\178\210\79\32\56\188\130", "\153\178\211\160\38\84\65")] = data._rarity or detectRarity(part, data) or false;
				data._rarity = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\10\72\34\150\18\31\123", "\75\226\107\58")];
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\223\3\115\5\219\136\8", "\173\56\190\113\26\113\162")] and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\255\31\40\200\249\255\31\44\195\242\155\125", "\151\171\190\77\101")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\46\234\160\236\100\78\149", "\107\165\79\152\201\152\29")]]) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\69\197\196\80\122\18\30", "\31\55\46\136\171\52")] = false;
				end
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\35\241\251\213\45\153\164", "\148\177\72\188")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\243\7", "\179\198\214\55")] = (part.Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\3\125\98\117\220\227\73\34", "\179\144\108\18\22\37")]).Magnitude;
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\230\75", "\175\166\195\123\233")] < minDist) then
					minDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\135\13", "\144\143\162\61\41")];
					closest = part;
				end
			end
		end
	end
	return closest;
end
local function moveBlatant(target)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\220\18\68\55\215", "\83\128\179\125\48\18\231")] or not target or not target.Parent) then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\190\253\220\75\91\13", "\126\61\215\147\189\39")] = target.Position + Vector3.new(0, 3, 0);
	safeTeleport(CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\246\19\68\116\186\77", "\37\24\159\125")]));
	return not autofarmStopRequested and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\147\65\109\252\135\71\111\229\131\91\99\248\138\80\102\159\246", "\34\186\198\21")];
end
local function moveSafe(target)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\7\202\73\135\168", "\162\152\104\165\61")] or not target or not target.Parent) then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\46\160\122\117\241\253\32\161\56\32", "\133\173\79\210\29\16")] = target.Position;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\117\227\42\129\57\189", "\75\237\28\141")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\94\222\182\42\15\215\238\207\26\156", "\129\188\63\172\209\79\123\135")] + Vector3.new(0, 3, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\237\245\217\5\180", "\173\32\132\134")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\20\7\251\235\97", "\173\46\123\104\143\206\81")].Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\20\44\139\73\198\81", "\97\212\125\66\234\37\227")]).Magnitude;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\246\164\112\78", "\126\234\131\214\85")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\220\90\78\10\212", "\47\228\181\41\58")] / TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\250\223\62\0\36\22\176\249\234\43\6\53\27\227\172", "\127\198\156\185\91\99\80")], 0.2);
	currentFlyTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\13\201\245\169\56\60\204\227\19\207\245\226\91", "\190\149\122\172\144\199\107\89")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\16\227\187\174", "\158\82\101\145\158")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\83\216\16\23\73\117", "\36\16\158\98\118")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\31\205\250\84\173\119", "\133\160\118\163\155\56\136\71")])});
	currentFlyTween:Play();
	currentFlyTween.Completed:Wait();
	currentFlyTween = nil;
	return not autofarmStopRequested and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\151\69\221\144\62\135\219\157\84\220\151\61\153\211\134\52\162", "\213\150\194\17\146\214\127")];
end
local function stopAutofarm()
	autofarmStopRequested = true;
	if autofarmThread then
		pcall(function()
			task.cancel(autofarmThread);
		end);
		autofarmThread = nil;
	end
	if currentFlyTween then
		pcall(function()
			currentFlyTween:Cancel();
		end);
		currentFlyTween = nil;
	end
	if searchTween then
		pcall(function()
			searchTween:Cancel();
		end);
		searchTween = nil;
	end
	isSearching = false;
	autofarmRunning = false;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\136\137\241\116\133\157\27\52\141\129\145\22", "\86\123\201\196\180\38\196\194")] == 1) then
		unfreezeCamera();
	end
end
local function autofarmLoop()
	autofarmRunning = true;
	while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\221\237\128\209\201\235\130\200\205\247\142\213\196\252\139\178\184", "\207\151\136\185")] and not autofarmStopRequested do
		updateRoot();
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\140\39\150\49\40", "\17\200\227\72\226\20\24")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\77\20\196\204\226\251\186\224", "\159\208\33\123\183\169\145\143")] = getClosestEntity();
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\86\55\37\247\73\44\115\162", "\86\146\58\88")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\212\175\144", "\154\56\191\138\160\206\137\86")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\108\193\168\90\27\179\225\185\111\212\181\85\27\175\248\195\9", "\172\230\57\149\231\28\90\225")] == LUAOBFUSACTOR_DECRYPT_STR_0("\32\166\135\198\41\213\22", "\187\98\202\230\178\72")) and moveBlatant(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\237\171\35\79\50\245\225\96", "\42\65\129\196\80")])) or moveSafe(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\70\82\201\18\20\22\171\82", "\142\98\42\61\186\119\103\98")]);
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\180\71\88", "\104\88\223\98")] then
					break;
				end
				task.wait(0.2);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\246\229\237\13\248\74\227\231\220\71\189", "\141\36\151\130\174\98")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\123\197\46\139\111\204\25\129\104\135\93", "\109\228\26\162")] + 1;
				if statsLabel then
					statsLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\124\228\250\107\186\166", "\134\62\133\157\24\128") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\164\29\250\32\164\216\19\160\8\156\127", "\182\103\197\122\185\79\209")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\179\199\253\55\64\120\252\142\239\99\19\18\179", "\40\147\231\129\23\96") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\247\133\75\175\191\255\122\237\130\81\190\190\153\37", "\188\21\152\236\37\219\204")];
				end
				removeEntity(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\229\56\31\69\250\35\73\16", "\108\32\137\87")]);
			else
				task.wait(0.5);
			end
		else
			task.wait(0.5);
		end
		task.wait(0.05);
	end
	autofarmRunning = false;
end
local function startAutofarm()
	if autofarmRunning then
		stopAutofarm();
		task.wait(0.15);
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\221\52\137\9\216\121\116\149\205\46\135\13\213\110\125\239\184", "\57\202\136\96\198\79\153\43")] then
		return;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\2\135\130\191\134\199\134\12\142\130\200\247", "\152\203\67\202\199\237\199")] == 1) then
		freezeCamera();
	else
		unfreezeCamera();
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\69\166\10\28\97\112\240\255\112\176\10\26\113\60\182", "\134\154\35\192\111\127\21\25")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\10\48\53\19\226\157\3\45\79\112", "\178\216\70\105\106\64")];
	autofarmStopRequested = false;
	autofarmThread = task.spawn(autofarmLoop);
end
local function teleportToNearest()
	updateRoot();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\110\42", "\224\95\75\26\150\169\181\180")] = getClosestEntity();
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\159\136", "\22\107\186\184\72\36\204")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\178\43\90\75\183", "\110\135\221\68\46")]) then
		safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\115\92", "\91\131\86\108\139\174\211")].CFrame * CFrame.new(0, 3, 0));
	end
end
local function teleportToSpecificPlayer(plrName)
	updateRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\36\183\3\24\171", "\61\155\75\216\119")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\167\160\121\8", "\189\100\203\210\92\56\105")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\93\252\49\42\67\238\109\127", "\72\79\49\157")]:FindFirstChild(plrName);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\188\35\249\216", "\220\232\208\81")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\178\247\117\124", "\193\149\222\133\80\76\58")].Character) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\77\10\130", "\178\166\61\47")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\70\250\63\154", "\94\155\42\136\26\170")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\172\42\43\180\138\48\47\177\182\48\41\161\180\62\52\161", "\213\228\95\70"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\171\135\212", "\23\74\219\162\228")] then
			safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\246\3\255", "\91\89\134\38\207")].CFrame * CFrame.new(0, 3, 0));
		end
	end
end
local function getPlayerList()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\231\219\34\86\128", "\71\36\142\168\86\115\176")] = {};
	for _, plr in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\173\115\166\6\172\69\12\143", "\41\191\193\18\223\99\222\54")]:GetPlayers()) do
		if (plr ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\42\198\51\175\185\99\151", "\202\203\70\167\74")]) then
			table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\8\207\39\52\124", "\17\76\97\188\83")], plr.Name);
		end
	end
	if (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\46\202\35\117\211", "\195\229\71\185\87\80\227\43")] == 0) then
		table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\245\19\68\170\176", "\143\128\156\96\48")], LUAOBFUSACTOR_DECRYPT_STR_0("\240\223\255\82\7\180\208\233\23\5\171\152", "\119\216\177\144\114"));
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\32\234\86\140\121", "\34\169\73\153")];
end
local function getAllBadges()
	updateRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\227\4\159\239\188", "\235\202\140\107")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\123\33\166\253\98\167", "\165\108\20\84\200\137\71\151")] = 0;
	for _, obj in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\187\57\131\105\164\42\139\127\241\123", "\232\26\212\75")]:GetDescendants()) do
		if (obj.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\21\72\118\239\242\22\94\115\250\243\50\91", "\151\87\41\18\136")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\234\154", "\158\59\207\170\176")] = (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\109\95\32\76\188\78\76\39", "\236\47\62\83\41")) and obj) or (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\215\166\36\62\166", "\226\154\201\64\91\202")) and (obj.PrimaryPart or obj:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\227\72\14\29\122\189\211\93", "\220\161\41\125\120\42"))));
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\52\240", "\110\220\17\192")] then
				safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\60\100", "\199\20\25\84\122\139\87\145")].CFrame * CFrame.new(0, 3, 0));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\6\200\160\15\175\23", "\138\39\105\189\206\123")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\8\156\35\231\188\159", "\159\127\103\233\77\147\153\175")] + 1;
				task.wait(0.4);
			end
		end
	end
	showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\37\241\224\173\69\216\71\243\235\166\76\206\4\228\225\174\26\139", "\171\103\144\132\202\32") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\32\252\2\4\106\185", "\108\112\79\137")], 2);
end
local function spawnTour()
	updateRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\205\123\60\232\81", "\85\95\162\20\72\205\97\137")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\242\38\216\8\234\136\167", "\173\151\157\74\188\109\152")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\7\42\214\207\68\212\240\33\77\104", "\147\68\104\88\189\188\52\181")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\55\137\155", "\176\122\232\235")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\122\40\68\253\144\116\57\74\171\208", "\142\224\21\90\47")].Map:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\71\196\38\65\170\152", "\229\20\180\71\54\196\235")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\113\211\232\230\186\129\42\123\132\179", "\224\73\30\161\131\149\202")].Map.Spawns:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\194\245\240\71\255\246", "\48\145\133\145"));
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\67\185\234\212\62\31\28", "\76\58\44\213\142\177")] then
		return;
	end
	for _, spawn in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\43\30\41\125\217\97\66", "\24\171\68\114\77")]:GetChildren()) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\18\67\23\215", "\205\143\125\48\50\231\190\100")] = (spawn:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\227\166\7\0\209\226\205\182", "\194\161\199\116\101\129\131\191")) and spawn.Position) or (spawn:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\193\43\204\173\251", "\194\140\68\168\200\151")) and ((spawn.PrimaryPart and spawn.PrimaryPart.Position) or spawn:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\96\250\198\32\197\67\233\193", "\149\34\155\181\69")).Position));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\242\198\191\83", "\154\99\157\181")] then
			safeTeleport(CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\0\255\229\188", "\140\237\111\140\192")] + Vector3.new(0, 3, 0)));
			task.wait(0.4);
		end
	end
end
local function createUI()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\12\116\93\86", "\120\102\121\29")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\159\224\171\62\169\237\158\46\165", "\91\204\131\217"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\234\92\145\227", "\158\174\159\53\180\211\189")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\117\239\232\216\115\172\122\232\233\199\114\185\94\200\196", "\213\50\157\141\189\23");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\51\141\229\34", "\196\158\70\228\192\18")].ResetOnSpawn = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\74\24\11\137", "\185\42\63\113\46")].ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\200\40\124\75", "\123\180\189\65\89")].Parent = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\225\131\226\225\174\215\133", "\233\162\236\144\132"));
	end);
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\209\247\95\233", "\63\210\164\158\122\217\150")].Parent then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\222\255\169\25", "\152\83\171\150\140\41")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\233\130\42\209\9\77\210", "\104\226\133\227\83\180\123")]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\51\7\34\73\6\25\4\69\10", "\48\99\107\67"), 5);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\167\116\222\10\110\215\227\45", "\27\190\198\29\176\77")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\94\244\113\249", "\46\143\43\157\84\201")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\121\95\204\26\67", "\168\55\24\54\162\63\115")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\49\232\33\141\215", "\174\119\154\64\224\178"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\127\204\117\64\247", "\132\74\30\165\27\101\199\122")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\2\230\246\169\144\188\186\43\232\232", "\212\79\135\159\199\199\213");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\161\188\73\25\135", "\120\25\192\213\39\60\183")].Size = UDim2.new(0, 780, 0, 520);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\65\54\70\93\16", "\40\120\32\95")].Position = UDim2.new(0.5, -390, 0.5, -260);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\170\48\116\234\79", "\127\90\203\89\26\207")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\61\170\198\12\184\141", "\157\189\85\207\171\105")].Background;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\160\209\187\70\150", "\99\166\193\184\213")].Active = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\182\137\181\73\218", "\234\182\215\224\219\108")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\148\178\112\144", "\85\160\225\219")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\105\44\160\198\36\210\78\78", "\43\60\101\227\169\86\188"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\201\216\177\31\156", "\87\16\168\177\223\58\172\217")]).CornerRadius = UDim.new(0, 14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\254\77\207\52\63\200\28\141", "\91\84\173\57\189")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\37\144\63\232\178\217\27\188", "\182\112\217\108\156\192"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\59\92\253\132\161\13\13\191", "\235\202\104\40\143")].Color = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\131\30\180\8\206\75", "\217\109\235\123")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\186\106\68\127\219\200\248\119", "\221\71\233\30\54\16\176\173")].Thickness = 1.5;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\207\74\173\59\247\91\250\100", "\223\84\156\62")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\253\235\211\242\107", "\91\182\156\130\189\215")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\122\184\89\123\81\173\71\59\35", "\53\30\19\204")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\223\242\113\137\162", "\199\153\128\16\228"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\35\241\21\162\243\43\247\92\247", "\199\177\74\133\121")].Size = UDim2.new(1, 0, 0, 42);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\192\168\242\50\228\43\170\140\236", "\74\216\169\220\158\87\166")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\43\22\33\95\173\115", "\58\136\67\115\76")].TitleBar;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\163\204\85\128\2\170\79\180\250", "\61\145\202\184\57\229\64\203")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\83\128\73\25\2", "\39\60\50\233")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\47\26\128\35\144\38\183\177", "\195\122\83\195\76\226\72\210"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\221\47\242\36\198\213\41\187\113", "\65\132\180\91\158")]).CornerRadius = UDim.new(0, 14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\72\212\54\17\57\129", "\78\101\28\177")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\17\177\248\69\9\181\226\84\41", "\49\69\212\128"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\56\213\234\245\82\92", "\129\119\108\176\146")].Size = UDim2.new(1, -120, 1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\251\2\213\49\75\76", "\124\92\175\103\173\69\110")].Position = UDim2.new(0, 16, 0, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\12\6\47\213\125\83", "\87\161\88\99")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\205\234\212\163\149\115", "\67\114\153\143\172\215\176")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\139\192\42\145\149\209\58\151\150\194\43\251\242", "\110\222\194\142")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\237\30\177\70\228\71", "\193\119\185\123\201\50")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\0\252\43\10\60\79", "\127\23\104\153\70\111\25")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\51\163\183\63\105\231", "\211\105\103\198\207\75\76\215")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\147\181\247\106\73\234", "\214\174\199\208\143\30\108\218")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\176\14\178\177\19\136", "\41\113\228\107\202\197\54\184")].TextXAlignment = Enum.TextXAlignment.Left;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\185\61\68\110\200\104", "\60\26\237\88")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\35\96\234\171\250\43\102\163\254", "\206\184\74\20\134")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\232\225\162\246\104\44\194\125\180", "\172\88\132\142\209\147\42\88")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\179\143\212\25\20\224\170\147\133\194", "\222\231\234\172\109\86\149"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\227\207\11\232\205\212\22\168\191", "\120\141\143\160")].Size = UDim2.new(0, 28, 0, 28);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\160\185\65\69\142\162\92\5\252", "\50\32\204\214")].Position = UDim2.new(1, -36, 0.5, -14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\75\58\106\182\51\146\73\112\41", "\113\230\39\85\25\211")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\179\3\229\34\142\251", "\43\190\219\102\136\71\171\203")].Danger;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\114\63\74\39\92\36\87\103\46", "\57\66\30\80")].Text = "X";
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\212\175\6\129\27\224\138\108\136", "\228\73\184\192\117\228\89\148")].TextColor3 = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\133\122\7\202\171\97\26\138\217", "\116\175\233\21")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\244\177\85\222\19\43\240\189\238", "\95\158\152\222\38\187\81")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\177\58\161\166\234\236\179\112\226", "\168\152\221\85\210\195")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\215\225\139\174\252\244\149\238\142", "\231\203\190\149")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\248\20\192\254\174\251\30\223", "\123\173\93\131\145\220\149"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\200\226\50\113\219\2\202\168\113", "\153\118\164\141\65\20")]).CornerRadius = UDim.new(0, 6);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\62\137\241\242\34\250\60\195\178", "\96\142\82\230\130\151")].Activated:Connect(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\165\70\7\180", "\142\47\208\47\34\132")]:Destroy();
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\183\0\7\89\93\228\251\84", "\60\150\222\100\98\59")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\99\46\86\91\222", "\81\37\92\55\54\187\218"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\77\169\50\131\1\86\232\103", "\225\96\36\205\87")].Size = UDim2.new(0, 150, 1, -42);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\175\70\124\126\78\27\172\246", "\105\137\198\34\25\28\47")].Position = UDim2.new(0, 0, 0, 42);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\160\69\115\194\16\187\4\38", "\160\113\201\33\22")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\80\169\170\172\232\132", "\205\180\56\204\199\201")].Sidebar;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\215\56\29\129\223\46\93\211", "\120\227\190\92")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\93\22\117\102\12", "\130\93\60\127\27\67\60\185")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\125\27\27\65\242\77\120\90", "\29\40\82\88\46\128\35"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\76\208\24\3\185\41\0\132", "\216\91\37\180\125\97")]).CornerRadius = UDim.new(0, 14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\127\24\198\123\44\101\8\134\7", "\55\69\22\124\163")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\77\250\112\225\204\101\124\245\97\220\73\252", "\148\24\179\60\136\191\17\48"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\35\253\165\218\187\57\237\229\166", "\150\210\74\153\192")].Padding = UDim.new(0, 6);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\193\60\143\89\115\167\247\141\104", "\212\131\168\88\234\21\26")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\125\141\137\58\38\87\49\217", "\71\37\20\233\236\88")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\79\180\19\112\237\72\25\157", "\60\173\38\208\118\32\140\44")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\116\27\209\210\36\203\72\60\230", "\175\33\82\129\179\64"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\230\52\202\12\179\234\170\96", "\210\142\143\80\175\92")].PaddingTop = UDim.new(0, 12);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\224\247\195\137\232\247\131\233", "\166\217\137\147")].PaddingLeft = UDim.new(0, 8);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\170\118\163\193\71\231\230\34", "\38\131\195\18\198\145")].PaddingRight = UDim.new(0, 8);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\223\62\238\8\85\87\147\106", "\52\51\182\90\139\88")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\176\212\226\65\247\171\149\183", "\35\150\217\176\135")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\95\5\24\114\77\98\188\0", "\22\153\48\107\108\23\35")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\40\151\186\23\122", "\137\110\229\219\122\31\21\33"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\178\54\111\51\69\48\59\74", "\30\122\221\88\27\86\43\68")].Size = UDim2.new(1, -162, 1, -54);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\39\229\146\61\38\255\195\104", "\230\88\72\139")].Position = UDim2.new(0, 156, 0, 48);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\187\24\15\6\6\76\55\228", "\56\18\212\118\123\99\104")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\230\246\199\218\208\10\172\168", "\190\126\137\152\179\191")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\3\123\197\239\16", "\32\72\98\18\171\202")];
	local function createPage(name)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\205\98", "\151\100\232\82\20")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\76\218\228\7\115\213\255\6\120\255\228\9\114\220", "\104\31\185\150"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\252\163", "\160\188\217\147\151\135\172\128")].Size = UDim2.new(1, 0, 1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\152\64", "\169\111\189\112\144\90")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\198\117", "\226\173\227\69\205\223\224\105")].Visible = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\123\114", "\123\56\94\66\59\175")].ScrollBarThickness = 4;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\6\35", "\225\154\35\19\129\122\158")].ScrollBarImageColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\8\238\90\240\162\128", "\84\58\96\139\55\149\135\176")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\122\243", "\94\115\95\195\96\46\175")].AutomaticCanvasSize = Enum.AutomaticSize.Y;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\14\111", "\128\35\43\95\93\78\77\231")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\18\56\32\18\112\189\225\77", "\201\196\125\86\84\119\30")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\171\84", "\223\163\142\100")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\183\63\239\184\171\150\58\194\168\183\151\2", "\216\226\118\163\209"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\181\75", "\95\222\144\123\97\55\16")].Padding = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\193\234", "\131\121\228\218\35")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\149\114", "\123\185\176\66\97\25")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\14\30\84\6\106\8", "\81\168\111\121\49\117\79\56")][name] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\79\181", "\214\167\106\133")];
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\125\28", "\185\73\88\44\47\84\31")];
	end
	local function switchTab(name)
		for n, p in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\214\29\165\192\186\216", "\159\232\183\122\192\179")]) do
			p.Visible = n == name;
		end
		for n, b in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\51\170\3\49\38\188\46\42\33\237\113", "\65\68\82\200")]) do
			if (n == name) then
				b.BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\88\119\45\202\138\46", "\30\69\48\18\64\175\175")].Accent;
				b.TextColor3 = Color3.fromRGB(20, 15, 5);
			else
				b.BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\36\26\225\62\181\124", "\91\144\76\127\140")].Button;
				b.TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\0\67\44\214\255\133", "\176\128\104\38\65\179\218\181")].Text;
			end
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\197\192\62\213\221\209\80\128", "\117\176\164\162")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\173\204\3\255\200\116\133\214\12\255\212", "\25\228\162\101\144\186"),LUAOBFUSACTOR_DECRYPT_STR_0("\101\57\175\11\255\225\70\34", "\132\40\86\217\110\146"),LUAOBFUSACTOR_DECRYPT_STR_0("\74\206\43\185\183\124\238\74", "\62\30\171\71\220\199\19\156"),LUAOBFUSACTOR_DECRYPT_STR_0("\97\80\184\57\91\200\61\64", "\45\32\37\204\86\61\169\79"),LUAOBFUSACTOR_DECRYPT_STR_0("\112\102\53", "\28\53\53\101\220\213"),LUAOBFUSACTOR_DECRYPT_STR_0("\47\93\15\82", "\191\109\60\104\33\58\193\48"),LUAOBFUSACTOR_DECRYPT_STR_0("\170\222\11\244\142\216\22\244", "\135\231\183\120"),LUAOBFUSACTOR_DECRYPT_STR_0("\203\3\95\231", "\201\134\106\44\132\85\122")};
	for _, name in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\13\117\20\4\21\219\102\102", "\67\86\108\23\95\97\108\168")]) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\44\66\79\244", "\48\196\88\44\106\196\68\181")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\182\218\196\55\162\177\182\56\141\209", "\76\226\191\188\67\224\196\194"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\60\9\181\173", "\157\185\72\103\144")].Size = UDim2.new(1, 0, 0, 36);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\167\132\63\248", "\209\57\211\234\26\200")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\198\163\140\85\151\81", "\178\97\174\198\225\48")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\66\10\180\40", "\111\175\54\100\145\24\134")].Text = name;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\13\46\80\19", "\117\35\121\64")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\181\235\219\38\10\141", "\47\189\221\142\182\67")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\171\41\142\24", "\73\64\223\71\171\40\201\64")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\153\202\28\240", "\29\106\237\164\57\192")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\176\233\255\133", "\146\209\196\135\218\181\178\192")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\57\135\20\82\166\63\117\211", "\199\77\80\227\113\48")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\31\22\125\194\56\49\91\223", "\173\74\95\62"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\13\82\115\155", "\220\166\121\60\86\171\103")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\3\63\146\46\222\14\230\12\46\245\107", "\122\137\98\93\208\91\170")][name] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\245\18\10\133", "\170\231\129\124\47\181\210\201")];
		createPage(name);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\175\52\117\90", "\74\235\219\90\80\106")].Activated:Connect(function()
			switchTab(name);
		end);
	end
	local function section(parent, title)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\134\11", "\146\44\163\59\91\90\148\26")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\83\63\185\140\76", "\41\21\77\216\225"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\8\34", "\37\116\45\18")].Size = UDim2.new(1, 0, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\186\6", "\203\175\159\54\194")].AutomaticSize = Enum.AutomaticSize.Y;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\139\73", "\162\27\174\121\91\58\47")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\205\26\248\58\156\131", "\185\179\165\127\149\95")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\48\159", "\119\49\21\175\148")].BackgroundTransparency = 0.35;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\240\70", "\149\55\213\118\61\77\41\234")].Parent = parent;
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\40\47\233\201\251\55\170\9", "\123\125\102\170\166\137\89\207"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\69\8", "\201\46\96\56\93\110\227")]).CornerRadius = UDim.new(0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\1\226\188\69", "\161\219\99\142\153\117")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\72\180\190\103\225\125\179\163\127", "\173\28\209\198\19"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\238\187\254\37", "\219\21\140\215")].Size = UDim2.new(1, -16, 0, 26);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\186\202\226\8", "\56\40\216\166\199")].Position = UDim2.new(0, 10, 0, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\182\25\106\118", "\79\70\212\117")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\20\237\131\169", "\109\199\118\129\166\153")].Text = title;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\178\123\179\97", "\150\81\208\23")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\205\229\134\252\128\176", "\235\153\165\128")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\75\174\106\22", "\158\219\41\194\79\38\70\202")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\39\35\71\190", "\232\35\69\79\98\142\182")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\2\19\184\41", "\157\25\96\127")].TextXAlignment = Enum.TextXAlignment.Left;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\129\249\64\0", "\81\199\227\149\101\48")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\23\171", "\219\29\50\155\113\150\230\92")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\41\214\111\186\24", "\45\177\64\165\27\159\40")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\59\4\14\167\119", "\18\125\118\111\202"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\53\74\238\117\253", "\155\48\92\57\154\80\205\167")].Size = UDim2.new(1, -16, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\196\168\171\189\251", "\37\217\173\219\223\152\203")].Position = UDim2.new(0, 8, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\12\12\34\10\248", "\150\105\101\127\86\47\200")].AutomaticSize = Enum.AutomaticSize.Y;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\251\224\161\130\144", "\160\174\146\147\213\167")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\237\9\80\73\17", "\33\32\132\122\36\108")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\81\34", "\28\217\116\18\43")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\86\207\17\128", "\92\178\55\182\52\176\206")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\47\28\93\28\9\33\93\20\3\58\100\1", "\117\122\85\17"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\238\51\1\246", "\189\232\143\74\36\198")].Padding = UDim.new(0, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\171\19\11\135", "\106\156\202\106\46\183")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\16\104\39\111\109", "\74\93\121\27\83")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\72\146\214\127\121\191\239\112\122", "\30\29\219\134"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\226\73", "\110\53\199\121\154\148\63\120")]).PaddingBottom = UDim.new(0, 10);
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\19\236\43\28\172", "\156\97\122\159\95\57")];
	end
	local function makeToggle(parent, text, default, callback)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\162\219\236\14\71\111", "\95\174\214\186\152\107\98")] = (default and true) or false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\26\127\206\67", "\166\233\110\17\235\115")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\76\11\220\213\208\171\104\108\1\202", "\28\24\110\164\161\146\222"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\215\88\96\11", "\69\59\163\54")].Size = UDim2.new(1, 0, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\188\196\15\99", "\214\208\200\170\42\83\173")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\53\124\229\37", "\21\185\65\18\192")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\66\83\94\241", "\193\158\54\61\123")].Parent = parent;
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\0\56\3\182\39\31\37\171", "\217\85\113\64"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\27\194\133\191", "\133\43\111\172\160\143\226")]).CornerRadius = UDim.new(0, 8);
		local function apply()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\183\94\148\144", "\160\171\195\48\177")].BackgroundColor3 = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\23\119\57\89\132\255", "\167\179\99\22\77\60\161\207")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\119\142\85\73\68\47", "\44\97\31\235\56")].Success) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\6\253\169\244\75\168", "\196\145\110\152")].Danger;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\58\240\183\8", "\146\56\78\158")].Text = text .. ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\207\78\242\95\104\139", "\58\77\187\47\134")] and LUAOBFUSACTOR_DECRYPT_STR_0("\82\41\225\40\203", "\126\114\85\193\103\133\78\52")) or LUAOBFUSACTOR_DECRYPT_STR_0("\132\199\114\87\226\253", "\24\164\187\82"));
		end
		apply();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\206\82\239\161", "\145\145\186\60\202")].Activated:Connect(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\196\50\16\227\149\99", "\100\134\176\83")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\213\67\169\182\80\131", "\117\179\161\34\221\211")];
			apply();
			if callback then
				callback(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\164\251\210\1\186\245", "\197\45\208\154\166\100\159")]);
			end
		end);
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\224\136\249\99", "\83\73\148\230\220")];
	end
	local function makeBtn(parent, text, color, callback)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\203\248\165\191", "\233\83\191\150\128\143")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\195\131\215\102\47\226\146\219\125\3", "\109\151\230\175\18"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\238\79\1\208", "\224\192\154\33\36")].Size = UDim2.new(1, 0, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\64\22\199\211", "\226\227\52\120")].BackgroundColor3 = color or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\227\233\169\79\250\135", "\217\101\139\140\196\42\223\183")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\27\161\95\20", "\36\122\111\207\122")].Text = text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\28\234\253\232", "\84\108\104\132\216\216")].TextColor3 = ((color == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\19\195\85\229\225\18", "\34\172\123\166\56\128\196")].Accent) and Color3.fromRGB(20, 15, 5)) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\161\173\198\79\54\133", "\116\196\201\200\171\42\19\181")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\146\245\24\69", "\124\22\230\155\61\117\96")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\191\232\174\174", "\149\165\203\134\139\158\141")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\184\78\99\99", "\70\83\204\32")].Parent = parent;
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\59\168\40\143\28\143\14\146", "\224\110\225\107"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\98\211\116\96", "\164\148\22\189\81\80\164")]).CornerRadius = UDim.new(0, 8);
		if callback then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\148\121\246\119", "\23\210\224\23\211\71\43")].Activated:Connect(function()
				pcall(callback);
			end);
		end
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\146\30\242\5", "\144\201\230\112\215\53\75\188")];
	end
	local function makeDrop(parent, label, options, default, callback)
		options = options or {"?"};
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\193\1\175\166", "\197\53\165\121\138\150")] = 1;
		for i, v in ipairs(options) do
			if (tostring(v) == tostring(default)) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\219\193\101\189", "\64\141\191\185")] = i;
				break;
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\248\177\202\231\204\180\70\186", "\198\99\138\208\186\151\169")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\43\231\130\83\8", "\62\109\149\227"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\154\136\196\16\246\154\204\132", "\96\147\232\233\180")].Size = UDim2.new(1, 0, 0, 36);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\42\27\91\157\60\58\125\74", "\89\72\88\122\43\237")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\169\164\38\11\41\169\224\102", "\123\76\219\197\86")].Parent = parent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\218\25\73\190", "\95\56\184\117\108\142")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\196\199\62\248\220\195\36\233\252", "\140\144\162\70"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\42\85\55\190", "\142\176\72\57\18")].Size = UDim2.new(0.38, 0, 1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\51\28\97\246", "\68\198\81\112")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\13\188\81\28", "\125\215\111\208\116\44")].Text = label;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\69\67\182\40", "\60\103\39\47\147\24")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\2\242\141\211\182\30", "\46\140\106\151\224\182\147")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\47\113\7\187", "\34\139\77\29")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\242\17\17\121", "\73\208\144\125\52")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\238\134\142\151", "\171\74\140\234\171\167\112\51")].TextXAlignment = Enum.TextXAlignment.Left;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\12\64\26\161", "\205\79\110\44\63\145")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\77\62\216\164\14\182\89\247", "\124\199\63\95\168\212\107\196")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\188\93\127\244", "\147\102\200\51\90\196\151\233")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\15\245\247\217\156\245\47\47\255\225", "\91\91\144\143\173\222\128"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\180\66\20\251", "\46\67\192\44\49\203")].Size = UDim2.new(0.6, 0, 1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\194\32\231\116", "\101\100\182\78\194\68\196")].Position = UDim2.new(0.4, 0, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\92\62\176\221", "\181\40\40\80\149\237\43\24")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\186\32\63\191\15\66", "\114\117\210\69\82\218\42")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\194\86\54\252", "\204\36\182\56\19")].Text = tostring(options[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\79\196\198\45", "\114\137\43\188\227\29\88")]]);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\9\166\85\180", "\112\132\125\200")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\176\246\126\95\176\173", "\149\157\216\147\19\58")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\146\22\141\153", "\168\169\230\120")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\153\138\82\172", "\119\156\237\228")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\197\14\59\147", "\30\163\177\96")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\50\84\153\45\46\198\95\112", "\180\122\64\53\233\93\75")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\227\62\48\50\196\25\22\47", "\93\182\119\115"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\11\221\201\231", "\158\226\127\179\236\215")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\212\199\147\161", "\182\145\160\169")].Activated:Connect(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\36\40\83\247", "\111\89\64\80\118\199")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\179\22\3\239", "\38\223\215\110")] % #options) + 1;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\207\2\128\251", "\203\62\187\108\165")].Text = tostring(options[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\112\80\123\33", "\176\153\20\40\94\17\158")]]);
			if callback then
				callback(options[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\55\163\22\149", "\165\200\83\219\51")]]);
			end
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\250\125\62\129", "\132\167\138\20\27\177\213\220")] = {};
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\197\234\9\108", "\92\146\181\131\44")].setOptions = function(newOpts, keepVal)
			options = newOpts;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\250\89\195\238", "\189\43\158\33\230\222\32\119")] = 1;
			for i, v in ipairs(options) do
				if (tostring(v) == tostring(keepVal)) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\196\85\20\216", "\232\62\160\45\49")] = i;
					break;
				end
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\199\251\233\241", "\193\20\179\149\204")].Text = tostring(options[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\5\153\135\135", "\162\183\97\225")]] or "");
		end;
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\215\229\231\12\231\179\108\149", "\193\73\165\132\151\124\130")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\214\167\30\230", "\214\173\162\201\59\214")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\105\163\4\135", "\64\67\25\202\33\183")];
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\199\127\186\33\151\19", "\35\137\142\17\220\78\178")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\79\34\4\62\11\117", "\97\77\46\69")].Information;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\246\14\163\208\154\80", "\197\191\191\96")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\0\227\72\87\173\29", "\45\170\73\141\46\56\136")], LUAOBFUSACTOR_DECRYPT_STR_0("\168\1\203\234", "\103\225\111\173\133\207\231"));
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\173\251\83\67\193\165", "\53\44\228\149")], LUAOBFUSACTOR_DECRYPT_STR_0("\238\212\43\28\139\0\196\200\56\10\217\32\141\247\50\11\192", "\68\173\187\91\101\171"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\7\23\202\76\199\45", "\185\156\111\114\167\41\226\29")].Button, function()
		if setclipboard then
			setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\44\37\3\155\209\47\58\49\8\241\179", "\131\107\101\118\64\212")]);
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\226\217\60\34\66\196\137\229\223\63\40\72\210\205", "\169\161\182\76\75\39\160"), 2);
		end
	end);
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\123\185\141\20\103\248", "\200\185\50\215\235\123\66")], LUAOBFUSACTOR_DECRYPT_STR_0("\209\142\201\251\202\69\19\230\132\153\206\131\120\17", "\122\146\225\185\130\234\22"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\234\197\194\234\254\233", "\219\217\130\160\175\143")].Button, function()
		if setclipboard then
			setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\149\118\24\1\137\112\17\123\236", "\93\94\220\34")]);
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\44\199\209\131\223\243\189\60\193\213\143", "\157\111\168\161\234\186\151"), 2);
		end
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\109\122\39\135\233", "\229\27\32\21\81\162\217\210")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\205\252\63\89\105\156", "\42\76\172\155\90")].Movement;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\160\142\63\69\162", "\96\146\237\225\73")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\83\7\254\12\42", "\194\136\30\104\136\41\26")], LUAOBFUSACTOR_DECRYPT_STR_0("\241\217\21\77\25\181\167\59\156\229\6\92\0\185\167\40\207", "\79\188\182\99\40\116\208\201"));
	makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\238\37\87\102\111", "\95\29\163\74\33\67")], LUAOBFUSACTOR_DECRYPT_STR_0("\75\51\76\60\76\154\1\121\54", "\100\28\82\32\87\31\234"), {LUAOBFUSACTOR_DECRYPT_STR_0("\96\4", "\94\81\50\128\17\155\182\136"),LUAOBFUSACTOR_DECRYPT_STR_0("\222\108", "\231\235\92\132\89\130\212\124"),LUAOBFUSACTOR_DECRYPT_STR_0("\175\228\164", "\37\158\212\148\95\177"),LUAOBFUSACTOR_DECRYPT_STR_0("\37\73\244", "\109\20\124\196\231"),LUAOBFUSACTOR_DECRYPT_STR_0("\242\237\36", "\64\192\221\20\197\81"),LUAOBFUSACTOR_DECRYPT_STR_0("\252\166\178", "\199\207\150\130\194"),LUAOBFUSACTOR_DECRYPT_STR_0("\224\26\43", "\35\213\42\27\136")}, LUAOBFUSACTOR_DECRYPT_STR_0("\241\215\107", "\146\192\231\91\223\184"), function(v)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\222\192\12\252\145\41\58\101\194\198\12\244\144\66\94", "\110\58\145\150\73\177\212\103")] = tonumber(v) or 100;
		applyWalkSpeed();
	end);
	makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\25\197\228\14\155", "\137\148\84\170\146\43\171")], LUAOBFUSACTOR_DECRYPT_STR_0("\43\202\114\237\71\14\200\122\239", "\23\97\191\31\157"), {LUAOBFUSACTOR_DECRYPT_STR_0("\211\210", "\82\230\226\103\101\189"),LUAOBFUSACTOR_DECRYPT_STR_0("\211\122", "\116\235\74\211\209"),LUAOBFUSACTOR_DECRYPT_STR_0("\121\108\142", "\69\72\92\190"),LUAOBFUSACTOR_DECRYPT_STR_0("\103\110\180", "\215\86\91\132\180\203\200\118"),LUAOBFUSACTOR_DECRYPT_STR_0("\97\190\214", "\179\83\142\230")}, LUAOBFUSACTOR_DECRYPT_STR_0("\143\127", "\191\186\79\157\85\89\127\151"), function(v)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\79\137\254\187\117\217\77\129\252\193\21", "\37\150\26\196\174\228")] = tonumber(v) or 50;
		applyJumpPower();
	end);
	makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\221\189\67\114\217", "\233\169\144\210\53\87")], LUAOBFUSACTOR_DECRYPT_STR_0("\17\86\232\217\38\6\192\201\46\82\228\204\46\79\232\206", "\188\66\38\141"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\96\40\20\87\125\37\253\205\100\50\30\93\7\88", "\168\129\48\109\81\19\34\104")], function(s)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\36\41\21\251\26\150\204\91\32\51\31\241\96\235", "\153\23\116\108\80\191\69\219")] = s;
		if s then
			startInfinite();
		else
			stopInfinite();
		end
	end);
	makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\50\242\206\189\219", "\22\41\127\157\184\152\235")], LUAOBFUSACTOR_DECRYPT_STR_0("\57\200\194\198\30\215", "\170\119\167\129"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\223\159\95\170\110\229\213\146\82\161\114\255\212\249\35", "\62\186\144\220\19\227")], toggleNoClip);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\200\220\147\241", "\182\193\156\140")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\77\17\183\245\122\145", "\95\161\44\118\210\134")].Teleport;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\116\35\72\42", "\206\134\32\115\109\26\182\133")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\204\255\86\13", "\61\86\152\175\115\61")], LUAOBFUSACTOR_DECRYPT_STR_0("\157\4\208\53\193\142\49\211\186", "\167\201\97\188\80\177\225\67"));
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\60\180\234\172", "\225\46\104\228\207\156")], LUAOBFUSACTOR_DECRYPT_STR_0("\158\197\191\75\39\92\160\171\234\212\188\14\25\86\179\173\175\211\167\14\24\81\184\186\169\212", "\223\202\160\211\46\87\51\210"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\225\31\121\8\147\185", "\109\182\137\122\20")].Accent, teleportToNearest);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\165\19\227\229\197\198\117\65\189\87\170", "\28\50\201\114\154\128\183\138")] = getPlayerList();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\131\21\247\169\146\28\246\154\138\24\235\175\148\92\162", "\146\202\230\121")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\227\239\7\194\160\140\55\253\251\171\78", "\94\142\143\142\126\167\210\192")][1];
	local _, _, playerDropApi = makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\241\45\164\151", "\167\96\165\125\129")], LUAOBFUSACTOR_DECRYPT_STR_0("\52\211\26\67\65\50\11\184\11\215\15\67\80", "\232\103\182\118\38\34\70\43"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\91\46\250\53\99\25\94\60\247\117\33", "\17\85\55\79\131\80")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\128\181\169\60\220\128\189\156\51\201\156\188\190\122\152", "\95\168\229\217\204")], function(v)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\62\138\140\137\47\131\141\186\55\135\144\143\41\195\217", "\233\234\91\230")] = v;
	end);
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\117\178\54\247", "\199\49\33\226\19")], LUAOBFUSACTOR_DECRYPT_STR_0("\102\94\79\26\215\93\73\87\95\211\93\27\112\26\203\87\88\87\26\195\18\107\79\30\222\87\73", "\167\50\59\35\127"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\27\87\225\173\13\67", "\200\40\115\50\140")].Button, function()
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\40\123\26\240\57\114\27\195\33\118\6\246\63\50\79", "\127\147\77\23")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\227\249\113\115\159\227\241\68\124\138\255\240\102\53\219", "\16\235\134\149\20")] ~= LUAOBFUSACTOR_DECRYPT_STR_0("\146\69\65\230\28\139\13\195\78\92\181\69", "\108\186\43\46\198\108\231"))) then
			teleportToSpecificPlayer(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\186\249\4\127\38\186\241\49\112\51\166\240\19\57\98", "\28\82\223\149\97")]);
		end
	end);
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\1\125\27\253", "\62\205\85\45")], LUAOBFUSACTOR_DECRYPT_STR_0("\71\9\167\187\7\154\1\53\60\173\168\27\140\27\53\32\168\186\22", "\105\21\108\193\201\98\233"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\141\30\243\198\123\138", "\186\32\229\123\158\163\94")].Button, function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\51\117\203\13\160\51\65\115", "\87\100\67\17\170\121\197")] = getPlayerList();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\142\182\133\84\161\235\143\138\140\86\172\235\153\255\208", "\213\142\235\218\224\55")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\178\253\196\28\167\253\128\88", "\165\104\194\153")][1];
		playerDropApi.setOptions(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\32\221\170\237\88\137\194\96", "\237\231\80\185\203\153\61")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\53\140\119\70\177\53\132\66\73\164\41\133\96\0\245", "\37\197\80\224\18")]);
		showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\41\78\77\95\177\11\81\12\116\177\31\80\73\85\188\28\70", "\212\121\34\44\38"), 1.5);
	end);
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\142\26\64\46", "\62\218\218\74\101\30\205\146")], LUAOBFUSACTOR_DECRYPT_STR_0("\113\185\120\230\211\126\112\32\87\187", "\79\34\201\25\145\189\94\36"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\36\239\7\69\17\16", "\52\32\76\138\106\32")].Button, spawnTour);
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\206\0\131\42", "\26\216\154\80\166")], LUAOBFUSACTOR_DECRYPT_STR_0("\235\204\249\3\92\32\192\137\207\66\121\43\201\218", "\76\172\169\141\35\29"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\209\253\14\217\156\168", "\99\188\185\152")].Button, getAllBadges);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\53\163\26\172\151\68", "\195\178\116\214\110")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\246\129\112\210\163\85", "\134\101\151\230\21\161")].Autofarm;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\171\47\64\44\119\176", "\128\201\234\90\52\67\82")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\108\43\96\197\225\29", "\170\196\45\94\20")], LUAOBFUSACTOR_DECRYPT_STR_0("\95\81\17\59\199\33\34\115\4\41\59\198\41\51", "\80\30\36\101\84\161\64"));
	makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\112\12\86\215\126\246", "\91\198\49\121\34\184")], LUAOBFUSACTOR_DECRYPT_STR_0("\21\211\99\182\143\53\212\122\249\172\58\199\117\181\140\48", "\233\84\166\23\217"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\77\204\201\16\0\74\85\199\195\24\0\90\84\221\194\115\113", "\65\24\24\152\134\86")], function(s)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\2\220\102\154\22\218\100\131\18\198\104\158\27\205\109\249\103", "\41\220\87\136")] = s;
		if s then
			startAutofarm();
		else
			stopAutofarm();
		end
	end);
	makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\23\246\228\193\238\117", "\203\69\86\131\144\174")], LUAOBFUSACTOR_DECRYPT_STR_0("\159\31\65\84\136\125\232\21\188", "\113\217\126\51\57\168\48\135"), {LUAOBFUSACTOR_DECRYPT_STR_0("\61\26\34\64", "\174\127\117\86\40\40\31\22"),LUAOBFUSACTOR_DECRYPT_STR_0("\254\58\75", "\187\188\91\44"),LUAOBFUSACTOR_DECRYPT_STR_0("\60\246\125\45\231", "\109\127\151\30\69\130")}, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\176\67\55\227\241\128\59\237\168\88\60\224\149\226", "\118\178\229\23\120\165\176\210")], function(v)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\233\120\38\42\142\19\144\58\241\99\45\41\234\113", "\221\101\188\44\105\108\207\65")] = v;
	end);
	makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\17\2\182\221\19\96", "\178\54\80\119\194")], LUAOBFUSACTOR_DECRYPT_STR_0("\18\14\83\207\175\207\184\208\61\14\79\214", "\162\84\111\33\162\143\153\217"), {LUAOBFUSACTOR_DECRYPT_STR_0("\5\215\28\158\38\213\9", "\234\71\187\125"),LUAOBFUSACTOR_DECRYPT_STR_0("\34\61\87\94", "\158\113\92\49\59")}, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\69\117\95\216\39\232\42\211\70\96\66\215\39\244\51\169\32", "\103\140\16\33\16\158\102\186")], function(v)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\184\137\90\37\29\245\160\130\67\34\14\238\172\147\65\70\108", "\92\167\237\221\21\99")] = v;
	end);
	makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\1\56\50\240\101\125", "\70\159\64\77")], LUAOBFUSACTOR_DECRYPT_STR_0("\241\67\75\191\41\199\74\87\251", "\122\183\47\50\159"), {LUAOBFUSACTOR_DECRYPT_STR_0("\154\97", "\224\162\81\199\47"),LUAOBFUSACTOR_DECRYPT_STR_0("\185\22\99", "\227\136\37\83\93"),LUAOBFUSACTOR_DECRYPT_STR_0("\8\245\88", "\20\57\205\104"),LUAOBFUSACTOR_DECRYPT_STR_0("\122\254\72", "\83\72\203\120\217\122\58"),LUAOBFUSACTOR_DECRYPT_STR_0("\232\185\235", "\223\220\137\219\195\207\221"),LUAOBFUSACTOR_DECRYPT_STR_0("\75\24\15", "\76\115\40\63\130")}, LUAOBFUSACTOR_DECRYPT_STR_0("\214\73\125", "\177\231\122\77\205\214"), function(v)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\63\120\127\154\108\97\54\101\5\249", "\60\36\115\33\32\201")] = tonumber(v) or 130;
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\83\100\118\9\14", "\193\215\22\55\38\44\62\93")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\19\9\202\198\190\127", "\155\79\114\110\175\181")].ESP;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\113\234\212\244\220", "\181\56\52\185\132\209\236")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\105\225\152\0\249", "\154\82\44\178\200\37\201")], LUAOBFUSACTOR_DECRYPT_STR_0("\67\226\17\24\191\68\102\53\163\39\62\142\1", "\21\21\139\98\109\222\40"));
	makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\201\159\188\127\84", "\90\100\140\204\236")], LUAOBFUSACTOR_DECRYPT_STR_0("\137\39\14\140\154\25\191\0\59\222\247\44\163\19\57\192\178", "\120\204\116\94\172\215"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\142\136\55\206\140\81\93\47\152\156\77\187", "\31\99\221\216\104\139\194\16")], function(s)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\147\218\51\44\205\20\130\198\41\45\166\101", "\131\85\192\138\108\105")] = s;
		if not s then
			clearAllESP();
		end
	end);
	makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\129\76\51\115\244", "\99\86\196\31")], LUAOBFUSACTOR_DECRYPT_STR_0("\99\60\64\234\31\133\14\87\39", "\111\48\84\47\157\63\199"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\53\176\152\12\59\33\179\152\11\52\39\162\139\11\62\67\208", "\78\122\102\224\199")], function(s)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\43\68\60\22\36\137\204\195\61\90\34\22\41\139\219\185\72", "\159\156\120\20\99\84\101\206")] = s;
	end);
	makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\52\191\79\141\17", "\71\28\113\236\31\168\33\23")], LUAOBFUSACTOR_DECRYPT_STR_0("\126\246\44\239\153\250\58\164\69\251\48", "\199\45\158\67\152\185\185\91"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\74\141\145\243\55\244\248\127\74\130\139\254\55\245\252\127\93\248\254", "\176\58\25\221\206\176\118\183")], function(s)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\34\233\57\205\153\17\57\252\53\209\157\28\48\251\42\203\156\119\65", "\216\82\113\185\102\142")] = s;
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\121\33\223\110\7\11", "\29\34\59\64\184")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\31\79\207\38\24\66", "\61\114\126\40\170\85")].Bags;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\10\118\62\208\54\156", "\19\172\72\23\89\163")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\126\206\226\38\23\245", "\197\87\60\175\133\85\50")], LUAOBFUSACTOR_DECRYPT_STR_0("\54\127\211\147\57\127\218\210\19\123\217\214\26\106", "\179\116\30\180"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\199\234\174\251\195\227\172\228\194\232\196\187", "\225\139\166\141")] = LUAOBFUSACTOR_DECRYPT_STR_0("\108\135\248", "\64\45\235\148");
	makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\115\59\229\79\144\38", "\181\22\49\90\130\60")], LUAOBFUSACTOR_DECRYPT_STR_0("\32\193\189\7\79\252\183\13\10", "\105\111\177\216"), {LUAOBFUSACTOR_DECRYPT_STR_0("\149\22\196", "\179\212\122\168\114\112"),LUAOBFUSACTOR_DECRYPT_STR_0("\74\127\136\200\122\110\129\201", "\173\25\26\228"),LUAOBFUSACTOR_DECRYPT_STR_0("\35\120\202\181\21\27\121\199\241", "\120\118\22\169\218"),LUAOBFUSACTOR_DECRYPT_STR_0("\245\33\164\227\140", "\134\167\64\214"),LUAOBFUSACTOR_DECRYPT_STR_0("\33\153\247\139\130", "\168\100\233\158\232\169"),LUAOBFUSACTOR_DECRYPT_STR_0("\94\81\30\249\124\80\24\238\107\31", "\156\18\52\121")}, LUAOBFUSACTOR_DECRYPT_STR_0("\98\28\215", "\191\35\112\187\170\228\213\101"), function(v)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\174\123\122\46\25\113\149\160\120\80\123\76", "\31\216\207\28\53\94\124")] = v;
	end);
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\5\170\8\72\100\119", "\59\65\71\203\111")], LUAOBFUSACTOR_DECRYPT_STR_0("\56\176\121\122\203\46\53\16\179\60\90\132\27", "\84\119\192\28\20\235\108"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\246\33\251\31\121\249", "\33\236\158\68\150\122\92\201")].Accent, function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\221\244\92\25", "\89\128\184\153\121\41\145")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\48\180\141\43\132\1\47\233\49\151\149\45\149\1\60\233\112\244", "\91\140\85\196\225\66\231\96")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\28\168\178\191\105\50\191", "\43\83\216\215\209")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\162\160\7\39\72\166\164\14\42\120\179\191\25\47\76\162\245\91", "\78\43\199\208\107")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\87\158\5\16\175\41", "\182\18\232\96\126\219\90\165")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\91\55\164\52\93\38\188\56\90\20\188\50\76\38\175\56\27\119", "\200\93\62\71")].Events:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\105\93\75\212\230\179\9", "\110\38\45\46\186\164\210")));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\187\165\83\110", "\94\24\222\200\118")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\197\43\92\77", "\121\125\160\70")]:FireServer(TABLE_TableIndirection["bagOpenMode%0"]);
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\220\250\62\188\246\238\123\144\242\237\40\232\179", "\210\147\138\91") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\252\207\100\32\22\59\208\199\79\53\86\101", "\115\85\157\168\43\80")], 2);
		else
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\208\74\130\89\174\200\65\137\205\95\138\88\152\204\6\199\240\78\199\81\131\220\72\205", "\169\159\58\231\55\236\169\38"), 2);
		end
	end);
	makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\227\190\23\215\81\44", "\28\113\161\223\112\164\116")], LUAOBFUSACTOR_DECRYPT_STR_0("\231\77\83\118\27\233\72\66\119\27\228\89\64\106\27\234\87\72\105", "\59\166\56\39\25"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\253\232\254\6\226", "\35\210\184\166\168")].AutoOpenBags, function(s)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\124\83\116\97\39", "\23\57\57\29\34\68")].AutoOpenBags = s;
		task.spawn(function()
			while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\20\49\26\21\97", "\76\48\81\127")].AutoOpenBags do
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\160\92\242\90", "\48\110\197\49\215\106\20\189")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\23\88\160\201\40\71\24\24\22\123\184\207\57\71\11\24\87\24", "\108\125\114\40\204\160\75\38")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\26\96\250\3\23\113\248", "\109\85\16\159")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\246\189\87\18\91\177\51\246\169\104\15\87\162\38\244\168\30\75", "\208\71\147\205\59\123\56")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\114\54\129\182\67\51", "\216\55\64\228")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\141\46\206\176\246\234\171\141\58\241\173\250\249\190\143\59\135\233", "\139\223\232\94\162\217\149")].Events:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\250\147\38\255\153\84\205", "\170\181\227\67\145\219\53")));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\128\19\247\9", "\210\57\229\126")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\54\231\227\98", "\227\216\83\138\198\82\165")]:FireServer(TABLE_TableIndirection["bagOpenMode%0"]);
				end
				task.wait(1);
			end
		end);
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\152\191\107\225\34\186\184\107\183\123", "\146\75\213\214\24")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\127\198\65\105\0\5", "\53\42\30\161\36\26\37")].Missions;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\212\254\243\238\240\248\238\238\188\167", "\128\157\153\151")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\88\133\58\6\122\121\123\159\108\69", "\19\22\21\236\73\117")], LUAOBFUSACTOR_DECRYPT_STR_0("\67\202\181\172\229\253\107\182\90\204\177\186\254\178\35\182\81\196\176\164", "\150\23\165\194\201\151\221\77"));
	makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\22\225\9\109\50\231\20\109\126\184", "\122\30\91\136")], LUAOBFUSACTOR_DECRYPT_STR_0("\139\171\242\181\159\255\130\228\162\128", "\237\223\196\133\208"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\45\237\136\27\170", "\154\188\104\163\222\62")].GreedyTowerRunning, function(s)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\200\3\205\85\31", "\162\85\141\77\155\112\47")].GreedyTowerRunning = s;
		task.spawn(function()
			while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\12\136\120\87\121", "\46\114\73\198")].GreedyTowerRunning do
				updateRoot();
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\113\121\251\107\26", "\42\197\30\22\143\78")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\74\72\58\97\0\15", "\95\19\37\63")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\35\181\247\98\23\112\47\162\185\33", "\103\17\76\199\156\17")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\135\37\146\237\78", "\154\211\74\229\136\60\112\217")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\19\248\198\22\87\174\31\239\136\85", "\39\207\124\138\173\101")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\227\0\83", "\194\174\97\35\160")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\47\47\9\236\48\60\1\250\101\109", "\98\159\64\93")].Map:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\58\190\58\26\3", "\68\110\209\77\127\113\102\59")));
					if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\235\176\74\17\134\254", "\206\206\132\199\47\99\163")] then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\195\197\117\84\226\135\135", "\49\150\162\183\18")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\37\172\36\8\165\72", "\120\41\74\219\65\122\128")].PrimaryPart or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\9\75\31\247\226\133", "\181\58\102\60\122\133\199")]:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\113\227\207\28\74\82\240\200", "\26\51\130\188\121"));
						if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\131\62\30\76\10\178\9", "\57\136\226\76\121\41\126\151")] then
							safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\214\27\84\33\247\56\114", "\29\66\183\105\51\68\131")].CFrame * CFrame.new(0, 3, 0));
						end
					end
				end
				task.wait(0.5);
			end
		end);
	end);
	makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\8\64\221\86\44\70\192\86\96\25", "\174\37\69\41")], LUAOBFUSACTOR_DECRYPT_STR_0("\172\185\64\5\21\152\246\104\15\2\140", "\112\225\214\46\110"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\1\13\109\161\237", "\140\126\68\67\59\132\221")].GreedyMonkeyRunning, function(s)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\84\41\125\8\79", "\230\226\17\103\43\45\127")].GreedyMonkeyRunning = s;
		task.spawn(function()
			while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\105\234\125\194\128", "\231\176\44\164\43")].GreedyMonkeyRunning do
				updateRoot();
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\201\43\189\235\220", "\236\193\166\68\201\206")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\52\198\122\1\34\141\33", "\17\100\91\168")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\169\158\231\160\51\122\89\163\201\188", "\27\58\198\236\140\211\67")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\12\194\194\65\140\242", "\139\65\173\172\42\233")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\89\99\211\215\103\225\75\130\19\33", "\40\231\54\17\184\164\23\128")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\169\200\111", "\138\228\169\31\152\229")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\3\80\62\243\211\205\15\71\112\176", "\163\172\108\34\85\128")].Map:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\10\30\249\140\222\93", "\52\71\113\151\231\187\36\232")));
					if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\130\118\166\115\148\61\253", "\205\22\237\24")] then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\121\97\207\60\170\61\35", "\89\222\24\19\168")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\86\93\188\20\236\28\3", "\113\149\57\51\215")].PrimaryPart or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\127\197\189\231\217\60\32", "\160\25\16\171\214\130")]:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\83\217\36\120\77\211\153\101", "\235\17\184\87\29\29\178"));
						if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\168\107\255\245\190\236\41", "\144\202\201\25\152")] then
							safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\218\22\121\254\94\162\80", "\96\89\187\100\30\155\42\135")].CFrame * CFrame.new(0, 3, 0));
						end
					end
				end
				task.wait(0.5);
			end
		end);
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\255\6\88\117\113\33\136\83", "\29\77\173\99\42\26")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\207\14\105\72\230\248\3\151\167\87", "\109\228\130\103\26\59\143\151")], LUAOBFUSACTOR_DECRYPT_STR_0("\174\113\189\202\55\69\33\196\177\125\188\214\50\70", "\228\227\24\206\185\94\42\79"));
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\16\50\186\187\23\60\139\114", "\80\174\66\87\200\212\123")], LUAOBFUSACTOR_DECRYPT_STR_0("\249\124\44\199\251\31\139\84\55\219\228\26\196\119\126\225\249\0\223\120\48\220", "\115\171\25\94\168\151"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\186\225\44\242\73\226", "\151\108\210\132\65")].Accent, function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\81\4\13\150", "\52\184\52\105\40\166\33\167")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\11\221\164\51\215\205\70\11\201\155\46\219\222\83\9\200\237\106", "\172\50\110\173\200\90\180")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\201\191\230\67\247\182\217\69\232\169\253\67\245", "\44\155\218\148")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\254\60\55\221\36\176\249\254\40\8\192\40\163\236\252\41\126\132", "\209\141\155\76\91\180\71")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\214\107\218\69\14\224", "\122\147\29\191\43")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\213\78\5\211\252\141\106\185\212\109\29\213\237\141\121\185\149\14", "\30\220\176\62\105\186\159\236")].Events:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\186\216\151\191\58\217\154\180\155\206\140\191\56", "\221\232\189\229\208\86\181\215")));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\177\249\153\126", "\78\108\212\148\188")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\21\25\103\188", "\90\91\112\116\66\140\96\219")]:FireServer();
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\232\94\25\31\233\167\10\133\101\15\30\239\164\8\192\83", "\100\165\55\106\108\128\200"), 2);
		else
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\247\206\35\188\201\199\113\129\192\198\62\167\192\139\31\188\209\139\23\188\208\197\53", "\211\165\171\81"), 2);
		end
	end);
	makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\71\215\216\216\208\8\48\130", "\188\100\21\178\170\183")], LUAOBFUSACTOR_DECRYPT_STR_0("\95\2\68\188\242\255\123\5\95\191\190\141\83\30\67\160\187\194\112\4", "\173\30\119\48\211\210"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\252\23\12\30\137", "\90\59\185\89")].AutoRerollMissions, function(s)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\213\116\121\126\45", "\29\32\144\58\47\91")].AutoRerollMissions = s;
		task.spawn(function()
			while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\16\95\139\4\241", "\193\115\85\17\221\33")].AutoRerollMissions do
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\126\3\91\255", "\188\141\27\110\126\207")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\51\78\123\237\235\8\153\51\90\68\240\231\27\140\49\91\50\180", "\105\237\86\62\23\132\136")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\139\76\46\66\47\17\148\64\47\94\42\18\183", "\125\217\41\92\45\67")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\177\22\83\138\88\88\160\3\91\176\79\86\166\7\88\134\30\9", "\59\57\212\102\63\227")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\88\254\122\9\105\251", "\103\29\136\31")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\43\202\38\79\29\47\206\47\66\45\58\213\56\71\25\43\159\122", "\38\126\78\186\74")].Events:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\243\69\56\133\75\136\236\73\57\153\78\139\207", "\228\161\32\74\234\39")));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\129\7\240\160", "\224\94\228\106\213\144\225\84")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\237\74\133\81", "\97\208\136\39\160")]:FireServer();
				end
				task.wait(2);
			end
		end);
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\4\202\149\90\87\107", "\91\150\73\163\230\57\114")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\172\181\83\227\78\238", "\63\46\205\210\54\144\107\222")].Misc;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\1\253\84\223\181\124", "\188\144\76\148\39")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\102\124\183\79\73\114", "\53\229\43\21\196\44\108\66")], LUAOBFUSACTOR_DECRYPT_STR_0("\6\33\30\169\58\33\30\160\32", "\197\83\85\119"));
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\215\23\36\76\191\78", "\87\47\154\126")], LUAOBFUSACTOR_DECRYPT_STR_0("\25\125\198\212\219\218\107\75\201\201\196\209\57", "\180\75\24\172\187\178"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\209\224\14\121\97\169", "\112\163\185\133\99\28\68\153")].Button, function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\81\240\206\187\91\238\223\152\81\238\221\162\87\249\142\251", "\171\203\52\156")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
	end);
	makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\231\116\162\41\196\237", "\192\218\170\29\209\74\225\221")], LUAOBFUSACTOR_DECRYPT_STR_0("\176\217\73\22\202\95\105\213\140\204", "\157\227\188\59\96\175\45\73"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\194\210\27\52\250\154", "\81\223\170\183\118")].Button, function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\68\160\190\233\61\3\50\114\169\169\239\59\18\35\4\252", "\113\70\33\204\219\153\82")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
	end);
	switchTab(LUAOBFUSACTOR_DECRYPT_STR_0("\216\140\57\51\236\189\240\150\54\51\240", "\208\145\226\95\92\158"));
end
createUI();
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\196\243\122\170\165", "\120\222\129\189\44\143\149\207")].GreedyHudzell_Ready = true;
print(LUAOBFUSACTOR_DECRYPT_STR_0("\191\54\15\180\207\79\96\133\196\34\8\178\201\78\106\171\130\4\17\189\211\11\123\183\139\5\24\181\138\77\108\180\136\81\15\180\217\95\118\170\129\21\93\167\207\89\106\177\139\31\83", "\216\228\113\125\209\170\43\25"));
