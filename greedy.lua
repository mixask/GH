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
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\202\213\33\211\146\130\78", "\126\177\163\187\69\134\219\167")] = loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\43\217\62\213\239\121\130\101\215\253\52\131\45\204\232\43\216\40\208\239\38\223\41\202\242\55\200\36\209\178\32\194\39\138\218\44\194\62\196\251\38\222\63\214\179\20\196\36\193\201\10\130\39\196\245\45\130\46\204\239\55\130\39\196\245\45\131\38\208\253", "\156\67\173\74\165")))();
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\158\103\50\147\17\121\0\158\125\58\153\99\22", "\38\84\215\41\118\220\70")] = LUAOBFUSACTOR_DECRYPT_STR_0("\119\4\39\23\250\73\86\10\7\250\74\19\46\30", "\158\48\118\66\114");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\1\34\5\90\138\213\238\116", "\155\203\68\112\86\19\197")] = LUAOBFUSACTOR_DECRYPT_STR_0("\80\137\120\170\14\40\165\207\79\211\50\201\105", "\152\38\189\86\156\32\24\133");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\126\147\99\195\98\149\106\185\7", "\38\156\55\199")] = LUAOBFUSACTOR_DECRYPT_STR_0("\160\105\104\56\0\46\181\12\175\111\121\45\23\109\242\86\172\103\121\36\31\58\226\90\178", "\35\200\29\28\72\115\20\154");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\150\226\252\162\30\16\38\152\249\154\221", "\84\121\223\177\191\237\76")] = LUAOBFUSACTOR_DECRYPT_STR_0("\179\66\221\176\41\10\127\142\191\95\218\163\53\66\52\143\188\81\134\179\56\102\37\192\143\15\200\242\14", "\161\219\54\169\192\90\48\80");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\119\37\16\108\125\51\6\123\107\48\17\118\119\50\9\12\18", "\69\41\34\96")] = LUAOBFUSACTOR_DECRYPT_STR_0("\180\215\195\26\17\113\243\140\208\24\7\46\184\218\223\31\6\49\185\207\219\68\26\50\166\140\219\5\3\47\185\209\153\6\23\42", "\75\220\163\183\106\98");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\149\172\24\230\43\158\206\103", "\185\98\218\235\87")] = LUAOBFUSACTOR_DECRYPT_STR_0("\217\62\63\231\205\185\206\40\46\226\132\229\132\109\119\182\135\251\155\108\119\178\138\250\153\105\116\179", "\202\171\92\71\134\190");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\205\45\145\44\211\63\205\121", "\232\73\161\76")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\139\213\67\68\27\169\202", "\126\219\185\34\61"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\193\76\121\109\103\242\228\9\139\14", "\135\108\174\62\18\30\23\147")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\129\230\56\192\11\190\50\196\179", "\167\214\137\74\171\120\206\83"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\245\34\81\241\164\138\228\55\89\203\179\132\226\51\90\253\226\219", "\199\235\144\82\61\152")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\53\19\169\39\14\21\184\63\2\18\138\63\8\4\184\44\2", "\75\103\118\217"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\65\126\39\188\12\209\93\115\17\252\78", "\126\167\52\16\116\217")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\250\59\46\179\177\11\234\193\45\37", "\156\168\78\64\224\212\121"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\249\160\203\9\221\160\220\17\231\166\203\66\190", "\174\103\142\197")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\98\63\90\61\43\109\253\68\62\86\59\32", "\152\54\72\63\88\69\62"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\193\226\89\196\203\252\72\231\193\252\74\221\199\235\25\132", "\60\180\164\142")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\108\91\9\44\55\226\0\76\109\0\59\49\228\17\93", "\114\56\62\101\73\71\141"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\224\201\208\173\232\215\237\182\249\206\208\149\232\213\197\191\236\201\129\232", "\164\216\137\187")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\228\239\35\166\179\255\7\251\232\33\167\178\211\10\220\231\54\183\180", "\107\178\134\81\210\198\158"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\26\150\214\153\61\28\148\207\169\61\75\210", "\202\88\110\226\166")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\235\27\150\231\249\198\29\148\254\201\198", "\170\163\111\226\151"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\60\179\33\75\37\108\65", "\73\113\80\210\88\46\87")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\32\204\11\226\147\63\136\66", "\135\225\76\173\114")].LocalPlayer or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\225\185\169\169\175\180\95\189", "\199\122\141\216\208\204\221")].PlayerAdded:Wait();
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\248\62\198\61\166", "\150\205\189\112\144\24")] = (getgenv and getgenv()) or _G;
if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\161\145\122\65\216", "\112\69\228\223\44\100\232\113")].GreedyHudzell_Ready and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\58\41\229\243\44", "\230\180\127\103\179\214\28")].GreedyHudzell_JobId == game.JobId)) then
	warn(LUAOBFUSACTOR_DECRYPT_STR_0("\183\34\77\67\225\69\249\177\69\94\74\246\68\225\136\28\31\74\235\64\228\137\1", "\128\236\101\63\38\132\33"));
	return;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\140\63\114\243\187", "\175\204\201\113\36\214\139")].GreedyHudzell_JobId = game.JobId;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\233\27\234\65\23", "\100\39\172\85\188")].GreedyHudzell_Ready = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\93\151\182\118\253", "\83\205\24\217\224")].GreedyTowerRunning = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\224\227\11\163\149", "\93\134\165\173")].GreedyMonkeyRunning = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\215\239\244\127\158", "\30\222\146\161\162\90\174\210")].GreedySpeedFarm = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\107\94\60\160\30", "\106\133\46\16")].GreedyTowerFind = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\19\67\195\127\110\121\2\95\217\126\5\8", "\32\56\64\19\156\58")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\251\213\105\120\211\167\105\247\192\120\123\208\172\127\236\160\6", "\224\58\168\133\54\58\146")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\101\123\194\69\170\166\50\124\100\120\194\80\168\166\41\117\115\111\184\37", "\107\57\54\43\157\21\230\231")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\190\37\218\159\253\253\246\180\52\219\152\254\227\254\175\84\165", "\175\187\235\113\149\217\188")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\154\181\99\197\88\74\17\144\172\99\199\92\61\108", "\24\92\207\225\44\131\25")] = LUAOBFUSACTOR_DECRYPT_STR_0("\105\220\172\68", "\29\43\179\216\44\123");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\236\20\99\155\248\18\97\130\239\1\126\148\248\14\120\248\137", "\44\221\185\64")] = LUAOBFUSACTOR_DECRYPT_STR_0("\50\230\78\90", "\19\97\135\40\63");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\112\10\4\28\1\139\121\23\126\127", "\81\206\60\83\91\79")] = 130;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\138\232\77\28\226\107\129\113\152\224\87\10\231\8\244", "\196\46\203\176\18\79\163\45")] = 180;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\12\74\55\27\217\206\150\29\91\48\5\217\195\157\6\59\78", "\143\216\66\30\126\68\155")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\237\59\226\228\151\254\206\132\247\44\230\234\150\249\213\239\152", "\129\202\168\109\171\165\195\183")] = 2.5;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\119\20\244\247\36\217\7\118\22\250\242\49\194\103\8", "\134\66\56\87\184\190\116")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\30\49\157\53\210\30\16\18\16\43\151\60\207\100\101", "\85\92\81\105\219\121\139\65")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\131\117\96\88\224\208\134\124\113\67\240\211\246\0", "\191\157\211\48\37\28")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\42\217\44\5\242\42\216\40\5\240\49\177\76", "\90\191\127\148\124")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\168\17\49\89\171\2\40\93\169\15\53\84\162\10\82\40", "\119\24\231\78")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\2\147\111\241\101\63\182\18\150\122\249\101\53\199\125", "\113\226\77\197\42\188\32")] = 100;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\35\217\133\5\38\219\130\31\36\177\229", "\213\90\118\148")] = 50;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\0\128\127\114\122\8\159\105\104\117\15\150\122\104\127\107\228", "\45\59\78\212\54")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\115\169\164\175\0\146\193\37\115\182\174\185\11\131\209\50\122\166\175\195\126", "\144\112\54\227\235\230\78\205")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\41\8\223\223\78\189\60\10\238\149\11", "\59\211\72\111\156\176")] = 0;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\146\247\34\72\134\241\32\125\147\226\63\90\179\234\32\75\194\179", "\77\46\231\131")] = os.time();
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\65\164\82\191\90\162\102\182\77\130\87\191\81\184\5\234", "\32\218\52\214")] = nil;
local cameraFrozen, savedCameraCFrame = false, nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\54\28\141\195\145\122\119\97\51\20\237\161", "\58\46\119\81\200\145\208\37")] = 1;
local entityESP, playerESP, ignoreList = {}, {}, {};
local noclipConn, boxFlyConn, speedConn, noFallConn, antiAfkConn, bodyVelocity;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\163\30\135\140\132\9\28\179\24\131\133\153\115\123", "\86\75\236\80\204\201\221")] = 1.9;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\110\89\174\219\178\77\119\82\171\202\206\34", "\235\18\33\23\229\158")] = Vector3.new(-311.12, 85.56, -443.3);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\155\243\146\100\131\254\152\127\150\238\137\99\255\145", "\219\48\218\161")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\209\127\127\70\214\66\239\234", "\128\132\17\28\41\187\47")]=Color3.fromRGB(0, 255, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\51\51\20\63", "\61\97\82\102\90")]=Color3.fromRGB(127, 0, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\62\162\72", "\105\204\78\203\43\167\55\126")]=Color3.fromRGB(0, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\175\36\27\29\0\198\67\188", "\49\197\202\67\126\115\100\167")]=Color3.fromRGB(255, 244, 119),[LUAOBFUSACTOR_DECRYPT_STR_0("\2\87\203\32\141\87\74\50", "\62\87\59\191\73\224\54")]=Color3.fromRGB(255, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\196\13\247\196\232\12", "\169\135\98\154")]=Color3.fromRGB(180, 150, 100)};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\86\22\125\201\10\247\228\69\0\113\207\118\152", "\168\171\23\68\52\157\83")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\215\126\248\160\42\35", "\231\148\17\149\205\69\77"),LUAOBFUSACTOR_DECRYPT_STR_0("\181\169\196\244\90\242\143\169", "\159\224\199\167\155\55"),LUAOBFUSACTOR_DECRYPT_STR_0("\197\242\46\215", "\178\151\147\92"),LUAOBFUSACTOR_DECRYPT_STR_0("\169\237\69\49", "\26\236\157\44\82\114\44"),LUAOBFUSACTOR_DECRYPT_STR_0("\6\43\210\94\36\42\212\73\51", "\59\74\78\181"),LUAOBFUSACTOR_DECRYPT_STR_0("\16\221\78\83\190\36\197\95", "\211\69\177\58\58")};
local FARM_RARITY, ESP_RARITY = {}, {};
for _, r in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\196\75\220\221\242\136\202\75\209\204\249\242\181", "\171\215\133\25\149\137")]) do
	FARM_RARITY[r] = true;
	ESP_RARITY[r] = true;
end
pcall(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\193\60\254\218\25\185\18", "\34\129\168\82\154\143\80\156")]:AddTheme({[LUAOBFUSACTOR_DECRYPT_STR_0("\171\179\62\14", "\233\229\210\83\107\40\46")]=LUAOBFUSACTOR_DECRYPT_STR_0("\230\80\55\211\1\216\101\61\218\1", "\101\161\34\82\182"),[LUAOBFUSACTOR_DECRYPT_STR_0("\202\12\90\245\220\240\141\59\230\9", "\78\136\109\57\158\187\130\226")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\125\111\250\161\63\111\172", "\145\94\95\153")),[LUAOBFUSACTOR_DECRYPT_STR_0("\220\206\23\208\64\163", "\215\157\173\116\181\46")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\118\229\221\163\136\101\236", "\186\85\212\235\146")),[LUAOBFUSACTOR_DECRYPT_STR_0("\230\136\23\242\54\233", "\56\162\225\118\158\89\142")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\31\84\146\254\114\136\93", "\184\60\101\160\207\66")),[LUAOBFUSACTOR_DECRYPT_STR_0("\30\151\104\176\56\140\121", "\220\81\226\28")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\80\214\219\250\184\149\68", "\167\115\181\226\155\138")),[LUAOBFUSACTOR_DECRYPT_STR_0("\214\39\255\72", "\166\130\66\135\60\27\17")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\7\76\200\112\53\70\76", "\80\36\42\174\21")),[LUAOBFUSACTOR_DECRYPT_STR_0("\126\28\54\121\75\24\56\118\74\21\37", "\26\46\112\87")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\250\122\170\44\234\234\16", "\212\217\67\203\20\223\223\37")),[LUAOBFUSACTOR_DECRYPT_STR_0("\152\152\188\198\181\131", "\178\218\237\200")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\245\231\231\130\226\228\182", "\176\214\213\134")),[LUAOBFUSACTOR_DECRYPT_STR_0("\221\174\185\218", "\57\148\205\214\180\200\54")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\81\251\51\55\37\67\248", "\22\114\157\85\84")),[LUAOBFUSACTOR_DECRYPT_STR_0("\240\196\20\195\81\243", "\200\164\171\115\164\61\150")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\253\247\90\68\209\236\163", "\227\222\148\99\37")),[LUAOBFUSACTOR_DECRYPT_STR_0("\0\94\91\242\252\33", "\153\83\50\50\150")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\30\112\117\31\32\250\72", "\45\61\22\19\124\19\203")),[LUAOBFUSACTOR_DECRYPT_STR_0("\226\26\8\246\9\114\182\217", "\217\161\114\109\149\98\16")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\81\35\97\125\238\38\69", "\20\114\64\88\28\220"))});
end);
local function notify(title, content)
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\8\220\176\205\249\248\97", "\221\81\97\178\212\152\176")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\249\238\9\247\31", "\122\173\135\125\155")]=tostring(title),[LUAOBFUSACTOR_DECRYPT_STR_0("\167\206\14\173\58\63\220", "\168\228\161\96\217\95\81")]=tostring(content),[LUAOBFUSACTOR_DECRYPT_STR_0("\255\196\60\93\59\94\212\223", "\55\187\177\78\60\79")]=3});
	end);
end
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
local function getRoot()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\198\94\249\3\159", "\224\77\174\63\139\38\175")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\77\89\55\129\83\29\126", "\78\228\33\56")].Character;
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\118\179\17\192\158", "\229\174\30\210\99")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\229\135\67\168\109", "\89\123\141\230\49\141\93")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\219\100\251\13\30\69\250\117\196\3\31\94\195\112\228\24", "\42\147\17\150\108\112"));
end
local function getHumanoid()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\174\44\109\162\184", "\136\111\198\77\31\135")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\5\166\79\184\246\82\249", "\201\98\105\199\54\221\132\119")].Character;
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\4\130\51\71\101", "\204\217\108\227\65\98\85")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\203\244\247\105\144", "\160\62\163\149\133\76")]:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\254\181\0\46\205\217\169\9", "\163\182\192\109\79"));
end
local function safeTeleport(cf)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\99\80", "\149\84\70\96\160")] = getRoot();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\67\93", "\141\88\102\109")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\22\154", "\161\211\51\170\16\122\93\53")].CFrame = cf;
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\235\226", "\72\155\206\210")].AssemblyLinearVelocity = Vector3.zero;
		end);
	end
end
local function applyWalkSpeed()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\111\89\75\99", "\83\38\26\52\110")] = getHumanoid();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\2\42\3\8", "\38\56\119\71")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\250\85\147\117", "\54\147\143\56\182\69")].WalkSpeed = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\177\218\108\251\233\172\202\101\235\233\174\209\12\143", "\191\182\225\159\41")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\61\30\112\166\162\236\31\45\27\101\174\162\230\110\66", "\162\75\114\72\53\235\231")]) or 16;
	end
