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
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\1\34\5\90\138\213\238\116", "\155\203\68\112\86\19\197")] = LUAOBFUSACTOR_DECRYPT_STR_0("\80\137\120\170\14\41\165\207\79\211\50\201\105", "\152\38\189\86\156\32\24\133");
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
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\2\37\167\247\177\87\87\125\3\62\184\195\181\84\79\75\4\37\173\245\245\21", "\58\46\119\81\200\145\208\37")] = false;
local cameraFrozen, savedCameraCFrame = false, nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\173\29\137\155\156\9\6\163\20\137\236\237", "\86\75\236\80\204\201\221")] = 1;
local entityESP, playerESP, ignoreList = {}, {}, {};
local noclipConn, boxFlyConn, speedConn, noFallConn, antiAfkConn, bodyVelocity;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\110\89\174\219\178\77\118\72\173\209\167\86\4\39", "\235\18\33\23\229\158")] = 1.9;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\149\239\144\117\131\254\141\117\148\245\254\0", "\219\48\218\161")] = Vector3.new(-311.12, 85.56, -443.3);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\80\78\96\239\118\223\199\94\80\102\233\124\165\180", "\128\132\17\28\41\187\47")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\52\60\5\53\80\12\61\8", "\61\97\82\102\90")]=Color3.fromRGB(0, 255, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\158\47\185\78", "\105\204\78\203\43\167\55\126")]=Color3.fromRGB(127, 0, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\128\186\42\29", "\49\197\202\67\126\115\100\167")]=Color3.fromRGB(0, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\27\94\216\44\142\82\95\37\66", "\62\87\59\191\73\224\54")]=Color3.fromRGB(255, 244, 119),[LUAOBFUSACTOR_DECRYPT_STR_0("\210\14\238\192\234\3\238\204", "\169\135\98\154")]=Color3.fromRGB(255, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\232\120\41\89\242\61", "\168\171\23\68\52\157\83")]=Color3.fromRGB(180, 150, 100)};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\80\199\132\17\20\184\219\67\209\136\23\104\215", "\231\148\17\149\205\69\77")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\163\168\202\246\88\241", "\159\224\199\167\155\55"),LUAOBFUSACTOR_DECRYPT_STR_0("\194\253\63\221\250\254\51\220", "\178\151\147\92"),LUAOBFUSACTOR_DECRYPT_STR_0("\190\252\94\55", "\26\236\157\44\82\114\44"),LUAOBFUSACTOR_DECRYPT_STR_0("\15\62\220\88", "\59\74\78\181"),LUAOBFUSACTOR_DECRYPT_STR_0("\9\212\93\95\189\33\208\72\67", "\211\69\177\58\58"),LUAOBFUSACTOR_DECRYPT_STR_0("\130\233\109\252\228\202\163\224", "\171\215\133\25\149\137")};
local FARM_RARITY, ESP_RARITY = {}, {};
for _, r in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\233\0\211\219\9\195\109\211\236\23\200\170\96", "\34\129\168\82\154\143\80\156")]) do
	FARM_RARITY[r] = true;
	ESP_RARITY[r] = true;
end
pcall(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\187\61\15\125\103\204\213", "\233\229\210\83\107\40\46")]:AddTheme({[LUAOBFUSACTOR_DECRYPT_STR_0("\239\67\63\211", "\101\161\34\82\182")]=LUAOBFUSACTOR_DECRYPT_STR_0("\207\31\92\251\223\251\165\33\228\9", "\78\136\109\57\158\187\130\226"),[LUAOBFUSACTOR_DECRYPT_STR_0("\28\62\250\250\57\45\246\228\48\59", "\145\94\95\153")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\190\157\23\133\79\231\168", "\215\157\173\116\181\46")),[LUAOBFUSACTOR_DECRYPT_STR_0("\20\183\136\247\212\33", "\186\85\212\235\146")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\129\208\64\175\107\190\0", "\56\162\225\118\158\89\142")),[LUAOBFUSACTOR_DECRYPT_STR_0("\120\12\193\163\45\223", "\184\60\101\160\207\66")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\114\211\46\237\97\210\125", "\220\81\226\28")),[LUAOBFUSACTOR_DECRYPT_STR_0("\60\192\150\247\227\201\22", "\167\115\181\226\155\138")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\161\33\190\93\41\35\145", "\166\130\66\135\60\27\17")),[LUAOBFUSACTOR_DECRYPT_STR_0("\112\79\214\97", "\80\36\42\174\21")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\13\22\49\127\75\18\49", "\26\46\112\87")),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\47\170\119\186\183\74\184\189\38\185", "\212\217\67\203\20\223\223\37")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\249\212\169\138\239\216\253", "\178\218\237\200")),[LUAOBFUSACTOR_DECRYPT_STR_0("\148\160\242\196\185\187", "\176\214\213\134")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\183\255\183\134\252\7\9", "\57\148\205\214\180\200\54")),[LUAOBFUSACTOR_DECRYPT_STR_0("\59\254\58\58", "\22\114\157\85\84")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\135\205\21\199\14\167\173", "\200\164\171\115\164\61\150")),[LUAOBFUSACTOR_DECRYPT_STR_0("\138\251\4\66\143\187", "\227\222\148\99\37")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\112\81\11\247\171\97\5", "\153\83\50\50\150")),[LUAOBFUSACTOR_DECRYPT_STR_0("\110\122\122\24\118\185", "\45\61\22\19\124\19\203")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\130\20\11\246\81\33\188", "\217\161\114\109\149\98\16")),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\40\61\127\183\118\29\56", "\20\114\64\88\28\220")]=Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\114\2\139\181\170\130\234", "\221\81\97\178\212\152\176"))});
end);
local function notify(title, content)
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\238\19\255\47\228\162\77", "\122\173\135\125\155")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\176\200\20\181\58", "\168\228\161\96\217\95\81")]=tostring(title),[LUAOBFUSACTOR_DECRYPT_STR_0("\248\222\32\72\42\89\207", "\55\187\177\78\60\79")]=tostring(content),[LUAOBFUSACTOR_DECRYPT_STR_0("\9\219\77\234\82\198\143\35", "\224\77\174\63\139\38\175")]=3});
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
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\73\89\60\193\17", "\78\228\33\56")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\114\179\26\128\220\59\226", "\229\174\30\210\99")].Character;
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\229\135\67\168\109", "\89\123\141\230\49\141\93")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\121\247\30\85\26", "\42\147\17\150\108\112")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\39\179\32\126\233\231\6\162\31\112\232\252\63\167\63\107", "\136\111\198\77\31\135"));
end
local function getHumanoid()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\1\166\68\248\180", "\201\98\105\199\54\221\132\119")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\0\130\56\7\39\233\233", "\204\217\108\227\65\98\85")].Character;
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\203\244\247\105\144", "\160\62\163\149\133\76")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\168\12\61\134\134", "\163\182\192\109\79")]:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\28\51\13\193\251\59\47\4", "\149\84\70\96\160"));
end
local function safeTeleport(cf)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\67\93", "\141\88\102\109")] = getRoot();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\22\154", "\161\211\51\170\16\122\93\53")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\235\226", "\72\155\206\210")].CFrame = cf;
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\63\4", "\83\38\26\52\110")].AssemblyLinearVelocity = Vector3.zero;
		end);
	end
end
local function applyWalkSpeed()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\2\42\3\8", "\38\56\119\71")] = getHumanoid();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\250\85\147\117", "\54\147\143\56\182\69")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\148\242\12\143", "\191\182\225\159\41")].WalkSpeed = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\34\13\112\175\184\239\30\62\28\106\164\169\135\123", "\162\75\114\72\53\235\231")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\19\114\199\126\39\162\8\123\209\99\39\169\24\1\178", "\98\236\92\36\130\51")]) or 16;
	end
end
local function applyJumpPower()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\12\1\255\21", "\80\196\121\108\218\37\200\213")] = getHumanoid();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\102\15\58\27", "\234\96\19\98\31\43\110")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\16\69\194\190\55\219", "\235\102\127\50\167\204\18")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\148\216\19\123\3\101\141\193\28\107\0\21\241", "\78\48\193\149\67\36")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\43\173\40\126\0\49\183\61\115\117\78", "\33\80\126\224\120")]) or 50;
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\189\14\129\12", "\60\140\200\99\164")].UseJumpPower = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\225\9\99\242", "\194\231\148\100\70")].JumpPower = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\67\214\166\228\141\22", "\168\38\44\161\195\150")];
	end);
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\233\143\51\96", "\118\224\156\226\22\80\136\214")].UseJumpPower = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\251\84\197\18", "\224\34\142\57")].JumpHeight = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\146\232\237\76\220\104\34\234\152\234\243\54\161", "\110\190\199\165\189\19\145\61")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\222\90\216\180\247\245\220\82\218\206\151", "\167\186\139\23\136\235")] * 0.5)) or 7.2;
	end);
	task.defer(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\240\216", "\109\122\213\232")] = getHumanoid();
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\178\242", "\80\142\151\194")] then
			return;
		end
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\131\39", "\44\99\166\23")].UseJumpPower = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\178\121", "\196\28\151\73\86\83")].JumpPower = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\54\4\32\189\117\45\90\199\60\6\62\199\8", "\22\147\99\73\112\226\56\120")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\64\207\197\178\136\90\213\208\191\253\37", "\237\216\21\130\149")]) or 50;
		end);
	end);
end
local function toggleNoClip(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\97\124\115\153\249\97\167\96\126\125\156\236\122\199\30", "\62\226\46\63\63\208\169")] = state;
	if noclipConn then
		noclipConn:Disconnect();
		noclipConn = nil;
	end
	if not state then
		return;
	end
	noclipConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\12\91\176\26\31\57\87\230\28\16\211", "\62\133\121\53\227\127\109\79")].Stepped:Connect(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\28\51\231\147\254", "\194\112\116\82\149\182\206")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\164\77\1\197\240\75\105", "\110\89\200\44\120\160\130")].Character;
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\203\74\84\6\26", "\45\203\163\43\38\35\42\91")] then
			return;
		end
		for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\141\221\49\194\249", "\52\178\229\188\67\231\201")]:GetDescendants()) do
			if p:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\3\64\67\1\199\93\49\53", "\67\65\33\48\100\151\60")) then
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
	speedConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\242\160\235\246\205\241\167\219\246\154\183", "\147\191\135\206\184")].Heartbeat:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\24\131\228\252\108\159\177\4\146\254\247\125\247\212", "\210\228\72\198\161\184\51")] then
			return;
		end
		local r, hum = getRoot(), getHumanoid();
		if (not r or not hum) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\64\225\85\35", "\174\86\41\147\112\19")] = hum.MoveDirection;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\9\159\78\117", "\203\59\96\237\107\69\111\113")].Magnitude > 0.05) then
			if (not bodyVelocity or not bodyVelocity.Parent) then
				bodyVelocity = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\6\25\168\248\7\245\219\43\21\165\245\40", "\183\68\118\204\129\81\144"));
				bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000);
				bodyVelocity.Parent = r;
			end
			bodyVelocity.Velocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\164\98\161\91", "\226\110\205\16\132\107")].X * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\236\214\252\108\206\237\212\230\114\219\230\197\253\4\187", "\33\139\163\128\185")], 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\81\22\155\7", "\190\55\56\100")].Z * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\128\10\59\62\198\221\98\144\15\46\54\198\215\19\255", "\147\54\207\92\126\115\131")]);
		elseif bodyVelocity then
			bodyVelocity.Velocity = Vector3.zero;
		end
	end);
end
local function stopBoxFly()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\30\13\91\33\71\50\20\27\92\47\82\40\21\112\45", "\30\109\81\85\29\109")] = false;
	if boxFlyConn then
		boxFlyConn:Disconnect();
		boxFlyConn = nil;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\52\4", "\156\159\17\52\214\86\190")] = getRoot();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\170\237", "\220\206\143\221")] then
		for _, v in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\56\125", "\178\230\29\77\119\184\172")]:GetChildren()) do
			if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\215\177\14\2\65\253\249\177\9\18\99\225", "\152\149\222\106\123\23")) and (v.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\250\52\243\70\177\196\4\249\91\147\209\63", "\213\189\70\150\35"))) then
				v:Destroy();
			end
		end
	end
end
local function startBoxFly()
	stopBoxFly();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\122\76\46\99\108\75\45\97\116\86\36\106\113\49\88", "\104\47\53\20")] = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\101\178\89\236", "\111\195\44\225\124\220")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\237\85\5\97\130\165\200\83\20\64\174\185\206\79\3\118", "\203\184\38\96\19\203"));
	boxFlyConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\102\119\114\203\43\101\112\66\203\124\35", "\174\89\19\25\33")].RenderStepped:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\61\106\104\219\190\52\10\60\115\108\219\162\47\106\66", "\107\79\114\50\46\151\231")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\227\229", "\160\89\198\213\73\234\89\215")] = getRoot();
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\52\228", "\165\40\17\212\158")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\207\77\99", "\70\133\185\104\83")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\0\20", "\169\100\37\36\74")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\39\149\167\85\4\158\128\95\24\161\174\73", "\48\96\231\194"));
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\76\75\125", "\227\168\58\110\77\121\184\207")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\42\250\16", "\197\27\92\223\32\209\187\17")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\33\80\199\226\53\90\207\244\0\86\215\226", "\155\99\63\163"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\199\228\221", "\228\226\177\193\237\217")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\19\162\38\227\48\169\1\233\44\150\47\255", "\134\84\208\67");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\186\195\12", "\60\115\204\230")].MaxForce = Vector3.new(4000, 4000, 4000);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\44\174\32", "\16\135\90\139")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\49\86", "\24\52\20\102\83\46\52")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\46\44\97\95", "\111\164\79\65\68")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\214\145\213\61\250\199\218\134\155\126", "\138\166\185\227\190\78")].CurrentCamera;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\125\215\114\2", "\121\171\20\165\87\50\67")] = Vector3.zero;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\17\138\115\233", "\98\166\88\217\86\217")]:IsKeyDown(Enum.KeyCode.W) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\255\107\68\214", "\188\150\150\25\97\230")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\128\77\71\92", "\141\186\233\63\98\108")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\235\33\243\117", "\69\145\138\76\214")].CFrame.LookVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\230\186\204\239", "\118\16\175\233\233\223")]:IsKeyDown(Enum.KeyCode.S) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\141\39\254\190", "\29\235\228\85\219\142\235")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\221\168\152\39", "\50\93\180\218\189\23\46\71")] - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\165\86\9\20", "\40\190\196\59\44\36\188")].CFrame.LookVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\108\239\241\170", "\109\92\37\188\212\154\29")]:IsKeyDown(Enum.KeyCode.A) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\230\182\134\97", "\58\100\143\196\163\81")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\75\49\230\111", "\110\122\34\67\195\95\41\133")] - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\176\86\15\134", "\182\21\209\59\42")].CFrame.RightVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\126\246\88\113", "\222\215\55\165\125\65")]:IsKeyDown(Enum.KeyCode.D) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\216\212\95\162", "\42\76\177\166\122\146\161\141")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\131\23\139\41", "\22\197\234\101\174\25")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\53\168\153\38", "\230\77\84\197\188\22\207\183")].CFrame.RightVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\61\245\185\220", "\85\153\116\166\156\236\193\144")]:IsKeyDown(Enum.KeyCode.Space) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\233\95\246\180", "\96\196\128\45\211\132")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\132\105\26\130", "\184\85\237\27\63\178\207\212")] + Vector3.new(0, 1, 0);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\112\58\26\88", "\63\104\57\105")]:IsKeyDown(Enum.KeyCode.LeftControl) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\142\182\1\91", "\36\107\231\196")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\188\176\194\13", "\231\61\213\194")] - Vector3.new(0, 1, 0);
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\164\47\54\89", "\19\105\205\93")].Magnitude > 0) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\1\204\196\111", "\95\201\104\190\225")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\194\211\139\255", "\174\207\171\161")].Unit * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\209\59\214\213\242\195\202\50\192\200\242\200\218\72\163", "\183\141\158\109\147\152")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\31\163\92", "\108\76\105\134")].Velocity = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\204\163\164\158", "\174\139\165\209\129")];
	end);