end
local function applyJumpPower()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\41\73\167\3", "\98\236\92\36\130\51")] = getHumanoid();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\12\1\255\21", "\80\196\121\108\218\37\200\213")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\102\15\58\27", "\234\96\19\98\31\43\110")].UseJumpPower = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\10\95\130\252", "\235\102\127\50\167\204\18")].JumpPower = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\148\216\19\123\3\101\141\193\28\107\0\21\241", "\78\48\193\149\67\36")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\43\173\40\126\0\49\183\61\115\117\78", "\33\80\126\224\120")]) or 50;
	end
end
local function toggleNoClip(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\135\32\232\117\220\151\38\234\125\206\132\38\224\25\188", "\60\140\200\99\164")] = state;
	if noclipConn then
		noclipConn:Disconnect();
		noclipConn = nil;
	end
	if not state then
		return;
	end
	noclipConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\225\10\21\167\149\226\13\37\167\194\164", "\194\231\148\100\70")].Stepped:Connect(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\68\192\177\179\152", "\168\38\44\161\195\150")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\240\131\111\53\250\243\70", "\118\224\156\226\22\80\136\214")].Character;
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\230\88\146\7\190", "\224\34\142\57")] then
			return;
		end
		for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\175\196\207\54\161", "\110\190\199\165\189\19\145\61")]:GetDescendants()) do
			if p:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\248\234\100\237\187\198\200\255", "\167\186\139\23\136\235")) then
				p.CanCollide = false;
			end
		end
	end);
end
local function stopInfinite()
	if speedConn then
		speedConn:Disconnect();
		speedConn = nil;
	end
	if bodyVelocity then
		pcall(function()
			bodyVelocity:Destroy();
		end);
		bodyVelocity = nil;
	end
end
local function startInfinite()
	stopInfinite();
	speedConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\160\134\62\31\167\158\4\25\176\205\93", "\109\122\213\232")].Heartbeat:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\199\135\21\202\200\143\5\194\195\157\31\192\178\242", "\80\142\151\194")] then
			return;
		end
		local r, hum = getRoot(), getHumanoid();
		if (not r or not hum) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\207\101\9\83", "\44\99\166\23")] = hum.MoveDirection;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\254\59\115\99", "\196\28\151\73\86\83")].Magnitude > 0.05) then
			if (not bodyVelocity or not bodyVelocity.Parent) then
				bodyVelocity = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\209\12\45\9\180\93\20\121\240\10\61\9", "\22\147\99\73\112\226\56\120"));
				bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000);
				bodyVelocity.Parent = r;
			end
			bodyVelocity.Velocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\124\240\176\221", "\237\216\21\130\149")].X * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\97\105\122\157\236\112\182\113\108\111\149\236\122\199\30", "\62\226\46\63\63\208\169")], 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\16\71\198\79", "\62\133\121\53\227\127\109\79")].Z * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\59\4\208\251\139\140\36\43\1\197\243\139\134\85\68", "\194\112\116\82\149\182\206")]);
		elseif bodyVelocity then
			bodyVelocity.Velocity = Vector3.zero;
		end
	end);
end
local function stopBoxFly()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\135\116\62\236\219\49\28\134\109\58\236\199\42\124\248", "\110\89\200\44\120\160\130")] = false;
	if boxFlyConn then
		boxFlyConn:Disconnect();
		boxFlyConn = nil;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\134\27", "\45\203\163\43\38\35\42\91")] = getRoot();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\192\140", "\52\178\229\188\67\231\201")] then
		for _, v in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\4\0", "\67\65\33\48\100\151\60")]:GetChildren()) do
			if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\253\232\170\193\197\218\235\161\219\250\203\254", "\147\191\135\206\184")) and (v.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\163\58\163\196\220\74\144\139\48\128\205\193", "\210\228\72\198\161\184\51"))) then
				v:Destroy();
			end
		end
	end
end
local function startBoxFly()
	stopBoxFly();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\102\203\54\95\247\9\108\221\49\81\226\19\109\182\64", "\174\86\41\147\112\19")] = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\41\190\78\117", "\203\59\96\237\107\69\111\113")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\17\5\169\243\24\254\199\49\2\159\228\35\230\222\39\19", "\183\68\118\204\129\81\144"));
	boxFlyConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\184\126\215\14\144\24\164\115\225\78\210", "\226\110\205\16\132\107")].RenderStepped:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\236\216\255\109\210\252\197\247\96\201\239\197\253\4\187", "\33\139\163\128\185")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\29\84", "\190\55\56\100")] = getRoot();
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\234\108", "\147\54\207\92\126\115\131")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\39\112\45", "\30\109\81\85\29\109")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\52\4", "\156\159\17\52\214\86\190")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\137\253\184\185\170\246\159\179\182\201\177\165", "\220\206\143\221"));
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\107\104\71", "\178\230\29\77\119\184\172")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\168\79\75", "\152\149\222\106\123\23")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\255\41\242\90\131\216\42\249\64\188\201\63", "\213\189\70\150\35"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\67\49\88", "\104\47\53\20")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\132\94\132\25\184\22\129\67\153\58\176\22", "\111\195\44\225\124\220");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\80\69\35", "\203\184\38\96\19\203")].MaxForce = Vector3.new(4000, 4000, 4000);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\101\60\17", "\174\89\19\25\33")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\87\2", "\107\79\114\50\46\151\231")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\167\184\108\218", "\160\89\198\213\73\234\89\215")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\126\166\245\214\88\112\183\251\128\24", "\165\40\17\212\158")].CurrentCamera;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\208\26\118\118", "\70\133\185\104\83")] = Vector3.zero;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\108\119\111\153", "\169\100\37\36\74")]:IsKeyDown(Enum.KeyCode.W) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\142\176\21\80", "\48\96\231\194")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\83\28\104\73", "\227\168\58\110\77\121\184\207")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\61\178\5\225", "\197\27\92\223\32\209\187\17")].CFrame.LookVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\118\240\190\83", "\155\99\63\163")]:IsKeyDown(Enum.KeyCode.S) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\216\179\200\233", "\228\226\177\193\237\217")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\185\49\163\100", "\134\84\208\67")] - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\173\139\25\67", "\60\115\204\230")].CFrame.LookVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\19\216\53\183", "\16\135\90\139")]:IsKeyDown(Enum.KeyCode.A) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\125\20\118\30", "\24\52\20\102\83\46\52")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\38\51\97\95", "\111\164\79\65\68")] - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\216\142\155\126", "\138\166\185\227\190\78")].CFrame.RightVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\93\246\114\2", "\121\171\20\165\87\50\67")]:IsKeyDown(Enum.KeyCode.D) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\49\171\115\233", "\98\166\88\217\86\217")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\255\107\68\214", "\188\150\150\25\97\230")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\136\82\71\92", "\141\186\233\63\98\108")].CFrame.RightVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\195\31\243\117", "\69\145\138\76\214")]:IsKeyDown(Enum.KeyCode.Space) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\198\155\204\239", "\118\16\175\233\233\223")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\141\39\254\190", "\29\235\228\85\219\142\235")] + Vector3.new(0, 1, 0);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\253\137\152\39", "\50\93\180\218\189\23\46\71")]:IsKeyDown(Enum.KeyCode.LeftControl) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\173\73\9\20", "\40\190\196\59\44\36\188")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\76\206\241\170", "\109\92\37\188\212\154\29")] - Vector3.new(0, 1, 0);
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\230\182\134\97", "\58\100\143\196\163\81")].Magnitude > 0) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\75\49\230\111", "\110\122\34\67\195\95\41\133")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\184\73\15\134", "\182\21\209\59\42")].Unit * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\120\243\56\12\155\153\99\250\46\17\155\146\115\128\77", "\222\215\55\165\125\65")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\199\131\74", "\42\76\177\166\122\146\161\141")].Velocity = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\131\23\139\41", "\22\197\234\101\174\25")];
	end);
end
local function setupNoFall()
	if noFallConn then
		noFallConn:Disconnect();
		noFallConn = nil;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\33\168\153\38", "\230\77\84\197\188\22\207\183")] = getHumanoid();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\1\203\185\220", "\85\153\116\166\156\236\193\144")] then
		return;
	end
	noFallConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\245\64\246\180", "\96\196\128\45\211\132")].HealthChanged:Connect(function(hp)
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\162\68\121\243\131\152\231\16\163\90\125\254\138\144\157\101", "\184\85\237\27\63\178\207\212")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\76\4\26\88", "\63\104\57\105")] and ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\146\169\1\91", "\36\107\231\196")].MaxHealth - hp) < 25)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\160\175\194\13", "\231\61\213\194")].Health = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\184\48\54\89", "\19\105\205\93")].MaxHealth;
		end
	end);
end
local function setAntiAfk(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\38\234\168\0\136\46\245\190\26\135\41\252\173\26\141\77\142", "\95\201\104\190\225")] = state;
	if antiAfkConn then
		antiAfkConn:Disconnect();
		antiAfkConn = nil;
	end
	if not state then
		return;
	end
	antiAfkConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\199\192\215\170\217\132\158", "\174\207\171\161")].Idled:Connect(function()
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\235\72\163", "\183\141\158\109\147\152")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\26\0\244\24\57\8\234\57\63\12\244", "\108\76\105\134"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\208\244\177", "\174\139\165\209\129")]:CaptureController();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\166\167\145", "\24\195\211\130\161\166\99\16")]:ClickButton2(Vector2.new());
		end);
	end);
end
local function setupRejoinQueue()
	if not queue_on_teleport then
		return;
	end
	pcall(function()
		queue_on_teleport(('loadstring(game:HttpGet("%s"))()'):format(TABLE_TableIndirection["QUEUE_SCRIPT_URL%0"]));
	end);
end
local function isUUIDName(name)
	return (type(name) == LUAOBFUSACTOR_DECRYPT_STR_0("\85\23\251\37\93\17", "\118\38\99\137\76\51")) and (string.match(name, LUAOBFUSACTOR_DECRYPT_STR_0("\195\99\29\87\17\101\229\99\29\87\17\101\229\99\29\87\17\101\176\99\29\87\17\101\229\99\29\87\68\101\229\99\29\87\17\101\229\99\72\87\17\101\229\99\29\87\17\101\176\99\29\87\17\101\229\99\29\87\17\101\229\99\29\87\17\101\229\99\29\87\17\101\229\98", "\64\157\70\101\114\105")) ~= nil);
end
local function getMainPart(inst)
	if not inst then
		return nil;
	end
	if inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\109\167\163\230\28", "\112\32\200\199\131")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\81\85\182\134\251", "\66\76\48\60\216\163\203")] = inst:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\151\135\112\253", "\68\218\230\25\147\63\174"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\43\90\66\243\253", "\214\205\74\51\44")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\77\235\242\50\170", "\23\154\44\130\156")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\51\167\190\171\6\18\3\178", "\115\113\198\205\206\86"))) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\86\247\84\193\7", "\58\228\55\158")];
		end
		return inst.PrimaryPart or inst:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\150\136\195\43\12\172\39\160", "\85\212\233\176\78\92\205"));
	end
	return (inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\104\89\155\231\122\89\154\246", "\130\42\56\232")) and inst) or nil;
end
local function detectRarity(model)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\186\40\236\82\15\235\167\48\166\16", "\95\138\213\68\131\32")] = getMainPart(model);
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\39\173\76\100\26\41\179\87\51\122", "\22\74\72\193\35")] then
		return LUAOBFUSACTOR_DECRYPT_STR_0("\15\118\233\85\35\119", "\56\76\25\132");
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\132\251", "\175\62\161\203\70")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\210\207\28\39\12\220\209\7\112\108", "\85\92\189\163\115")].Color;
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\233\96", "\88\73\204\80")].R > 0.7) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\198\64", "\186\78\227\112\38\73")].G < 0.35) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\18\173", "\26\156\55\157\53\51")].B < 0.35)) then
		return LUAOBFUSACTOR_DECRYPT_STR_0("\185\212\2\208\181\81\152\221", "\48\236\184\118\185\216");
	end
	local best, bestDist = LUAOBFUSACTOR_DECRYPT_STR_0("\198\178\90\61\192\58", "\84\133\221\55\80\175"), 0.12;
	for name, col in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\198\22\143\243\101\130\196\11\138\232\110\142\162\116", "\60\221\135\68\198\167")]) do
		if ((name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\205\178\245\142\77\215", "\185\142\221\152\227\34")) and (name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\109\201\67\243\78\50\227\93", "\151\56\165\55\154\35\83"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\6\85", "\142\192\35\101")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\48\121", "\118\182\21\73\195\135\236\204")].R - col.R) ^ 2) + ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\121\74", "\157\104\92\122\32\100\109")].G - col.G) ^ 2) + ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\227\159", "\203\195\198\175\170\93\71\237")].B - col.B) ^ 2);
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\14\110", "\156\78\43\94\181\49\113")] < bestDist) then
				bestDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\173\148", "\25\18\136\164\195\107\35")];
				best = name;
			end
		end
	end
	return best;
end
local function scanEntities()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\36\186\91\55\236", "\216\136\77\201\47\18\220\161")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\237\59\159\88", "\226\77\140\75\186\104\188")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\193\194\52\92\169\207\211\58\10\233", "\47\217\174\176\95")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\149\220\102", "\70\216\189\22\98\210\52\24"));
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\222\179\194\131", "\179\186\191\195\231")] then
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\54\11\240\188\111", "\132\153\95\120")];
	end
	for _, child in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\179\30\104\167", "\192\209\210\110\77\151\186")]:GetChildren()) do
		if isUUIDName(child.Name) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\2\48\253\186\148", "\164\128\99\66\137\159")] = getMainPart(child);
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\136\251\170\69\217", "\222\96\233\137")] then
				table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\186\180\11\205\163", "\144\217\211\199\127\232\147")], {[LUAOBFUSACTOR_DECRYPT_STR_0("\245\32\58\45\217", "\36\152\79\94\72\181\37\98")]=child,[LUAOBFUSACTOR_DECRYPT_STR_0("\199\217\85\43", "\95\183\184\39")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\62\245\50\17\208", "\98\213\95\135\70\52\224")],[LUAOBFUSACTOR_DECRYPT_STR_0("\234\186\217", "\52\158\195\169\23")]=LUAOBFUSACTOR_DECRYPT_STR_0("\88\189\53", "\235\26\220\82\20\230\85\27"),[LUAOBFUSACTOR_DECRYPT_STR_0("\154\160\251\203\96\145", "\20\232\193\137\162")]=detectRarity(child)});
			end
		end
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\214\214\178\162\220", "\17\66\191\165\198\135\236\119")];
end
local function getClosestEntity()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\234\254", "\177\111\207\206\115\159\136\140")] = getRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\204\64", "\63\101\233\112\116\180\47")] then
		return nil;
	end
	local best, bestDist = nil, math.huge;
	for _, e in ipairs(scanEntities()) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\48\228\2\189\102", "\86\163\91\141\114\152")] = ignoreList[e.model];
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\0\125\99\127\3", "\90\51\107\20\19")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\197\177\192\27\172\194\168\208\16\162\212\160\170\109", "\93\237\144\229\143")] == LUAOBFUSACTOR_DECRYPT_STR_0("\55\247\247", "\38\117\150\144\121\107")) and (e.typ ~= LUAOBFUSACTOR_DECRYPT_STR_0("\15\186\233", "\90\77\219\142"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\15\40\41\9\87", "\26\134\100\65\89\44\103")] = true;
		end
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\232\57\51\225\161", "\196\145\131\80\67")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\133\50\39\62\201\44\157\57\37\55\204\59\245\86", "\136\126\208\102\104\120")] == LUAOBFUSACTOR_DECRYPT_STR_0("\91\139\205\75\170", "\49\24\234\174\35\207\50\93")) and (e.typ ~= LUAOBFUSACTOR_DECRYPT_STR_0("\47\243\254\128\116", "\17\108\146\157\232"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\200\29\253\106\248", "\200\43\163\116\141\79")] = true;
		end
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\61\52\147\245\164", "\131\223\86\93\227\208\148")] and e.rarity and not FARM_RARITY[e.rarity]) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\78\191\166\88\229", "\213\131\37\214\214\125")] = true;
		end
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\32\44\175\164\118", "\129\70\75\69\223")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\142\163", "\143\38\171\147\137\28")] = (e.part.Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\199\233", "\180\176\226\217\147\99\131")].Position).Magnitude;
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\252\127", "\103\179\217\79")] < bestDist) then
				bestDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\242\76", "\195\42\215\124\181\33\236")];
				best = e.part;
			end
		end
	end
	return best;
end
local function clearAllESP()
	for model, data in pairs(entityESP) do
		pcall(function()
			if data.hl then
				data.hl:Destroy();
			end
			if data.bb then
				data.bb:Destroy();
			end
		end);
		entityESP[model] = nil;
	end
	for plr, data in pairs(playerESP) do
		pcall(function()
			if data.hl then
				data.hl:Destroy();
			end
			if data.bb then
				data.bb:Destroy();
			end
		end);
		playerESP[plr] = nil;
	end
end
local function rebuildESP()
	clearAllESP();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\106\7\1\0\214\44\123\27\27\1\189\93", "\152\109\57\87\94\69")] then
		return;
	end
	for _, e in ipairs(scanEntities()) do
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\228\58\156\156\243\115\155\198\242\36\130\156\254\113\140\188\135", "\200\153\183\106\195\222\178\52")] and e.rarity and ESP_RARITY[e.rarity] and not entityESP[e.model]) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\239\205\109", "\58\82\131\232\93\41")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\171\94\215\29\81\54\132\95\196", "\95\227\55\176\117\61"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\114\102\27", "\203\120\30\67\43")].Adornee = e.model;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\41\8\191", "\185\145\69\45\143")].FillTransparency = 0.65;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\19\92\246", "\188\234\127\121\198")].OutlineColor = e.part.Color;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\62\86\211", "\227\88\82\115")].FillColor = e.part.Color;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\19\255\247", "\19\35\127\218\199\98")].Parent = e.model;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\249\79\178", "\130\124\155\106")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\247\194\250\163\161\249\125\173\209\236\227\166", "\223\181\171\150\207\195\150\28"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\56\166\254", "\105\44\90\131\206")].Size = UDim2.fromOffset(100, 18);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\226\247\233", "\94\159\128\210\217\104")].AlwaysOnTop = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\251\67\239", "\26\48\153\102\223\63\31\153")].Adornee = e.part;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\66\168\163", "\147\98\32\141")].Parent = e.part;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\6\179", "\43\120\35\131\170\102\54")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\96\3\159\162\137\177\134\81\10", "\228\52\102\231\214\197\208"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\165\37", "\182\126\128\21\170\138\235\121")].Size = UDim2.new(1, 0, 1, 0);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\159\101", "\102\235\186\85\134\230\115\80")].BackgroundTransparency = 1;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\73\110", "\66\55\108\94\63\18\180")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\54\140\130\119", "\57\116\237\229\87\71") .. (e.rarity or "");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\244\189", "\39\202\209\141\135\23\142")].TextColor3 = e.part.Color;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\118\89", "\152\159\83\105\106\82")].TextScaled = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\131\1", "\60\225\166\49\146\169")].Font = Enum.Font.GothamBold;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\91\127", "\103\79\126\79\74\97")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\125\150\35", "\122\218\31\179\19\62")];
			entityESP[e.model] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\187\218", "\37\211\182\173\161\169\193")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\54\8\137", "\217\151\90\45\185\72\27")],[LUAOBFUSACTOR_DECRYPT_STR_0("\193\126", "\54\163\28\135\114")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\217\24\210", "\31\72\187\61\226\46")]};
		end
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\53\115\237\119\82\5\250\35\113\225\120\91\10\226\36\111\247\99\59\116", "\68\163\102\35\178\39\30")] then
		for _, plr in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\124\219\222\6\167\144\84\238", "\113\222\16\186\167\99\213\227")]:GetPlayers()) do
			if ((plr ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\2\250\239\43\28\190\166", "\150\78\110\155")]) and plr.Character and not playerESP[plr]) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\215\55\164\244", "\32\229\165\71\129\196\126\223")] = plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\235\156\201\128\143\218\202\141\246\142\142\193\243\136\214\149", "\181\163\233\164\225\225"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\153\46\50\0", "\23\48\235\94")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\214\157\13", "\178\28\186\184\61\55\83")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\236\196\64\52\254\7\242\204\217", "\149\164\173\39\92\146\110"));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\43\85\79", "\123\147\71\112\127\122")].FillTransparency = 0.7;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\193\199\33", "\38\172\173\226\17")].OutlineColor = Color3.fromRGB(255, 195, 30);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\29\105\191", "\143\45\113\76")].Parent = plr.Character;
					playerESP[plr] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\176\180", "\92\216\216\124")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\62\233\16", "\157\59\82\204\32")]};
				end
			end
		end
	end
end
local function freezeCamera()
	cameraFrozen = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\63\238\191\185", "\209\88\94\131\154\137\138\179")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\174\214\119\13\51\48\33\45\228\148", "\66\72\193\164\28\126\67\81")].CurrentCamera;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\45\165\29\118", "\22\135\76\200\56\70")] then
		savedCameraCFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\49\245\97\13", "\129\237\80\152\68\61")].CFrame;
	end
end
local function unfreezeCamera()
	cameraFrozen = false;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\189\10\192\25\5\78\88\171\1\182\76", "\56\49\200\100\147\124\119")].RenderStepped:Connect(function()
	if (cameraFrozen and savedCameraCFrame and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\11\139\223\234\31\141\221\243\27\145\209\238\18\154\212\137\110", "\144\172\94\223")]) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\14\175\2\116", "\39\68\111\194")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\169\245\204\106\167\215\165\226\130\41", "\215\182\198\135\167\25")].CurrentCamera;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\72\231\13\221", "\40\237\41\138")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\117\247\189\26", "\42\167\20\154\152")].CFrame = savedCameraCFrame;
		end
	end
end);
local function flyTo(targetPos, speed)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\187\242", "\65\42\158\194\34\17")] = getRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\98\2", "\142\122\71\50\108\77\141\123")] then
		return false;
	end
	speed = speed or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\142\198\39\8\37\135\218\60\126\69", "\91\117\194\159\120")];
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\51\10\49\10\211\5\52\34\27\54\20\211\8\63\57\123\72", "\68\122\125\94\120\85\145")] and (speed > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\61\247\97\251\248\156\50\35\252\110\237\252\158\82\76", "\218\119\124\175\62\168\185")])) then
		speed = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\209\112\251\150\209\110\225\154\195\120\225\128\212\13\148", "\164\197\144\40")];
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\249\185\159\152\230", "\214\227\144\202\235\189")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\224\215", "\92\141\197\231\27\112\211\51")].Position - targetPos).Magnitude;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\246\153\183\148\182", "\177\134\159\234\195")] < 2) then
		return true;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\254\45\161\221\180\228\49\229\153", "\169\221\139\95\192")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\130\108\43\103\118", "\70\190\235\31\95\66")] / math.max(speed, 1), 0.15);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\231\12\239\228\174\235\21\232\160\234", "\133\218\130\122\134")] = Vector3.new((math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\218\213\237\253\151\17\19\209\220\229\241\140\13\18\203\166\148", "\88\92\159\131\164\188\195")], (math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\11\137\98\246\223\244\175\0\128\106\250\196\232\174\26\250\27", "\189\224\78\223\43\183\139")] * 0.3, (math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\217\188\63\224\26\213\165\56\254\15\209\165\35\239\26\185\218", "\161\78\156\234\118")]);
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\162\219\206\162\185\221\250\171\174\253\203\162\178\199\153\247", "\188\199\215\169")] then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\28\77\105\237\242\29\121\119\241\200\30\90\126\230\185\89", "\136\156\105\63\27")]:Cancel();
		end);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\153\107\38\30\130\109\18\23\149\77\35\30\137\119\113\75", "\84\123\236\25")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\156\175\18\162\134\245\153\188\30\175\176\181\219", "\213\144\235\202\119\204")]:Create(TABLE_TableIndirection["r%0"], TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\13\204\43\60\42\66\45\93\142", "\45\67\120\190\74\72\67")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\3\4\255\164\244\141", "\137\64\66\141\197\153\232\142")]=CFrame.new(targetPos + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\213\52\175\137\23\217\45\168\205\83", "\232\99\176\66\198")])});
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\52\58\20\126\131\237\10\224\56\28\17\126\136\247\105\188", "\76\140\65\72\102\27\237\153")]:Play();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\207\4\192\210\15\170\108\214\15\230\192\4\187\68\159\70", "\222\42\186\118\178\183\97")].Completed:Wait();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\249\86\152\88\226\80\172\81\245\112\157\88\233\74\207\13", "\234\61\140\36")] = nil;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\243\142\91\48\3\252\148\77\42\15\252\152\94\42\5\152\234", "\111\65\189\218\18")] then
		task.wait(0.05 + (math.random() * 0.1));
	end
	return true;
end
local function stopAutofarm()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\126\47\26\45\125\157\110\116\62\27\42\126\131\102\111\94\101", "\207\35\43\123\85\107\60")] = false;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\191\178\248\124\126\190\134\230\96\68\189\165\239\119\53\250", "\25\16\202\192\138")] then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\222\191\240\172\250\233\237\161\251\157\227\248\206\163\167\249", "\148\157\171\205\130\201")]:Cancel();
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\193\102\59\212\248\55\242\120\48\229\225\38\209\122\108\129", "\150\67\180\20\73\177")] = nil;
	end
	unfreezeCamera();
end
local function autofarmLoop()
	while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\45\46\98\171\57\40\96\178\61\52\108\175\52\63\105\200\72", "\45\237\120\122")] do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\173\242", "\76\183\136\194")] = getRoot();
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\163\181", "\116\26\134\133\88\48\47")] then
			task.wait(0.5);
		else
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\209\165\225\185\55\78", "\18\126\161\192\132\221")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\4\151\59\101\111\13\139\32\19\15", "\54\63\72\206\100")];
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\119\113\83\218\89\233\119\122\95\203\90\234\117\96\94\160\43", "\27\168\57\37\26\133")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\186\121\173\211\104\250", "\183\77\202\28\200")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\18\177\55\36\18\175\45\40\0\185\45\50\23\204\88", "\104\119\83\233")])) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\232\34\39\71\176\168", "\35\149\152\71\66")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\201\122\143\9\56\206\103\143\9\41\205\103\148\127\73", "\90\121\136\34\208")];
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\15\71\25\194\26\16\78", "\126\167\110\53")] = getClosestEntity();
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\17\60\255\217\43\120\64", "\95\93\112\78\152\188")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\244\151\18\225\170\226\206\230\192\69", "\178\161\149\229\117\132\222")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\218\207\171\164\2\227\115", "\67\232\187\189\204\193\118\198")].Position;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\39\187\33\55\54\238\153\41\176\52\126\82", "\143\235\78\213\64\91\98")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\73\150\238\117\162\189\71\151\172\32", "\214\237\40\228\137\16")] + Vector3.new(0, 3, 0);
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\214\219\246\37\135\183\206\208\239\34\148\172\194\193\237\70\246", "\198\229\131\143\185\99")] == LUAOBFUSACTOR_DECRYPT_STR_0("\115\128\169\103\80\130\188", "\19\49\236\200")) then
					flyTo(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\62\248\182\232\142\255\37\241\178\240\255\174", "\218\158\87\150\215\132")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\14\220\231\50\103\157", "\173\155\126\185\130\86\66")]);
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\179\168\213\141\226\241\150\181\212\205\188", "\140\133\198\218\167\232")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\107\228", "\228\213\78\212\29")].Position;
					if ((math.abs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\89\164\23\238\137\88\134\10\248\194\28", "\139\231\44\214\101")].Y - 5) > 0.5) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\250\20\76\21\191\37\38\214\252\67\14", "\118\185\143\102\62\112\209\81")].Y > 8)) then
						flyTo(Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\101\59\244\160\27\8\8\83\99\108\182", "\88\60\16\73\134\197\117\124")].X, 5, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\255\234\218\68\94\254\200\199\82\21\186", "\33\48\138\152\168")].Z), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\6\53\84\197\114\34", "\87\18\118\80\49\161")]);
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\12\213\181\190\72\42\219\178\183\73\10\159\240", "\208\44\126\186\192")] = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\27\182\193\17\232\249\65\228\95\244", "\46\151\122\196\166\116\156\169")].X, 5, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\236\84\29\254\241\221\73\9\190\181", "\155\133\141\38\122")].Z);
					if ((getRoot().Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\56\163\84\65\123\145\36\56\171\68\91\58\245", "\197\69\74\204\33\47\31")]).Magnitude > 2) then
						flyTo(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\93\85\146\254\75\110\134\226\72\95\147\181\31", "\231\144\47\58")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\200\223\112\28\120\159", "\89\210\184\186\21\120\93\175")]);
					end
					if ((getRoot().Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\90\114\212\117\14\176\65\123\208\109\127\225", "\90\209\51\28\181\25")]).Magnitude > 2) then
						flyTo(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\114\89\239\179\228\122\69\233\186\196\62\7", "\223\176\27\55\142")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\171\203\176\32\254\158", "\213\68\219\174")]);
					end
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\165\115", "\31\107\128\67\135\74\165\95")] = getRoot();
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\173\172", "\209\184\136\156\45\33")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\201\103\15\189\19\141\37", "\216\103\168\21\104")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\172\81\163\125\185\6\244", "\196\24\205\35")].Parent) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\206\179", "\102\78\235\131")].CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\47\38\67\66\45\242\100", "\84\154\78\84\36\39\89\215")].Position + Vector3.new(0, 2, 0));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\224\81\123\10\232\239\66\93\23\184\177", "\101\157\129\54\56")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\168\141\136\44\108\19\189\143\185\102\41", "\25\125\201\234\203\67")] + 1;
				end
				task.wait(0.15);
			else
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\224\25\17\0\23\28\106\177\72", "\115\25\148\120\99\116\71")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\120\233", "\33\108\93\217\68")].Position;
				local angle, radius = 0, 400;
				for _ = 1, 10 do
					if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\126\149\130\253\106\147\128\228\110\143\140\249\103\132\137\158\27", "\205\187\43\193")] or getClosestEntity()) then
						break;
					end
					angle = angle + 0.7;
					flyTo(Vector3.new(clamp(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\102\4\205\234\66\10\204\187\34", "\191\158\18\101")].X + (math.cos(angle) * radius), -5000, 5000), 8, clamp(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\215\134\165\187\245\204\148\242\255", "\207\165\163\231\215")].Z + (math.sin(angle) * radius), -5000, 5000)), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\233\252\83\32\53\150", "\16\166\153\153\54\68")]);
					radius = radius + 80;
				end
				task.wait(0.2);
			end
		end
	end