end
local function setupNoFall()
	if noFallConn then
		noFallConn:Disconnect();
		noFallConn = nil;
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\156\221\231\231\47\92\71\134\157\195\227\234\38\84\61\243", "\24\195\211\130\161\166\99\16")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\22\228\105\3", "\118\38\99\137\76\51")] = getHumanoid();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\51\8\87\89", "\64\157\70\101\114\105")] then
		return;
	end
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\190\226\179", "\112\32\200\199\131")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\85\76\180\202\168\35\56\85\88\139\215\164\48\45\87\89\253\147", "\66\76\48\60\216\163\203")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\158\143\106\242\93\194\33\156\135\117\255\123\207\41\187\129\124", "\68\218\230\25\147\63\174"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\60\22\28", "\214\205\74\51\44")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\90\167\172", "\23\154\44\130\156")].FireServer) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\176\232\254", "\115\113\198\205\206\86")]:FireServer(true);
		end
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\86\237\78\172\71\187\10", "\58\228\55\158")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\156\221\107\108", "\85\212\233\176\78\92\205")].Health;
	noFallConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\77\134\209\79\74\158\235\73\93\205\178", "\130\42\56\232")].Heartbeat:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\154\27\197\97\19\198\138\1\205\97\29\198\144\0\166\16", "\95\138\213\68\131\32")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\109\241", "\22\74\72\193\35")] = getHumanoid();
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\60\180", "\56\76\25\132")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\213\238\118", "\175\62\161\203\70")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\152\147", "\85\92\189\163\115")]:GetState();
		if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\184\117\104", "\88\73\204\80")] == Enum.HumanoidStateType.Freefall) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\151\85\22", "\186\78\227\112\38\73")] == Enum.HumanoidStateType.Flying) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\67\184\5", "\26\156\55\157\53\51")] == Enum.HumanoidStateType.Landed) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\204\83\137", "\48\236\184\118\185\216")] == Enum.HumanoidStateType.FallingDown)) then
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\248\7", "\84\133\221\55\80\175")].Health < TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\162\116", "\60\221\135\68\198\167")].MaxHealth) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\248\168", "\185\142\221\152\227\34")].Health = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\128\7", "\151\56\165\55\154\35\83")].MaxHealth;
			end
		elseif ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\6\85", "\142\192\35\101")].Health < TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\116\58\183\207\156\233\70", "\118\182\21\73\195\135\236\204")]) and ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\61\9\84\44\29\184\88", "\157\104\92\122\32\100\109")] - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\227\159", "\203\195\198\175\170\93\71\237")].Health) <= 40)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\14\110", "\156\78\43\94\181\49\113")].Health = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\233\215\183\35\83\60\34", "\25\18\136\164\195\107\35")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\44\186\91\90\172\132\232", "\216\136\77\201\47\18\220\161")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\169\123", "\226\77\140\75\186\104\188")].Health;
	end);
end
local function setAntiAfk(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\224\228\22\112\152\232\251\0\106\151\239\242\19\106\157\139\128", "\47\217\174\176\95")] = state;
	if antiAfkConn then
		antiAfkConn:Disconnect();
		antiAfkConn = nil;
	end
	if not state then
		return;
	end
	antiAfkConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\209\119\27\183\70\61\118", "\70\216\189\22\98\210\52\24")].Idled:Connect(function()
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\202\230\215", "\179\186\191\195\231")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\207\54\10\240\236\62\20\209\234\58\10", "\132\153\95\120"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\167\75\125", "\192\209\210\110\77\151\186")]:CaptureController();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\22\103\185", "\164\128\99\66\137\159")]:ClickButton2(Vector2.new());
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
	return (type(name) == LUAOBFUSACTOR_DECRYPT_STR_0("\19\157\251\183\14\142", "\222\96\233\137")) and (string.match(name, LUAOBFUSACTOR_DECRYPT_STR_0("\135\246\191\90\144\182\232\252\171\226\7\205\235\181\161\246\191\90\197\182\232\252\171\226\7\205\235\181\244\246\191\90\144\182\232\252\171\226\82\205\235\181\161\246\191\90\144\182\189\252\171\226\7\205\235\181\161\246\191\90\144\182\232\252\171\226\7\205\235\181\161\246\191\91", "\144\217\211\199\127\232\147")) ~= nil);
end
local function getMainPart(inst)
	if not inst then
		return nil;
	end
	if inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\213\32\58\45\217", "\36\152\79\94\72\181\37\98")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\217\78\49\146\136", "\95\183\184\39")] = inst:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\152\62\238\40", "\98\213\95\135\70\52\224"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\162\192\121\17\174", "\52\158\195\169\23")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\189\59\122\195\101", "\235\26\220\82\20\230\85\27")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\170\160\250\199\68\137\179\253", "\20\232\193\137\162"))) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\222\204\168\162\220", "\17\66\191\165\198\135\236\119")];
		end
		return inst.PrimaryPart or inst:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\45\174\189\22\207\233\254\197", "\177\111\207\206\115\159\136\140"));
	end
	return (inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\39\136\3\17\228\78\77\17", "\63\101\233\112\116\180\47")) and inst) or nil;
end
local function detectRarity(model)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\52\225\29\234\6\194\41\249\87\168", "\86\163\91\141\114\152")] = getMainPart(model);
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\4\120\124\40\99\10\102\103\127\3", "\90\51\107\20\19")] then
		return LUAOBFUSACTOR_DECRYPT_STR_0("\174\255\136\226\50\131", "\93\237\144\229\143");
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\179\160", "\38\117\150\144\121\107")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\180\226\53\63\139\239\40\57\254\190", "\90\77\219\142")].Color;
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\65\113", "\26\134\100\65\89\44\103")].R > 0.7) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\166\96", "\196\145\131\80\67")].G < 0.35) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\245\86", "\136\126\208\102\104\120")].B < 0.35)) then
		return LUAOBFUSACTOR_DECRYPT_STR_0("\77\134\218\74\162\83\41\84", "\49\24\234\174\35\207\50\93");
	end
	local best, bestDist = LUAOBFUSACTOR_DECRYPT_STR_0("\47\253\240\133\126\2", "\17\108\146\157\232"), 0.12;
	for name, col in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\226\38\196\27\145\116\224\59\193\0\154\120\134\68", "\200\43\163\116\141\79")]) do
		if ((name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\156\57\48\142\191\250", "\131\223\86\93\227\208\148")) and (name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\214\73\162\191\16\180\247\64", "\213\131\37\214\214\125"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\110\117", "\129\70\75\69\223")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\142\163", "\143\38\171\147\137\28")].R - col.R) ^ 2) + ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\199\233", "\180\176\226\217\147\99\131")].G - col.G) ^ 2) + ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\252\127", "\103\179\217\79")].B - col.B) ^ 2);
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\242\76", "\195\42\215\124\181\33\236")] < bestDist) then
				bestDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\28\103", "\152\109\57\87\94\69")];
				best = name;
			end
		end
	end
	return best;
end
local function scanEntities()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\222\25\183\251\130", "\200\153\183\106\195\222\178\52")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\226\152\120\25", "\58\82\131\232\93\41")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\88\194\30\78\47\130\84\213\80\13", "\95\227\55\176\117\61")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\53\127\51", "\203\120\30\67\43"));
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\36\93\170\137", "\185\145\69\45\143")] then
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\22\10\178\153\218", "\188\234\127\121\198")];
	end
	for _, child in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\51\3\198\104", "\227\88\82\115")]:GetChildren()) do
		if isUUIDName(child.Name) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\30\168\179\71\35", "\19\35\127\218\199\98")] = getMainPart(child);
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\250\24\246\89\171", "\130\124\155\106")] then
				table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\194\229\187\230\166", "\223\181\171\150\207\195\150\28")], {[LUAOBFUSACTOR_DECRYPT_STR_0("\65\53\231\171\5", "\105\44\90\131\206")]=child,[LUAOBFUSACTOR_DECRYPT_STR_0("\239\225\160\173", "\94\159\128\210\217\104")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\248\20\171\26\47", "\26\48\153\102\223\63\31\153")],[LUAOBFUSACTOR_DECRYPT_STR_0("\22\89\253", "\147\98\32\141")]=LUAOBFUSACTOR_DECRYPT_STR_0("\58\66\228", "\43\120\35\131\170\102\54"),[LUAOBFUSACTOR_DECRYPT_STR_0("\70\7\149\191\177\169", "\228\52\102\231\214\197\208")]=detectRarity(child)});
			end
		end
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\233\102\222\175\219", "\182\126\128\21\170\138\235\121")];
end
local function getClosestEntity()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\159\101", "\102\235\186\85\134\230\115\80")] = getRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\73\110", "\66\55\108\94\63\18\180")] then
		return nil;
	end
	local best, bestDist = nil, math.huge;
	for _, e in ipairs(scanEntities()) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\134\140\39\98\9", "\57\116\237\229\87\71")] = ignoreList[e.model];
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\186\228\247\50\190", "\39\202\209\141\135\23\142")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\6\61\37\20\217\205\30\54\39\29\220\218\118\89", "\152\159\83\105\106\82")] == LUAOBFUSACTOR_DECRYPT_STR_0("\163\199\86", "\60\225\166\49\146\169")) and (e.typ ~= LUAOBFUSACTOR_DECRYPT_STR_0("\13\31\40", "\103\79\126\79\74\97"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\116\218\99\27\74", "\122\218\31\179\19\62")] = true;
		end
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\221\196\209\140\241", "\37\211\182\173\161\169\193")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\15\121\246\14\90\139\218\5\96\246\12\94\252\167", "\217\151\90\45\185\72\27")] == LUAOBFUSACTOR_DECRYPT_STR_0("\224\125\228\26\83", "\54\163\28\135\114")) and (e.typ ~= LUAOBFUSACTOR_DECRYPT_STR_0("\11\218\94\138\75", "\31\72\187\61\226\46"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\13\74\194\2\46", "\68\163\102\35\178\39\30")] = true;
		end
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\123\211\215\70\229", "\113\222\16\186\167\99\213\227")] and e.rarity and not FARM_RARITY[e.rarity]) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\5\242\230\107\94", "\150\78\110\155")] = true;
		end
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\206\46\241\225\78", "\32\229\165\71\129\196\126\223")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\204\148", "\181\163\233\164\225\225")] = (e.part.Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\206\110", "\23\48\235\94")].Position).Magnitude;
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\159\136", "\178\28\186\184\61\55\83")] < bestDist) then
				bestDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\136\23", "\149\164\173\39\92\146\110")];
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
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\20\32\32\63\53\210\5\60\58\62\94\163", "\123\147\71\112\127\122")] then
		return;
	end
	for _, e in ipairs(scanEntities()) do
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\254\178\78\100\237\234\177\78\99\226\236\160\93\99\232\136\210", "\38\172\173\226\17")] and e.rarity and ESP_RARITY[e.rarity] and not entityESP[e.model]) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\29\105\191", "\143\45\113\76")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\144\177\27\52\180\177\27\52\172", "\92\216\216\124"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\62\233\16", "\157\59\82\204\32")].Adornee = e.model;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\50\166\170", "\209\88\94\131\154\137\138\179")].FillTransparency = 0.65;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\173\129\44", "\66\72\193\164\28\126\67\81")].OutlineColor = e.part.Color;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\32\237\8", "\22\135\76\200\56\70")].FillColor = e.part.Color;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\60\189\116", "\129\237\80\152\68\61")].Parent = e.model;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\170\65\163", "\56\49\200\100\147\124\119")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\238\55\179\252\206\49\190\226\200\25\170\249", "\144\172\94\223"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\13\231\23", "\39\68\111\194")].Size = UDim2.fromOffset(100, 18);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\164\162\151", "\215\182\198\135\167\25")].AlwaysOnTop = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\75\175\24", "\40\237\41\138")].Adornee = e.part;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\118\191\168", "\42\167\20\154\152")].Parent = e.part;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\187\242", "\65\42\158\194\34\17")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\46\34\74\24\1\236\25\235\22", "\142\122\71\50\108\77\141\123"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\231\175", "\91\117\194\159\120")].Size = UDim2.new(1, 0, 1, 0);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\88\110", "\68\122\125\94\120\85\145")].BackgroundTransparency = 1;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\89\159", "\218\119\124\175\62\168\185")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\135\241\79\132", "\164\197\144\40") .. (e.rarity or "");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\181\250", "\214\227\144\202\235\189")].TextColor3 = e.part.Color;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\224\215", "\92\141\197\231\27\112\211\51")].TextScaled = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\186\218", "\177\134\159\234\195")].Font = Enum.Font.GothamBold;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\174\111", "\169\221\139\95\192")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\137\58\111", "\70\190\235\31\95\66")];
			entityESP[e.model] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\178\238", "\133\218\130\122\134")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\243\166\148", "\88\92\159\131\164\188\195")],[LUAOBFUSACTOR_DECRYPT_STR_0("\130\44", "\189\224\78\223\43\183\139")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\254\207\70", "\161\78\156\234\118")]};
		end
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\132\249\227\151\155\232\229\130\133\250\227\130\153\232\254\139\146\237\153\247", "\188\199\215\169")] then
		for _, plr in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\5\94\98\237\238\26\26\43", "\136\156\105\63\27")]:GetPlayers()) do
			if ((plr ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\128\120\45\30\158\60\100", "\84\123\236\25")]) and plr.Character and not playerESP[plr]) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\153\186\82\252", "\213\144\235\202\119\204")] = plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\11\13\211\43\38\44\68\39\42\209\37\60\19\76\49\12", "\45\67\120\190\74\72\67"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\48\253\224\169", "\137\64\66\141\197\153\232\142")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\220\103\246", "\232\99\176\66\198")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\196\40\47\14\119\132\254\36\248", "\76\140\65\72\102\27\237\153"));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\214\83\130", "\222\42\186\118\178\183\97")].FillTransparency = 0.7;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\224\1\218", "\234\61\140\36")].OutlineColor = Color3.fromRGB(255, 195, 30);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\209\255\34", "\111\65\189\218\18")].Parent = plr.Character;
					playerESP[plr] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\75\71", "\207\35\43\123\85\107\60")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\166\229\186", "\25\16\202\192\138")]};
				end
			end
		end
	end
end
local function freezeCamera()
	cameraFrozen = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\202\160\167\249", "\148\157\171\205\130\201")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\219\102\34\194\230\34\215\113\108\129", "\150\67\180\20\73\177")].CurrentCamera;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\25\23\8\221", "\45\237\120\122")] then
		savedCameraCFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\233\175\105\135", "\76\183\136\194")].CFrame;
	end