end
local function startAutofarm()
	stopAutofarm();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\134\244\105\18\0\203\255\140\229\104\21\3\213\247\151\133\22", "\153\178\211\160\38\84\65")] = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\30\78\36\132\10\72\38\177\31\91\57\150\63\83\38\135\78\10", "\75\226\107\58")] = os.time();
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\255\60\95\35\227\242\117\241\53\95\84\146", "\173\56\190\113\26\113\162")] == 1) then
		freezeCamera();
	end
	task.spawn(autofarmLoop);
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\234\203\57\10\241\202\204\32", "\151\171\190\77\101"), LUAOBFUSACTOR_DECRYPT_STR_0("\246\59\249\187\236\120\15\133\103", "\107\165\79\152\201\152\29") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\123\220\228\114\94\101\99\215\253\117\77\126\111\198\255\17\47", "\31\55\46\136\171\52")] .. ")");
end
local function getRuntime()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\60\153\164", "\148\177\72\188")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\179\71\223\175\181\86\199\163\178\100\199\169\164\86\212\163\243\7", "\179\198\214\55")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\192\0\115\111\64\193\194\25\124\98\76\222\245\40\115\98\68", "\179\144\108\18\22\37"));
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\183\94\217", "\175\166\195\123\233")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\214\24\25", "\144\143\162\61\41")]:FindFirstChild(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\223\28\73\119\149\118\176", "\83\128\179\125\48\18\231")].Name);
end
local function getGeneric()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\179\182\141", "\126\61\215\147\189\39")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\250\13\73\113\252\28\81\125\251\46\81\119\237\28\66\125\186\77", "\37\24\159\125")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\234\170\116\91\223\180\81\67\206\167", "\34\186\198\21"));
	pd = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\12\128\13", "\162\152\104\165\61")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\43\247\45", "\133\173\79\210\29\16")]:FindFirstChild(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\112\236\50\136\110\168\123", "\75\237\28\141")].Name);
	return pd and pd:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\251\90\194\180\61\18\228", "\129\188\63\172\209\79\123\135"));
end
local function getMissionsFolder()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\240\163\157", "\173\32\132\134")] = getRuntime();
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\15\77\191", "\173\46\123\104\143\206\81")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\9\103\218", "\97\212\125\66\234\37\227")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\167\234\165\38\23\133\237\165", "\126\234\131\214\85"));
end
local function getLevel()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\144\25", "\47\228\181\41\58")] = getGeneric();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\234\156\107", "\127\198\156\185\91\99\80")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\95\156", "\190\149\122\172\144\199\107\89")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\64\161", "\158\82\101\145\158")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\92\251\20\19\72", "\36\16\158\98\118"));
	return (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\0\134\171", "\133\160\118\163\155\56\136\71")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\180\52\162", "\213\150\194\17\146\214\127")].Value) or 0;
end
local function patchTimers()
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\189\225\132", "\86\123\201\196\180\38\196\194")] = getRuntime();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\240\201\234\167", "\207\151\136\185")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\151\109\210", "\17\200\227\72\226\20\24")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\85\94\135", "\159\208\33\123\183\169\145\143")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\223\83\43\37\251\85\54\2\251\87\61\36\215\66\40\63\224\95", "\86\146\58\88"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\199\250\133\254", "\154\56\191\138\160\206\137\86")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\65\229\194\44", "\172\230\57\149\231\28\90\225")].Value = tick() - 10;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\239\214", "\187\98\202\230\178\72")] = getGeneric();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\245\225\96", "\42\65\129\196\80")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\15\13", "\142\98\42\61\186\119\103\98")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\250\82", "\104\88\223\98")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\73\254\241\221\11\226\74\195\235\195\7\255", "\141\36\151\130\174\98"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\110\135\93", "\109\228\26\162")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\241\184\40", "\134\62\133\157\24\128")].Value = os.time() - 30;
		end
	end);
end
local function rerollAll()
	patchTimers();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\183\95\137", "\182\103\197\122\185\79\209")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\130\241\123\9\75\242\147\228\115\51\92\252\149\224\112\5\13\163", "\40\147\231\129\23\96")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\88\241\159\86\178\163\210\71\253\158\74\183\160", "\188\21\152\236\37\219\204"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\230\59\8\69\251\114\92", "\108\32\137\87")] = getMissionsFolder();
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\250\69\246", "\57\202\136\96\198\79\153\43")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\44\166\163\136\181\189\251", "\152\203\67\202\199\237\199")]) then
		return 0;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\6\240", "\134\154\35\192\111\127\21\25")] = 0;
	for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\41\5\14\37\192\253\118", "\178\216\70\105\106\64")]:GetChildren()) do
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\57\63\166", "\224\95\75\26\150\169\181\180")]:FireServer(m.Name);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\159\136", "\22\107\186\184\72\36\204")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\248\116", "\110\135\221\68\46")] + 1;
		task.wait(0.04);
	end
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\36\73\187", "\91\131\86\108\139\174\211")]:FireServer();
	end);
	task.wait(0.1);
	patchTimers();
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\110\232", "\61\155\75\216\119")];
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\132\133\25\106\58\152\84", "\189\100\203\210\92\56\105")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\25\84\239\60\38\86\242", "\72\79\49\157")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\129\180\34", "\220\232\208\81")]={LUAOBFUSACTOR_DECRYPT_STR_0("\242\187\235\53\62\91\173\160\232", "\193\149\222\133\80\76\58")},[LUAOBFUSACTOR_DECRYPT_STR_0("\205\88\86\193", "\178\166\61\47")]={LUAOBFUSACTOR_DECRYPT_STR_0("\237\79\250\110\195\57\244", "\94\155\42\136\26\170"),LUAOBFUSACTOR_DECRYPT_STR_0("\133\57\52\180\141\59\102\186\130\127\46\176\141\56\46\161\151", "\213\228\95\70")},[LUAOBFUSACTOR_DECRYPT_STR_0("\58\186\214\140", "\23\74\219\162\228")]={LUAOBFUSACTOR_DECRYPT_STR_0("\20\231\86", "\91\89\134\38\207"),LUAOBFUSACTOR_DECRYPT_STR_0("\102\251\193\58\23\217\41\67\253", "\71\36\142\168\86\115\176"),LUAOBFUSACTOR_DECRYPT_STR_0("\242\168\97\188\33\171\95\69\219\168\124\184\16", "\41\191\193\18\223\99\222\54"),LUAOBFUSACTOR_DECRYPT_STR_0("\157\35\213\62\163\172\41", "\202\203\70\167\74"),LUAOBFUSACTOR_DECRYPT_STR_0("\26\4\206\39\120\43\14\156\31\120\43\9\200", "\17\76\97\188\83")}},[LUAOBFUSACTOR_DECRYPT_STR_0("\179\34\203\35\53\155", "\195\229\71\185\87\80\227\43")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\233\248\19", "\143\128\156\96\48")]={LUAOBFUSACTOR_DECRYPT_STR_0("\191\212\254\23\5\185\221\165\69", "\119\216\177\144\114")},[LUAOBFUSACTOR_DECRYPT_STR_0("\194\44\224\81", "\34\169\73\153")]={LUAOBFUSACTOR_DECRYPT_STR_0("\188\233\25\159\175\244", "\235\202\140\107"),LUAOBFUSACTOR_DECRYPT_STR_0("\26\113\38\188\236\63\183\211\9\122\32\189\251\34", "\165\108\20\84\200\137\71\151")},[LUAOBFUSACTOR_DECRYPT_STR_0("\106\181\63\128", "\232\26\212\75")]={LUAOBFUSACTOR_DECRYPT_STR_0("\26\72\98", "\151\87\41\18\136"),LUAOBFUSACTOR_DECRYPT_STR_0("\121\186\195\220\250\82\161\205\195", "\158\59\207\170\176"),LUAOBFUSACTOR_DECRYPT_STR_0("\98\87\32\74\174\90\87\63\77\133\65\89\32", "\236\47\62\83\41"),LUAOBFUSACTOR_DECRYPT_STR_0("\204\172\50\47\175\154", "\226\154\201\64\91\202"),LUAOBFUSACTOR_DECRYPT_STR_0("\247\76\15\12\79\164\129\101\20\31\66\168", "\220\161\41\125\120\42")}},[LUAOBFUSACTOR_DECRYPT_STR_0("\159\99\165\29\168", "\110\220\17\192")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\125\125\39", "\199\20\25\84\122\139\87\145")]={LUAOBFUSACTOR_DECRYPT_STR_0("\64\12\211\171\9\235\75\92\133", "\138\39\105\189\206\123")},[LUAOBFUSACTOR_DECRYPT_STR_0("\20\2\144\62", "\159\127\103\233\77\147\153\175")]={LUAOBFUSACTOR_DECRYPT_STR_0("\4\226\225\185\84", "\171\103\144\132\202\32"),LUAOBFUSACTOR_DECRYPT_STR_0("\19\61\236\31\4\111\234\13\2\61\224\9\2", "\108\112\79\137")},[LUAOBFUSACTOR_DECRYPT_STR_0("\47\195\96\32", "\85\95\162\20\72\205\97\137")]={LUAOBFUSACTOR_DECRYPT_STR_0("\218\252\58", "\173\151\157\74\188\109\152"),LUAOBFUSACTOR_DECRYPT_STR_0("\6\29\49\209\216\93\219\244\55", "\147\68\104\88\189\188\52\181"),LUAOBFUSACTOR_DECRYPT_STR_0("\55\129\152\211\56\157\130\220\30\129\133\215\9", "\176\122\232\235"),LUAOBFUSACTOR_DECRYPT_STR_0("\163\103\63\92\250", "\142\224\21\90\47"),LUAOBFUSACTOR_DECRYPT_STR_0("\87\198\34\69\176", "\229\20\180\71\54\196\235"),LUAOBFUSACTOR_DECRYPT_STR_0("\10\108\196\240\225\234\172\32\121\201\247", "\224\73\30\161\131\149\202")}}};
local function resolvePath(path)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\240\227\21\161", "\48\145\133\145")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\67\167\229\194\60\91\79\176\171\129", "\76\58\44\213\142\177")];
	for _, n in ipairs(path) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\49\0\104\40", "\24\171\68\114\77")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\8\66\23\215", "\205\143\125\48\50\231\190\100")]:FindFirstChild(n);
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\178\6\64\177", "\194\161\199\116\101\129\131\191")] then
			return nil;
		end
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\49\218\237\167", "\194\140\68\168\200\151")];
end
local function matchTower(m)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\190\133", "\149\34\155\181\69")] = string.lower(m.Name);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\184\133", "\154\99\157\181")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\169\6\255\176\224\140\22\194\161\225\136", "\140\237\111\140\192"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\16\105\20\3\92\45", "\120\102\121\29")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\166\233", "\91\204\131\217")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\186\5", "\158\174\159\53\180\211\189")].Value))) or "";
	for tn, data in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\210\218\248\69\134\23\173", "\213\50\157\141\189\23")]) do
		for _, id in ipairs(data.ids) do
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\99\212", "\196\158\70\228\192\18")] == id) then
				return tn, data, m;
			end
		end
		for _, k in ipairs(data.keys) do
			if (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\26\65", "\185\42\63\113\46")], k, 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\212\53\53\30\145\141", "\123\180\189\65\89")], k, 1, true)) then
				return tn, data, m;
			end
		end
	end
end
local function findTower()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\131\252\224\140\208\201\160", "\233\162\236\144\132")] = getMissionsFolder();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\203\242\30\188\228\26\226", "\63\210\164\158\122\217\150")] then
		return;
	end
	for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\196\250\232\76\234\118\155", "\152\83\171\150\140\41")]:GetChildren()) do
		local a, b, c = matchTower(m);
		if a then
			return a, b, c;
		end
	end
end
local function tpTower(data)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\160\211", "\104\226\133\227\83\180\123")] = getRoot();
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\78\115", "\48\99\107\67")] or not data) then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\175\122\216\57\62\142", "\27\190\198\29\176\77")] = resolvePath(data.path);
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\66\250\60\189\11\191", "\46\143\43\157\84\201")] then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\119\69\135\15", "\168\55\24\54\162\63\115")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\243\39\136\198\139\71", "\174\119\154\64\224\178")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\8\127\214\126\53\166\8\240", "\132\74\30\165\27\101\199\122")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\238\248\175\179\240\228", "\212\79\135\159\199\199\213")].Position;
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\175\166\2\12", "\120\25\192\213\39\60\183")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\73\56\64\12\5\111", "\40\120\32\95")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\23\164\61\127\163", "\127\90\203\89\26\207"))) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\112\255", "\157\189\85\207\171\105")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\168\223\189\23\131\241", "\99\166\193\184\213")].PrimaryPart or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\190\135\179\24\207\134", "\234\182\215\224\219\108")]:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\226\128\168\48\240\128\169\33", "\85\160\225\219"), true);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\10\144\140\102", "\43\60\101\227\169\86\188")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\141\129", "\87\16\168\177\223\58\172\217")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\136\9", "\91\84\173\57\189")].Position;
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\182\31\185\240", "\182\112\217\108\156\192")] then
		return false;
	end
	safeTeleport(CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\7\91\170\219", "\235\202\104\40\143")] + Vector3.new(0, 6, 0)));
	return true;
end
local function startTowerAutofarm()
	if (getLevel() < 15) then
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\57\132\12\188\31", "\217\109\235\123"), LUAOBFUSACTOR_DECRYPT_STR_0("\9\140\123\82\48\220\200\171\34\133\62\7\37\155", "\221\71\233\30\54\16\176\173"));
		return;
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\217\112\137\113\172", "\223\84\156\62")].GreedyTowerRunning then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\217\204\235\242\107", "\91\182\156\130\189\215")].GreedyTowerRunning = true;
	task.spawn(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\122\184\70\59\35", "\53\30\19\204")] = 0;
		while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\197\94\178\226\169", "\199\153\128\16\228")].GreedyTowerRunning do
			patchTimers();
			local name, data, mis = findTower();
			if (name and data) then
				if tpTower(data) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\35\241\10\226\129", "\199\177\74\133\121")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\192\168\237\114\150", "\74\216\169\220\158\87\166")] + 1;
					notify(LUAOBFUSACTOR_DECRYPT_STR_0("\220\44\4\41\72", "\58\136\67\115\76"), name .. LUAOBFUSACTOR_DECRYPT_STR_0("\177\233", "\61\145\202\184\57\229\64\203") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\91\157\84\25\2", "\39\60\50\233")]);
					task.wait(1);
					if mis then
						pcall(function()
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\54\179\32\139\43\179\183\31\55\144\56\141\58\179\164\31\118\243", "\195\122\83\195\76\226\72\210")].MissionReroll:FireServer(mis.Name);
						end);
					end
				end
				rerollAll();
			else
				rerollAll();
			end
			task.wait(0.3);
		end
	end);
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\208\219\44\251\51", "\65\132\180\91\158"), LUAOBFUSACTOR_DECRYPT_STR_0("\36\105\197\33\3\125\195\35\69\83\255", "\78\101\28\177"));
end
local function stopTowerAutofarm()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\145\206\103\96\228", "\49\69\212\128")].GreedyTowerRunning = false;
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\35\3\199\247\243", "\129\119\108\176\146"), LUAOBFUSACTOR_DECRYPT_STR_0("\19\233\33", "\124\92\175\103\173\69\110"));
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\8\38\18\229\7\55\22\243\31\38\3\242\125\83", "\87\161\88\99")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\2\240\236\199\190\222\36\82\236\255\140\163\216\38\82\233\238\207\178", "\67\114\153\143\172\215\176"),LUAOBFUSACTOR_DECRYPT_STR_0("\173\178\235\11\186\226\253\30\183\172\234\2\187", "\110\222\194\142"),LUAOBFUSACTOR_DECRYPT_STR_0("\30\153\15\161\93\180\16\209\15\233\70\169\30\202\91\190\83\178\87\201\26\187\89\174\2\203", "\193\119\185\123\201\50"),LUAOBFUSACTOR_DECRYPT_STR_0("\115\1\239\47\1\124\95\115\13\248\37\12\124\19\114\26\248\50\6\118\17", "\127\23\104\153\70\111\25"),LUAOBFUSACTOR_DECRYPT_STR_0("\30\15\169\239\46\58\178\189\73\9\163\170\47\63\247\178\73\20\182\170\46\40\180\178\25", "\211\105\103\198\207\75\76\215"),LUAOBFUSACTOR_DECRYPT_STR_0("\221\178\160\234\108\76\169\185\192\174\179", "\214\174\199\208\143\30\108\218")};
local function speedHasTarget()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\139\7\174\160\68\157\25", "\41\113\228\107\202\197\54\184")] = getMissionsFolder();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\130\52\88\127\159\125\12", "\60\26\237\88")] then
		return nil;
	end
	for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\37\120\226\171\202\111\36", "\206\184\74\20\134")]:GetChildren()) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\161\190", "\172\88\132\142\209\147\42\88")] = string.lower(m.Name);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\132\137\93", "\222\231\234\172\109\86\149")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\201\230\211\8\225\238\217\54\236\226\197", "\120\141\143\160"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\233\230", "\50\32\204\214")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\73\112\41", "\113\230\39\85\25\211")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\181\67\184", "\43\190\219\102\136\71\171\203")].Value))) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\59\96", "\57\66\30\80")];
		for _, k in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\232\133\48\160\6\192\165\27\255\133\33\183\124\164", "\228\73\184\192\117\228\89\148")]) do
			if (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\204\37", "\116\175\233\21")], k, 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\189\238", "\95\158\152\222\38\187\81")], k, 1, true)) then
				return m, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\248\101", "\168\152\221\85\210\195")];
			end
		end
	end
end
local function speedUnfreeze()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\251\219\177\238\142", "\231\203\190\149")].GreedySpeedFrozen = false;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\24\205\199\249\165", "\123\173\93\131\145\220\149")].GreedySpeedFreezeConn then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\225\195\23\49\169", "\153\118\164\141\65\20")].GreedySpeedFreezeConn:Disconnect();
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\23\168\212\178\80", "\96\142\82\230\130\151")].GreedySpeedFreezeConn = nil;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\245\31", "\142\47\208\47\34\132")] = getRoot();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\251\84", "\60\150\222\100\98\59")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\121\7", "\81\37\92\55\54\187\218")].Anchored = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\1\253", "\225\96\36\205\87")].AssemblyLinearVelocity = Vector3.zero;
	end
end
local function speedFreeze(cf)
	speedUnfreeze();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\131\108\79\57\31", "\105\137\198\34\25\28\47")].GreedySpeedFrozen = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\236\17", "\160\113\201\33\22")] = getRoot();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\29\252", "\205\180\56\204\199\201")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\155\108", "\120\227\190\92")].Anchored = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\25\79", "\130\93\60\127\27\67\60\185")].CFrame = cf;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\61\59\69\165\19", "\29\40\82\88\46\128\35")] = cf;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\96\250\43\68\232", "\216\91\37\180\125\97")].GreedySpeedFreezeConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\99\18\240\82\55\96\21\192\82\96\38", "\55\69\22\124\163")].Heartbeat:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\246\114\222\154\33", "\148\24\179\60\136\191\17\48")].GreedySpeedFrozen then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\37\246\180\179\226", "\150\210\74\153\192")] = getRoot();
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\199\55\158\48\42", "\212\131\168\88\234\21\26")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\123\134\152\125\119", "\71\37\20\233\236\88")].Anchored = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\73\191\2\5\188", "\60\173\38\208\118\32\140\44")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\61\226\216\101\159", "\175\33\82\129\179\64")];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\224\63\219\121\226", "\210\142\143\80\175\92")].AssemblyLinearVelocity = Vector3.zero;
		end
	end);
end
local function speedPass()
	speedUnfreeze();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\172\163", "\166\217\137\147")] = getRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\230\34", "\38\131\195\18\198\145")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\194\59\249\44\119\117\147\106", "\52\51\182\90\139\88")] = CFrame.new(3000, 100, 3000);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\183\212\196\101\179\233", "\35\150\217\176\135")] = CFrame.new(3180, 100, 3000);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\89\25\73\39", "\22\153\48\107\108\23\35")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\139\191\57\89\48\17", "\137\110\229\219\122\31\21\33")].Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\169\57\105\34\104\2\59\74", "\30\122\221\88\27\86\43\68")].Position).Unit;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\109\187", "\230\88\72\139")].Anchored = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\241\70", "\56\18\212\118\123\99\104")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\253\249\193\203\253\56\172\168", "\190\126\137\152\179\191")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\1\102\194\188\69\109\82", "\32\72\98\18\171\202")] = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\139\119\36", "\151\100\232\82\20")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\204\248\59\122\203\224\1\124\220\179\88", "\104\31\185\150")].Heartbeat:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\186\231\254\241\201\165\144", "\160\188\217\147\151\135\172\128")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\210\31\228\127\153", "\169\111\189\112\144\90")] = getRoot();
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\140\42\185\250\208", "\226\173\227\69\205\223\224\105")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\123\114", "\123\56\94\66\59\175")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\74\97\164\74", "\225\154\35\19\129\122\158")] * 500;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\15\228\67\176\183", "\84\58\96\139\55\149\135\176")].AssemblyLinearVelocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\122\243", "\94\115\95\195\96\46\175")].X, 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\14\111", "\128\35\43\95\93\78\77\231")].Z);
		end
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\10\115\100", "\201\196\125\86\84\119\30")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\249\1\186\205\221\1\173\213\231\7\186\134\190", "\223\163\142\100")]:Create(TABLE_TableIndirection["r%0"], TweenInfo.new(0.35, Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\161\48\209\176\181\135", "\216\226\118\163\209")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\254\31\34\113\53\111", "\95\222\144\123\97\55\16")]});
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\147\255\19", "\131\121\228\218\35")]:Play();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\199\103\81", "\123\185\176\66\97\25")].Completed:Wait();
	active = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\12\92\1", "\81\168\111\121\49\117\79\56")]:Disconnect();
	speedFreeze(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\4\225\149\225\79\181", "\214\167\106\133")]);
end
local function startSpeedFarm()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\29\98\121\113\47", "\185\73\88\44\47\84\31")].GreedySpeedFarm then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\242\52\150\150\175", "\159\232\183\122\192\179")].GreedySpeedFarm = true;
	task.spawn(function()
		while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\23\134\23\97\98", "\65\68\82\200")].GreedySpeedFarm do
			patchTimers();
			if speedHasTarget() then
				pcall(speedPass);
				task.wait(0.35);
			else
				rerollAll();
				task.wait(0.15);
			end
		end
		speedUnfreeze();
	end);
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\22\64\119\37\203", "\30\69\48\18\64\175\175"), LUAOBFUSACTOR_DECRYPT_STR_0("\223\2", "\91\144\76\127\140"));
end
local function stopSpeedFarm()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\45\104\23\150\234", "\176\128\104\38\65\179\218\181")].GreedySpeedFarm = false;
	speedUnfreeze();
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\227\212\199\16\212", "\117\176\164\162"), LUAOBFUSACTOR_DECRYPT_STR_0("\171\228\35", "\25\228\162\101\144\186"));
end
local function findMonkey()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\57\181\10\247\246\13\102", "\132\40\86\217\110\146")] = getMissionsFolder();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\196\43\184\162\97\185\14", "\62\30\171\71\220\199\19\156")] then
		return false;
	end
	for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\74\160\50\88\219\106\29", "\45\32\37\204\86\61\169\79")]:GetChildren()) do
		if (m.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\82\80\11\185\167\125\89\3\84", "\28\53\53\101\220\213")) then
			return true;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\82\77\17", "\191\109\60\104\33\58\193\48")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\163\222\11\247\139\214\1\201\134\218\29", "\135\231\183\120"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\79\28", "\201\134\106\44\132\85\122")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\2\50\111", "\67\86\108\23\95\97\108\168")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\54\9\90", "\48\196\88\44\106\196\68\181")].Value))) or "";
		if string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\154\140", "\76\226\191\188\67\224\196\194")], LUAOBFUSACTOR_DECRYPT_STR_0("\212\39\9\251\248\192\59\71\249\243\153\59\23\241\254\220", "\157\185\72\103\144"), 1, true) then
			return true;
		end
	end
	return false;
end
local function monkeyOnce()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\246\218", "\209\57\211\234\26\200")] = getRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\139\246", "\178\97\174\198\225\48")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\19\84", "\111\175\54\100\145\24\134")].AssemblyLinearVelocity = Vector3.zero;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\92\112", "\117\35\121\64")].CFrame = CFrame.lookAt(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\146\192\253\6\118\226\139\203\248\23\10\141", "\47\189\221\142\182\67")] + Vector3.new(0, 3, 0), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\144\9\224\109\144\31\31\5\145\19\142\24", "\73\64\223\71\171\40\201\64")] + Vector3.new(20, 3, 0));
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\132\214\77\181\124\6\164\202\73\181\105\39\140\202\88\167\120\24\200\148", "\29\106\237\164\57\192")]:SendKeyEvent(true, Enum.KeyCode.W, false, game);
	end);
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\173\245\174\192\211\172\219\191\180\242\174\248\211\174\243\182\161\245\255\133", "\146\209\196\135\218\181\178\192")]:SendKeyEvent(true, Enum.KeyCode.Space, false, game);
	end);
	local w, s = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\31\173\58\117\158\18\7\188\57\127\139\9\117\211", "\199\77\80\227\113\48")], 2;
	if (s <= w) then
		task.wait(s);
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\54\76\217\63\62\82\228\36\47\75\217\7\62\80\204\45\58\76\136\122", "\173\74\95\62")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
		end);
		task.wait(w - s);
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\16\78\34\222\6\176\239\23\76\35\223\42\189\200\24\91\51\217\66\236", "\220\166\121\60\86\171\103")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
		end);
	else
		task.wait(w);
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\11\47\164\46\203\22\192\12\45\165\47\231\27\231\3\58\181\41\143\74", "\122\137\98\93\208\91\170")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
		end);
		task.wait(s - w);
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\232\14\91\192\179\165\227\137\241\9\91\248\179\167\203\128\228\14\10\133", "\170\231\129\124\47\181\210\201")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
		end);
	end