end
local function unfreezeCamera()
	cameraFrozen = false;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\243\235\11\85\93\2\115\229\224\125\0", "\116\26\134\133\88\48\47")].RenderStepped:Connect(function()
	if (cameraFrozen and savedCameraCFrame and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\244\148\203\155\83\44\236\159\193\147\83\60\237\133\192\248\34", "\18\126\161\192\132\221")]) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\41\163\65\6", "\54\63\72\206\100")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\86\87\113\246\107\201\90\64\63\181", "\27\168\57\37\26\133")].CurrentCamera;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\171\113\237\135", "\183\77\202\28\200")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\50\132\77\71", "\104\119\83\233")].CFrame = savedCameraCFrame;
		end
	end
end);
local function flyTo(targetPos, speed)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\189\119", "\35\149\152\71\66")] = getRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\173\18", "\90\121\136\34\208")] then
		return false;
	end
	speed = speed or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\34\108\33\244\62\112\59\227\75\5", "\126\167\110\53")];
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\62\26\209\227\29\28\62\17\221\242\30\31\60\11\220\153\111", "\95\93\112\78\152\188")] and (speed > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\212\189\42\215\159\244\228\202\182\37\193\155\246\132\165", "\178\161\149\229\117\132\222")])) then
		speed = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\250\229\147\146\55\128\6\183\232\237\137\132\50\227\115", "\67\232\187\189\204\193\118\198")];
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\39\166\52\126\82", "\143\235\78\213\64\91\98")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\13\212", "\214\237\40\228\137\16")].Position - targetPos).Magnitude;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\234\252\205\70\246", "\198\229\131\143\185\99")] < 2) then
		return true;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\153\186\114\69\133\167\125\20\220", "\19\49\236\200")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\62\229\163\161\234", "\218\158\87\150\215\132")] / math.max(speed, 1), 0.15);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\27\207\235\55\54\196\244\16\156\178", "\173\155\126\185\130\86\66")] = Vector3.new((math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\131\140\238\169\216\204\137\148\248\169\193\202\147\148\243\205\188", "\140\133\198\218\167\232")], (math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\11\130\84\165\129\7\155\83\187\148\3\155\72\170\129\107\228", "\228\213\78\212\29")] * 0.3, (math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\105\128\44\202\179\101\153\43\212\166\97\153\48\197\179\9\230", "\139\231\44\214\101")]);
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\250\20\76\21\191\37\48\213\246\50\73\21\180\63\83\137", "\118\185\143\102\62\112\209\81")] then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\101\59\244\160\27\8\30\80\105\29\241\160\16\18\125\12", "\88\60\16\73\134\197\117\124")]:Cancel();
		end);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\255\234\218\68\94\254\222\196\88\100\253\253\205\79\21\186", "\33\48\138\152\168")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\1\53\84\207\4\119\4\38\88\194\50\55\70", "\87\18\118\80\49\161")]:Create(TABLE_TableIndirection["r%0"], TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\11\200\161\164\69\17\212\229\224", "\208\44\126\186\192")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\212\60\182\199\25\249", "\46\151\122\196\166\116\156\169")]=CFrame.new(targetPos + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\232\80\19\250\241\228\73\20\190\181", "\155\133\141\38\122")])});
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\63\190\83\74\113\177\3\38\181\117\88\122\160\43\111\252", "\197\69\74\204\33\47\31")]:Play();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\90\72\149\245\65\78\161\252\86\110\144\245\74\84\194\160", "\231\144\47\58")].Completed:Wait();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\205\200\103\29\51\219\31\190\193\238\98\29\56\193\124\226", "\89\210\184\186\21\120\93\175")] = nil;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\125\72\252\70\24\144\125\67\240\87\27\147\127\89\241\60\106", "\90\209\51\28\181\25")] then
		task.wait(0.05 + (math.random() * 0.1));
	end
	return true;
end
local function stopAutofarm()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\78\99\193\153\241\73\122\209\154\254\90\117\194\154\244\62\7", "\223\176\27\55\142")] = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\174\218\186\34\186\220\184\23\175\193\165\22\190\223\160\33\168\218\176\32\254\158", "\213\68\219\174")] = true;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\245\49\245\47\203\43\89\7\249\23\240\47\192\49\58\91", "\31\107\128\67\135\74\165\95")] then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\253\238\95\68\191\204\206\240\84\117\166\221\237\242\8\17", "\209\184\136\156\45\33")]:Cancel();
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\221\103\26\189\9\220\83\4\161\51\223\112\13\182\66\152", "\216\103\168\21\104")] = nil;
	end
	unfreezeCamera();
end
local function autofarmLoop()
	while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\152\119\139\94\140\113\137\71\136\109\133\90\129\102\128\61\253", "\196\24\205\35")] and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\158\247\9\40\138\241\11\29\159\236\22\28\142\242\19\43\152\247\3\42\206\179", "\102\78\235\131")] do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\107\100", "\84\154\78\84\36\39\89\215")] = getRoot();
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\164\6", "\101\157\129\54\56")] then
			task.wait(0.5);
		else
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\185\143\174\39\60\77", "\25\125\201\234\203\67")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\216\33\60\39\23\54\92\208\93\83", "\115\25\148\120\99\116\71")];
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\19\141\13\126\46\28\151\27\100\34\28\155\8\100\40\120\233", "\33\108\93\217\68")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\91\164\168\223\14\241", "\205\187\43\193")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\83\61\224\205\83\35\250\193\65\53\250\219\86\64\143", "\191\158\18\101")])) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\211\130\178\171\128\147", "\207\165\163\231\215")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\216\193\105\23\81\224\220\198\101\20\85\227\221\188\6", "\16\166\153\153\54\68")];
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\178\210\65\49\53\188\130", "\153\178\211\160\38\84\65")] = getClosestEntity();
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\10\72\44\135\31\31\123", "\75\226\107\58")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\223\3\125\20\214\253\87\205\84\42", "\173\56\190\113\26\113\162")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\223\63\2\242\223\155\125", "\151\171\190\77\101")].Position;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\38\246\168\244\73\10\215\40\253\189\189\45", "\107\165\79\152\201\152\29")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\79\250\204\81\107\103\65\251\142\4", "\31\55\46\136\171\52")] + Vector3.new(0, 3, 0);
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\29\232\219\247\9\238\217\238\30\253\198\248\9\242\192\148\120", "\148\177\72\188")] == LUAOBFUSACTOR_DECRYPT_STR_0("\132\186\86\199\167\184\67", "\179\198\214\55")) then
					flyTo(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\5\124\119\73\231\241\30\117\115\81\150\160", "\179\144\108\18\22\37")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\179\30\140\203\131\243", "\175\166\195\123\233")]);
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\215\79\91\245\225\214\109\70\227\170\146", "\144\143\162\61\41")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\150\77", "\83\128\179\125\48\18\231")].Position;
					if ((math.abs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\162\225\207\66\16\73\135\252\206\2\78", "\126\61\215\147\189\39")].Y - 5) > 0.5) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\234\15\87\125\241\9\117\119\236\88\21", "\37\24\159\125")].Y > 8)) then
						flyTo(Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\179\103\80\223\168\97\114\213\181\48\18", "\34\186\198\21")].X, 5, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\29\215\79\199\246\28\245\82\209\189\88", "\162\152\104\165\61")].Z), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\63\183\120\116\160\157", "\133\173\79\210\29\16")]);
					end
					if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\105\249\36\139\125\255\38\190\104\226\59\191\121\252\62\136\111\249\46\137\57\189", "\75\237\28\141")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\106\248\158\9\58\213\204\227\122\226\144\13\55\194\197\153\15", "\129\188\63\172\209\79\123\135")]) then
						break;
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\246\233\216\78\224\210\204\82\227\227\217\5\180", "\173\32\132\134")] = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\26\26\232\171\37\253\65\8\77\191", "\173\46\123\104\143\206\81")].X, 5, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\28\48\141\64\151\49\187\14\103\218", "\97\212\125\66\234\37\227")].Z);
					if (getRoot() and ((getRoot().Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\241\185\32\16\142\215\183\39\25\143\247\243\101", "\126\234\131\214\85")]).Magnitude > 2)) then
						flyTo(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\199\70\79\65\128\225\72\72\72\129\193\12\10", "\47\228\181\41\58")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\236\220\62\7\117\79", "\127\198\156\185\91\99\80")]);
					end
					if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\15\216\255\161\10\43\211\198\14\195\224\149\14\40\203\240\9\216\245\163\78\105", "\190\149\122\172\144\199\107\89")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\48\197\209\216\19\55\220\193\219\28\36\211\210\219\22\64\161", "\158\82\101\145\158")]) then
						break;
					end
					if (getRoot() and ((getRoot().Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\247\12\23\72\68\255\16\17\65\100\187\82", "\36\16\158\98\118")]).Magnitude > 2)) then
						flyTo(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\31\205\250\84\220\38\247\199\19\215\190\8", "\133\160\118\163\155\56\136\71")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\178\116\247\178\90\229", "\213\150\194\17\146\214\127")]);
					end
				end
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\188\176\219\64\165\176\59\40\189\171\196\116\161\179\35\30\186\176\209\66\225\242", "\86\123\201\196\180\38\196\194")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\221\237\128\209\201\235\130\200\205\247\142\213\196\252\139\178\184", "\207\151\136\185")]) then
					break;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\198\120", "\17\200\227\72\226\20\24")] = getRoot();
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\4\75", "\159\208\33\123\183\169\145\143")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\91\42\49\247\78\125\102", "\86\146\58\88")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\222\248\199\171\253\115\170", "\154\56\191\138\160\206\137\86")].Parent) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\28\165", "\172\230\57\149\231\28\90\225")].CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\171\148\213\45\207\71\250", "\187\98\202\230\178\72")].Position + Vector3.new(0, 2, 0));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\224\163\19\69\52\239\176\53\88\100\177", "\42\65\129\196\80")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\75\90\249\24\18\12\250\7\88\24\138", "\142\98\42\61\186\119\103\98")] + 1;
				end
				task.wait(0.15);
			else
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\171\3\26\44\143\13\27\125\239", "\104\88\223\98")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\178\178", "\141\36\151\130\174\98")].Position;
				local angle, radius = 0, 400;
				for _ = 1, 10 do
					if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\79\246\34\162\91\240\32\187\95\236\44\166\86\231\41\193\42", "\109\228\26\162")] or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\240\233\119\230\231\76\232\206\108\239\246\108\224\236\109\229\245\74\224\249\61\176", "\134\62\133\157\24\128")] or getClosestEntity()) then
						break;
					end
					angle = angle + 0.7;
					flyTo(Vector3.new(clamp(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\177\27\203\59\129\217\20\224\74", "\182\103\197\122\185\79\209")].X + (math.cos(angle) * radius), -5000, 5000), 8, clamp(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\147\224\101\20\120\252\148\164\39", "\40\147\231\129\23\96")].Z + (math.sin(angle) * radius), -5000, 5000)), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\232\137\64\191\233\140", "\188\21\152\236\37\219\204")]);
					radius = radius + 80;
				end
				task.wait(0.2);
			end
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\220\3\35\102\200\5\33\127\204\25\45\98\197\18\40\5\185", "\108\32\137\87")] = false;
end
local function startAutofarm()
	stopAutofarm();
	task.wait(0.05);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\253\20\169\41\248\89\84\153\252\15\182\29\252\90\76\175\251\20\163\43\188\27", "\57\202\136\96\198\79\153\43")] = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\22\158\136\171\134\202\134\28\143\137\172\133\212\142\7\239\247", "\152\203\67\202\199\237\199")] = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\86\180\0\25\116\107\235\201\87\161\29\11\65\112\235\255\6\240", "\134\154\35\192\111\127\21\25")] = os.time();
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\7\36\47\18\243\135\11\38\46\5\151\232", "\178\216\70\105\106\64")] == 1) then
		freezeCamera();
	else
		unfreezeCamera();
	end
	task.spawn(autofarmLoop);
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\30\62\110\249\207\212\198\141", "\224\95\75\26\150\169\181\180"), LUAOBFUSACTOR_DECRYPT_STR_0("\56\206\217\58\80\169\114\75\146", "\22\107\186\184\72\36\204") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\136\16\97\40\198\143\9\113\56\198\143\13\111\32\211\248\116", "\110\135\221\68\46")] .. ")");
end
local function getRuntime()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\34\73\187", "\91\131\86\108\139\174\211")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\46\168\27\84\248\42\172\18\89\200\63\183\5\92\252\46\253\71", "\61\155\75\216\119")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\52\167\179\37\93\27\239\17\165\166\53\85\12\249\5\191\179", "\189\100\203\210\92\56\105"));
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\69\184\120", "\72\79\49\157")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\164\116\236", "\220\232\208\81")]:FindFirstChild(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\178\228\41\41\72\228\165", "\193\149\222\133\80\76\58")].Name);
end
local function getGeneric()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\89\10\130", "\178\166\61\47")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\79\248\118\195\61\250\94\237\126\249\42\244\88\233\125\207\123\171", "\94\155\42\136\26\170")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\180\51\39\172\129\45\2\180\144\62", "\213\228\95\70"));
	pd = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\191\135\212", "\23\74\219\162\228")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\226\3\255", "\91\89\134\38\207")]:FindFirstChild(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\226\201\47\22\194\98\20", "\71\36\142\168\86\115\176")].Name);
	return pd and pd:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\248\164\124\186\17\183\85", "\41\191\193\18\223\99\222\54"));
end
local function getMissionsFolder()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\50\130\122", "\202\203\70\167\74")] = getRuntime();
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\21\153\99", "\17\76\97\188\83")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\51\156\103", "\195\229\71\185\87\80\227\43")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\205\245\19\67\230\239\242\19", "\143\128\156\96\48"));
end
local function getLevel()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\148\160", "\119\216\177\144\114")] = getGeneric();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\63\188\18", "\34\169\73\153")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\169\91", "\235\202\140\107")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\49\100", "\165\108\20\84\200\137\71\151")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\86\177\61\141\118", "\232\26\212\75"));
	return (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\95\55\184", "\151\87\41\18\136")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\185\143\128", "\158\59\207\170\176")].Value) or 0;
end
local function patchTimers()
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\74\118\25", "\236\47\62\83\41")] = getRuntime();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\177\48\126\250", "\226\154\201\64\91\202")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\93\88\72", "\220\161\41\125\120\42")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\101\229\94", "\110\220\17\192")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\89\112\39\9\226\56\255\147\125\116\49\8\206\47\225\174\102\124", "\199\20\25\84\122\139\87\145"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\17\205\235\75", "\138\39\105\189\206\123")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\31\153\104\163", "\159\127\103\233\77\147\153\175")].Value = tick() - 10;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\181\180", "\171\103\144\132\202\32")] = getGeneric();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\59\172\92", "\108\112\79\137")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\135\36", "\85\95\162\20\72\205\97\137")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\184\122", "\173\151\157\74\188\109\152")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\41\1\43\206\213\91\219\199\45\5\61\207", "\147\68\104\88\189\188\52\181"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\156\206\128", "\176\122\232\235")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\97\127\31", "\142\224\21\90\47")].Value = os.time() - 30;
		end
	end);
end
local function rerollAll()
	patchTimers();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\198\98\6", "\229\20\180\71\54\196\235")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\123\209\239\252\169\129\61\123\197\208\225\165\146\40\121\196\166\165", "\224\73\30\161\131\149\202")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\220\236\226\67\248\234\255\98\244\247\254\92\253", "\48\145\133\145"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\67\185\234\212\62\31\28", "\76\58\44\213\142\177")] = getMissionsFolder();
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\54\87\125", "\24\171\68\114\77")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\18\92\86\130\204\65\253", "\205\143\125\48\50\231\190\100")]) then
		return 0;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\226\68", "\194\161\199\116\101\129\131\191")] = 0;
	for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\43\196\172\242\176\169\116", "\194\140\68\168\200\151")]:GetChildren()) do
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\233\144\117", "\149\34\155\181\69")]:FireServer(m.Name);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\184\133", "\154\99\157\181")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\74\188", "\140\237\111\140\192")] + 1;
		task.wait(0.04);
	end
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\11\56\72", "\120\102\121\29")]:FireServer();
	end);
	task.wait(0.1);
	patchTimers();
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\166\233", "\91\204\131\217")];
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\208\98\241\129\238\187\158", "\158\174\159\53\180\211\189")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\100\248\255\201\126\178\93", "\213\50\157\141\189\23")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\247\34\151", "\196\158\70\228\192\18")]={LUAOBFUSACTOR_DECRYPT_STR_0("\77\90\31\75\203\75\83\68\24", "\185\42\63\113\46")},[LUAOBFUSACTOR_DECRYPT_STR_0("\223\216\56\42", "\123\180\189\65\89")]={LUAOBFUSACTOR_DECRYPT_STR_0("\212\137\226\240\128\197\131", "\233\162\236\144\132"),LUAOBFUSACTOR_DECRYPT_STR_0("\179\194\236\27\176\242\31\189\194\190\18\188\255\88\186\208\237", "\63\210\164\158\122\217\150")},[LUAOBFUSACTOR_DECRYPT_STR_0("\35\202\226\228", "\152\83\171\150\140\41")]={LUAOBFUSACTOR_DECRYPT_STR_0("\175\228\147", "\104\226\133\227\83\180\123"),LUAOBFUSACTOR_DECRYPT_STR_0("\33\30\42\92\7\2\45\87\16", "\48\99\107\67"),LUAOBFUSACTOR_DECRYPT_STR_0("\243\175\110\211\15\110\215\170\121\217\35\124\205", "\27\190\198\29\176\77"),LUAOBFUSACTOR_DECRYPT_STR_0("\217\78\239\32\160\73\224", "\46\143\43\157\84\201"),LUAOBFUSACTOR_DECRYPT_STR_0("\97\125\68\214\86\20\199\23\84\95\197\87\7", "\168\55\24\54\162\63\115")}},[LUAOBFUSACTOR_DECRYPT_STR_0("\33\255\50\148\215\214", "\174\119\154\64\224\178")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\35\122\214", "\132\74\30\165\27\101\199\122")]={LUAOBFUSACTOR_DECRYPT_STR_0("\40\226\241\162\181\180\184\122\176", "\212\79\135\159\199\199\213")},[LUAOBFUSACTOR_DECRYPT_STR_0("\114\165\172\84", "\120\25\192\213\39\60\183")]={LUAOBFUSACTOR_DECRYPT_STR_0("\14\69\45\92\29\88", "\40\120\32\95"),LUAOBFUSACTOR_DECRYPT_STR_0("\44\174\43\110\170\7\122\189\60\116\187\10\40\174", "\127\90\203\89\26\207")},[LUAOBFUSACTOR_DECRYPT_STR_0("\205\52\187\195", "\157\189\85\207\171\105")]={LUAOBFUSACTOR_DECRYPT_STR_0("\235\160\200", "\99\166\193\184\213"),LUAOBFUSACTOR_DECRYPT_STR_0("\244\162\137\183\8\131\216\176\147", "\234\182\215\224\219\108"),LUAOBFUSACTOR_DECRYPT_STR_0("\237\136\168\54\226\148\178\57\196\136\181\50\211", "\85\160\225\219"),LUAOBFUSACTOR_DECRYPT_STR_0("\106\0\145\221\51\196", "\43\60\101\227\169\86\188"),LUAOBFUSACTOR_DECRYPT_STR_0("\70\205\195\171\95\212\249\27\121\207\217\171", "\87\16\168\177\223\58\172\217")}},[LUAOBFUSACTOR_DECRYPT_STR_0("\23\223\92\206\47", "\91\84\173\57\189")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\25\189\31", "\182\112\217\108\156\192")]={LUAOBFUSACTOR_DECRYPT_STR_0("\173\13\70\234\153\171\4\29\183", "\235\202\104\40\143")},[LUAOBFUSACTOR_DECRYPT_STR_0("\6\142\2\170", "\217\109\235\123")]={LUAOBFUSACTOR_DECRYPT_STR_0("\36\155\123\69\100", "\221\71\233\30\54\16\176\173"),LUAOBFUSACTOR_DECRYPT_STR_0("\55\238\91\172\32\188\93\190\38\238\87\186\38", "\223\84\156\62")},[LUAOBFUSACTOR_DECRYPT_STR_0("\198\253\246\213", "\91\182\156\130\189\215")]={LUAOBFUSACTOR_DECRYPT_STR_0("\83\114\188", "\53\30\19\204"),LUAOBFUSACTOR_DECRYPT_STR_0("\219\245\121\136\163\240\238\119\151", "\199\153\128\16\228"),LUAOBFUSACTOR_DECRYPT_STR_0("\252\35\246\26\133\196\35\233\29\174\223\45\246", "\199\177\74\133\121"),LUAOBFUSACTOR_DECRYPT_STR_0("\155\219\185\237\35", "\74\216\169\220\158\87\166"),LUAOBFUSACTOR_DECRYPT_STR_0("\203\49\22\63\78", "\58\136\67\115\76"),LUAOBFUSACTOR_DECRYPT_STR_0("\210\184\221\74\145\96\135\84\246\162\204", "\61\145\202\184\57\229\64\203")}}};
local function resolvePath(path)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\71\155\2\12", "\39\60\50\233")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\60\177\39\145\56\179\160\31\118\243", "\195\122\83\195\76\226\72\210")];
	for _, n in ipairs(path) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\193\41\187\113", "\65\132\180\91\158")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\105\195\107\85", "\78\101\28\177")]:FindFirstChild(n);
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\161\242\20\117", "\49\69\212\128")] then
			return nil;
		end
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\25\194\183\177", "\129\119\108\176\146")];
end
local function matchTower(m)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\138\87", "\124\92\175\103\173\69\110")] = string.lower(m.Name);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\125\83", "\87\161\88\99")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\54\240\252\220\187\209\58\60\248\226\201", "\67\114\153\143\172\215\176"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\171\250\2\187\231\190", "\110\222\194\142")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\156\75", "\193\119\185\123\201\50")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\77\169", "\127\23\104\153\70\111\25")].Value))) or "";
	for tn, data in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\40\145\138\25\31\242\227", "\211\105\103\198\207\75\76\215")]) do
		for _, id in ipairs(data.ids) do
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\226\224", "\214\174\199\208\143\30\108\218")] == id) then
				return tn, data, m;
			end
		end
		for _, k in ipairs(data.keys) do
			if (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\193\91", "\41\113\228\107\202\197\54\184")], k, 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\132\44\80\127\200\104", "\60\26\237\88")], k, 1, true)) then
				return tn, data, m;
			end
		end
	end
end
local function findTower()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\37\120\226\171\202\111\36", "\206\184\74\20\134")] = getMissionsFolder();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\235\226\181\246\88\125\156", "\172\88\132\142\209\147\42\88")] then
		return;
	end
	for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\133\192\9\51\231\251\215", "\222\231\234\172\109\86\149")]:GetChildren()) do
		local a, b, c = matchTower(m);
		if a then
			return a, b, c;
		end
	end
end
local function tpTower(data)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\170\144", "\120\141\143\160")] = getRoot();
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\233\230", "\50\32\204\214")] or not data) then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\78\50\113\167\84\214", "\113\230\39\85\25\211")] = resolvePath(data.path);
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\178\1\224\51\142\251", "\43\190\219\102\136\71\171\203")] then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\113\35\28\114", "\57\66\30\80")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\209\167\29\144\124\164", "\228\73\184\192\117\228\89\148")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\237\136\102\17\255\136\103\0", "\116\175\233\21")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\241\185\78\207\116\111", "\95\158\152\222\38\187\81")].Position;
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\178\38\247\243", "\168\152\221\85\210\195")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\215\242\143\191\155\165", "\231\203\190\149")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\224\50\231\244\176", "\123\173\93\131\145\220\149"))) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\129\189", "\153\118\164\141\65\20")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\59\129\234\227\69\190", "\96\142\82\230\130\151")].PrimaryPart or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\185\72\74\240\171\31", "\142\47\208\47\34\132")]:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\212\191\23\7\107\93\228\170", "\60\150\222\100\98\59"), true);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\51\68\19\139", "\81\37\92\55\54\187\218")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\1\253", "\225\96\36\205\87")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\227\18", "\105\137\198\34\25\28\47")].Position;
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\166\82\51\144", "\160\113\201\33\22")] then
		return false;
	end
	safeTeleport(CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\87\191\226\249", "\205\180\56\204\199\201")] + Vector3.new(0, 6, 0)));
	return true;
end
local function startTowerAutofarm()
	if (getLevel() < 15) then
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\183\209\43\29\145", "\120\227\190\92"), LUAOBFUSACTOR_DECRYPT_STR_0("\19\89\26\127\99\80\220\244\56\80\95\42\118\23", "\130\93\60\127\27\67\60\185"));
		return;
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\23\22\120\165\19", "\29\40\82\88\46\128\35")].GreedyTowerRunning then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\96\250\43\68\232", "\216\91\37\180\125\97")].GreedyTowerRunning = true;
	task.spawn(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\127\8\208\18\117", "\55\69\22\124\163")] = 0;
		while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\246\114\222\154\33", "\148\24\179\60\136\191\17\48")].GreedyTowerRunning do
			patchTimers();
			local name, data, mis = findTower();
			if (name and data) then
				if tpTower(data) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\35\237\179\179\226", "\150\210\74\153\192")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\193\44\153\48\42", "\212\131\168\88\234\21\26")] + 1;
					notify(LUAOBFUSACTOR_DECRYPT_STR_0("\113\123\158\137\42", "\71\37\20\233\236\88"), name .. LUAOBFUSACTOR_DECRYPT_STR_0("\141\5", "\60\173\38\208\118\32\140\44") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\59\245\192\101\159", "\175\33\82\129\179\64")]);
					task.wait(1);
					if mis then
						pcall(function()
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\234\32\195\53\177\239\251\53\203\15\166\225\253\49\200\57\247\190", "\210\142\143\80\175\92")].MissionReroll:FireServer(mis.Name);
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
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\141\230\228\195\171", "\166\217\137\147"), LUAOBFUSACTOR_DECRYPT_STR_0("\194\182\102\169\247\71\241\174\50\137\223", "\38\131\195\18\198\145"));
end
local function stopTowerAutofarm()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\243\20\221\125\4", "\52\51\182\90\139\88")].GreedyTowerRunning = false;
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\194\182\199\226\81", "\35\150\217\176\135"), LUAOBFUSACTOR_DECRYPT_STR_0("\214\118\45", "\22\153\48\107\108\23\35"));
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\181\158\63\91\74\117\200\60\162\158\46\76\48\17", "\137\110\229\219\122\31\21\33")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\10\180\59\112\63\69\35\62\15\173\120\111\62\78\100\110\27\190\61", "\30\122\221\88\27\86\43\68"),LUAOBFUSACTOR_DECRYPT_STR_0("\43\56\238\131\60\104\248\150\49\38\239\138\61", "\230\88\72\139"),LUAOBFUSACTOR_DECRYPT_STR_0("\123\244\2\19\12\29\95\122\160\86\15\11\1\75\50\163\23\8\67\24\89\96\191\25\14\17", "\56\18\212\118\123\99\104"),LUAOBFUSACTOR_DECRYPT_STR_0("\26\224\238\218\209\219\94\237\253\210\220\221\27\229\253\193\222\202\23\230\246", "\190\126\137\152\179\191"),LUAOBFUSACTOR_DECRYPT_STR_0("\63\10\125\139\175\86\45\12\50\197\175\69\44\17\50\202\234\83\56\7\119\207\169\65\56", "\32\72\98\18\171\202"),LUAOBFUSACTOR_DECRYPT_STR_0("\23\157\34\113\229\68\155\61\122\254\7", "\151\100\232\82\20")};
local function speedHasTarget()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\214\250\12\122\203\179\88", "\104\31\185\150")] = getMissionsFolder();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\182\255\243\226\222\165\144", "\160\188\217\147\151\135\172\128")] then
		return nil;
	end
	for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\210\28\244\63\219\74\141", "\169\111\189\112\144\90")]:GetChildren()) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\198\117", "\226\173\227\69\205\223\224\105")] = string.lower(m.Name);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\48\103\11", "\123\56\94\66\59\175")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\222\74\96\241\22\255\152\212\66\126\228", "\225\154\35\19\129\122\158"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\69\187", "\84\58\96\139\55\149\135\176")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\49\230\80", "\94\115\95\195\96\46\175")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\69\122\109", "\128\35\43\95\93\78\77\231")].Value))) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\88\102", "\201\196\125\86\84\119\30")];
		for _, k in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\222\33\154\231\209\48\158\241\201\33\139\240\171\84", "\223\163\142\100")]) do
			if (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\83\147", "\216\226\118\163\209")], k, 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\181\75", "\95\222\144\123\97\55\16")], k, 1, true)) then
				return m, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\193\234", "\131\121\228\218\35")];
			end
		end
	end
end
local function speedUnfreeze()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\245\12\55\60\75", "\123\185\176\66\97\25")].GreedySpeedFrozen = false;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\42\55\103\80\127", "\81\168\111\121\49\117\79\56")].GreedySpeedFreezeConn then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\47\203\128\130\90", "\214\167\106\133")].GreedySpeedFreezeConn:Disconnect();
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\29\98\121\113\47", "\185\73\88\44\47\84\31")].GreedySpeedFreezeConn = nil;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\146\74", "\159\232\183\122\192\179")] = getRoot();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\119\248", "\65\68\82\200")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\21\34", "\30\69\48\18\64\175\175")].Anchored = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\105\79", "\91\144\76\127\140")].AssemblyLinearVelocity = Vector3.zero;
	end
end
local function speedFreeze(cf)
	speedUnfreeze();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\45\104\23\150\234", "\176\128\104\38\65\179\218\181")].GreedySpeedFrozen = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\129\146", "\117\176\164\162")] = getRoot();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\135\85", "\25\228\162\101\144\186")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\115\233", "\132\40\86\217\110\146")].Anchored = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\142\119", "\62\30\171\71\220\199\19\156")].CFrame = cf;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\74\175\61\24\153", "\45\32\37\204\86\61\169\79")] = cf;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\114\112\43\138\240\44", "\28\53\53\101\220\213")].GreedySpeedFreezeConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\73\6\114\95\179\70\214\14\89\77\17", "\191\109\60\104\33\58\193\48")].Heartbeat:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\242\54\209\194\135", "\135\231\183\120")].GreedySpeedFrozen then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\5\67\240\112\74", "\201\134\106\44\132\85\122")] = getRoot();
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\3\120\43\68\92", "\67\86\108\23\95\97\108\168")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\55\67\30\225\116", "\48\196\88\44\106\196\68\181")].Anchored = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\208\211\55\197\244", "\76\226\191\188\67\224\196\194")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\39\4\251\184\137", "\157\185\72\103\144")];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\188\133\110\237\225", "\209\57\211\234\26\200")].AssemblyLinearVelocity = Vector3.zero;
		end
	end);