end
local function startMonkeyFarm()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\158\20\6\79\122", "\74\235\219\90\80\106")].GreedyMonkeyRunning then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\230\117\13\127\164", "\146\44\163\59\91\90\148\26")].GreedyMonkeyRunning = true;
	task.spawn(function()
		while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\8\150\183\12\37", "\41\21\77\216\225")].GreedyMonkeyRunning do
			patchTimers();
			if not findMonkey() then
				rerollAll();
				task.wait(0.3);
			else
				monkeyOnce();
				task.wait(1);
			end
		end
	end);
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\57\66\124\78\17\84", "\37\116\45\18"), LUAOBFUSACTOR_DECRYPT_STR_0("\224\209", "\203\175\159\54\194"));
end
local function stopMonkeyFarm()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\235\55\13\31\31", "\162\27\174\121\91\58\47")].GreedyMonkeyRunning = false;
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\204\13\225\42\216\223\236\17\229\42\205\254\196\17\244\56\220\193\128\79", "\185\179\165\127\149\95")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\124\221\224\2\80\121\230\250\7\68\97\226\245\25\80\114\202\230\82\1", "\119\49\21\175\148")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
	end);
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\122\186\24\86\40\80", "\149\55\213\118\61\77\41\234"), LUAOBFUSACTOR_DECRYPT_STR_0("\50\32\236", "\123\125\102\170\166\137\89\207"));
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\1\95\18\30\134\167\124\21\86\51\7\141\174\11\80", "\201\46\96\56\93\110\227")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\2\233\214\5\196\181\46\225\253\16\132\235", "\161\219\99\142\153\117")] = LUAOBFUSACTOR_DECRYPT_STR_0("\90\176\181\103", "\173\28\209\198\19");
local function openCasesLoop()
	task.spawn(function()
		local opened, fail = 0, 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\245\167\190\102\169\231", "\219\21\140\215")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\107\183\203\170\87\70", "\56\40\216\166\199"),LUAOBFUSACTOR_DECRYPT_STR_0("\19\186\22\32\43\185\26\33", "\79\70\212\117"),LUAOBFUSACTOR_DECRYPT_STR_0("\149\23\243\195", "\109\199\118\129\166\153"),LUAOBFUSACTOR_DECRYPT_STR_0("\20\160\126\245", "\150\81\208\23"),LUAOBFUSACTOR_DECRYPT_STR_0("\213\192\231\142\247\193\225\153\224", "\235\153\165\128")};
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\80\178\42\111\34\178\187\235", "\158\219\41\194\79\38\70\202")] = 1;
		while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\36\40\45\254\211\134\113\48\33\12\231\216\143\6\117", "\232\35\69\79\98\142\182")] do
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\1\24\210\105\5\17\208\118\4\26\184\41", "\157\25\96\127")] == LUAOBFUSACTOR_DECRYPT_STR_0("\142\141\230\17\81\63\179", "\81\199\227\149\101\48")) then
				for _, ty in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\75\235\20\229\195\108", "\219\29\50\155\113\150\230\92")]) do
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\33\194\84\239\77\67\227\53\203\117\246\70\74\148\112", "\45\177\64\165\27\159\40")] then
						break;
					end
					local ok, res = pcall(function()
						return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\19\31\166\123\30\23\27\175\118\46\2\0\184\115\26\19\74\250", "\18\125\118\111\202")].OpenCase:InvokeServer(ty);
					end);
					if (ok and res) then
						opened = opened + 1;
						fail = 0;
					end
				end
				task.wait();
			else
				local ok, res = pcall(function()
					return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\57\73\246\57\174\198\239\85\56\106\238\63\191\198\252\85\121\9", "\155\48\92\57\154\80\205\167")].OpenCase:InvokeServer(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\212\171\186\235\238\21", "\37\217\173\219\223\152\203")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\28\15\51\102\172\238\76\85", "\150\105\101\127\86\47\200")]]);
				end);
				if (ok and res) then
					opened = opened + 1;
					fail = 0;
				else
					fail = fail + 1;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\235\227\176\238\196\214\183\163", "\160\174\146\147\213\167")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\253\10\65\37\69\88\161\74", "\33\32\132\122\36\108")] % #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\13\98\78\111\252\68", "\28\217\116\18\43")]) + 1;
					if (fail > 40) then
						break;
					end
				end
				task.wait(((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\86\209\123\192\171\50\255\88\210\81\149\254", "\92\178\55\182\52\176\206")] == LUAOBFUSACTOR_DECRYPT_STR_0("\41\57\126\2", "\117\122\85\17")) and 0.35) or 0.01);
			end
		end
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\170\238\45\87", "\189\232\143\74\36\198"), LUAOBFUSACTOR_DECRYPT_STR_0("\216\165\4\75\151\37\166", "\106\156\202\106\46\183") .. opened .. LUAOBFUSACTOR_DECRYPT_STR_0("\125\63\33", "\74\93\121\27\83") .. fail);
	end);
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\183\231\103\120\169\163\46", "\30\29\219\134")].CharacterAdded:Connect(function()
	task.wait(0.3);
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\151\60\223\208\96\53\59\121\147\38\213\218\26\72", "\110\53\199\121\154\148\63\120")] then
		startInfinite();
		applyWalkSpeed();
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\47\210\15\102\209\52\54\203\0\118\210\68\74", "\156\97\122\159\95\57")] then
		applyJumpPower();
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\153\249\212\34\50\0\235\152\251\218\39\39\27\139\230", "\95\174\214\186\152\107\98")] then
		toggleNoClip(true);
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\33\73\173\63\255\182\43\95\170\49\234\172\42\52\219", "\166\233\110\17\235\115")] then
		startBoxFly();
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\33\251\231\211\146\80\71\43\234\224\208\146\89\92\75\148", "\28\24\110\164\161\146\222")] then
		setupNoFall();
	end
end);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\202\88\33\84\212\19\117", "\69\59\163\54")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\161\196\78\6\228\243\224", "\214\208\200\170\42\83\173")]:CreateWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\237\40\102\172\112", "\21\185\65\18\192")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\127\115\63\142\201\105\105\50\149\210\115\24\75", "\193\158\54\61\123")],[LUAOBFUSACTOR_DECRYPT_STR_0("\28\18\47\183", "\217\85\113\64")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\32\235\239\208\171\193\14\95", "\133\43\111\172\160\143\226")],[LUAOBFUSACTOR_DECRYPT_STR_0("\234\182\68\217\207\217", "\160\171\195\48\177")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\38\68\30\117\238\129\130\131", "\167\179\99\22\77\60\161\207")],[LUAOBFUSACTOR_DECRYPT_STR_0("\39\112\135\92\73\19", "\44\97\31\235\56")]=LUAOBFUSACTOR_DECRYPT_STR_0("\214\28\253\161\245\23\208\177\245\20\253\168\253\45\247\170\247\7\255", "\196\145\110\152"),[LUAOBFUSACTOR_DECRYPT_STR_0("\107\39\228\247", "\146\56\78\158")]=UDim2.fromOffset(640, 480),[LUAOBFUSACTOR_DECRYPT_STR_0("\25\211\74\235\95", "\58\77\187\47\134")]=LUAOBFUSACTOR_DECRYPT_STR_0("\53\39\164\2\225\55\115\17\30\49", "\126\114\85\193\103\133\78\52"),[LUAOBFUSACTOR_DECRYPT_STR_0("\240\201\51\118\215\203\51\106\193\213\38", "\24\164\187\82")]=false});
pcall(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\211\82\174\196\216\159\12", "\145\145\186\60\202")]:SetTheme(LUAOBFUSACTOR_DECRYPT_STR_0("\193\194\54\1\226\201\20\11\234\212", "\100\134\176\83"));
end);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\192\64\174\246\69", "\117\179\161\34\221\211")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\100\190\252\201", "\197\45\208\154\166\100\159")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\253\136\184\60\62\177\214", "\83\73\148\230\220")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\7\214\226\236\234", "\233\83\191\150\128\143")]=LUAOBFUSACTOR_DECRYPT_STR_0("\222\136\201\125\31\250\135\219\123\2\249", "\109\151\230\175\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\249\78\74", "\224\192\154\33\36")]=LUAOBFUSACTOR_DECRYPT_STR_0("\138\90\30\141", "\226\227\52\120")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\40\228\250\161\71\186\217\173", "\217\101\139\140\196\42\223\183")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\6\161\30\75\13\74\255", "\36\122\111\207\122")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\56\1\240\180\189", "\84\108\104\132\216\216")]=LUAOBFUSACTOR_DECRYPT_STR_0("\225\20\208\93\237\161\76\216", "\34\172\123\166\56\128\196"),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\170\167\197", "\116\196\201\200\171\42\19\181")]=LUAOBFUSACTOR_DECRYPT_STR_0("\112\137\244\73\5\18\21\120\146\232", "\124\22\230\155\61\117\96")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\241\174\234\238\238\226\231\209", "\149\165\203\134\139\158\141")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\165\78\34\60\187\5\118", "\70\83\204\32")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\58\136\31\140\11", "\224\110\225\107")]=LUAOBFUSACTOR_DECRYPT_STR_0("\192\115\209\52\32\203\214\224", "\164\148\22\189\81\80\164"),[LUAOBFUSACTOR_DECRYPT_STR_0("\155\131\120\189", "\23\210\224\23\211\71\43")]=LUAOBFUSACTOR_DECRYPT_STR_0("\164\135\0\250\69\34\210", "\144\201\230\112\215\53\75\188")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\116\208\13\229\240\164\71\200", "\197\53\165\121\138\150")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\214\215\36\226\200\156\112", "\64\141\191\185")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\55\227\164\214\242", "\198\99\138\208\186\151\169")]=LUAOBFUSACTOR_DECRYPT_STR_0("\44\224\151\81\11\244\145\83", "\62\109\149\227"),[LUAOBFUSACTOR_DECRYPT_STR_0("\218\139\134\218", "\96\147\232\233\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\42\55\14", "\89\72\88\122\43\237")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\9\136\149", "\123\76\219\197\86")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\209\27\8\225\40\29\136", "\95\56\184\117\108\142")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\196\203\50\224\245", "\140\144\162\70")]=LUAOBFUSACTOR_DECRYPT_STR_0("\245\27\105", "\142\176\72\57\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\143\50\31\42", "\68\198\81\112")]=LUAOBFUSACTOR_DECRYPT_STR_0("\178\22\181", "\125\215\111\208\116\44")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\37\70\72\224", "\60\103\39\47\147\24")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\3\249\132\217\228\11\188", "\46\140\106\151\224\182\147")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\223\36\105\78\238", "\34\139\77\29")]=LUAOBFUSACTOR_DECRYPT_STR_0("\146\241\26\71", "\73\208\144\125\52"),[LUAOBFUSACTOR_DECRYPT_STR_0("\3\239\133\197", "\171\74\140\234\171\167\112\51")]=LUAOBFUSACTOR_DECRYPT_STR_0("\60\6\67\79\225\164\33\9\1\93\240\170", "\205\79\110\44\63\145")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\138\86\44\219\189\4\170\15", "\124\199\63\95\168\212\107\196")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\161\93\62\171\224\204\163", "\147\102\200\51\90\196\151\233")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\15\249\251\193\187", "\91\91\144\143\173\222\128")]=LUAOBFUSACTOR_DECRYPT_STR_0("\14\169\95\66\162\65\45\179", "\46\67\192\44\49\203"),[LUAOBFUSACTOR_DECRYPT_STR_0("\45\213\33\172", "\101\100\182\78\194\68\196")]=LUAOBFUSACTOR_DECRYPT_STR_0("\92\73\34\242\136\95", "\181\40\40\80\149\237\43\24")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\56\187\54\49", "\114\117\210\69\82\218\42")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\223\86\119\163\83\147\8", "\204\36\182\56\19")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\221\66\200\143\120", "\114\137\43\188\227\29\88")]=LUAOBFUSACTOR_DECRYPT_STR_0("\201\20\187\19", "\112\132\125\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\212\187\252\125", "\149\157\216\147\19\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\218\131\12\220\192\136\31\219", "\168\169\230\120")})};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\140\134\4\185\221", "\119\156\237\228")].Info:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\247\216\20\114\198", "\30\163\177\96")]=LUAOBFUSACTOR_DECRYPT_STR_0("\57\47\69\144\125\15\221\9\35\90\155\57", "\180\122\64\53\233\93\75"),[LUAOBFUSACTOR_DECRYPT_STR_0("\245\22\31\49\212\22\16\54", "\93\182\119\115")]=function()
	if setclipboard then
		setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\54\224\175\152\204\166\32\244\164\242\174", "\158\226\127\179\236\215")]);
	end
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\210\207\217\223\244\196", "\182\145\160\169"), LUAOBFUSACTOR_DECRYPT_STR_0("\29\41\35\21\168\29\61", "\111\89\64\80\118\199"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\182\12\85\250\231", "\38\223\215\110")].Info:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\106\210\24\201\174", "\203\62\187\108\165")]=LUAOBFUSACTOR_DECRYPT_STR_0("\218\123\88\39\49\201\213\251\103\65\42\116", "\176\153\20\40\94\17\158"),[LUAOBFUSACTOR_DECRYPT_STR_0("\139\50\183\95\199\169\48\176", "\165\200\83\219\51")]=function()
	if setclipboard then
		setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\195\64\94\238\128\142\200\130\186", "\132\167\138\20\27\177\213\220")]);
	end
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\209\218\243\69\57\246", "\92\146\181\131\44"), LUAOBFUSACTOR_DECRYPT_STR_0("\124\251\67\149\183\84\18", "\189\43\158\33\230\222\32\119"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\193\79\66\205\14", "\232\62\160\45\49")].Info:Paragraph({[LUAOBFUSACTOR_DECRYPT_STR_0("\64\218\225\160\164", "\193\20\179\149\204")]=LUAOBFUSACTOR_DECRYPT_STR_0("\240\19\132\199\211\24\193\234\194\5\155\199\219\13", "\162\183\97\225"),[LUAOBFUSACTOR_DECRYPT_STR_0("\13\192\247\244", "\193\73\165\132\151\124\130")]=(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\231\155\104\159\153\227\135\249", "\214\173\162\201\59\214")] .. " · Black & Gold · WindUI")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\120\168\82\146\112", "\64\67\25\202\33\183")].Movement:Slider({[LUAOBFUSACTOR_DECRYPT_STR_0("\221\231\101\176\43", "\35\137\142\17\220\78\178")]=LUAOBFUSACTOR_DECRYPT_STR_0("\26\79\41\10\30\94\32\4\41", "\97\77\46\69"),[LUAOBFUSACTOR_DECRYPT_STR_0("\242\214\14", "\197\191\191\96")]=16,[LUAOBFUSACTOR_DECRYPT_STR_0("\231\40\245", "\45\170\73\141\46\56\136")]=500,[LUAOBFUSACTOR_DECRYPT_STR_0("\165\10\203\228\186\139\19", "\103\225\111\173\133\207\231")]=100,[LUAOBFUSACTOR_DECRYPT_STR_0("\111\133\249\89\78\133\246\94", "\53\44\228\149")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\244\13\32\230\1\227\239\4\54\251\1\232\255\126\85", "\68\173\187\91\101\171")] = val;
	applyWalkSpeed();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\14\16\212\12\210", "\185\156\111\114\167\41\226\29")].Movement:Slider({[LUAOBFUSACTOR_DECRYPT_STR_0("\63\12\2\44\177", "\131\107\101\118\64\212")]=LUAOBFUSACTOR_DECRYPT_STR_0("\235\195\33\59\119\207\222\196\196", "\169\161\182\76\75\39\160"),[LUAOBFUSACTOR_DECRYPT_STR_0("\244\91\185", "\200\185\50\215\235\123\66")]=20,[LUAOBFUSACTOR_DECRYPT_STR_0("\223\128\193", "\122\146\225\185\130\234\22")]=300,[LUAOBFUSACTOR_DECRYPT_STR_0("\157\231\198\206\250\183\173", "\219\217\130\160\175\143")]=50,[LUAOBFUSACTOR_DECRYPT_STR_0("\29\189\78\49\60\189\65\54", "\93\94\220\34")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\253\236\186\229\199\210\56\237\243\207\138", "\157\111\168\161\234\186\151")] = val;
	applyJumpPower();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\65\119\34\135\233", "\229\27\32\21\81\162\217\210")].Movement:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\24\197\239\54\79", "\42\76\172\155\90")]=LUAOBFUSACTOR_DECRYPT_STR_0("\193\157\132\44\4\178\160\148\37\20\251\157\141\32\5\224", "\96\146\237\225\73"),[LUAOBFUSACTOR_DECRYPT_STR_0("\204\123\14\233\92\118\182", "\194\136\30\104\136\41\26")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\255\215\15\68\22\177\170\36", "\79\188\182\99\40\116\208\201")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\243\15\100\7\0\80\246\6\117\28\16\83\134\122", "\95\29\163\74\33\67")] = state;
	if state then
		startInfinite();
	else
		stopInfinite();
	end
	applyWalkSpeed();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\51\66\36\58\218", "\100\28\82\32\87\31\234")].Movement:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\5\91\244\125\254", "\94\81\50\128\17\155\182\136")]=LUAOBFUSACTOR_DECRYPT_STR_0("\161\41\233\41\162\153\9\139\159\53\244\53\235\177\14", "\231\235\92\132\89\130\212\124"),[LUAOBFUSACTOR_DECRYPT_STR_0("\218\177\242\62\196\73\234", "\37\158\212\148\95\177")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\87\29\168\139\15\117\31\175", "\109\20\124\196\231")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\136\89\149\14\13\149\145\64\154\30\14\229\237", "\64\192\221\20\197\81")] = state;
	applyJumpPower();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\247\224\177\226\255", "\199\207\150\130\194")].Movement:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\129\67\111\228\70", "\35\213\42\27\136")]=LUAOBFUSACTOR_DECRYPT_STR_0("\142\136\24\179\209\226", "\146\192\231\91\223\184"),[LUAOBFUSACTOR_DECRYPT_STR_0("\126\244\240\40\196\184\19", "\110\58\145\150\73\177\212\103")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\215\53\198\254\73\202\234\255", "\137\148\84\170\146\43\171")]=toggleNoClip});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\222\125\238\50\81", "\23\97\191\31\157")].Movement:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\178\139\19\9\216", "\82\230\226\103\101\189")]=LUAOBFUSACTOR_DECRYPT_STR_0("\169\37\171\241\50\135\51", "\116\235\74\211\209"),[LUAOBFUSACTOR_DECRYPT_STR_0("\12\57\216\36\61\48\202", "\69\72\92\190")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\21\58\232\216\169\169\21\188", "\215\86\91\132\180\203\200\118")]=function(state)
	if state then
		startBoxFly();
	else
		stopBoxFly();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\239\132\192\118\190", "\179\83\142\230")].Movement:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\238\38\233\57\60", "\191\186\79\157\85\89\127\151")]=LUAOBFUSACTOR_DECRYPT_STR_0("\216\117\228\232\133\73\250\58\128\207\137\68\241\127", "\37\150\26\196\174\228"),[LUAOBFUSACTOR_DECRYPT_STR_0("\237\245\180\84\34\133\221", "\233\169\144\210\53\87")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\1\71\225\208\32\71\238\215", "\188\66\38\141")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\127\50\23\82\110\36\247\196\126\44\19\95\103\44\141\177", "\168\129\48\109\81\19\34\104")] = state;
	if state then
		setupNoFall();
	end