end
local function speedPass()
	speedUnfreeze();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\139\246", "\178\97\174\198\225\48")] = getRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\19\84", "\111\175\54\100\145\24\134")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\13\33\7\87\58\6\80\19", "\117\35\121\64")] = CFrame.new(3000, 100, 3000);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\179\234\245\5\10\141", "\47\189\221\142\182\67")] = CFrame.new(3180, 100, 3000);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\182\53\142\24", "\73\64\223\71\171\40\201\64")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\131\192\122\134\56\90", "\29\106\237\164\57\192")].Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\176\230\168\193\241\134\183\225", "\146\209\196\135\218\181\178\192")].Position).Unit;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\117\211", "\199\77\80\227\113\48")].Anchored = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\122\14", "\173\74\95\62")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\13\93\36\223\36\154\131\73", "\220\166\121\60\86\171\103")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\1\41\185\45\207\95\185", "\122\137\98\93\208\91\170")] = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\226\89\31", "\170\231\129\124\47\181\210\201")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\174\52\3\15\56\157\178\57\53\79\122", "\74\235\219\90\80\106")].Heartbeat:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\192\79\50\44\241\63\162", "\146\44\163\59\91\90\148\26")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\34\183\149\12\37", "\41\21\77\216\225")] = getRoot();
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\66\125\81\81\29", "\37\116\45\18")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\186\6", "\203\175\159\54\194")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\199\11\126\10", "\162\27\174\121\91\58\47")] * 500;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\202\16\225\122\137", "\185\179\165\127\149\95")].AssemblyLinearVelocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\48\159", "\119\49\21\175\148")].X, 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\240\70", "\149\55\213\118\61\77\41\234")].Z);
		end
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\17\143\150", "\123\125\102\170\166\137\89\207")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\23\93\56\0\176\172\92\22\81\62\11\198\249", "\201\46\96\56\93\110\227")]:Create(TABLE_TableIndirection["r%0"], TweenInfo.new(0.35, Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\152\37\252\248\24\196", "\161\219\99\142\153\117")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\191\162\80\235\57\225", "\173\28\209\198\19")]});
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\251\242\235", "\219\21\140\215")]:Play();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\175\131\247", "\56\40\216\166\199")].Completed:Wait();
	active = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\183\80\127", "\79\70\212\117")]:Disconnect();
	speedFreeze(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\24\229\229\223\72\247", "\109\199\118\129\166\153")]);
end
local function startSpeedFarm()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\149\89\192\116\224", "\150\81\208\23")].GreedySpeedFarm then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\224\206\189\188\149", "\235\153\165\128")].GreedySpeedFarm = true;
	task.spawn(function()
		while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\108\140\25\3\118", "\158\219\41\194\79\38\70\202")].GreedySpeedFarm do
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
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\112\53\42\7\234", "\232\35\69\79\98\142\182"), LUAOBFUSACTOR_DECRYPT_STR_0("\86\46", "\157\25\96\127"));
end
local function stopSpeedFarm()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\166\219\51\21\97", "\81\199\227\149\101\48")].GreedySpeedFarm = false;
	speedUnfreeze();
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\78\66\254\20\242", "\219\29\50\155\113\150\230\92"), LUAOBFUSACTOR_DECRYPT_STR_0("\254\6\227", "\45\177\64\165\27\159\40"));
end
local function findMonkey()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\25\3\174\119\15\83\95", "\18\125\118\111\202")] = getMissionsFolder();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\51\85\254\53\191\130\171", "\155\48\92\57\154\80\205\167")] then
		return false;
	end
	for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\194\183\187\253\185\0\233", "\37\217\173\219\223\152\203")]:GetChildren()) do
		if (m.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\14\0\17\51\93\169\250\95\84", "\150\105\101\127\86\47\200")) then
			return true;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\252\182\229", "\160\174\146\147\213\167")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\100\237\9\84\0\64\89\202\27\73\9", "\33\32\132\122\36\108"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\81\34", "\28\217\116\18\43")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\89\147\4", "\92\178\55\182\52\176\206")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\59\52\69", "\117\122\85\17")].Value))) or "";
		if string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\170\122", "\189\232\143\74\36\198")], LUAOBFUSACTOR_DECRYPT_STR_0("\241\165\4\69\210\19\239\234\3\64\151\25\236\171\9\75", "\106\156\202\106\46\183"), 1, true) then
			return true;
		end
	end
	return false;
end
local function monkeyOnce()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\92\43", "\74\93\121\27\83")] = getRoot();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\254\182", "\30\29\219\134")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\226\73", "\110\53\199\121\154\148\63\120")].AssemblyLinearVelocity = Vector3.zero;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\95\175", "\156\97\122\159\95\57")].CFrame = CFrame.lookAt(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\153\244\211\46\59\0\248\147\244\204\78\82", "\95\174\214\186\152\107\98")] + Vector3.new(0, 3, 0), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\33\95\160\54\255\182\56\84\165\39\131\217", "\166\233\110\17\235\115")] + Vector3.new(20, 3, 0));
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\7\214\213\231\191\112\81\0\212\212\230\147\125\118\15\195\196\224\251\44", "\28\24\110\164\161\146\222")]:SendKeyEvent(true, Enum.KeyCode.W, false, game);
	end);
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\202\68\49\78\194\90\12\85\211\67\49\118\194\88\36\92\198\68\96\11", "\69\59\163\54")]:SendKeyEvent(true, Enum.KeyCode.Space, false, game);
	end);
	local w, s = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\135\228\97\22\244\137\135\151\226\101\31\233\243\224", "\214\208\200\170\42\83\173")], 2;
	if (s <= w) then
		task.wait(s);
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\40\96\180\96\216\45\91\174\101\204\53\95\161\123\216\38\119\178\48\137", "\21\185\65\18\192")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
		end);
		task.wait(w - s);
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\95\79\15\180\255\90\116\21\177\235\66\112\26\175\255\81\88\9\228\174", "\193\158\54\61\123")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
		end);
	else
		task.wait(w);
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\24\50\173\32\16\44\144\59\1\53\173\24\16\46\184\50\20\50\252\101", "\217\85\113\64")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
		end);
		task.wait(s - w);
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\6\222\212\250\131\233\98\1\220\213\251\175\228\69\14\203\197\253\199\181", "\133\43\111\172\160\143\226")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
		end);
	end
end
local function startMonkeyFarm()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\134\126\231\133\155", "\160\171\195\48\177")].GreedyMonkeyRunning then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\38\88\27\25\145", "\167\179\99\22\77\60\161\207")].GreedyMonkeyRunning = true;
	task.spawn(function()
		while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\90\165\110\9\81", "\44\97\31\235\56")].GreedyMonkeyRunning do
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
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\220\1\246\175\244\23", "\196\145\110\152"), LUAOBFUSACTOR_DECRYPT_STR_0("\119\0", "\146\56\78\158"));
end
local function stopMonkeyFarm()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\254\97\208\31\125", "\58\77\187\47\134")].GreedyMonkeyRunning = false;
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\60\179\19\240\47\88\55\28\37\180\19\200\47\90\31\21\48\179\66\181", "\126\114\85\193\103\133\78\52")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\210\32\108\209\218\62\81\202\203\39\108\233\218\60\121\195\222\32\61\148", "\24\164\187\82")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
	end);
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\220\213\82\161\244\232", "\145\145\186\60\202"), LUAOBFUSACTOR_DECRYPT_STR_0("\201\246\21", "\100\134\176\83"));
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\192\69\146\163\16\221\243\87\179\189\28\221\198\7\237", "\117\179\161\34\221\211")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\177\253\233\20\250\171\96\191\254\195\65\175", "\197\45\208\154\166\100\159")] = LUAOBFUSACTOR_DECRYPT_STR_0("\15\245\149\168", "\83\73\148\230\220");
local function openCasesLoop()
	task.spawn(function()
		local opened, fail = 0, 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\198\230\229\252\204\99", "\233\83\191\150\128\143")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\212\137\194\127\2\249", "\109\151\230\175\18"),LUAOBFUSACTOR_DECRYPT_STR_0("\149\244\66\75\141\173\245\79", "\224\192\154\33\36"),LUAOBFUSACTOR_DECRYPT_STR_0("\177\85\10\135", "\226\227\52\120"),LUAOBFUSACTOR_DECRYPT_STR_0("\32\251\229\167", "\217\101\139\140\196\42\223\183"),LUAOBFUSACTOR_DECRYPT_STR_0("\54\10\168\31\74\30\14\189\3", "\36\122\111\207\122")};
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\17\244\189\145\48\20\77\180", "\84\108\104\132\216\216")] = 1;
		while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\26\193\119\240\161\76\254\14\200\86\233\170\69\137\75", "\34\172\123\166\56\128\196")] do
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\168\175\228\90\118\219\57\171\173\173\142\26", "\116\196\201\200\171\42\19\181")] == LUAOBFUSACTOR_DECRYPT_STR_0("\95\136\232\73\20\14\8", "\124\22\230\155\61\117\96")) then
				for _, ty in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\178\246\238\237\168\165", "\149\165\203\134\139\158\141")]) do
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\173\71\9\35\169\78\20\38\162\78\47\61\171\5\118", "\70\83\204\32")] then
						break;
					end
					local ok, res = pcall(function()
						return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\132\27\140\7\130\10\148\11\133\56\148\1\147\10\135\11\196\91", "\224\110\225\107")].OpenCase:InvokeServer(ty);
					end);
					if (ok and res) then
						opened = opened + 1;
						fail = 0;
					end
				end
				task.wait();
			else
				local ok, res = pcall(function()
					return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\115\205\61\57\199\197\224\115\217\2\36\203\214\245\113\216\116\96", "\164\148\22\189\81\80\164")].OpenCase:InvokeServer(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\153\103\182\52\14\39", "\23\210\224\23\211\71\43")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\159\0\178\124\47\196\181\249", "\144\201\230\112\215\53\75\188")]]);
				end);
				if (ok and res) then
					opened = opened + 1;
					fail = 0;
				else
					fail = fail + 1;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\220\9\239\223\161\77\128\73", "\197\53\165\121\138\150")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\198\201\37\196\219\193\101\189", "\64\141\191\185")] % #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\243\160\223\228\140\246", "\198\99\138\208\186\151\169")]) + 1;
					if (fail > 40) then
						break;
					end
				end
				task.wait(((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\244\132\113\29\240\141\115\2\241\134\27\93", "\62\109\149\227")] == LUAOBFUSACTOR_DECRYPT_STR_0("\192\132\134\195", "\96\147\232\233\180")) and 0.35) or 0.01);
			end
		end
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\10\57\29\88", "\89\72\88\122\43\237"), LUAOBFUSACTOR_DECRYPT_STR_0("\8\180\171\51\91\3\225", "\123\76\219\197\86") .. opened .. LUAOBFUSACTOR_DECRYPT_STR_0("\24\254\79", "\95\56\184\117\108\142") .. fail);
	end);
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\206\39\245\245\208\99\188", "\140\144\162\70")].CharacterAdded:Connect(function()
	task.wait(0.3);
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\24\124\87\202\239\5\108\94\218\239\7\119\55\190", "\142\176\72\57\18")] then
		startInfinite();
		applyWalkSpeed();
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\4\61\20\153\28\37\8\146\14\63\10\227\97", "\68\198\81\112")] then
		applyJumpPower();
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\32\147\56\101\45\136\42\158\53\110\49\146\43\245\68", "\125\215\111\208\116\44")] then
		toggleNoClip(true);
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\104\119\213\84\101\56\98\97\210\90\112\34\99\10\163", "\60\103\39\47\147\24")] then
		startBoxFly();
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\37\200\166\247\223\98\211\47\217\161\244\223\107\200\79\167", "\46\140\106\151\224\182\147")] then
		setupNoFall();
	end
end);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\36\115\70\228\58\56\18", "\34\139\77\29")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\249\19\80\28\153\181\77", "\73\208\144\125\52")]:CreateWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\30\229\158\199\194", "\171\74\140\234\171\167\112\51")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\39\98\123\222\154\16\58\101\107\221\136\106\94", "\205\79\110\44\63\145")],[LUAOBFUSACTOR_DECRYPT_STR_0("\142\92\48\198", "\124\199\63\95\168\212\107\196")]=LUAOBFUSACTOR_DECRYPT_STR_0("\14\173\75\59\163\248\135", "\147\102\200\51\90\196\151\233"),[LUAOBFUSACTOR_DECRYPT_STR_0("\26\229\251\197\177\242", "\91\91\144\143\173\222\128")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\133\126\98\130\97\13\229\28", "\46\67\192\44\49\203")],[LUAOBFUSACTOR_DECRYPT_STR_0("\34\217\34\166\33\182", "\101\100\182\78\194\68\196")]=LUAOBFUSACTOR_DECRYPT_STR_0("\111\90\53\240\137\82\80\192\76\82\53\249\129\104\119\219\78\65\55", "\181\40\40\80\149\237\43\24"),[LUAOBFUSACTOR_DECRYPT_STR_0("\38\187\63\55", "\114\117\210\69\82\218\42")]=UDim2.fromOffset(640, 480),[LUAOBFUSACTOR_DECRYPT_STR_0("\112\222\93\126\169", "\204\36\182\56\19")]=LUAOBFUSACTOR_DECRYPT_STR_0("\206\89\217\134\121\33\53\230\71\216", "\114\137\43\188\227\29\88"),[LUAOBFUSACTOR_DECRYPT_STR_0("\208\15\169\30\247\13\169\2\225\19\188", "\112\132\125\200")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\210\168\246\125\120\224\233\172\252\125", "\149\157\216\147\19\58")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\253\143\12\196\204", "\168\169\230\120")]=LUAOBFUSACTOR_DECRYPT_STR_0("\219\159\129\18\248\148", "\119\156\237\228"),[LUAOBFUSACTOR_DECRYPT_STR_0("\224\222\18\112\198\195\50\127\199\216\21\109", "\30\163\177\96")]=UDim.new(1, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\41\52\71\134\54\46\224\18\41\86\130\51\46\199\9", "\180\122\64\53\233\93\75")]=2,[LUAOBFUSACTOR_DECRYPT_STR_0("\243\25\18\63\218\18\23", "\93\182\119\115")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\166\13\210\139\176\255\128\19\214", "\158\226\127\179\236\215")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\222\206\197\207\220\207\203\223\253\197", "\182\145\160\169")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\10\35\49\26\162", "\111\89\64\80\118\199")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\156\184\2\73\173", "\38\223\215\110")]=ColorSequence.new(Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\29\138\13\148\255\14\131", "\203\62\187\108\165")), Color3.fromHex(LUAOBFUSACTOR_DECRYPT_STR_0("\186\119\17\63\35\172\135", "\176\153\20\40\94\17\158")))}});
pcall(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\58\181\87\240\129\118\235", "\165\200\83\219\51")]:SetTheme(LUAOBFUSACTOR_DECRYPT_STR_0("\224\248\113\126\213\172\155\235\203\238", "\132\167\138\20\27\177\213\220"));
end);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\212\225\95\121\162", "\92\146\181\131\44")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\98\240\71\137", "\189\43\158\33\230\222\32\119")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\201\67\85\135\73\133\29", "\232\62\160\45\49")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\64\218\225\160\164", "\193\20\179\149\204")]=LUAOBFUSACTOR_DECRYPT_STR_0("\254\15\135\205\197\12\128\214\222\14\143", "\162\183\97\225"),[LUAOBFUSACTOR_DECRYPT_STR_0("\0\198\235\249", "\193\73\165\132\151\124\130")]=LUAOBFUSACTOR_DECRYPT_STR_0("\196\204\175\84", "\214\173\162\201\59\214")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\14\118\188\68\218\37\45\109", "\64\67\25\202\33\183")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\231\127\184\33\197\6\185", "\35\137\142\17\220\78\178")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\25\71\49\13\40", "\97\77\46\69")]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\208\22\160\210\218\14\177", "\197\191\191\96"),[LUAOBFUSACTOR_DECRYPT_STR_0("\227\42\226\64", "\45\170\73\141\46\56\136")]=LUAOBFUSACTOR_DECRYPT_STR_0("\135\0\194\241\191\149\14\143\27\222", "\103\225\111\173\133\207\231")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\120\129\249\80\92\139\231\65", "\53\44\228\149")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\210\53\1\196\51\136\139", "\68\173\187\91\101\171")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\200\6\6\203\76", "\185\156\111\114\167\41\226\29")]=LUAOBFUSACTOR_DECRYPT_STR_0("\63\0\26\37\164\236\25\17", "\131\107\101\118\64\212"),[LUAOBFUSACTOR_DECRYPT_STR_0("\232\213\35\37", "\169\161\182\76\75\39\160")]=LUAOBFUSACTOR_DECRYPT_STR_0("\212\83\167\198\11\43\166", "\200\185\50\215\235\123\66")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\211\148\205\237\140\119\8\255", "\122\146\225\185\130\234\22")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\235\206\203\224\172\252\178", "\219\217\130\160\175\143")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\10\181\86\49\59", "\93\94\220\34")]=LUAOBFUSACTOR_DECRYPT_STR_0("\46\221\213\133\220\246\239\2", "\157\111\168\161\234\186\151"),[LUAOBFUSACTOR_DECRYPT_STR_0("\82\67\122\63", "\229\27\32\21\81\162\217\210")]=LUAOBFUSACTOR_DECRYPT_STR_0("\46\195\239", "\42\76\172\155\90")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\215\190\177", "\96\146\237\225\73")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\119\6\236\70\109\231\184", "\194\136\30\104\136\41\26")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\232\223\23\68\17", "\79\188\182\99\40\116\208\201")]=LUAOBFUSACTOR_DECRYPT_STR_0("\88\240\26", "\95\29\163\74\33\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\85\49\79\57", "\100\28\82\32\87\31\234")]=LUAOBFUSACTOR_DECRYPT_STR_0("\52\75\229", "\94\81\50\128\17\155\182\136")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\169\61\227\42", "\231\235\92\132\89\130\212\124")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\189\250\59\222\82\187\228", "\37\158\212\148\95\177")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\64\21\176\139\8", "\109\20\124\196\231")]=LUAOBFUSACTOR_DECRYPT_STR_0("\130\188\115\182", "\64\192\221\20\197\81"),[LUAOBFUSACTOR_DECRYPT_STR_0("\134\245\237\172", "\199\207\150\130\194")]=LUAOBFUSACTOR_DECRYPT_STR_0("\166\66\116\248\83\188\68\124\165\65\180\77", "\35\213\42\27\136")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\142\40\172\209\253\174\148", "\146\192\231\91\223\184")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\248\248\45\222\163\66\94", "\110\58\145\150\73\177\212\103")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\192\61\222\254\78", "\137\148\84\170\146\43\171")]=LUAOBFUSACTOR_DECRYPT_STR_0("\44\214\108\238\126\14\209\108", "\23\97\191\31\157"),[LUAOBFUSACTOR_DECRYPT_STR_0("\175\129\8\11", "\82\230\226\103\101\189")]=LUAOBFUSACTOR_DECRYPT_STR_0("\159\43\161\182\17\159", "\116\235\74\211\209")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\5\53\205\38", "\69\72\92\190")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\50\234\208\164\191\83\231", "\215\86\91\132\180\203\200\118")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\7\231\146\223\54", "\179\83\142\230")]=LUAOBFUSACTOR_DECRYPT_STR_0("\247\38\238\54", "\191\186\79\157\85\89\127\151"),[LUAOBFUSACTOR_DECRYPT_STR_0("\223\121\171\192", "\37\150\26\196\174\228")]=LUAOBFUSACTOR_DECRYPT_STR_0("\218\245\166\65\62\135\206\227", "\233\169\144\210\53\87")})};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\71\239\207\103\22", "\188\66\38\141")].Info:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\213\89\25\61\118", "\168\129\48\109\81\19\34\104")]=LUAOBFUSACTOR_DECRYPT_STR_0("\84\27\28\41\159\1\178\234\116\27\30\52", "\153\23\116\108\80\191\69\219"),[LUAOBFUSACTOR_DECRYPT_STR_0("\106\30\241\212\250\138\117\66", "\22\41\127\157\184\152\235")]=function()
	if setclipboard then
		setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\238\210\233\56\245\197\245\48\239\164\154", "\170\119\167\129")]);
	end
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\249\255\172\122\134\90", "\62\186\144\220\19\227"), LUAOBFUSACTOR_DECRYPT_STR_0("\133\245\255\213\174\238\232", "\182\193\156\140"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\77\20\161\163\111", "\95\161\44\118\210\134")].Info:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\210\73\7\1\127", "\206\134\32\115\109\26\182\133")]=LUAOBFUSACTOR_DECRYPT_STR_0("\21\247\223\10\29\106\51\250\220\26\73\88", "\61\86\152\175\115\61"),[LUAOBFUSACTOR_DECRYPT_STR_0("\138\0\208\60\211\128\32\204", "\167\201\97\188\80\177\225\67")]=function()
	if setclipboard then
		setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\33\176\138\195\180\124\36\193\255", "\225\46\104\228\207\156")]);
	end
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\137\207\163\71\50\87", "\223\202\160\211\46\87\51\210"), LUAOBFUSACTOR_DECRYPT_STR_0("\225\236\24\103\4\194\236", "\109\182\137\122\20"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\168\16\233\165\135", "\28\50\201\114\154\128\183\138")].Info:Paragraph({[LUAOBFUSACTOR_DECRYPT_STR_0("\158\143\13\254\175", "\146\202\230\121")]=LUAOBFUSACTOR_DECRYPT_STR_0("\201\253\235\27\195\171\224\22\251\235\244\27\203\190", "\94\142\143\142\126\167\210\192"),[LUAOBFUSACTOR_DECRYPT_STR_0("\36\192\14\226", "\167\96\165\125\129")]=(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\243\36\117\107\9\101\205\87", "\232\103\182\118\38\34\70\43")] .. " · Black & Gold · WindUI")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\86\45\240\117\33", "\17\85\55\79\131\80")].Movement:Slider({[LUAOBFUSACTOR_DECRYPT_STR_0("\252\140\173\160\58", "\95\168\229\217\204")]=LUAOBFUSACTOR_DECRYPT_STR_0("\189\58\138\130\185\43\131\140\142", "\233\234\91\230"),[LUAOBFUSACTOR_DECRYPT_STR_0("\98\85\135\99", "\199\49\33\226\19")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\100\90\79\10\194", "\167\50\59\35\127")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\101\26\92", "\200\40\115\50\140")]=16,[LUAOBFUSACTOR_DECRYPT_STR_0("\222\44\111", "\127\147\77\23")]=500,[LUAOBFUSACTOR_DECRYPT_STR_0("\175\227\243\117\101\135\242", "\16\235\134\149\20")]=100},[LUAOBFUSACTOR_DECRYPT_STR_0("\249\74\66\170\14\134\15\209", "\108\186\43\46\198\108\231")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\144\195\36\81\23\145\193\62\79\2\154\208\37\57\98", "\28\82\223\149\97")] = tonumber(val) or 100;
	applyWalkSpeed();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\52\79\77\232\101", "\62\205\85\45")].Movement:Slider({[LUAOBFUSACTOR_DECRYPT_STR_0("\65\5\181\165\7", "\105\21\108\193\201\98\233")]=LUAOBFUSACTOR_DECRYPT_STR_0("\106\144\22\238\243\49\205\69\151", "\186\32\229\123\158\163\94"),[LUAOBFUSACTOR_DECRYPT_STR_0("\55\55\116\218", "\87\100\67\17\170\121\197")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\216\138\182\149\82", "\213\142\235\218\224\55")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\37\171\247", "\165\104\194\153")]=20,[LUAOBFUSACTOR_DECRYPT_STR_0("\170\49\193", "\237\231\80\185\203\153\61")]=300,[LUAOBFUSACTOR_DECRYPT_STR_0("\129\53\134\115\80\169\36", "\37\197\80\224\18")]=50},[LUAOBFUSACTOR_DECRYPT_STR_0("\58\67\64\74\182\24\65\71", "\212\121\34\44\38")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\143\7\53\65\157\221\105\159\136\111\85", "\62\218\218\74\101\30\205\146")] = tonumber(val) or 50;
	applyJumpPower();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\168\123\226\152\110", "\79\34\201\25\145\189\94\36")].Movement:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\116\37\254\6\69", "\52\32\76\138\106\32")]=LUAOBFUSACTOR_DECRYPT_STR_0("\139\234\53\195\126\248\215\37\202\110\177\234\60\207\127\170", "\26\216\154\80\166"),[LUAOBFUSACTOR_DECRYPT_STR_0("\232\204\235\66\104\32\216", "\76\172\169\141\35\29")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\255\216\244\15\222\216\251\8", "\99\188\185\152")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\36\147\43\135\237\57\131\34\151\237\59\152\75\243", "\195\178\116\214\110")] = state;
	if state then
		startInfinite();
	else
		stopInfinite();
	end
	applyWalkSpeed();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\246\132\102\132\182", "\134\101\151\230\21\161")].Movement:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\157\131\46\88\38", "\128\201\234\90\52\67\82")]=LUAOBFUSACTOR_DECRYPT_STR_0("\142\88\51\100\138\137\88\50\96\195\180\65\55\113\216", "\170\196\45\94\20"),[LUAOBFUSACTOR_DECRYPT_STR_0("\90\65\3\53\212\44\36", "\80\30\36\101\84\161\64")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\133\80\21\78\218\58\165\90", "\91\198\49\121\34\184")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\243\90\137\182\25\243\91\141\182\27\232\50\233", "\233\84\166\23\217")] = state;
	applyJumpPower();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\121\250\245\115\113", "\65\24\24\152\134\86")].Movement:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\136\62\252\69\185", "\41\220\87\136")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\57\192\252\199\187", "\203\69\86\131\144\174"),[LUAOBFUSACTOR_DECRYPT_STR_0("\157\27\85\88\221\92\243", "\113\217\126\51\57\168\48\135")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\60\20\58\68\74\126\117\197", "\174\127\117\86\40\40\31\22")]=toggleNoClip});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\58\78\200\153\107", "\187\188\91\44")].Movement:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\43\254\106\41\231", "\109\127\151\30\69\130")]=LUAOBFUSACTOR_DECRYPT_STR_0("\240\138\111\88\227\220\171", "\118\178\229\23\120\165\176\210"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\217\74\8\25\163\53", "\221\101\188\44\105\108\207\65")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\117\49\27\174\208\87\51\28", "\178\54\80\119\194")]=function(state)
	if state then
		startBoxFly();
	else
		stopBoxFly();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\14\67\209\170\169", "\162\84\111\33\162\143\153\217")].Movement:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\19\210\9\134\34", "\234\71\187\125")]=LUAOBFUSACTOR_DECRYPT_STR_0("\63\51\17\125\255\29\48\17\127\255\28\61\86\94", "\158\113\92\49\59"),[LUAOBFUSACTOR_DECRYPT_STR_0("\200\117\71\113\235\10\206", "\103\140\16\33\16\158\102\186")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\228\140\177\121\1\61\196\134", "\92\167\237\221\21\99")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\15\18\0\222\12\1\25\218\14\12\4\211\5\9\99\175", "\70\159\64\77")] = state;
	setupNoFall();
	if state then
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\249\64\116\254\22\219", "\122\183\47\50\159"), LUAOBFUSACTOR_DECRYPT_STR_0("\237\31", "\224\162\81\199\47"));
	end