end});
local function getPlayerNames()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\21\1\53\204\96\235", "\153\23\116\108\80\191\69\219")] = {};
	for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\19\252\193\253\153\101\12\79", "\22\41\127\157\184\152\235")]:GetPlayers()) do
		if (p ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\203\224\211\18\213\164\154", "\170\119\167\129")]) then
			table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\241\177\118\144\27\138", "\62\186\144\220\19\227")], p.Name);
		end
	end
	if (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\253\225\211\178\185\188", "\182\193\156\140")] == 0) then
		table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\77\27\183\245\122\145", "\95\161\44\118\210\134")], LUAOBFUSACTOR_DECRYPT_STR_0("\200\79\29\8", "\206\134\32\115\109\26\182\133"));
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\249\194\22\78\24\102", "\61\86\152\175\115\61")];
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\4\208\53\210\149\38\195\153\13\221\41\212\147\13\198\164\4\153\96", "\167\201\97\188\80\177\225\67")] = getPlayerNames()[1];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\4\133\182\249\147\106\26\139\191\248\142\89\6\193\255", "\225\46\104\228\207\156")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\193\177\93\114\3", "\223\202\160\211\46\87\51\210")].Teleport:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\226\224\14\120\8", "\109\182\137\122\20")]=LUAOBFUSACTOR_DECRYPT_STR_0("\97\172\30\255\227\195\170\76\94\168\11\255\242", "\28\50\201\114\154\128\183\138"),[LUAOBFUSACTOR_DECRYPT_STR_0("\156\135\21\231\175\149", "\146\202\230\121")]=getPlayerNames(),[LUAOBFUSACTOR_DECRYPT_STR_0("\202\234\232\31\210\190\180", "\94\142\143\142\126\167\210\192")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\192\17\228\196\20\192\25\209\203\1\220\24\243\233\1\200\24\164\151", "\167\96\165\125\129")],[LUAOBFUSACTOR_DECRYPT_STR_0("\36\215\26\74\64\39\72\131", "\232\103\182\118\38\34\70\43")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\82\35\230\51\101\48\83\31\239\49\104\48\69\1\226\61\116\112\7", "\17\85\55\79\131\80")] = val;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\132\187\191\122\152", "\95\168\229\217\204")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\190\50\146\133\143", "\233\234\91\230")]=LUAOBFUSACTOR_DECRYPT_STR_0("\99\68\132\97\162\66\73\194\67\171\80\88\135\97\180", "\199\49\33\226\19"),[LUAOBFUSACTOR_DECRYPT_STR_0("\113\90\79\19\197\83\88\72", "\167\50\59\35\127")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\3\86\237\188\77\23\23\188", "\200\40\115\50\140")] = getPlayerNames();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\40\123\26\240\57\114\27\195\33\118\6\246\63\89\30\254\40\50\79", "\127\147\77\23")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\246\241\117\100\142\226\176\36", "\16\235\134\149\20")][1];
	pcall(function()
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\71\79\191\9\149\40\200\68\94\162\3\144\2\159\27", "\108\186\43\46\198\108\231")].Refresh then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\179\244\24\121\32\155\231\14\108\54\176\226\15\57\98", "\28\82\223\149\97")]:Refresh(TABLE_TableIndirection["updated%0"]);
		elseif TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\57\76\71\168\39\105\76\162\37\73\81\186\59\8\14", "\62\205\85\45")].SetValues then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\0\160\176\7\155\45\103\3\177\173\13\158\7\48\92", "\105\21\108\193\201\98\233")]:SetValues(TABLE_TableIndirection["updated%0"]);
		end
	end);
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\116\128\23\251\211\49\200\84", "\186\32\229\123\158\163\94"), LUAOBFUSACTOR_DECRYPT_STR_0("\52\47\112\211\28\183\36\68\49\116\204\11\160\36\12\38\117", "\87\100\67\17\170\121\197"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\138\184\147\18\229", "\213\142\235\218\224\55")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\60\171\237\201\13", "\165\104\194\153")]=LUAOBFUSACTOR_DECRYPT_STR_0("\179\0\153\191\246\29\189\139\49\192\174\235", "\237\231\80\185\203\153\61"),[LUAOBFUSACTOR_DECRYPT_STR_0("\134\49\140\126\71\164\51\139", "\37\197\80\224\18")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\67\94\65\177\13\7\28", "\212\121\34\44\38")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\182\43\28\123\191\225\27\234", "\62\218\218\74\101\30\205\146")]:FindFirstChild(TABLE_TableIndirection["selectedPlayerName%0"]);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\168\107\246\216\42\1\127", "\79\34\201\25\145\189\94\36")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\45\248\13\69\64\5\124", "\52\32\76\138\106\32")].Character) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\234\117\150", "\26\216\154\80\166")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\200\255\68\120\56\137\153", "\76\172\169\141\35\29")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\244\204\245\2\210\214\241\7\238\214\247\23\236\216\234\23", "\99\188\185\152"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\4\243\94", "\195\178\116\214\110")] then
			safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\231\195\37", "\134\101\151\230\21\161")].CFrame * CFrame.new(0, 3, 0));
		end
	else
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\157\143\54\81\51\61\242\189", "\128\201\234\90\52\67\82"), LUAOBFUSACTOR_DECRYPT_STR_0("\148\65\63\109\207\182\13\48\123\222\228\75\49\97\196\160", "\170\196\45\94\20"));
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\69\7\39\132\112", "\80\30\36\101\84\161\64")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\146\88\13\78\221", "\91\198\49\121\34\184")]=LUAOBFUSACTOR_DECRYPT_STR_0("\0\246\55\151\140\53\212\114\170\157\116\228\118\190", "\233\84\166\23\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\91\121\244\234\52\32\123\115", "\65\24\24\152\134\86")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\114\184", "\41\220\87\136")] = getClosestEntity();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\115\179", "\203\69\86\131\144\174")] then
		safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\91\3", "\113\217\126\51\57\168\48\135")].CFrame * CFrame.new(0, 3, 0));
	else
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\43\16\58\77\88\112\100\218", "\174\127\117\86\40\40\31\22"), LUAOBFUSACTOR_DECRYPT_STR_0("\242\52\12\217\221\60\12\213\217\58\94\217\197", "\187\188\91\44"));
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\246\124\54\167\93", "\109\127\151\30\69\130")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\230\140\99\20\192", "\118\178\229\23\120\165\176\210")]=LUAOBFUSACTOR_DECRYPT_STR_0("\54\204\77\30\2\239\21\178\16\206", "\221\101\188\44\105\108\207\65"),[LUAOBFUSACTOR_DECRYPT_STR_0("\117\49\27\174\208\87\51\28", "\178\54\80\119\194")]=function()
	task.spawn(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\74\17", "\162\84\111\33\162\143\153\217")] = 0;
		for _, obj in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\212\15\129\52\203\28\137\34\158\77", "\234\71\187\125")]:GetDescendants()) do
			if obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\34\44\80\76\240\61\51\82\90\234\24\51\95", "\158\113\92\49\59")) then
				safeTeleport(obj.CFrame + Vector3.new(0, 4, 0));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\53\17", "\103\140\16\33\16\158\102\186")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\200\237", "\92\167\237\221\21\99")] + 1;
				task.wait(0.4);
			end
		end
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\203\37\33\35\239\47\63\50", "\70\159\64\77"), LUAOBFUSACTOR_DECRYPT_STR_0("\228\95\83\232\20\196\21\18", "\122\183\47\50\159") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\116\247", "\224\162\81\199\47")]);
	end);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\68\49\46\198\184", "\227\136\37\83\93")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\109\164\28\120\92", "\20\57\205\104")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\164\20\181\31\89\39\104\137\25\189\29\95\32", "\83\72\203\120\217\122\58"),[LUAOBFUSACTOR_DECRYPT_STR_0("\159\232\183\175\173\188\188\183", "\223\220\137\219\195\207\221")]=function()
	task.spawn(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\71\74\236\56\86\24", "\76\115\40\63\130")] = 0;
		for _, obj in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\21\63\166\165\193\134\25\40\232\230", "\177\231\122\77\205\214")]:GetDescendants()) do
			if (obj.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\102\18\69\71\172\125\83\18\83\68\172\78", "\60\36\115\33\32\201")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\51\7", "\193\215\22\55\38\44\62\93")] = (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\13\19\29\202\229\250\61\6", "\155\79\114\110\175\181")) and obj) or (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\117\91\221\225\189", "\181\56\52\185\132\209\236")) and (obj.PrimaryPart or obj:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\16\77\193\173\117\168\232\38", "\154\82\44\178\200\37\201"))));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\174\82", "\21\21\139\98\109\222\40")] then
					safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\169\252", "\90\100\140\204\236")].CFrame * CFrame.new(0, 3, 0));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\27\43\194\163\93\252", "\120\204\116\94\172\215")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\178\173\6\255\231\32", "\31\99\221\216\104\139\194\16")] + 1;
					task.wait(0.4);
				end
			end
		end
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\23\161\238\11\12\240", "\131\85\192\138\108\105"), LUAOBFUSACTOR_DECRYPT_STR_0("\18\171\113\6\108\228", "\99\86\196\31") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\59\90\243\75\226\95", "\111\48\84\47\157\63\199")]);
	end);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\7\130\180\107\74", "\78\122\102\224\199")].Autofarm:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\200\17\96\15\49", "\159\156\120\20\99\84\101\206")]=LUAOBFUSACTOR_DECRYPT_STR_0("\89\31\141\125\196\68\55\6\105\5\131\121\201\83\122", "\71\28\113\236\31\168\33\23"),[LUAOBFUSACTOR_DECRYPT_STR_0("\105\251\37\249\204\213\47", "\199\45\158\67\152\185\185\91")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\121\120\177\162\210\23\212\219", "\176\58\25\221\206\176\118\183")]=function(state)
	if state then
		startAutofarm();
	else
		stopAutofarm();
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\19\4\205\9\232\185\32\28", "\216\82\113\185\102\142"), LUAOBFUSACTOR_DECRYPT_STR_0("\113\79\47\200\109\71\95", "\29\34\59\64\184"));
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\31\74\217\112\13", "\61\114\126\40\170\85")].Autofarm:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\248\33\99\53\198", "\19\172\72\23\89\163")]=LUAOBFUSACTOR_DECRYPT_STR_0("\17\93\221\232\117\127\170\51\89", "\197\87\60\175\133\85\50"),[LUAOBFUSACTOR_DECRYPT_STR_0("\34\127\216\198\17\109", "\179\116\30\180")]={LUAOBFUSACTOR_DECRYPT_STR_0("\201\201\249\137", "\225\139\166\141"),LUAOBFUSACTOR_DECRYPT_STR_0("\111\138\243", "\64\45\235\148"),LUAOBFUSACTOR_DECRYPT_STR_0("\85\80\57\234\89", "\181\22\49\90\130\60")},[LUAOBFUSACTOR_DECRYPT_STR_0("\43\212\190\8\26\221\172", "\105\111\177\216")]=LUAOBFUSACTOR_DECRYPT_STR_0("\150\21\220\26", "\179\212\122\168\114\112"),[LUAOBFUSACTOR_DECRYPT_STR_0("\90\123\136\193\123\123\135\198", "\173\25\26\228")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\67\253\149\62\55\68\228\133\53\57\82\236\255\72", "\120\118\22\169\218")] = val;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\33\180\245\130\112", "\134\167\64\214")].Autofarm:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\48\128\234\132\204", "\168\100\233\158\232\169")]=LUAOBFUSACTOR_DECRYPT_STR_0("\68\85\11\245\115\90\13", "\156\18\52\121"),[LUAOBFUSACTOR_DECRYPT_STR_0("\117\17\215\223\129\166", "\191\35\112\187\170\228\213\101")]={LUAOBFUSACTOR_DECRYPT_STR_0("\139\174\122\80", "\31\216\207\28\53\94\124"),LUAOBFUSACTOR_DECRYPT_STR_0("\3\43\170\27\90\47\51", "\59\65\71\203\111")},[LUAOBFUSACTOR_DECRYPT_STR_0("\51\165\122\117\158\0\32", "\84\119\192\28\20\235\108")]=LUAOBFUSACTOR_DECRYPT_STR_0("\191\255\34\243", "\33\236\158\68\150\122\92\201"),[LUAOBFUSACTOR_DECRYPT_STR_0("\195\217\245\21\75\240\58\235", "\89\128\184\153\121\41\145")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\0\144\174\4\166\50\22\211\3\133\179\11\166\46\15\169\101", "\91\140\85\196\225\66\231\96")] = val;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\185\181\162\14\99", "\43\83\216\215\209")].Autofarm:Slider({[LUAOBFUSACTOR_DECRYPT_STR_0("\127\174\164\7\43", "\78\43\199\208\107")]=LUAOBFUSACTOR_DECRYPT_STR_0("\84\132\25\94\136\42\192\211\118", "\182\18\232\96\126\219\90\165"),[LUAOBFUSACTOR_DECRYPT_STR_0("\16\87\41", "\200\93\62\71")]=20,[LUAOBFUSACTOR_DECRYPT_STR_0("\107\76\86", "\110\38\45\46\186\164\210")]=800,[LUAOBFUSACTOR_DECRYPT_STR_0("\92\187\174\23\43\116\170", "\94\24\222\200\118")]=130,[LUAOBFUSACTOR_DECRYPT_STR_0("\62\193\42\21\31\193\37\18", "\121\125\160\70")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\198\2\141\192\218\30\151\215\175\107", "\210\147\138\91")] = val;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\252\202\88\117\67", "\115\85\157\168\43\80")].Autofarm:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\203\83\147\91\137", "\169\159\58\231\55\236\169\38")]=LUAOBFUSACTOR_DECRYPT_STR_0("\48\207\171\25\137\54\125\31\129\247\19\197\4\60\2\209\186\21\192\93", "\28\113\161\223\112\164\116"),[LUAOBFUSACTOR_DECRYPT_STR_0("\226\93\65\120\78\202\76", "\59\166\56\39\25")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\145\217\202\196\65\179\219\205", "\35\210\184\166\168")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\119\73\107\27\85\120\119\66\103\10\86\123\117\88\102\97\39", "\23\57\57\29\34\68")] = state;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\48\29\63\21\97", "\76\48\81\127")].Autofarm:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\58\172\69\187\15", "\48\110\197\49\215\106\20\189")]=LUAOBFUSACTOR_DECRYPT_STR_0("\47\23\91\169\212\107\68\13\26\82\75\163\213\37\82\9\15", "\108\125\114\40\204\160\75\38"),[LUAOBFUSACTOR_DECRYPT_STR_0("\22\113\243\1\55\113\252\6", "\109\85\16\159")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\242\170\120\20\77\190\51\246\191\30\75", "\208\71\147\205\59\123\56")] = 0;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\53\144\183\81\33\150\181\100\52\133\170\67\20\141\181\82\101\212", "\216\55\64\228")] = os.time();
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\140\156\63\214\170", "\139\223\232\94\162\217\149"), LUAOBFUSACTOR_DECRYPT_STR_0("\231\134\48\244\175", "\170\181\227\67\145\219\53"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\132\28\161\28\213", "\210\57\229\126")].Autofarm:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\140\58\254\170\55", "\227\216\83\138\198\82\165")]=LUAOBFUSACTOR_DECRYPT_STR_0("\24\189\185\111\178\56\161\183\108\225", "\146\75\213\214\24"),[LUAOBFUSACTOR_DECRYPT_STR_0("\105\127\205\72\120\68\86\65", "\53\42\30\161\36\26\37")]=function()
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\206\237\246\244\238", "\128\157\153\151"), LUAOBFUSACTOR_DECRYPT_STR_0("\84\116\139\58\79\51", "\19\22\21\236\73\117") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\196\165\138\248\168\35\226\114\215\231\249", "\150\23\165\194\201\151\221\77")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\62\39\168", "\122\30\91\136") .. (os.time() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\177\241\191\139\190\182\232\131\153\190\182\241\132\132\178\161\160\224", "\237\223\196\133\208")]) .. "s");
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\9\193\173\27\170", "\154\188\104\163\222\62")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\1\228\57\247\21", "\162\85\141\77\155\112\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\55\26\150\14\55\39\167\76\30\44\162", "\46\114\73\198"),[LUAOBFUSACTOR_DECRYPT_STR_0("\129\123\112\238\59\70\177", "\42\197\30\22\143\78")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\80\68\83\51\113\68\92\52", "\95\19\37\63")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\31\151\195\84\41\80\14\139\217\85\66\33", "\103\17\76\199\156\17")] = state;
	if state then
		rebuildESP();
	else
		clearAllESP();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\43\135\251\25\64", "\154\211\74\229\136\60\112\217")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\155\21\254\193\0", "\39\207\124\138\173\101")]=LUAOBFUSACTOR_DECRYPT_STR_0("\253\9\76\215\226\236\0\68\211", "\194\174\97\35\160"),[LUAOBFUSACTOR_DECRYPT_STR_0("\219\37\59\3\234\44\41", "\98\159\64\93")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\45\176\33\19\19\7\88\47", "\68\110\209\77\127\113\102\59")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\215\151\112\33\226\137\157\219\130\97\34\225\130\139\192\226\31", "\206\206\132\199\47\99\163")] = state;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\241\231\77\116\216\227\245\94\116\210\135\135", "\49\150\162\183\18")] then
		rebuildESP();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\43\185\50\95\176", "\120\41\74\219\65\122\128")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\110\15\72\22\224", "\181\58\102\60\122\133\199")]=LUAOBFUSACTOR_DECRYPT_STR_0("\96\234\211\14\58\99\238\221\0\127\65\241", "\26\51\130\188\121"),[LUAOBFUSACTOR_DECRYPT_STR_0("\204\135\42\24\92\18\227", "\57\136\226\76\121\41\126\151")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\1\214\5\95\38\226\126\41", "\29\66\183\105\51\68\131")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\22\121\241\117\9\104\247\96\23\122\241\96\11\104\236\105\0\109\139\21", "\174\37\69\41")] = state;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\133\126\49\53\175\151\108\34\53\165\243\30", "\112\225\214\46\110")] then
		rebuildESP();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\37\33\72\161\237", "\140\126\68\67\59\132\221")].ESP:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\182\120\19\71\72", "\230\226\17\103\43\45\127")]=LUAOBFUSACTOR_DECRYPT_STR_0("\226\73\194\89\130\195\68\132\110\180\224", "\231\176\44\164\43"),[LUAOBFUSACTOR_DECRYPT_STR_0("\130\199\40\165\172\141\162\205", "\236\193\166\68\201\206")]=function()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\8\248\78\33\21\233\83\40\30\236\52\84", "\17\100\91\168")] then
		rebuildESP();
	end
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\127\149\188", "\27\58\198\236\140\211\67"), LUAOBFUSACTOR_DECRYPT_STR_0("\19\200\202\88\140\248\41\200\200", "\139\65\173\172\42\233"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\87\115\203\129\39", "\40\231\54\17\184\164\23\128")].ESP:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\176\192\107\244\128", "\138\228\169\31\152\229")]=LUAOBFUSACTOR_DECRYPT_STR_0("\229\11\76\58\242\198\140\2\71\52\242\198\223\24\2\55\225\196", "\163\172\108\34\85\128"),[LUAOBFUSACTOR_DECRYPT_STR_0("\4\16\251\139\217\69\139\95", "\52\71\113\151\231\187\36\232")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\200\40", "\205\22\237\24")] = getClosestEntity();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\61\35", "\89\222\24\19\168")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\28\3", "\113\149\57\51\215")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\53\155", "\160\25\16\171\214\130")]:FindFirstAncestorOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\92\215\51\120\113", "\235\17\184\87\29\29\178")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\236\41", "\144\202\201\25\152")];
		ignoreList[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\158\84", "\96\89\187\100\30\155\42\135")]] = true;
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\8\254\51", "\29\77\173\99\42\26"), LUAOBFUSACTOR_DECRYPT_STR_0("\173\229\9\117\73\234\243", "\109\228\130\103\26\59\143\151"));
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\121\172\202\123\26", "\228\227\24\206\185\94\42\79")].Bags:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\250\43\35\164\177", "\80\174\66\87\200\212\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\228\105\59\198\183\62\196\125\59", "\115\171\25\94\168\151"),[LUAOBFUSACTOR_DECRYPT_STR_0("\58\179\232\52\242\31", "\151\108\210\132\65")]={LUAOBFUSACTOR_DECRYPT_STR_0("\235\88\6\95", "\52\184\52\105\40\166\33\167"),LUAOBFUSACTOR_DECRYPT_STR_0("\116\15\222\188", "\172\50\110\173\200\90\180"),LUAOBFUSACTOR_DECRYPT_STR_0("\210\180\231\88\250\180\224", "\44\155\218\148")},[LUAOBFUSACTOR_DECRYPT_STR_0("\201\254\42\58\193\43\165", "\209\141\155\76\91\180\71")]=LUAOBFUSACTOR_DECRYPT_STR_0("\213\124\204\95", "\122\147\29\191\43"),[LUAOBFUSACTOR_DECRYPT_STR_0("\159\209\82\5\216\254\143\117", "\30\220\176\62\105\186\159\236")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\220\130\159\38\208\185\144\135\217\128\245\102", "\221\232\189\229\208\86\181\215")] = val;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\181\246\207\107\92", "\78\108\212\148\188")].Bags:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\15\25\0\46\233", "\90\91\112\116\66\140\96\219")]=LUAOBFUSACTOR_DECRYPT_STR_0("\228\66\30\3\160\135\20\192\89\74\47\225\187\1\214\23\66\35\240\173\10\230\86\25\9\169", "\100\165\55\106\108\128\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\225\206\55\178\208\199\37", "\211\165\171\81")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\39\116\222\198\213\221\7\126", "\188\100\21\178\170\183")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\22\87\156\162\200\112\37\69\189\188\196\112\16\21\227", "\173\30\119\48\211\210")] = state;
	if state then
		openCasesLoop();
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\121\216\62\41", "\90\59\185\89"), LUAOBFUSACTOR_DECRYPT_STR_0("\111\224\95\65\50\115\71\190\20\1", "\29\32\144\58\47\91"));
	else
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\49\52\118\174", "\193\115\85\17\221\33"), LUAOBFUSACTOR_DECRYPT_STR_0("\222\111\1\14\191\217\233", "\188\141\27\110\126\207"));
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\55\92\100\161\184", "\105\237\86\62\23\132\136")].Missions:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\141\64\40\65\38", "\125\217\41\92\45\67")]=LUAOBFUSACTOR_DECRYPT_STR_0("\106\189\8\88\150\87\88\166\70\109\134\73\86\184\10", "\59\57\212\102\63\227"),[LUAOBFUSACTOR_DECRYPT_STR_0("\94\233\115\11\127\233\124\12", "\103\29\136\31")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\107\138", "\38\126\78\186\74")] = rerollAll();
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\236\73\57\153\78\139\207\83", "\228\161\32\74\234\39"), LUAOBFUSACTOR_DECRYPT_STR_0("\12\129\24\186\252\141\116\152", "\224\94\228\106\213\144\225\84") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\173\23", "\97\208\136\39\160")]);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\40\193\149\28\66", "\91\150\73\163\230\57\114")].Missions:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\122\164\166\90\245", "\63\46\205\210\54\144\107\222")]=LUAOBFUSACTOR_DECRYPT_STR_0("\194\41\230\72\208\252\108\225\73\200\249\32\180\83\211\231\41\230\7\148\227\56\251\87\156\231\36\241\73\156\246\35\225\73\216\185", "\188\144\76\148\39"),[LUAOBFUSACTOR_DECRYPT_STR_0("\161\78\115\165\89\0\54", "\53\229\43\21\196\44\108\66")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\16\52\27\169\49\52\20\174", "\197\83\85\119")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\223\48\1\10\170", "\87\47\154\126")].GreedyTowerFind = state;
	if not state then
		return;
	end
	task.spawn(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\61\156", "\180\75\24\172\187\178")] = 0;
		while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\252\203\53\57\116", "\112\163\185\133\99\28\68\153")].GreedyTowerFind do
			local name, data, mis = findTower();
			if name then
				notify(LUAOBFUSACTOR_DECRYPT_STR_0("\159\91\235\206\185\20\250\196\190\90\248", "\171\203\52\156"), name .. LUAOBFUSACTOR_DECRYPT_STR_0("\250\133\61", "\192\218\170\29\209\74\225\221") .. ((mis and mis.Name) or "?"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\249\117\54\138\29", "\157\227\188\59\96\175\45\73")].GreedyTowerFind = false;
				break;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\143\135", "\81\223\170\183\118")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\4\252", "\113\70\33\204\219\153\82")] + 1;
			rerollAll();
			task.wait(0.3);
		end
	end);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\131\61\47\187\224", "\208\145\226\95\92\158")].Missions:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\138\232\201\64\234", "\120\222\129\189\44\143\149\207")]=LUAOBFUSACTOR_DECRYPT_STR_0("\176\30\10\180\216\11\88\173\144\30\27\176\216\70\57\240\213\68\86\248", "\216\228\113\125\209\170\43\25"),[LUAOBFUSACTOR_DECRYPT_STR_0("\221\255\94\68\103\114\237", "\30\153\154\56\37\18")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\62\184\251\0\57\28\186\252", "\91\125\217\151\108")]=function(state)
	if state then
		startTowerAutofarm();
	else
		stopTowerAutofarm();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\18\164\99\155\169", "\190\153\115\198\16")].Missions:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\14\114\190\139\63", "\231\90\27\202")]=LUAOBFUSACTOR_DECRYPT_STR_0("\178\148\93\167\90\193\137\81\177\77\136\139\86\226\88\128\150\85", "\62\225\228\56\194"),[LUAOBFUSACTOR_DECRYPT_STR_0("\50\188\191\44\97\89\2", "\53\118\217\217\77\20")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\138\30\232\210\45\168\28\239", "\79\201\127\132\190")]=function(state)
	if state then
		startSpeedFarm();
	else
		stopSpeedFarm();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\21\235\218\109\68", "\169\72\116\137")].Missions:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\77\115\221\170\124", "\198\25\26\169")]=LUAOBFUSACTOR_DECRYPT_STR_0("\100\124\211\45\130\72\59\105\72\102\209\50\199\87\122\109\68", "\31\41\19\189\70\231\49\27"),[LUAOBFUSACTOR_DECRYPT_STR_0("\147\214\87\231\162\223\69", "\134\215\179\49")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\194\245\90\234\87\18\226\255", "\115\129\148\54\134\53")]=function(state)
	if state then
		startMonkeyFarm();
	else
		stopMonkeyFarm();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\134\82\88\157\88", "\115\137\231\48\43\184\104")].Missions:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\237\224\14\239\172", "\95\185\137\122\131\201\192")]=LUAOBFUSACTOR_DECRYPT_STR_0("\91\57\201\24\32\111\118\200\29\38\115", "\69\22\86\167\115"),[LUAOBFUSACTOR_DECRYPT_STR_0("\123\133\75\141\71\38\91\143", "\71\56\228\39\225\37")]=monkeyOnce});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\224\230\58\191\189", "\66\208\129\132\73\154\141")].Missions:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\126\86\194\241\79", "\157\42\63\182")]=LUAOBFUSACTOR_DECRYPT_STR_0("\248\39\42\240\202\155\9\105\244\192\215\58\105\180\158\149\107\102\173\129\130\113\123\178\154\148\109\96", "\175\187\94\73\156"),[LUAOBFUSACTOR_DECRYPT_STR_0("\5\62\67\44\25\34\195\45", "\160\70\95\47\64\123\67")]=function()
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\117\90\26\251\99\75\6\225\114\91\29\250\31\36", "\81\190\58\20")] < 1.6) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\98\152\92\166\16\96\4\115\101\153\91\167\108\15", "\83\44\45\214\23\227\73\63")] = 1.9;
	elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\149\104\149\5\204\133\113\129\8\218\150\98\251\112", "\64\149\218\38\222")] < 2) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\136\228\251\63\158\245\231\37\143\229\252\62\226\154", "\176\122\199\170")] = 2.5;
	elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\36\158\251\20\18\45\60\143\248\30\7\54\78\224", "\75\114\107\208\176\81")] < 2.7) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\4\7\94\220\18\22\66\198\3\6\89\221\110\121", "\21\153\75\73")] = 3;
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\60\99\217\151\127\54\36\114\218\157\106\45\86\29", "\38\105\115\45\146\210")] = 1.5;
	end
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\47\25\2\125\54\27", "\83\98\118\108\22"), LUAOBFUSACTOR_DECRYPT_STR_0("\126\171\113\34\169\128\99\20\171", "\67\41\139\25\77\197\228") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\129\224\1\115\209\215\153\241\2\121\196\204\235\158", "\136\136\206\174\74\54")]);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\242\132\150\22\244", "\219\68\147\230\229\51\196")].Misc:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\72\71\226\236\3", "\123\28\46\150\128\102\39")]=LUAOBFUSACTOR_DECRYPT_STR_0("\36\71\9\94\86\168\29\94", "\21\101\41\125\55\123\233\91"),[LUAOBFUSACTOR_DECRYPT_STR_0("\166\238\168\242\25\62\150", "\82\226\139\206\147\108")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\210\7\65\189\206\240\5\70", "\172\145\102\45\209")]=setAntiAfk});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\12\14\83\206\46", "\30\148\109\108\32\235")].Misc:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\32\78\5\83\17", "\63\116\39\113")]=LUAOBFUSACTOR_DECRYPT_STR_0("\9\69\194\249\21\104\167\54\16\243\233\28\45\184\55\66\211", "\200\88\48\167\140\112\72"),[LUAOBFUSACTOR_DECRYPT_STR_0("\230\91\46\170\247\206\74", "\130\162\62\72\203")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\128\182\177\124\133\129\236\246", "\157\195\215\221\16\231\224\143")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\252\33\163\202\81\230\58\185\198\74\252\52\169\205\94\251\39\169\199\58\137", "\131\31\185\107\236")] = state;
	if state then
		setupRejoinQueue();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\170\72\55\238\251", "\68\203\203\42")].Misc:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\119\94\97\213\70", "\185\35\55\21")]=LUAOBFUSACTOR_DECRYPT_STR_0("\129\252\181\139\186\247", "\228\211\153\223"),[LUAOBFUSACTOR_DECRYPT_STR_0("\119\238\84\49\56\7\87\228", "\102\52\143\56\93\90")]=function()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\50\138\7\204\104\40\145\29\192\115\50\159\13\203\103\53\140\13\193\3\71", "\133\38\119\192\72")] then
		setupRejoinQueue();
	end
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\164\120\254\231\174\102\239\196\164\102\237\254\162\113\190\167", "\155\151\193\20")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
	end);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\165\2\93\62\126", "\27\78\196\96\46")].Misc:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\222\242\166\180\127", "\44\138\155\210\216\26\36")]=LUAOBFUSACTOR_DECRYPT_STR_0("\136\72\171\76\248\169\13\145\85\237", "\157\219\45\217\58"),[LUAOBFUSACTOR_DECRYPT_STR_0("\147\188\58\217\252\177\190\61", "\158\208\221\86\181")]=function()
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\68\230\14\48\176\42\244\114\239\25\54\182\59\229\4\186", "\88\128\33\138\107\64\223")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
	end);
end});
setAntiAfk(true);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\215\91\67\232\43", "\142\161\146\21\21\205\27")].GreedyHudzell_Ready = true;
notify(LUAOBFUSACTOR_DECRYPT_STR_0("\55\232\121\6\30\224\140\56\239\120\25\31\245\192", "\172\112\154\28\99\122\153"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\210\146\45\226\216\142\91\155", "\126\171\151\192")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\126\18\246\29\3\255\93", "\57\94\126\153\124\103\154"));
print(LUAOBFUSACTOR_DECRYPT_STR_0("\44\224\91\28\211\69\14\250", "\33\119\167\41\121\182"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\145\9\101\130\124\50\125\23", "\88\39\212\91\54\203\51\124")], LUAOBFUSACTOR_DECRYPT_STR_0("\27\165\186\142\78\231\136\62\169\181\142\98", "\168\76\204\212\234\27\174"));