end});
local function getPlayerNames()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\68\62\56\144\173\21", "\227\136\37\83\93")] = {};
	for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\161\9\109\92\191\27\49\9", "\20\57\205\104")]:GetPlayers()) do
		if (p ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\167\25\160\31\72\118\120", "\83\72\203\120\217\122\58")]) then
			table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\232\182\166\188\248\239", "\223\220\137\219\195\207\221")], p.Name);
		end
	end
	if (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\73\82\231\63\86\24", "\76\115\40\63\130")] == 0) then
		table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\27\32\168\165\148\215", "\177\231\122\77\205\214")], LUAOBFUSACTOR_DECRYPT_STR_0("\106\28\79\69", "\60\36\115\33\32\201"));
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\119\90\67\95\27\109", "\193\215\22\55\38\44\62\93")];
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\23\2\202\214\239\42\22\62\195\212\226\42\0\32\206\216\254\106\66", "\155\79\114\110\175\181")] = getPlayerNames()[1];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\88\216\253\180\158\241\74\91\201\224\190\155\219\29\4", "\181\56\52\185\132\209\236")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\77\208\187\0\249", "\154\82\44\178\200\37\201")].Teleport:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\65\226\22\1\187", "\21\21\139\98\109\222\40")]=LUAOBFUSACTOR_DECRYPT_STR_0("\55\233\160\137\57\16\172\156\128\59\29\233\190", "\90\100\140\204\236"),[LUAOBFUSACTOR_DECRYPT_STR_0("\154\21\50\217\178\11", "\120\204\116\94\172\215")]=getPlayerNames(),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\184\190\9\254\174\100", "\31\99\221\216\104\139\194\16")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\165\230\9\10\247\48\164\218\0\8\250\48\178\196\13\4\230\112\240", "\131\85\192\138\108\105")],[LUAOBFUSACTOR_DECRYPT_STR_0("\21\165\115\15\52\165\124\8", "\99\86\196\31")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\49\67\248\92\179\10\84\4\67\252\70\162\29\126\53\66\248\26\247", "\111\48\84\47\157\63\199")] = val;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\7\130\180\107\74", "\78\122\102\224\199")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\200\17\96\15\49", "\159\156\120\20\99\84\101\206")]=LUAOBFUSACTOR_DECRYPT_STR_0("\78\20\138\109\205\82\127\103\76\29\141\102\205\83\100", "\71\28\113\236\31\168\33\23"),[LUAOBFUSACTOR_DECRYPT_STR_0("\110\255\47\244\219\216\56\172", "\199\45\158\67\152\185\185\91")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\105\185\175\196\19\211\149\10", "\176\58\25\221\206\176\118\183")] = getPlayerNames();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\20\213\3\237\172\55\21\233\10\239\161\55\3\247\7\227\189\119\65", "\216\82\113\185\102\142")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\75\36\217\105\71\95\101\136", "\29\34\59\64\184")][1];
	pcall(function()
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\18\73\211\48\79\54\12\71\218\49\82\5\16\13\154", "\61\114\126\40\170\85")].Refresh then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\36\118\32\198\97\232\58\120\41\199\124\219\38\50\105", "\19\172\72\23\89\163")]:Refresh(TABLE_TableIndirection["updated%0"]);
		elseif TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\80\206\252\48\64\129\37\83\223\225\58\69\171\114\12", "\197\87\60\175\133\85\50")].SetValues then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\114\213\202\17\108\240\193\27\110\208\220\3\112\145\131", "\179\116\30\180")]:SetValues(TABLE_TableIndirection["updated%0"]);
		end
	end);
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\223\195\225\132\251\201\255\149", "\225\139\166\141"), LUAOBFUSACTOR_DECRYPT_STR_0("\125\135\245\57\72\153\231\96\95\142\242\50\72\152\252\37\73", "\64\45\235\148"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\80\56\241\25\133", "\181\22\49\90\130\60")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\59\216\172\5\10", "\105\111\177\216")]=LUAOBFUSACTOR_DECRYPT_STR_0("\128\42\136\6\31\147\132\22\201\11\21\193", "\179\212\122\168\114\112"),[LUAOBFUSACTOR_DECRYPT_STR_0("\90\123\136\193\123\123\135\198", "\173\25\26\228")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\119\219\189\29\2\51\153", "\120\118\22\169\218")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\44\183\255\194\50\165\163\151", "\134\167\64\214")]:FindFirstChild(TABLE_TableIndirection["selectedPlayerName%0"]);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\136\236\143\204\220\65\217", "\168\100\233\158\232\169")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\85\11\251\119\64\92\172", "\156\18\52\121")].Character) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\0\158\154", "\191\35\112\187\170\228\213\101")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\174\110\82\59\8\58\232", "\31\216\207\28\53\94\124")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\9\50\166\14\85\46\46\175\61\84\46\51\155\14\73\53", "\59\65\71\203\111"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\176\57\36", "\84\119\192\28\20\235\108")] then
			safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\238\97\166", "\33\236\158\68\150\122\92\201")].CFrame * CFrame.new(0, 3, 0));
		end
	else
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\212\221\245\28\89\254\43\244", "\89\128\184\153\121\41\145"), LUAOBFUSACTOR_DECRYPT_STR_0("\220\57\165\152\39\149\64\53\227\33\228\135\45\146\14\63", "\91\140\85\196\225\66\231\96"));
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\185\181\162\14\99", "\43\83\216\215\209")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\127\174\164\7\43", "\78\43\199\208\107")]=LUAOBFUSACTOR_DECRYPT_STR_0("\70\184\64\48\190\59\215\211\97\156\64\60\186\61", "\182\18\232\96\126\219\90\165"),[LUAOBFUSACTOR_DECRYPT_STR_0("\30\95\43\164\63\95\36\163", "\200\93\62\71")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\8\30", "\110\38\45\46\186\164\210")] = getClosestEntity();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\251\248", "\94\24\222\200\118")] then
		safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\133\118", "\121\125\160\70")].CFrame * CFrame.new(0, 3, 0));
	else
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\199\239\55\183\227\229\41\166", "\210\147\138\91"), LUAOBFUSACTOR_DECRYPT_STR_0("\27\242\136\73\49\20\117\243\205\74\34\17\44", "\115\85\157\168\43\80"));
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\91\133\68\201\153", "\169\159\58\231\55\236\169\38")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\37\200\171\28\193", "\28\113\161\223\112\164\116")]=LUAOBFUSACTOR_DECRYPT_STR_0("\245\72\70\110\85\134\108\72\108\73", "\59\166\56\39\25"),[LUAOBFUSACTOR_DECRYPT_STR_0("\145\217\202\196\65\179\219\205", "\35\210\184\166\168")]=function()
	task.spawn(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\28\45", "\23\57\57\29\34\68")] = 0;
		for _, obj in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\62\13\39\67\33\30\47\85\116\79", "\76\48\81\127")]:GetDescendants()) do
			if obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\61\181\80\160\4\88\210\83\15\177\88\184\4", "\48\110\197\49\215\106\20\189")) then
				safeTeleport(obj.CFrame + Vector3.new(0, 4, 0));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\87\24", "\108\125\114\40\204\160\75\38")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\53\175", "\109\85\16\159")] + 1;
				task.wait(0.4);
			end
		end
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\19\246\161\94\11\87\162\51", "\208\71\147\205\59\123\56"), LUAOBFUSACTOR_DECRYPT_STR_0("\100\48\133\175\89\51\222\248", "\216\55\64\228") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\205\110", "\139\223\232\94\162\217\149")]);
	end);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\130\33\226\254\5", "\170\181\227\67\145\219\53")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\109\140\10\190\92", "\210\57\229\126")]=LUAOBFUSACTOR_DECRYPT_STR_0("\155\60\230\170\55\198\151\248\17\235\162\53\192\144", "\227\216\83\138\198\82\165"),[LUAOBFUSACTOR_DECRYPT_STR_0("\8\180\186\116\240\42\182\189", "\146\75\213\214\24")]=function()
	task.spawn(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\113\212\74\110\0\5", "\53\42\30\161\36\26\37")] = 0;
		for _, obj in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\246\229\235\238\233\246\227\248\188\167", "\128\157\153\151")]:GetDescendants()) do
			if (obj.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\84\116\136\46\16\82\97\116\158\45\16\97", "\19\22\21\236\73\117")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\128\242", "\150\23\165\194\201\151\221\77")] = (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\92\58\251\31\78\58\250\14", "\122\30\91\136")) and obj) or (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\146\171\225\181\129", "\237\223\196\133\208")) and (obj.PrimaryPart or obj:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\254\9\208\187\110\251\206\28", "\154\188\104\163\222\62"))));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\168\125", "\162\85\141\77\155\112\47")] then
					safeTeleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\108\246", "\46\114\73\198")].CFrame * CFrame.new(0, 3, 0));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\113\99\225\58\15\245", "\42\197\30\22\143\78")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\74\74\49\103\0\15", "\95\19\37\63")] + 1;
					task.wait(0.4);
				end
			end
		end
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\83\45\163\251\116\20", "\103\17\76\199\156\17"), LUAOBFUSACTOR_DECRYPT_STR_0("\151\37\139\237\6\80", "\154\211\74\229\136\60\112\217") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\19\255\195\17\2\255", "\39\207\124\138\173\101")]);
	end);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\0\65\211\231\158", "\194\174\97\35\160")].Autofarm:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\203\41\41\14\250", "\98\159\64\93")]=LUAOBFUSACTOR_DECRYPT_STR_0("\43\191\44\29\29\3\27\5\27\165\34\25\16\20\86", "\68\110\209\77\127\113\102\59"),[LUAOBFUSACTOR_DECRYPT_STR_0("\138\225\161\78\22\207\186", "\206\206\132\199\47\99\163")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\213\195\219\126\83\247\193\220", "\49\150\162\183\18")]=function(state)
	if state then
		startAutofarm();
	else
		stopAutofarm();
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\104\63\175\46\28\225\10\68", "\120\41\74\219\65\122\128"), LUAOBFUSACTOR_DECRYPT_STR_0("\105\18\83\10\245\162\209", "\181\58\102\60\122\133\199"));
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\227\222\10\63\3", "\26\51\130\188\121")].Autofarm:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\220\139\56\21\76", "\57\136\226\76\121\41\126\151")]=LUAOBFUSACTOR_DECRYPT_STR_0("\4\214\27\94\100\206\114\38\210", "\29\66\183\105\51\68\131"),[LUAOBFUSACTOR_DECRYPT_STR_0("\115\36\69\219\64\54", "\174\37\69\41")]={LUAOBFUSACTOR_DECRYPT_STR_0("\163\185\90\6", "\112\225\214\46\110"),LUAOBFUSACTOR_DECRYPT_STR_0("\60\37\36", "\140\126\68\67\59\132\221"),LUAOBFUSACTOR_DECRYPT_STR_0("\161\112\4\67\72", "\230\226\17\103\43\45\127")},[LUAOBFUSACTOR_DECRYPT_STR_0("\244\73\194\74\146\220\88", "\231\176\44\164\43")]=LUAOBFUSACTOR_DECRYPT_STR_0("\131\201\48\161", "\236\193\166\68\201\206"),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\58\196\125\6\58\203\122", "\17\100\91\168")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\147\184\195\149\2\73\119\153\161\195\151\6\62\10", "\27\58\198\236\140\211\67")] = val;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\204\206\89\204\187", "\139\65\173\172\42\233")].Autofarm:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\179\95\101\212\193", "\40\231\54\17\184\164\23\128")]=LUAOBFUSACTOR_DECRYPT_STR_0("\178\200\109\241\132\228\144", "\138\228\169\31\152\229"),[LUAOBFUSACTOR_DECRYPT_STR_0("\250\13\78\32\229\208", "\163\172\108\34\85\128")]={LUAOBFUSACTOR_DECRYPT_STR_0("\20\16\241\130", "\52\71\113\151\231\187\36\232"),LUAOBFUSACTOR_DECRYPT_STR_0("\84\129\121\185\119\131\108", "\205\22\237\24")},[LUAOBFUSACTOR_DECRYPT_STR_0("\154\125\117\201\44\178\108", "\89\222\24\19\168")]=LUAOBFUSACTOR_DECRYPT_STR_0("\198\88\85\178", "\113\149\57\51\215"),[LUAOBFUSACTOR_DECRYPT_STR_0("\90\113\199\186\224\193\122\123", "\160\25\16\171\214\130")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\237\3\82\91\243\185\92\231\1\92\79\251\170\95\236\114\45", "\235\17\184\87\29\29\178")] = val;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\168\123\235\181\250", "\144\202\201\25\152")].Autofarm:Slider({[LUAOBFUSACTOR_DECRYPT_STR_0("\13\210\16\114\254", "\96\89\187\100\30\155\42\135")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\193\26\10\73\109\40\200\7", "\29\77\173\99\42\26"),[LUAOBFUSACTOR_DECRYPT_STR_0("\183\246\2\106", "\109\228\130\103\26\59\143\151")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\181\121\162\204\59", "\228\227\24\206\185\94\42\79")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\227\43\57", "\80\174\66\87\200\212\123")]=20,[LUAOBFUSACTOR_DECRYPT_STR_0("\230\120\38", "\115\171\25\94\168\151")]=800,[LUAOBFUSACTOR_DECRYPT_STR_0("\40\183\226\32\226\0\166", "\151\108\210\132\65")]=130},[LUAOBFUSACTOR_DECRYPT_STR_0("\251\85\5\68\196\64\196\95", "\52\184\52\105\40\166\33\167")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\34\244\151\9\228\233\119\42\136\248", "\172\50\110\173\200\90\180")] = tonumber(val) or 130;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\187\246\95\190\234", "\44\155\218\148")].Autofarm:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\217\242\56\55\209", "\209\141\155\76\91\180\71")]=LUAOBFUSACTOR_DECRYPT_STR_0("\213\111\218\78\0\246\61\252\74\23\246\111\222\11\13\251\116\211\78\90\245\124\205\70\19\253\122", "\122\147\29\191\43"),[LUAOBFUSACTOR_DECRYPT_STR_0("\152\213\88\8\207\243\152", "\30\220\176\62\105\186\159\236")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\171\220\137\188\52\212\180\182", "\221\232\189\229\208\86\181\215")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\149\217\249\28\45\139\217\243\10\41\241\164", "\78\108\212\148\188")] = (state and 1) or 2;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\37\32\13\202\33\137\23\4\53\58\3\206\44\158\30\126\64", "\90\91\112\116\66\140\96\219")] then
		if state then
			freezeCamera();
		else
			unfreezeCamera();
		end
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\86\8\31\165\248", "\100\165\55\106\108\128\200")].Autofarm:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\241\194\37\191\192", "\211\165\171\81")]=LUAOBFUSACTOR_DECRYPT_STR_0("\37\123\198\195\154\254\5\123\146\130\212\221\20\53\193\218\210\217\0\60", "\188\100\21\178\170\183"),[LUAOBFUSACTOR_DECRYPT_STR_0("\90\18\86\178\167\193\106", "\173\30\119\48\211\210")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\120\216\53\54\89\216\58\49", "\90\59\185\89")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\222\110\102\4\95\97\222\101\106\21\92\98\220\127\107\126\45", "\29\32\144\58\47\91")] = state;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\52\115\174\4\241", "\193\115\85\17\221\33")].Autofarm:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\217\114\26\18\170", "\188\141\27\110\126\207")]=LUAOBFUSACTOR_DECRYPT_STR_0("\171\25\108\84\193\168\58\185\25\110\55\197\253\29\130\48\95\101\233", "\105\237\86\62\23\132\136"),[LUAOBFUSACTOR_DECRYPT_STR_0("\154\72\48\65\33\28\186\66", "\125\217\41\92\45\67")]=function()
	stopAutofarm();
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\120\161\18\80\133\90\75\185", "\59\57\212\102\63\227"), LUAOBFUSACTOR_DECRYPT_STR_0("\91\231\109\4\120\168\108\19\114\248\111\2\121", "\103\29\136\31"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\47\216\57\3\78", "\38\126\78\186\74")].Autofarm:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\245\73\62\134\66", "\228\161\32\74\234\39")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\129\25\176\228\193\54\129\57\196\9\186\229\143\32\133\44", "\224\94\228\106\213\144\225\84"),[LUAOBFUSACTOR_DECRYPT_STR_0("\147\233\75\204\3\177\235\76", "\97\208\136\39\160")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\40\196\165\86\7\53\226\44\209\195\9", "\91\150\73\163\230\57\114")] = 0;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\184\166\89\246\10\172\82\125\185\179\68\228\63\183\82\75\232\226", "\63\46\205\210\54\144\107\222")] = os.time();
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\195\56\245\83\207", "\188\144\76\148\39"), LUAOBFUSACTOR_DECRYPT_STR_0("\183\78\102\161\88", "\53\229\43\21\196\44\108\66"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\52\21\182\118\101", "\197\83\85\119")].Autofarm:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\123\243\10\59\74", "\87\47\154\126")]=LUAOBFUSACTOR_DECRYPT_STR_0("\24\112\195\204\146\199\63\121\216\200", "\180\75\24\172\187\178"),[LUAOBFUSACTOR_DECRYPT_STR_0("\224\216\233\15\126\37\250\27", "\112\163\185\133\99\28\68\153")]=function()
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\152\64\253\223\184", "\171\203\52\156"), LUAOBFUSACTOR_DECRYPT_STR_0("\152\203\122\162\112\193", "\192\218\170\29\209\74\225\221") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\221\92\35\192\88\39\233\134\206\30\80", "\157\227\188\59\96\175\45\73")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\255\214\151", "\81\223\170\183\118") .. (os.time() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\84\184\180\255\51\3\43\114\184\186\235\38\37\47\76\169\254\169", "\113\70\33\204\219\153\82")]) .. "s");
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\131\61\47\187\224", "\208\145\226\95\92\158")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\138\232\201\64\234", "\120\222\129\189\44\143\149\207")]=LUAOBFUSACTOR_DECRYPT_STR_0("\161\34\45\241\239\69\120\186\136\20\25", "\216\228\113\125\209\170\43\25"),[LUAOBFUSACTOR_DECRYPT_STR_0("\221\255\94\68\103\114\237", "\30\153\154\56\37\18")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\62\184\251\0\57\28\186\252", "\91\125\217\151\108")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\32\150\79\251\215\50\132\92\251\221\86\246", "\190\153\115\198\16")] = state;
	if state then
		rebuildESP();
	else
		clearAllESP();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\122\168\148\127\43", "\231\90\27\202")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\181\141\76\174\91", "\62\225\228\56\194")]=LUAOBFUSACTOR_DECRYPT_STR_0("\37\177\182\58\52\119\23\190\170", "\53\118\217\217\77\20"),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\26\226\223\58\165\11", "\79\201\127\132\190")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\11\21\229\197\42\21\234\194", "\169\72\116\137")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\73\249\153\91\91\238\149\70\95\231\135\91\86\236\130\60\42", "\198\25\26\169")] = state;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\64\237\25\162\127\90\93\101\86\249\99\215", "\31\41\19\189\70\231\49\27")] then
		rebuildESP();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\210\83\245\242\131", "\134\215\179\49")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\213\253\66\234\80", "\115\129\148\54\134\53")]=LUAOBFUSACTOR_DECRYPT_STR_0("\218\143\95\92\152\56\31\232\158\85\89\203", "\115\137\231\48\43\184\104"),[LUAOBFUSACTOR_DECRYPT_STR_0("\253\236\28\226\188\172\43", "\95\185\137\122\131\201\192")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\85\55\203\31\39\119\53\204", "\69\22\86\167\115")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\183\119\190\117\11\121\189\98\179\118\24\125\170\102\163\105\2\124\193\23", "\71\56\228\39\225\37")] = state;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\210\212\22\223\195\3\146\205\193\13\191\189", "\66\208\129\132\73\154\141")] then
		rebuildESP();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\94\212\238\15\15", "\157\42\63\182")].ESP:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\239\55\61\240\202", "\175\187\94\73\156")]=LUAOBFUSACTOR_DECRYPT_STR_0("\20\58\73\50\30\48\200\102\26\124\16", "\160\70\95\47\64\123\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\253\91\120\61\220\91\119\58", "\81\190\58\20")]=function()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\126\134\72\166\7\126\17\96\104\146\50\211", "\83\44\45\214\23\227\73\63")] then
		rebuildESP();
	end
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\208\137\118", "\64\149\218\38\222"), LUAOBFUSACTOR_DECRYPT_STR_0("\40\162\204\194\31\180\194\213\30", "\176\122\199\170"));
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\10\178\195\116\123", "\75\114\107\208\176\81")].ESP:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\205\34\61\121\252", "\21\153\75\73")]=LUAOBFUSACTOR_DECRYPT_STR_0("\32\20\67\253\160\67\73\29\72\243\160\67\26\7\13\240\179\65", "\38\105\115\45\146\210"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\23\0\122\49\3\21\7", "\83\98\118\108\22")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\174\41", "\67\41\139\25\77\197\228")] = getClosestEntity();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\235\158", "\136\136\206\174\74\54")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\182\214", "\219\68\147\230\229\51\196")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\11\166", "\123\28\46\150\128\102\39")]:FindFirstAncestorOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\40\70\25\82\23", "\21\101\41\125\55\123\233\91")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\174\254", "\82\226\139\206\147\108")];
		ignoreList[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\67\29", "\172\145\102\45\209")]] = true;
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\209\62\60", "\30\148\109\108\32\235"), LUAOBFUSACTOR_DECRYPT_STR_0("\61\64\31\80\6\66\21", "\63\116\39\113"));
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\81\197\255\85\120", "\200\88\48\167\140\112\72")].Bags:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\246\87\60\167\231", "\130\162\62\72\203")]=LUAOBFUSACTOR_DECRYPT_STR_0("\140\167\184\126\199\173\224\249\166", "\157\195\215\221\16\231\224\143"),[LUAOBFUSACTOR_DECRYPT_STR_0("\73\216\7\153\230\108", "\131\31\185\107\236")]={LUAOBFUSACTOR_DECRYPT_STR_0("\152\167\69\51", "\68\203\203\42"),LUAOBFUSACTOR_DECRYPT_STR_0("\101\86\102\205", "\185\35\55\21"),LUAOBFUSACTOR_DECRYPT_STR_0("\154\247\172\144\178\247\171", "\228\211\153\223")},[LUAOBFUSACTOR_DECRYPT_STR_0("\112\234\94\60\47\10\64", "\102\52\143\56\93\90")]=LUAOBFUSACTOR_DECRYPT_STR_0("\96\22\179\60", "\133\38\119\192\72"),[LUAOBFUSACTOR_DECRYPT_STR_0("\212\160\120\247\245\160\119\240", "\155\151\193\20")]=function(val)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\165\7\97\107\43\170\45\65\127\43\225\80", "\27\78\196\96\46")] = val;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\250\176\171\63\20", "\44\138\155\210\216\26\36")].Bags:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\143\68\173\86\248", "\157\219\45\217\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\145\168\34\218\190\159\173\51\219\190\147\188\37\208\237\240\245\25\197\251\190\158\55\198\251\249", "\158\208\221\86\181"),[LUAOBFUSACTOR_DECRYPT_STR_0("\196\68\236\10\53\179\44", "\88\128\33\138\107\64\223")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\226\243\121\121\175\122\237\202", "\142\161\146\21\21\205\27")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\251\123\44\10\252\194\34\239\114\13\19\247\203\85\170", "\172\112\154\28\99\122\153")] = state;
	if state then
		openCasesLoop();
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\233\246\167\13", "\126\171\151\192"), LUAOBFUSACTOR_DECRYPT_STR_0("\17\14\252\18\14\244\94\112\80\183", "\57\94\126\153\124\103\154"));
	else
		notify(LUAOBFUSACTOR_DECRYPT_STR_0("\53\198\78\10", "\33\119\167\41\121\182"), LUAOBFUSACTOR_DECRYPT_STR_0("\116\160\52\70\187\86\24", "\88\39\212\91\54\203\51\124"));
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\173\182\153\62\158", "\168\76\204\212\234\27\174")].Missions:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\184\13\39\72\12", "\46\236\100\83\36\105\134")]=LUAOBFUSACTOR_DECRYPT_STR_0("\10\243\137\135\148\3\56\232\199\178\132\29\54\246\139", "\111\89\154\231\224\225"),[LUAOBFUSACTOR_DECRYPT_STR_0("\222\219\10\169\46\248\223\218", "\177\157\186\102\197\76\153\188")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\251\112", "\207\194\222\64")] = rerollAll();
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\54\124\196\83\129\220\21\102", "\179\123\21\183\32\232"), LUAOBFUSACTOR_DECRYPT_STR_0("\244\38\222\50\191\14\134\59", "\98\166\67\172\93\211") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\166\135", "\130\135\131\183\181\98\42")]);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\183\57\240\101\147", "\64\163\214\91\131")].Missions:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\37\38\12\58\58", "\95\113\79\120\86")]=LUAOBFUSACTOR_DECRYPT_STR_0("\153\241\50\191\138\1\127\220\165\224\41\188\198\25\48\222\174\230\96\248\149\25\48\217\235\227\40\181\136\77\57\198\190\250\36\249", "\169\203\148\64\208\230\109\95"),[LUAOBFUSACTOR_DECRYPT_STR_0("\236\18\0\179\63\23\40", "\134\168\119\102\210\74\123\92")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\136\15\16\85\169\15\31\82", "\57\203\110\124")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\246\59\31\69\254", "\96\206\179\117\73")].GreedyTowerFind = state;
	if not state then
		return;
	end
	task.spawn(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\102\39", "\69\225\67\23")] = 0;
		while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\164\29\131\153\211", "\27\164\225\83\213\188\227\185")].GreedyTowerFind do
			local name, data, mis = findTower();
			if name then
				notify(LUAOBFUSACTOR_DECRYPT_STR_0("\188\0\149\251\213\200\9\141\235\201\140", "\167\232\111\226\158"), name .. LUAOBFUSACTOR_DECRYPT_STR_0("\4\107\111", "\209\36\68\79\120\123\61\144") .. ((mis and mis.Name) or "?"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\196\125\13\69\28", "\96\44\129\51\91")].GreedyTowerFind = false;
				break;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\74\92", "\147\117\111\108\198\147\136")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\243\146", "\52\106\214\162")] + 1;
			rerollAll();
			task.wait(0.3);
		end
	end);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\14\220\183\180\85", "\145\101\111\190\196")].Missions:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\100\196\149\224\74", "\47\48\173\225\140")]=LUAOBFUSACTOR_DECRYPT_STR_0("\119\194\150\221\57\236\98\216\149\215\45\173\81\192\193\144\122\249\8\132", "\204\35\173\225\184\75"),[LUAOBFUSACTOR_DECRYPT_STR_0("\202\65\229\140\243\170\26", "\110\142\36\131\237\134\198")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\88\65\191\252\58\122\67\184", "\88\27\32\211\144")]=function(state)
	if state then
		startTowerAutofarm();
	else
		stopTowerAutofarm();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\170\188\47\142\253", "\16\237\203\222\92\171\205\59")].Missions:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\213\184\169\132\26", "\211\129\209\221\232\127")]=LUAOBFUSACTOR_DECRYPT_STR_0("\58\95\67\33\248\93\189\79\26\92\79\43\242\93\182\71\27\66", "\38\105\47\38\68\156\125\208"),[LUAOBFUSACTOR_DECRYPT_STR_0("\168\133\163\69\233\36\152", "\72\236\224\197\36\156")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\231\170\72\134\198\170\71\129", "\234\164\203\36")]=function(state)
	if state then
		startSpeedFarm();
	else
		stopSpeedFarm();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\236\130\49\201\14", "\18\107\141\224\66\236\62\17")].Missions:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\159\166\8\251\174", "\151\203\207\124")]=LUAOBFUSACTOR_DECRYPT_STR_0("\249\21\255\9\229\144\94\210\213\15\253\22\160\143\31\214\217", "\164\180\122\145\98\128\233\126"),[LUAOBFUSACTOR_DECRYPT_STR_0("\159\1\29\204\174\8\15", "\173\219\100\123")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\151\41\64\7\17\181\43\71", "\115\212\72\44\107")]=function(state)
	if state then
		startMonkeyFarm();
	else
		stopMonkeyFarm();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\238\86\97\184\126", "\36\236\143\52\18\157\78\206")].Missions:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\100\72\44\67\250", "\159\48\33\88\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\50\77\23\249\182\248\119\56\17\65\28", "\87\127\34\121\146\211\129\87"),[LUAOBFUSACTOR_DECRYPT_STR_0("\136\224\137\224\39\63\204\127", "\20\203\129\229\140\69\94\175")]=monkeyOnce});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\199\86\37\170\178", "\130\207\166\52\86\143")].Missions:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\126\83\7\225\175", "\65\42\58\115\141\202\27")]=LUAOBFUSACTOR_DECRYPT_STR_0("\104\29\86\205\42\11\51\21\201\32\71\0\21\137\126\5\81\26\144\97\18\75\7\143\122\4\87\28", "\79\43\100\53\161"),[LUAOBFUSACTOR_DECRYPT_STR_0("\211\197\195\67\86\77\53\79", "\36\144\164\175\47\52\44\86")]=function()
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\32\213\143\90\9\48\204\155\87\31\35\223\225\47", "\31\80\111\155\196")] < 1.6) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\118\207\255\10\106\102\214\235\7\124\117\197\145\127", "\79\51\57\129\180")] = 1.9;
	elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\157\30\115\252\14\141\7\103\241\24\158\20\29\137", "\185\87\210\80\56")] < 2) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\63\128\115\88\192\106\241\47\134\119\81\221\16\150", "\53\166\112\206\56\29\153")] = 2.5;
	elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\60\120\33\208\22\77\36\105\34\218\3\86\86\6", "\79\18\115\54\106\149")] < 2.7) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\125\96\117\0\68\178\145\117\122\97\114\1\56\221", "\198\42\50\46\62\69\29\237")] = 3;
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\149\56\18\13\153\49\108\253\146\57\21\12\229\94", "\59\162\218\118\89\72\192\110")] = 1.5;
	end
	notify(LUAOBFUSACTOR_DECRYPT_STR_0("\168\241\190\84\77\24", "\97\229\158\208\63\40\97\18"), LUAOBFUSACTOR_DECRYPT_STR_0("\26\142\122\73\128\41\142\47\6", "\236\77\174\18\38") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\114\225\62\165\100\240\34\191\117\224\57\164\24\159", "\117\224\61\175")]);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\70\196\155\174\23", "\232\139\39\166")].Misc:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\215\88\71\73\114", "\162\131\49\51\37\23")]=LUAOBFUSACTOR_DECRYPT_STR_0("\126\119\234\35\57\126\95\213", "\20\63\25\158\74"),[LUAOBFUSACTOR_DECRYPT_STR_0("\94\223\90\172\106\220\60", "\217\26\186\60\205\31\176\72")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\248\112\10\224\217\112\5\231", "\140\187\17\102")]=setAntiAfk});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\138\166\82\105\219", "\33\76\235\196")].Misc:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\60\227\230\83\169", "\229\104\138\146\63\204\80\229")]=LUAOBFUSACTOR_DECRYPT_STR_0("\145\104\27\220\165\61\17\199\224\73\27\197\165\109\17\219\180", "\169\192\29\126"),[LUAOBFUSACTOR_DECRYPT_STR_0("\21\192\3\138\36\201\17", "\235\81\165\101")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\91\133\83\21\135\5\207\115", "\172\24\228\63\121\229\100")]=function(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\107\255\226\163\96\234\252\191\107\224\232\181\107\251\236\168\98\240\233\207\30", "\173\234\46\181")] = state;
	if state then
		setupRejoinQueue();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\51\233\44\102\143", "\67\191\82\139\95")].Misc:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\9\228\83\206\233", "\139\93\141\39\162\140")]=LUAOBFUSACTOR_DECRYPT_STR_0("\30\166\3\216\23\34", "\126\76\195\105\183"),[LUAOBFUSACTOR_DECRYPT_STR_0("\124\73\168\125\91\181\92\67", "\212\63\40\196\17\57")]=function()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\238\218\213\128\229\207\203\156\238\197\223\150\238\222\219\139\231\213\222\236\155", "\154\201\171\144")] then
		setupRejoinQueue();
	end
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\235\164\200\166\0\173\169\177\235\186\219\191\12\186\248\210", "\221\226\142\200\173\214\111\223")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
	end);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\79\189\34\237\94", "\200\110\46\223\81")].Misc:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\34\78\40\56\39", "\34\118\39\92\84\66\178")]=LUAOBFUSACTOR_DECRYPT_STR_0("\120\141\35\20\43\187\143\91\68\152", "\19\43\232\81\98\78\201\175"),[LUAOBFUSACTOR_DECRYPT_STR_0("\104\210\244\170\198\236\137\64", "\234\43\179\152\198\164\141")]=function()
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\95\112\219\151\188\223\147\150\95\110\200\142\176\200\194\245", "\231\197\58\28\190\231\211\173")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
	end);
end});
setAntiAfk(true);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\247\16\26\146\220", "\236\51\178\94\76\183")].GreedyHudzell_Ready = true;
notify(LUAOBFUSACTOR_DECRYPT_STR_0("\205\223\215\70\238\212\146\107\255\201\200\70\230\193", "\35\138\173\178"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\38\122\239\123\82\239\70\24", "\29\161\99\40\188\50")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\57\38\175\230\10\63\14", "\140\25\74\192\135\110\90\106"));
print(LUAOBFUSACTOR_DECRYPT_STR_0("\25\118\86\247\175\166\59\108", "\194\66\49\36\146\202"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\20\255\49\236\164\31\136\82", "\165\235\81\173\98")], LUAOBFUSACTOR_DECRYPT_STR_0("\28\140\167\50\140\205\107\151\172\55\189\253", "\132\75\229\201\86\217"));
