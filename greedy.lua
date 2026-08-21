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
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\208\233\36\239\181\208\31\195\198\158\117", "\126\177\163\187\69\134\219\167")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\228\4\225\211\20\242\30\236\200\15\232\111\149", "\156\67\173\74\165")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\164\123\23\181\40\81\53\165\76\83\236", "\38\84\215\41\118\220\70")] and LUAOBFUSACTOR_DECRYPT_STR_0("\98\23\43\28\233\81\4\39\82\179\16\49\48\23\251\84\15\98\58\235\84\12\39\30\242", "\158\48\118\66\114")) or LUAOBFUSACTOR_DECRYPT_STR_0("\140\54\21\51\119\188\187\131\49\20\44\118\169\247", "\155\203\68\112\86\19\197");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\244\2\217\127\77\215\212\3\141", "\152\38\189\86\156\32\24\133")] = LUAOBFUSACTOR_DECRYPT_STR_0("\244\67\179\86\239\13\232\9\251\69\162\67\248\78\175\83\248\77\162\74\240\25\191\95\230", "\38\156\55\199");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\84\79\11\60\70\222\124\143\85\57\120", "\35\200\29\28\72\115\20\154")] = LUAOBFUSACTOR_DECRYPT_STR_0("\17\171\197\207\158\118\123\86\187\216\204\142\35\38\29\241\214\216\194\63\54\47\170\208\235\212\45\102\45", "\84\121\223\177\191\237\76");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\127\250\131\21\98\20\254\137\119\224\142\127\0", "\161\219\54\169\192\90\48\80")] = LUAOBFUSACTOR_DECRYPT_STR_0("\65\86\20\53\90\24\79\106\77\75\19\38\70\80\4\107\78\69\79\55\72\75\14\50\72\80\5", "\69\41\34\96");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\230\249\60\71\123", "\75\220\163\183\106\98")] = (getgenv and getgenv()) or _G;
do
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\177\163\56\202\22\255\219", "\185\98\218\235\87")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\25\9\208\155\250", "\202\171\92\71\134\190")].GreedyOfficial == true) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\228\2\190\108\145", "\232\73\161\76")].GreedyOfficialTag == LUAOBFUSACTOR_DECRYPT_STR_0("\188\203\71\88\26\162\209\87\89\4\190\213\78", "\126\219\185\34\61")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\235\112\68\59\39", "\135\108\174\62\18\30\23\147")].GreedyLoader_Done == true);
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\226\2\196\11\186\118\151", "\167\214\137\74\171\120\206\83")] then
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\214\173\111\0\165\250\214\173\111\0\165\250\214\173\111\0\165\250\214\173\111\0\165\250\214\173\111\0\165\250\214\173\111\0\165\250\214\173\111\0\165\250\214\173\111\0\165\250\214\173\111\0\165\250\214\173\111\0\165\250", "\199\235\144\82\61\152"));
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\71\86\141\35\14\5\249\56\4\4\176\59\19\86\174\42\20\86\180\42\3\19\249\41\30\86\169\62\21\4\190\62\30", "\75\103\118\217"));
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\135\20\84\29\170\29\200\70\116\78\249\23\201\64\98\21\186\27\203\88\101\24\184\12\137\89\117\25\187\12\198\90\117\90\170\7\212\64\117\25", "\126\167\52\16\116\217"));
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\136\110\9\134\244\0\243\221\110\51\133\177\89\232\192\39\51\192\189\23\188\201\32\57\192\187\13\244\205\60\96\147\183\11\245\216\58\108\192\176\20\188\197\43", "\156\168\78\64\224\212\121"));
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147\90\179\248\147", "\174\103\142\197"));
		print("[Greedy] Unauthorized host — watermark (features still load)");
	end
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\9\115\17\1\127\204\115\23\106\10\9\27\168", "\152\54\72\63\88\69\62")] = LUAOBFUSACTOR_DECRYPT_STR_0("\220\208\250\76\199\158\161\19\211\214\235\89\208\221\230\73\208\222\235\80\216\138\246\69\206\139\248\93\216\205\234\93\192\193", "\60\180\164\142");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\123\60\22\11\196\60\115\27\85", "\114\56\62\101\73\71\141")] = LUAOBFUSACTOR_DECRYPT_STR_0("\176\253\207\212\171\179\148\139\175\230\201\207\246\224\213\207\247\187\131\211\168\166\252\214\189\236\223\221\245\225\206\192\162\236\215\200", "\164\216\137\187");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\207\19\128\135\204\50\237\211\3\158\227\174", "\107\178\134\81\210\198\158")] = LUAOBFUSACTOR_DECRYPT_STR_0("\48\26\150\214\185\98\65\205\193\184\61\11\134\223\162\45\10\152\195\166\52\64\154\223\176\119\2\139\196\184\57\28\155\136\166\45\15", "\202\88\110\226\166");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\58\167\194\239\252\60\161\197\227\243\59\189\194\248\239\74\210", "\170\163\111\226\151")] = LUAOBFUSACTOR_DECRYPT_STR_0("\25\36\166\40\93\109\102\94\55\160\61\75\51\48\25\37\182\34\75\59\37\95\40\171\34\1\59\38\16\52\183\42\0\59\60\16", "\73\113\80\210\88\46\87");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\56\217\2\212\132\62\219\27\228\132\105\157", "\135\225\76\173\114")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\50\249\172\160\159\184\181\12\228\187\181", "\199\122\141\216\208\204\221"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\248\62\198\61\167", "\150\205\189\112\144\24")] = (getgenv and getgenv()) or _G;
if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\161\145\122\65\217", "\112\69\228\223\44\100\232\113")].GreedyHudzell_Ready and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\58\41\229\243\45", "\230\180\127\103\179\214\28")].GreedyHudzell_JobId == game.JobId)) then
	warn("[Greedy] already loaded (same server) — skip");
	return;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\32\113\112\161\16", "\128\236\101\63\38\132\33")].GreedyHudzell_Ready = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\140\63\114\243\186", "\175\204\201\113\36\214\139")].GreedyHudzell_JobId = game.JobId;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\233\27\234\65\22", "\100\39\172\85\188")].GreedyTowerRunning = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\93\151\182\118\252", "\83\205\24\217\224")].GreedyMonkeyRunning = false;
print(LUAOBFUSACTOR_DECRYPT_STR_0("\221\226\223\56\227\193\212\0\166\199\194\50\242\139\131\115", "\93\134\165\173"));
print([[
   ____                     _           _   _           _          _ _ 
  / ___|_ __ ___  ___  __| |_   _    | | | |_   _  __| |_______ | | |
 | |  _| '__/ _ \/ _ \/ _` | | | |   | |_| | | | |/ _` |_  / _ \| | |
 | |_| | | |  __/  __/ (_| | |_| |   |  _  | |_| | (_| |/ /  __/| | |
  \____|_|  \___|\___|\__,_|\__, |   |_| |_|\__,_|\__,_/___\___||_|_|
                             |___/            v4.0.0 full
]]);
do
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\254\192\219\63\220\161\59\238", "\30\222\146\161\162\90\174\210")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\213\66\113\19\224\92\99", "\106\133\46\16"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\44\114\229\95\82\29\112", "\32\56\64\19\156\58")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\196\228\79\95\224\147\31\152", "\224\58\168\133\54\58\146")].LocalPlayer;
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\90\74\228\112\148\194\91", "\107\57\54\43\157\21\230\231")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\219\84\165", "\175\187\235\113\149\217\188")] = os.clock();
		repeat
			task.wait(0.05);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\163\128\85\230\107\61\108", "\24\92\207\225\44\131\25")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\223\185\85\30\111\88\150\232", "\29\43\179\216\44\123")].LocalPlayer;
		until TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\213\33\85\184\203\101\28", "\44\221\185\64")] or ((os.clock() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\183\13\15", "\19\97\135\40\63")]) > 8) 
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\80\50\34\42\35\235\12", "\81\206\60\83\91\79")] then
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\117\140\194\119\42\199\84\153\14\165\223\50\3\204\78\165\66\155\220\115\54\198\95", "\196\46\203\176\18\79\163\45"));
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\23\74\54\27\221\198\148\7\59\78", "\143\216\66\30\126\68\155")] = LUAOBFUSACTOR_DECRYPT_STR_0("\141\218\8\206\193\186\255\244\174\210\8\199\201\236\196\228\185\219\4\196\203\237\208\233", "\129\202\168\109\171\165\195\183");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\109\3\240\225\62\213\13\118\114\136", "\134\66\56\87\184\190\116")] = LUAOBFUSACTOR_DECRYPT_STR_0("\27\35\12\190\29\242\9\32\56\43\12\183\21\164\32\32\40\57\71\177\10\228\47", "\85\92\81\105\219\121\139\65");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\134\100\109\67\242\220\148\121\102\57\143", "\191\157\211\48\37\28")] = LUAOBFUSACTOR_DECRYPT_STR_0("\248\55\199\57\9\236\54\219\50\5\201\78", "\90\191\127\148\124");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\166\2\62\92\166\26\50\71\178\28\59\61\214", "\119\24\231\78")] = LUAOBFUSACTOR_DECRYPT_STR_0("\138\57\177\90\207\26\94\205\42\183\79\217\68\8\138\56\161\80\217\76\29\204\53\188\80\147\86\16\142\36\161\75\200\69", "\113\226\77\197\42\188\32");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\63\199\150\21\36\208\240\106", "\213\90\118\148")] = LUAOBFUSACTOR_DECRYPT_STR_0("\83\58\160\70\94\1\97\251\82\68\72\45\187\68\73\21\41\179\25\94\89\24\161\87\121\2\47\230\98", "\45\59\78\212\54");
	local function httpRequest(opts)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\83\146\206\214", "\144\112\54\227\235\230\78\205")] = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request);
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\45\30\185\128", "\59\211\72\111\156\176")] then
			return nil;
		end
		local ok, res = pcall(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\130\242\104\30", "\77\46\231\131")], opts);
		if ok then
			return res;
		end
		return nil;
	end
	local function httpRequestTimed(opts, timeout)
		timeout = timeout or 6;
		local done, result = false, nil;
		task.spawn(function()
			result = httpRequest(opts);
			done = true;
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\4\243\16", "\32\218\52\214")] = os.clock();
		while not done and ((os.clock() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\71\116\248", "\58\46\119\81\200\145\208\37")]) < timeout) do
			task.wait(0.05);
		end
		if not done then
			return nil;
		end
		return result;
	end
	local function readSession()
		local ok, raw = pcall(function()
			if (isfile and isfile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\185\4\132\150\155\31\7\169\117\252", "\86\75\236\80\204\201\221")])) then
				return readfile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\116\67\173\193\173\91\109\82\192\174", "\235\18\33\23\229\158")]);
			end
		end);
		if (ok and (type(raw) == LUAOBFUSACTOR_DECRYPT_STR_0("\67\174\211\178\94\189", "\219\48\218\161"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\112\110\93\200\10\176", "\128\132\17\28\41\187\47")] = {};
			for bit in string.gmatch(raw, LUAOBFUSACTOR_DECRYPT_STR_0("\58\12\26\7\22", "\61\97\82\102\90")) do
				table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\47\185\95\212\18\78", "\105\204\78\203\43\167\55\126")], bit);
			end
			if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\171\49\10\0\65\151", "\49\197\202\67\126\115\100\167")][1] == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\110\235\1\191\123\127\16\114\252\108\208", "\62\87\59\191\73\224\54")]) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\3\232\221\244\71\170", "\169\135\98\154")][3]) then
				return {[LUAOBFUSACTOR_DECRYPT_STR_0("\222\100\33\70\243\50\197\206", "\168\171\23\68\52\157\83")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\112\231\185\54\104\215", "\231\148\17\149\205\69\77")][2],[LUAOBFUSACTOR_DECRYPT_STR_0("\139\162\222", "\159\224\199\167\155\55")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\242\46\198\228\182\108", "\178\151\147\92")][3],[LUAOBFUSACTOR_DECRYPT_STR_0("\137\229\92\59\0\73\105\179\252\88", "\26\236\157\44\82\114\44")]=tonumber(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\47\199\79\57\107\133", "\59\74\78\181")][4]),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\194", "\211\69\177\58\58")]=tonumber(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\228\107\225\250\142\231", "\171\215\133\25\149\137")][5])};
			end
		end
		local ok2, data = pcall(function()
			if (isfile and isfile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\253\6\210\208\26\207\109\207\141\98", "\34\129\168\82\154\143\80\156")])) then
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\166\39\27\123\75\155\147\187\48\14\13\30", "\233\229\210\83\107\40\46")]:JSONDecode(readfile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\119\6\254\58\235\113\29\248\64\145", "\101\161\34\82\182")]));
			end
		end);
		if (ok2 and (type(data) == LUAOBFUSACTOR_DECRYPT_STR_0("\252\12\91\242\222", "\78\136\109\57\158\187\130\226")) and data.key) then
			return data;
		end
		if ((type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\26\215\199\123\110", "\145\94\95\153")].GreedyAuth) == LUAOBFUSACTOR_DECRYPT_STR_0("\233\204\22\217\75", "\215\157\173\116\181\46")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\145\165\196\159\100", "\186\85\212\235\146")].GreedyAuth.key) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\164\56\200\124\191", "\56\162\225\118\158\89\142")].GreedyAuth;
		end
		return nil;
	end
	local function validateKey(key)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\0\211\234\114", "\184\60\101\160\207\66")] = httpRequestTimed({[LUAOBFUSACTOR_DECRYPT_STR_0("\4\144\112", "\220\81\226\28")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\244\174\210\206\230\39\240\189\206\216\235\86\132", "\167\115\181\226\155\138")],[LUAOBFUSACTOR_DECRYPT_STR_0("\207\39\243\84\116\117", "\166\130\66\135\60\27\17")]=LUAOBFUSACTOR_DECRYPT_STR_0("\116\101\253\65", "\80\36\42\174\21"),[LUAOBFUSACTOR_DECRYPT_STR_0("\102\21\54\126\75\2\36", "\26\46\112\87")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\154\44\165\96\186\177\81\249\141\58\187\113", "\212\217\67\203\20\223\223\37")]=LUAOBFUSACTOR_DECRYPT_STR_0("\187\157\184\222\179\142\169\198\179\130\166\157\176\158\167\220", "\178\218\237\200")},[LUAOBFUSACTOR_DECRYPT_STR_0("\148\186\226\201", "\176\214\213\134")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\185\162\196\155\83\75\226\164\181\209\237\6", "\57\148\205\214\180\200\54")]:JSONEncode({[LUAOBFUSACTOR_DECRYPT_STR_0("\25\248\44", "\22\114\157\85\84")]=key,[LUAOBFUSACTOR_DECRYPT_STR_0("\209\216\22\214\83\247\165\193", "\200\164\171\115\164\61\150")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\248\2\92\134\172\177\83", "\227\222\148\99\37")].Name})}, 5);
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\87\65\179\169", "\153\83\50\50\150")] then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\94\121\125\18\118\168\89\84\121\125\35\117\170\68\81\115\119", "\45\61\22\19\124\19\203"), nil;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\19\25\244\71\32", "\217\161\114\109\149\98\16")] = nil;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\43\125\44", "\20\114\64\88\28\220")] = pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\0\198\181\189\128", "\221\81\97\178\212\152\176")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\243\9\235\41\200\245\11\242\25\200\162\77", "\122\173\135\125\155")]:JSONDecode(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\196\19\252\111", "\168\228\161\96\217\95\81")].Body or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\212\61\25\127", "\55\187\177\78\60\79")].body or "");
		end);
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\197\26\187", "\224\77\174\63\139\38\175")] or (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\64\76\47\193\17", "\78\228\33\56")]) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\218\127\176\15\128", "\229\174\30\210\99"))) then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\18\227\144\80\225\52\61\36\255\131\66\253\50\55\8\232", "\89\123\141\230\49\141\93"), nil;
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\112\226\13\85\26", "\42\147\17\150\108\112")].valid == true) then
			return true, LUAOBFUSACTOR_DECRYPT_STR_0("\25\167\33\118\227", "\136\111\198\77\31\135"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\8\179\87\248\180", "\201\98\105\199\54\221\132\119")].expires_at or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\13\151\32\71\101", "\204\217\108\227\65\98\85")].expiresAt;
		end
		return false, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\194\225\228\105\144", "\160\62\163\149\133\76")].reason or LUAOBFUSACTOR_DECRYPT_STR_0("\192\161\1\38\199\215\180\4\32\205\233\166\12\38\207\211\164", "\163\182\192\109\79"), nil;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\35\19\211\176\100", "\149\84\70\96\160")] = readSession();
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\3\30\254\125\86", "\141\88\102\109")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\86\217\99\95\109", "\161\211\51\170\16\122\93\53")].key) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\182\162\109\171", "\72\155\206\210")] = tonumber(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\127\71\29\118\22", "\83\38\26\52\110")].expires_at);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\4\34\84\119\28\98\22", "\38\56\119\71")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\234\75\197\96\6", "\54\147\143\56\182\69")].username or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\132\236\90\154\134", "\191\182\225\159\41")].username == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\30\41\76\142\149\135\123", "\162\75\114\72\53\235\231")].Name);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\53\73\231\124\9\201\108", "\98\236\92\36\130\51")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\1\28\255\21", "\80\196\121\108\218\37\200\213")] or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\107\18\58\27", "\234\96\19\98\31\43\110")] > os.time());
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\12\87\213\131\121\206\86", "\235\102\127\50\167\204\18")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\168\248\38\107\37\21\241", "\78\48\193\149\67\36")]) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\59\174\46\4\97", "\33\80\126\224\120")].GreedyAuth = {[LUAOBFUSACTOR_DECRYPT_STR_0("\231\173\26", "\60\140\200\99\164")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\241\23\53\231\215", "\194\231\148\100\70")].key,[LUAOBFUSACTOR_DECRYPT_STR_0("\83\95\196\177\248\201\75\73", "\168\38\44\161\195\150")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\240\131\111\53\250\243\70", "\118\224\156\226\22\80\136\214")].Name,[LUAOBFUSACTOR_DECRYPT_STR_0("\71\246\73\137\80\235\74\191\67\250", "\224\34\142\57")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\191\213\152\35", "\110\190\199\165\189\19\145\61")],[LUAOBFUSACTOR_DECRYPT_STR_0("\206\248", "\167\186\139\23\136\235")]=os.time()};
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\33\146\154\8\31\177\145\48\90\166\141\30\9\188\135\3\90\161\154\24\9\161\141\9\90\253\142\12\9\161\200\15\21\186\156\68", "\109\122\213\232"));
			task.spawn(function()
				local ok, reason = validateKey(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\242\177\35\171\167", "\80\142\151\194")].key);
				if (not ok and (reason ~= LUAOBFUSACTOR_DECRYPT_STR_0("\0\201\121\66\6\197\99\69\12\200\72\74\2\207\123\73\7", "\44\99\166\23")) and (reason ~= LUAOBFUSACTOR_DECRYPT_STR_0("\117\249\63\55\63\173\120\200\59\51\32\180\115\249\58\51", "\196\28\151\73\86\83"))) then
					pcall(function()
						if (delfile and isfile and isfile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\54\29\56\189\126\49\90\214\70\121", "\22\147\99\73\112\226\56\120")])) then
							delfile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\64\214\221\178\158\92\206\208\200\232", "\237\216\21\130\149")]);
						end
					end);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\107\113\105\245\152", "\62\226\46\63\63\208\169")].GreedyAuth = nil;
					warn(LUAOBFUSACTOR_DECRYPT_STR_0("\222\62\71\134\26\9\54\99\165\27\84\128\20\10\61\81\240\23\81\195\9\12\35\87\225\24\65\134\95\11\46\87\233\28\81\217", "\62\133\121\53\227\127\109\79"), reason);
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\24\51\236\211\188\231\64", "\194\112\116\82\149\182\206")]:Kick(LUAOBFUSACTOR_DECRYPT_STR_0("\18\173\85\88\201\236\24\56\164\69\28\128\170", "\110\89\200\44\120\160\130") .. tostring(reason) .. ")\n" .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\234\120\101\108\120\31\8\251", "\45\203\163\43\38\35\42\91")]);
					end);
				end
			end);
		else
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\160\242\21\194\248", "\52\178\229\188\67\231\201")].GreedyAuth = nil;
			pcall(function()
				if (delfile and isfile and isfile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\116\100\44\200\122\10\13\100\21\84", "\67\65\33\48\100\151\60")])) then
					delfile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\210\154\240\204\249\206\130\253\182\143", "\147\191\135\206\184")]);
				end
			end);
			print("[Greedy] session expired/mismatch — need key");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\45\181\210\157\3", "\210\228\72\198\161\184\51")] = nil;
		end
	end
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\108\221\38\54\159", "\174\86\41\147\112\19")].GreedyAuth or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\37\163\61\96\94", "\203\59\96\237\107\69\111\113")].GreedyAuth.key) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\24\160\238\50\251\210\32\83\252", "\183\68\118\204\129\81\144")] = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\170\53\180", "\226\110\205\16\132\107")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\216\192\242\220\68\229\228\245\208", "\33\139\163\128\185"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\95\65\142", "\190\55\56\100")].Name = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\187\40\14\32\230\225\64\166\63\27\86\179", "\147\54\207\92\126\115\131")]:GenerateGUID(false);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\54\112\45", "\30\109\81\85\29\109")].ResetOnSpawn = false;
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\118\17\230", "\156\159\17\52\214\86\190")].Parent = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\141\224\175\185\137\250\180", "\220\206\143\221"));
		end);
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\122\104\71", "\178\230\29\77\119\184\172")].Parent then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\185\79\75", "\152\149\222\106\123\23")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\42\247\90\176\207\99\166", "\213\189\70\150\35")]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\127\89\117\17\74\71\83\29\70", "\104\47\53\20"), 5);
			end);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\9\209", "\111\195\44\225\124\220")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\254\84\1\126\174", "\203\184\38\96\19\203"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\54\41", "\174\89\19\25\33")].Size = UDim2.new(0, 360, 0, 200);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\87\2", "\107\79\114\50\46\151\231")].Position = UDim2.new(0.5, -180, 0.5, -100);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\227\229", "\160\89\198\213\73\234\89\215")].BackgroundColor3 = Color3.fromRGB(12, 10, 5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\52\228", "\165\40\17\212\158")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\222\77\99", "\70\133\185\104\83")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\49\108\103\37\219\10\64\86", "\169\100\37\36\74"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\194\242", "\48\96\231\194")]).CornerRadius = UDim.new(0, 12);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\83\26\33\28\157\255", "\227\168\58\110\77\121\184\207")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\79\57\167\84\157\218\115\160\119", "\197\27\92\223\32\209\187\17"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\86\215\247\6\26\147", "\155\99\63\163")].Size = UDim2.new(1, -20, 0, 24);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\216\181\129\188\193\210", "\228\226\177\193\237\217")].Position = UDim2.new(0, 10, 0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\185\55\234\49\245\115", "\134\84\208\67")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\165\146\80\22\233\214", "\60\115\204\230")].Text = "GREEDY — KEY";
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\51\255\124\226\127\187", "\16\135\90\139")].TextColor3 = Color3.fromRGB(255, 195, 30);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\125\18\63\75\17\40", "\24\52\20\102\83\46\52")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\38\53\40\10\129\127", "\111\164\79\65\68")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\208\151\210\43\175\150", "\138\166\185\227\190\78")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\49\149", "\121\171\20\165\87\50\67")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\55\161\115\233", "\98\166\88\217\86\217")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\194\243\97\21\164\211\238", "\188\150\150\25\97\230"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\134\71\71\92", "\141\186\233\63\98\108")].Size = UDim2.new(1, -20, 0, 36);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\229\52\243\117", "\69\145\138\76\214")].Position = UDim2.new(0, 10, 0, 50);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\114\192\145\204\239", "\118\16\175\233\233\223")].BackgroundColor3 = Color3.fromRGB(18, 15, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\139\45\254\190", "\29\235\228\85\219\142\235")].PlaceholderText = LUAOBFUSACTOR_DECRYPT_STR_0("\26\252\247\229\79\118\31", "\50\93\180\218\189\23\46\71");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\171\67\9\20", "\40\190\196\59\44\36\188")].Text = "";
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\74\196\241\170", "\109\92\37\188\212\154\29")].TextColor3 = Color3.fromRGB(255, 235, 190);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\224\188\134\97", "\58\100\143\196\163\81")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\77\59\230\111", "\110\122\34\67\195\95\41\133")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\190\67\15\134", "\182\21\209\59\42")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\18\149", "\222\215\55\165\125\65")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\25\248\229\21\224\207\232\88", "\42\76\177\166\122\146\161\141"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\133\29\139\41", "\22\197\234\101\174\25")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\32\224\140", "\230\77\84\197\188\22\207\183")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\205\17\222\232\160\160\242\48\245", "\85\153\116\166\156\236\193\144"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\244\8\227", "\96\196\128\45\211\132")].Size = UDim2.new(1, -20, 0, 18);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\153\62\15", "\184\85\237\27\63\178\207\212")].Position = UDim2.new(0, 10, 0, 92);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\77\76\15", "\63\104\57\105")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\147\225\20", "\36\107\231\196")].Text = "";
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\161\231\215", "\231\61\213\194")].TextColor3 = Color3.fromRGB(220, 150, 40);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\185\120\35", "\19\105\205\93")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\28\155\209", "\95\201\104\190\225")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\223\132\158", "\174\207\171\161")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\187\93", "\183\141\158\109\147\152")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\6\163\92", "\108\76\105\134")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\223\192\169\245\236\254\209\165\238\192", "\174\139\165\209\129"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\188\167\145", "\24\195\211\130\161\166\99\16")].Size = UDim2.new(1, -20, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\12\172\124", "\118\38\99\137\76\51")].Position = UDim2.new(0, 10, 0, 120);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\41\64\66", "\64\157\70\101\114\105")].BackgroundColor3 = Color3.fromRGB(45, 36, 12);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\167\226\179", "\112\32\200\199\131")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\25\126\112\151\224\128", "\66\76\48\60\216\163\203");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\137\60\163", "\68\218\230\25\147\63\174")].TextColor3 = Color3.fromRGB(255, 235, 190);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\37\22\28", "\214\205\74\51\44")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\67\167\172", "\23\154\44\130\156")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\169\232\254", "\115\113\198\205\206\86")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\18\174", "\58\228\55\158")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\129\160\243\33\46\163\48\166", "\85\212\233\176\78\92\205"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\87\205\178", "\130\42\56\232")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\176\97\179", "\95\138\213\68\131\32")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\8\33\175\71\119\40\36\164\102\96\47\38\181", "\22\74\72\193\35"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\118\161\8", "\56\76\25\132")].MouseButton1Click:Connect(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\196\178\99\159", "\175\62\161\203\70")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\210\219\86\101", "\85\92\189\163\115")].Text or ""):gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\23\233\35\115", "\88\73\204\80"), ""):gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\107\144\91\2", "\186\78\227\112\38\73"), "");
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\82\228\16\3", "\26\156\55\157\53\51")] == "") then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\204\83\137", "\48\236\184\118\185\216")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\192\179\67\53\221\116\238\184\78", "\84\133\221\55\80\175");
				return;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\232\97\246", "\60\221\135\68\198\167")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\160\243\182", "\185\142\221\152\227\34");
			task.spawn(function()
				local ok, reason, exp = validateKey(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\192\78\191\19", "\151\56\165\55\154\35\83")]);
				if ok then
					pcall(function()
						if (makefolder and not isfolder(LUAOBFUSACTOR_DECRYPT_STR_0("\135\81\0\235\164\90\45\251\164\89\0\226\172", "\142\192\35\101"))) then
							makefolder(LUAOBFUSACTOR_DECRYPT_STR_0("\241\103\44\166\227\149\132\3\210\111\44\175\235", "\118\182\21\73\195\135\236\204"));
						end
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\53\20\69\65\93", "\157\104\92\122\32\100\109")] = table.concat({TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\147\251\226\2\10\172\140\138\133\138\154", "\203\195\198\175\170\93\71\237")],TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\71\63\204\84\3\185\126", "\156\78\43\94\181\49\113")].Name,TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\237\221\230\91", "\25\18\136\164\195\107\35")],tostring(exp or (os.time() + 86400)),tostring(os.time()),"x"}, "|");
						if writefile then
							writefile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\24\157\103\77\154\232\148\205\104\249", "\216\136\77\201\47\18\220\161")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\229\37\223\77\140", "\226\77\140\75\186\104\188")]);
						end
					end);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\235\254\9\10\232", "\47\217\174\176\95")].GreedyAuth = {[LUAOBFUSACTOR_DECRYPT_STR_0("\179\216\111", "\70\216\189\22\98\210\52\24")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\218\186\194\131", "\179\186\191\195\231")],[LUAOBFUSACTOR_DECRYPT_STR_0("\236\44\29\246\247\62\21\225", "\132\153\95\120")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\190\15\52\242\200\229\225", "\192\209\210\110\77\151\186")].Name,[LUAOBFUSACTOR_DECRYPT_STR_0("\229\27\50\224\237\193\243\60\35\253", "\164\128\99\66\137\159")]=exp,[LUAOBFUSACTOR_DECRYPT_STR_0("\20\154", "\222\96\233\137")]=os.time()};
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\189\171\16\139\248\245\189\246\247", "\144\217\211\199\127\232\147")] = true;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\40\123\120", "\36\152\79\94\72\181\37\98")]:Destroy();
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\221\2\111", "\95\183\184\39")]:Fire();
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\43\162\118", "\98\213\95\135\70\52\224")].Text = tostring(reason);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\172\140\39", "\52\158\195\169\23")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\79\146\30\91\165\30", "\235\26\220\82\20\230\85\27");
				end
			end);
		end);
		if not (((getgenv and getgenv()) or _G).GreedyLoader_Done or ((getgenv and getgenv()) or _G).GreedyOfficial) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\164\172\146", "\20\232\193\137\162")].Event:Wait();
		end
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\209\201\169\228\135\18\117\103\143", "\17\66\191\165\198\135\236\119")] then
			warn("[Greedy] key not entered — stopping");
			return;
		end
	end
end
print(LUAOBFUSACTOR_DECRYPT_STR_0("\52\136\188\22\250\236\245\236\79\164\171\10\191\239\237\197\10\239\190\18\236\251\233\213", "\177\111\207\206\115\159\136\140"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\133\17\13\209\93\76\64\217", "\63\101\233\112\116\180\47")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\243\55\236\11\253\36\208", "\86\163\91\141\114\152"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\4\102\120\41\67\10\119\118\127\3", "\90\51\107\20\19")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\186\255\151\228\46\157\241\134\234", "\93\237\144\229\143"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\243\224\21\2\69\20\226\245\29\56\82\26\228\241\30\14\3\69", "\38\117\150\144\121\107")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\31\190\254\54\36\184\239\46\40\191\221\46\34\169\239\61\40", "\90\77\219\142"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\17\47\10\73\21\108\239\7\36\124\28", "\26\134\100\65\89\44\103")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\195\246\62\16\161\227\245\57\32\161", "\196\145\131\80\67"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\163\3\26\49\230\14\165\18\59\29\250\8\185\5\13\93\184", "\136\126\208\102\104\120")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\77\153\203\81\134\92\45\68\108\185\203\81\185\91\62\84", "\49\24\234\174\35\207\50\93"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\229\248\141\127\63\247\239\158\120\15\247\184\216", "\17\108\146\157\232")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\127\212\17\232\33\155\78\209\2\228\44\173", "\200\43\163\116\141\79"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\63\58\139\164\253\237\184\115\109", "\131\223\86\93\227\208\148")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\207\76\177\190\9\188\237\66", "\213\131\37\214\214\125"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\46\41\186\241\41\57\49\140\228\52\61\44\188\228\99\123", "\129\70\75\69\223")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\114\206\255\236\108\224\84\223\192\236\110\249\79\200\246", "\143\38\171\147\137\28"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\150\173\227\48\230\198\198\139\186\246\70\178", "\180\176\226\217\147\99\131")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\251\173\59\23\224\188\61\17\218\186\42", "\103\179\217\79"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\182\17\208\83\141\230\26", "\195\42\215\124\181\33\236")] = workspace.CurrentCamera;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\85\54\39\32\234\72\9", "\152\109\57\87\94\69")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\219\11\186\187\192\71\237\169", "\200\153\183\106\195\222\178\52")].LocalPlayer;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\208\183\16\102\120\27\207\173\120\25", "\58\82\131\232\93\41")] = false;
pcall(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\100\239\56\114\29\170\123\245\80\13", "\95\227\55\176\117\61")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\109\38\89\130\22\110\54\95\152\29\108\53\66\168\29\59\115", "\203\120\30\67\43")].TouchEnabled and (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\54\72\253\240\255\53\88\251\234\244\55\91\230\218\244\96\29", "\185\145\69\45\143")].KeyboardEnabled or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\12\28\180\245\132\15\12\178\239\143\13\15\175\223\143\90\73", "\188\234\127\121\198")].GyroscopeEnabled);
end);
print(LUAOBFUSACTOR_DECRYPT_STR_0("\3\21\1\134\61\54\10\190\120\49\28\145\61\114\31\140\57\54\26\141\63\124\93\205", "\227\88\82\115"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\48\157\136\61\90\103\90\234", "\19\35\127\218\199\98")] = LUAOBFUSACTOR_DECRYPT_STR_0("\14\249\18\227\15\232\15\246\21\255\80\173\83\170\90\178\69\170\90\178\76\175\94\178\78\174\89\183", "\130\124\155\106");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\234\216\129\134\196\67\150\241\142\166", "\223\181\171\150\207\195\150\28")] = LUAOBFUSACTOR_DECRYPT_STR_0("\94\56\251\175\26\95\63\247\167\13\22\117\172\255\91\20\110\177\249\91\26\98\183\252\88\27\108\178", "\105\44\90\131\206");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\232\183\180\13\123\175", "\94\159\128\210\217\104")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\114\248\5\180\88\109\246\111\94\253", "\26\48\153\102\223\63\31\153")]=Color3.fromRGB(12, 10, 5),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\73\233\246\0\65\255", "\147\98\32\141")]=Color3.fromRGB(18, 15, 6),[LUAOBFUSACTOR_DECRYPT_STR_0("\44\74\247\198\3\116\74\10", "\43\120\35\131\170\102\54")]=Color3.fromRGB(22, 18, 8),[LUAOBFUSACTOR_DECRYPT_STR_0("\118\19\147\162\170\190", "\228\52\102\231\214\197\208")]=Color3.fromRGB(45, 36, 12),[LUAOBFUSACTOR_DECRYPT_STR_0("\63\227\118\207\228\159", "\182\126\128\21\170\138\235\121")]=Color3.fromRGB(255, 195, 30),[LUAOBFUSACTOR_DECRYPT_STR_0("\191\223\45\242", "\102\235\186\85\134\230\115\80")]=Color3.fromRGB(255, 235, 190),[LUAOBFUSACTOR_DECRYPT_STR_0("\99\9\38\75\86\221\47", "\66\55\108\94\63\18\180")]=Color3.fromRGB(190, 170, 120),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\152\134\52\34\74\7", "\57\116\237\229\87\71")]=Color3.fromRGB(80, 170, 70),[LUAOBFUSACTOR_DECRYPT_STR_0("\142\176\227\224\114\252", "\39\202\209\141\135\23\142")]=Color3.fromRGB(190, 45, 45),[LUAOBFUSACTOR_DECRYPT_STR_0("\204\39\27\5\57\253", "\152\159\83\105\106\82")]=Color3.fromRGB(90, 70, 20)};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\231\99\219\253\101\190\229\126\222\230\110\178\131\1", "\60\225\166\49\146\169")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\26\16\44\37\12\10\32\16", "\103\79\126\79\74\97")]=Color3.fromRGB(0, 255, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\136\126\193\118", "\122\218\31\179\19\62")]=Color3.fromRGB(127, 0, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\150\198\196\194", "\37\211\182\173\161\169\193")]=Color3.fromRGB(0, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\219\63\74\220\38\127\184\229\35", "\217\151\90\45\185\72\27")]=Color3.fromRGB(255, 244, 119),[LUAOBFUSACTOR_DECRYPT_STR_0("\246\112\243\27\91\194\104\226", "\54\163\28\135\114")]=Color3.fromRGB(255, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\11\212\80\143\65\113", "\31\72\187\61\226\46")]=Color3.fromRGB(180, 150, 100)};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\39\113\251\115\71\27\236\52\103\247\117\59\116", "\68\163\102\35\178\39\30")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\157\127\215\202\12\187", "\113\222\16\186\167\99\213\227"),LUAOBFUSACTOR_DECRYPT_STR_0("\27\0\248\249\35\3\244\248", "\150\78\110\155"),LUAOBFUSACTOR_DECRYPT_STR_0("\183\196\53\228", "\32\229\165\71\129\196\126\223"),LUAOBFUSACTOR_DECRYPT_STR_0("\230\153\205\130", "\181\163\233\164\225\225"),LUAOBFUSACTOR_DECRYPT_STR_0("\124\142\57\114\94\143\63\101\73", "\23\48\235\94"),LUAOBFUSACTOR_DECRYPT_STR_0("\73\214\204\84\90\50\198\121", "\178\28\186\184\61\55\83")};
local function isUUIDName(name)
	if (type(name) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\215\217\85\53\252\9", "\149\164\173\39\92\146\110")) then
		return false;
	end
	return name:match(LUAOBFUSACTOR_DECRYPT_STR_0("\205\98\8\90\2\94\235\98\8\90\2\94\235\98\8\90\2\94\190\98\8\90\2\94\235\98\8\90\87\94\235\98\8\90\2\94\235\98\93\90\2\94\235\98\8\90\2\94\190\98\8\90\2\94\235\98\8\90\2\94\235\98\8\90\2\94\235\98\8\90\2\94\235\99", "\123\147\71\112\127\122")) ~= nil;
end
local function isRedish(color)
	return (color.R > 0.7) and (color.G < 0.35) and (color.B < 0.35);
end
local function getMainPart(inst)
	if not inst then
		return nil;
	end
	if (inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\238\204\145\116\118\205\223\150", "\38\172\173\226\17")) and (inst.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\96\16\37\225", "\143\45\113\76"))) then
		return inst;
	end
	if inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\149\183\24\57\180", "\92\216\216\124")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\51\165\78\184\11", "\157\59\82\204\32")] = inst:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\21\63\234\244", "\209\88\94\131\154\137\138\179"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\160\205\114\91\115", "\66\72\193\164\28\126\67\81")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\45\161\86\99\38", "\22\135\76\200\56\70")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\175\49\235\33\109\224\159\36", "\129\237\80\152\68\61"))) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\169\13\253\89\71", "\56\49\200\100\147\124\119")];
		end
		return inst.PrimaryPart or inst:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\238\63\172\245\252\63\173\228", "\144\172\94\223"));
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\0\166\66\40\74\242", "\39\68\111\194")] = inst.Parent;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\169\227\194\117\242\134", "\215\182\198\135\167\25")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\72\227\70\200\25", "\40\237\41\138")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\123\254\253\70\130\36", "\42\167\20\154\152")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\103\255\171\76", "\65\42\158\194\34\17"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\38\91\2\104\189", "\142\122\71\50\108\77\141\123")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\163\246\22\126\69", "\91\117\194\159\120")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\56\28\45\29\5\240\54\14", "\68\122\125\94\120\85\145"))) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\29\198\80\141\137", "\218\119\124\175\62\168\185")];
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\255\76\193\169\181\24", "\164\197\144\40")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\174\255\174\142\209", "\214\227\144\202\235\189")) and isUUIDName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\170\131\126\28\246\3", "\92\141\197\231\27\112\211\51")].Name)) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\240\142\166\221\163\175", "\177\134\159\234\195")].PrimaryPart or inst;
		end
	end
	if inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\159\234\44\165\249\188\249\43", "\169\221\139\95\192")) then
		return inst;
	end
	return nil;
end
local function getBagModel(inst)
	if not inst then
		return nil;
	end
	if (inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\243\132\123\58\46", "\70\190\235\31\95\66")) and isUUIDName(inst.Name)) then
		return inst;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\167\74", "\133\218\130\122\134")] = inst.Parent;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\186\179", "\88\92\159\131\164\188\195")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\107\239", "\189\224\78\223\43\183\139")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\3\243\142\19\205", "\161\78\156\234\118")) and isUUIDName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\242\153", "\188\199\215\169")].Name)) then
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\76\15", "\136\156\105\63\27")];
	end
	return nil;
end
local function detectRarity(part, data)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\131\117\59\9\188\120\38\15\201\41", "\84\123\236\25")] = getMainPart(part);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\132\174\18\160\240\160", "\213\144\235\202\119\204")] = getBagModel(part) or (part and isUUIDName(part.Name) and part);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\23\210\37\58\19\76\49\12\155\122", "\45\67\120\190\74\72\67")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\45\233\160\245\205\190", "\137\64\66\141\197\153\232\142")] and isUUIDName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\223\38\163\132\70\128", "\232\99\176\66\198")].Name) and isRedish(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\46\36\9\105\189\248\62\248\100\120", "\76\140\65\72\102\27\237\153")].Color)) then
		return LUAOBFUSACTOR_DECRYPT_STR_0("\127\214\2\219\218\0\170\79", "\222\42\186\118\178\183\97");
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\227\72\133\79\220\69\152\73\169\20", "\234\61\140\36")] and part and isUUIDName(part.Name) and isRedish(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\210\182\125\29\17\220\168\102\74\113", "\111\65\189\218\18")].Color)) then
		return LUAOBFUSACTOR_DECRYPT_STR_0("\118\71\15\60\6\93\187\70", "\207\35\43\123\85\107\60");
	end
	if data then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\239\240", "\25\16\202\192\138")] = data.rarity or data.Rarity or data.tier or data.Tier;
		if (typeof(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\142\253", "\148\157\171\205\130\201")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\48\192\102\32\223\241", "\150\67\180\20\73\177")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\23\13\8\221", "\45\237\120\122")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\173\242", "\76\183\136\194")]:lower();
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\233\242\125\0", "\116\26\134\133\88\48\47")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\11\205\180\237\176", "\18\126\161\192\132\221")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\106\36\186\13\91\94\60\171", "\54\63\72\206\100");
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\86\82\63\181", "\27\168\57\37\26\133")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\33\175\123\173\217\41", "\183\77\202\28\200")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\59\54\142\13\25\55\136\26\14", "\104\119\83\233");
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\247\48\103\19", "\35\149\152\71\66")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\28\248\75\179", "\90\121\136\34\208")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\226\30\92\29", "\126\167\110\53");
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\31\57\189\140", "\95\93\112\78\152\188")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\211\244\151\16", "\178\161\149\229\117\132\222")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\186\218\207\169", "\67\232\187\189\204\193\118\198");
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\33\162\101\107", "\143\235\78\213\64\91\98")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\152\70\135\230\125\187\130\70", "\214\237\40\228\137\16")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\176\237\236\214\14\171\138\237", "\198\229\131\143\185\99");
			end
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\131\191\54\1", "\19\49\236\200")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\253\56\251\186\235\180", "\218\158\87\150\215\132")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\216\17\212\239\57\44", "\173\155\126\185\130\86\66");
			end
		end
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\169\182\200\154\220\228\180\174\130\216", "\140\133\198\218\167\232")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\107\228", "\228\213\78\212\29")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\67\186\10\249\183\77\164\17\174\215", "\139\231\44\214\101")].Color;
		local best, bestDist = LUAOBFUSACTOR_DECRYPT_STR_0("\250\224\11\83\31\191", "\118\185\143\102\62\112\209\81"), 0.12;
		for name, col in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\81\27\207\145\44\35\27\115\92\6\212\150\80\76", "\88\60\16\73\134\197\117\124")]) do
			if ((name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\115\229\245\197\78\94", "\33\48\138\152\168")) and (name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\71\26\36\88\204\54\102\19", "\87\18\118\80\49\161"))) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\91\138", "\208\44\126\186\192")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\95\244", "\46\151\122\196\166\116\156\169")].R - col.R) ^ 2) + ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\168\22", "\155\133\141\38\122")].G - col.G) ^ 2) + ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\111\252", "\197\69\74\204\33\47\31")].B - col.B) ^ 2);
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\10\10", "\231\144\47\58")] < bestDist) then
					bestDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\157\138", "\89\210\184\186\21\120\93\175")];
					best = name;
				end
			end
		end
		return best;
	end
	return LUAOBFUSACTOR_DECRYPT_STR_0("\146\92\113\216\118\52", "\90\209\51\28\181\25");
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\90\121\201\250\128", "\223\176\27\55\142")] = LUAOBFUSACTOR_DECRYPT_STR_0("\1\181\201\185\45\168\198", "\213\68\219\174");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\165\115", "\31\107\128\67\135\74\165\95")] = {};
local function setLanguage(lang)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\201\210\106\4\225", "\209\184\136\156\45\33")] = lang;
	if (lang == LUAOBFUSACTOR_DECRYPT_STR_0("\53\221\102\27\177\6\198", "\216\103\168\21\104")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\232\19", "\196\24\205\35")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\7\133\229\9\60\134\226\18\39\132\237", "\102\78\235\131")]="Информация",[LUAOBFUSACTOR_DECRYPT_STR_0("\215\33\34\65\74\60\185\32", "\84\154\78\84\36\39\89\215")]="Движение",[LUAOBFUSACTOR_DECRYPT_STR_0("\201\228\90\93\21\242\243\66", "\101\157\129\54\56")]="Телепорт",[LUAOBFUSACTOR_DECRYPT_STR_0("\60\188\158\164\37\120\15\164", "\25\125\201\234\203\67")]="Автофарм",[LUAOBFUSACTOR_DECRYPT_STR_0("\92\199\40", "\115\25\148\120\99\116\71")]=LUAOBFUSACTOR_DECRYPT_STR_0("\41\14\137", "\33\108\93\217\68"),[LUAOBFUSACTOR_DECRYPT_STR_0("\239\67\164\160\222\88", "\205\187\43\193")]="Темы",[LUAOBFUSACTOR_DECRYPT_STR_0("\211\123\22\220", "\191\158\18\101")]="Разное",[LUAOBFUSACTOR_DECRYPT_STR_0("\246\198\147\163\166\203\196\148", "\207\165\163\231\215")]="Настройки",[LUAOBFUSACTOR_DECRYPT_STR_0("\241\248\245\93\23\96\195\252\253", "\16\166\153\153\54\68")]="Скорость ходьбы",[LUAOBFUSACTOR_DECRYPT_STR_0("\248\166\205\86\4\46\238\215\161", "\153\178\211\160\38\84\65")]="Сила прыжка",[LUAOBFUSACTOR_DECRYPT_STR_0("\177\27\95\46\134\38\79\39\150", "\75\226\107\58")]="Множитель скорости",[LUAOBFUSACTOR_DECRYPT_STR_0("\114\203\28\106\60\215\193\76", "\173\56\190\113\26\113\162")]="Множитель прыжка",[LUAOBFUSACTOR_DECRYPT_STR_0("\229\209\11\4\251\199", "\151\171\190\77\101")]="Без урона от падения",[LUAOBFUSACTOR_DECRYPT_STR_0("\235\32\219\165\241\109", "\107\165\79\152\201\152\29")]=LUAOBFUSACTOR_DECRYPT_STR_0("\121\65\203\199\93\111", "\31\55\46\136\171\52"),[LUAOBFUSACTOR_DECRYPT_STR_0("\243\39\196\210\221\49", "\148\177\72\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\132\185\79\147\128\186\78", "\179\198\214\55"),[LUAOBFUSACTOR_DECRYPT_STR_0("\196\60\92\115\68\193\245\31\102", "\179\144\108\18\22\37")]="К ближайшему кешу",[LUAOBFUSACTOR_DECRYPT_STR_0("\242\147\43\133\206\223\166\9", "\175\166\195\123\233")]="К игроку",[LUAOBFUSACTOR_DECRYPT_STR_0("\220\210\92\94\254\219\205\72\91", "\144\143\162\61\41")]="Тур по спавнам",[LUAOBFUSACTOR_DECRYPT_STR_0("\199\214\9\114\115\131\52\229\192", "\83\128\179\125\48\18\231")]="Все бейджи",[LUAOBFUSACTOR_DECRYPT_STR_0("\110\178\225\203\66\12\117\184\227", "\126\61\215\147\189\39")]="Смена сервера",[LUAOBFUSACTOR_DECRYPT_STR_0("\89\234\9\74\126\254\15\72\76\240\26\66\116\250", "\37\24\159\125")]="Автофарм",[LUAOBFUSACTOR_DECRYPT_STR_0("\236\167\103\75\219\168\97", "\34\186\198\21")]="Вариант",[LUAOBFUSACTOR_DECRYPT_STR_0("\222\9\215\80\239\247\12\192", "\162\152\104\165\61")]="Режим фарма",[LUAOBFUSACTOR_DECRYPT_STR_0("\254\63\183\120\116", "\133\173\79\210\29\16")]="Скорость",[LUAOBFUSACTOR_DECRYPT_STR_0("\174\125\224\46\159\125", "\75\237\28\141")]="Камера",[LUAOBFUSACTOR_DECRYPT_STR_0("\253\81\216\184\13\26\233", "\129\188\63\172\209\79\123\135")]="Анти-бан",[LUAOBFUSACTOR_DECRYPT_STR_0("\101\215\214\238\65\231\238\200\83", "\173\32\132\134")]="ESP Кеши",[LUAOBFUSACTOR_DECRYPT_STR_0("\107\40\56\205\175\54\222", "\173\46\123\104\143\206\81")]="ESP Баги",[LUAOBFUSACTOR_DECRYPT_STR_0("\145\46\18\186\73\130\24\177\15\49", "\97\212\125\66\234\37\227")]="ESP Игроки",[LUAOBFUSACTOR_DECRYPT_STR_0("\163\228\184\58\12\143\205\179\52\12\143\240\162", "\126\234\131\214\85")]="Игнор ближайшего",[LUAOBFUSACTOR_DECRYPT_STR_0("\181\192\76\79\74\182\208\67\85\70\138", "\47\228\181\41\58")]="Очередь при реджойне",[LUAOBFUSACTOR_DECRYPT_STR_0("\145\249\219\51\12\63\20", "\127\198\156\185\91\99\80")]=LUAOBFUSACTOR_DECRYPT_STR_0("\209\19\223\243\168\25\61\158\194\31\206\248\168\4\50", "\190\149\122\172\144\199\107\89"),[LUAOBFUSACTOR_DECRYPT_STR_0("\23\19\244\236\231\16\4\246", "\158\82\101\145\158")]="Каждый баг",[LUAOBFUSACTOR_DECRYPT_STR_0("\85\232\7\4\93\33\174", "\36\16\158\98\118")]="Каждые 10 багов",[LUAOBFUSACTOR_DECRYPT_STR_0("\229\0\198\233\65\185\119\181", "\133\160\118\163\155\56\136\71")]="Каждые 100 багов",[LUAOBFUSACTOR_DECRYPT_STR_0("\217\172\66\230\185\15", "\213\150\194\17\146\214\127")]="При остановке",[LUAOBFUSACTOR_DECRYPT_STR_0("\47\172\183\192\113\161\160\62\20\166\175", "\86\123\201\196\180\38\196\194")]="Тест вебхука",[LUAOBFUSACTOR_DECRYPT_STR_0("\197\237\211\160\254\230", "\207\151\136\185")]="Реджойн",[LUAOBFUSACTOR_DECRYPT_STR_0("\154\134\36\141\117\124", "\17\200\227\72\226\20\24")]="Перезагрузка персонажа",[LUAOBFUSACTOR_DECRYPT_STR_0("\145\79\15\222\232\215\196", "\159\208\33\123\183\169\145\143")]="Анти-AFK",[LUAOBFUSACTOR_DECRYPT_STR_0("\194\95\42\48\223\85\60\51", "\86\146\58\88")]="Режим производительности",[LUAOBFUSACTOR_DECRYPT_STR_0("\106\218\249\197\186\218\34\251\76\204", "\154\56\191\138\160\206\137\86")]="Сброс статистики",[LUAOBFUSACTOR_DECRYPT_STR_0("\163\65\229\136\110\46\178\216\135\77\230", "\172\230\57\149\231\28\90\225")]="Экспорт статистики",[LUAOBFUSACTOR_DECRYPT_STR_0("\33\165\150\203\12\210\17\169\137\192\44", "\187\98\202\230\178\72")]="Скопировать Discord",[LUAOBFUSACTOR_DECRYPT_STR_0("\18\228\168\53\73\53\209\168\49\83\36\243", "\42\65\129\196\80")]="Выбор игрока",[LUAOBFUSACTOR_DECRYPT_STR_0("\48\75\79\211\3\30\36\231\14\94\88\200", "\142\98\42\61\186\119\103\98")]="Фильтр редкости",[LUAOBFUSACTOR_DECRYPT_STR_0("\25\179\14", "\104\88\223\98")]="Все"};
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\178\178", "\141\36\151\130\174\98")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\173\116\196\2\150\119\195\25\141\117\204", "\109\228\26\162")]=LUAOBFUSACTOR_DECRYPT_STR_0("\119\235\251\119\242\235\95\241\244\119\238", "\134\62\133\157\24\128"),[LUAOBFUSACTOR_DECRYPT_STR_0("\42\170\12\220\34\180\216\19", "\182\103\197\122\185\79\209")]=LUAOBFUSACTOR_DECRYPT_STR_0("\222\136\247\114\13\77\253\147", "\40\147\231\129\23\96"),[LUAOBFUSACTOR_DECRYPT_STR_0("\65\253\128\64\171\163\206\97", "\188\21\152\236\37\219\204")]=LUAOBFUSACTOR_DECRYPT_STR_0("\116\236\59\9\80\230\37\24", "\108\32\137\87"),[LUAOBFUSACTOR_DECRYPT_STR_0("\139\253\20\169\41\248\89\84", "\57\202\136\96\198\79\153\43")]=LUAOBFUSACTOR_DECRYPT_STR_0("\138\54\190\168\139\166\234\166", "\152\203\67\202\199\237\199"),[LUAOBFUSACTOR_DECRYPT_STR_0("\223\112\144", "\134\154\35\192\111\127\21\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\157\21\57", "\178\216\70\105\106\64"),[LUAOBFUSACTOR_DECRYPT_STR_0("\11\35\127\251\204\198", "\224\95\75\26\150\169\181\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\63\210\221\37\65\191", "\22\107\186\184\72\36\204"),[LUAOBFUSACTOR_DECRYPT_STR_0("\202\180\55\77", "\110\135\221\68\46")]=LUAOBFUSACTOR_DECRYPT_STR_0("\206\63\31\232", "\91\131\86\108\139\174\211"),[LUAOBFUSACTOR_DECRYPT_STR_0("\200\46\172\3\84\245\44\171", "\61\155\75\216\119")]=LUAOBFUSACTOR_DECRYPT_STR_0("\55\174\166\40\81\7\218\23", "\189\100\203\210\92\56\105"),[LUAOBFUSACTOR_DECRYPT_STR_0("\24\80\241\35\28\65\248\45\43", "\72\79\49\157")]=LUAOBFUSACTOR_DECRYPT_STR_0("\191\177\61\183\200\131\33\185\141\180", "\220\232\208\81"),[LUAOBFUSACTOR_DECRYPT_STR_0("\223\171\232\32\28\85\182\240\172", "\193\149\222\133\80\76\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\236\72\66\194\134\109\64\197\195\79", "\178\166\61\47"),[LUAOBFUSACTOR_DECRYPT_STR_0("\200\90\237\127\206\19\238\70\252", "\94\155\42\136\26\170")]=LUAOBFUSACTOR_DECRYPT_STR_0("\183\47\35\176\128\127\11\160\136\43\47\165\136\54\35\167", "\213\228\95\70"),[LUAOBFUSACTOR_DECRYPT_STR_0("\0\174\207\148\90\63\183\214", "\23\74\219\162\228")]=LUAOBFUSACTOR_DECRYPT_STR_0("\19\243\75\191\123\20\243\74\187\50\41\234\79\170\41", "\91\89\134\38\207"),[LUAOBFUSACTOR_DECRYPT_STR_0("\106\225\238\55\31\220", "\71\36\142\168\86\115\176")]=LUAOBFUSACTOR_DECRYPT_STR_0("\241\174\50\153\2\178\90\9\251\160\127\190\4\187", "\41\191\193\18\223\99\222\54"),[LUAOBFUSACTOR_DECRYPT_STR_0("\133\41\228\38\163\187", "\202\203\70\167\74")]=LUAOBFUSACTOR_DECRYPT_STR_0("\2\14\255\63\120\60", "\17\76\97\188\83"),[LUAOBFUSACTOR_DECRYPT_STR_0("\167\40\193\17\60\154", "\195\229\71\185\87\80\227\43")]=LUAOBFUSACTOR_DECRYPT_STR_0("\194\243\24\16\201\236\229", "\143\128\156\96\48"),[LUAOBFUSACTOR_DECRYPT_STR_0("\140\225\222\23\22\170\212\227\6", "\119\216\177\144\114")]=LUAOBFUSACTOR_DECRYPT_STR_0("\253\44\245\71\217\38\235\86\137\61\246\2\231\44\248\80\204\58\237\2\234\40\250\74\204", "\34\169\73\153"),[LUAOBFUSACTOR_DECRYPT_STR_0("\158\220\59\135\171\245\14\153", "\235\202\140\107")]=LUAOBFUSACTOR_DECRYPT_STR_0("\56\113\56\173\249\40\229\209\76\96\59\232\217\43\246\220\9\102", "\165\108\20\84\200\137\71\151"),[LUAOBFUSACTOR_DECRYPT_STR_0("\73\164\42\159\116\128\36\157\104", "\232\26\212\75")]=LUAOBFUSACTOR_DECRYPT_STR_0("\4\89\115\255\249\119\125\125\253\229", "\151\87\41\18\136"),[LUAOBFUSACTOR_DECRYPT_STR_0("\124\170\222\242\255\95\168\207\195", "\158\59\207\170\176")]=LUAOBFUSACTOR_DECRYPT_STR_0("\104\91\39\9\173\67\82\115\107\141\75\89\54\90", "\236\47\62\83\41"),[LUAOBFUSACTOR_DECRYPT_STR_0("\201\172\50\45\175\144\210\166\48", "\226\154\201\64\91\202")]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\76\15\14\79\174\129\97\18\8", "\220\161\41\125\120\42"),[LUAOBFUSACTOR_DECRYPT_STR_0("\157\100\180\1\186\112\178\3\136\126\167\9\176\116", "\110\220\17\192")]=LUAOBFUSACTOR_DECRYPT_STR_0("\85\108\32\21\237\54\227\170", "\199\20\25\84\122\139\87\145"),[LUAOBFUSACTOR_DECRYPT_STR_0("\113\8\207\167\26\228\83", "\138\39\105\189\206\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\41\6\155\36\242\247\219", "\159\127\103\233\77\147\153\175"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\241\246\167\109\196\3\245", "\171\103\144\132\202\32")]=LUAOBFUSACTOR_DECRYPT_STR_0("\54\46\251\1\80\2\230\8\21", "\108\112\79\137"),[LUAOBFUSACTOR_DECRYPT_STR_0("\12\210\113\45\169", "\85\95\162\20\72\205\97\137")]=LUAOBFUSACTOR_DECRYPT_STR_0("\196\237\47\217\9", "\173\151\157\74\188\109\152"),[LUAOBFUSACTOR_DECRYPT_STR_0("\7\9\53\216\206\85", "\147\68\104\88\189\188\52\181")]=LUAOBFUSACTOR_DECRYPT_STR_0("\57\137\134\213\8\137\203\253\21\140\142", "\176\122\232\235"),[LUAOBFUSACTOR_DECRYPT_STR_0("\161\123\46\70\204\129\123", "\142\224\21\90\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\85\218\51\95\233\169\132\122\148\10\89\160\142", "\229\20\180\71\54\196\235"),[LUAOBFUSACTOR_DECRYPT_STR_0("\12\77\241\192\244\169\136\44\109", "\224\73\30\161\131\149\202")]=LUAOBFUSACTOR_DECRYPT_STR_0("\212\214\193\16\210\228\242\88\244\246", "\48\145\133\145"),[LUAOBFUSACTOR_DECRYPT_STR_0("\127\127\133\204\208\43\73", "\76\58\44\213\142\177")]=LUAOBFUSACTOR_DECRYPT_STR_0("\238\23\34\109\90\202\35\1", "\24\171\68\114\77"),[LUAOBFUSACTOR_DECRYPT_STR_0("\202\46\96\98\139\223\29\168\253\14", "\205\143\125\48\50\231\190\100")]=LUAOBFUSACTOR_DECRYPT_STR_0("\228\148\36\69\209\239\222\187\196\181\7", "\194\161\199\116\101\129\131\191"),[LUAOBFUSACTOR_DECRYPT_STR_0("\197\35\198\167\229\167\194\33\201\186\242\177\248", "\194\140\68\168\200\151")]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\252\219\42\231\71\187\219\32\244\80\254\198\49\181\77\249\223\32\246\86", "\149\34\155\181\69"),[LUAOBFUSACTOR_DECRYPT_STR_0("\50\232\208\239\6\207\208\240\12\244\219", "\154\99\157\181")]=LUAOBFUSACTOR_DECRYPT_STR_0("\188\26\233\181\233\205\0\226\224\222\136\5\227\169\226", "\140\237\111\140\192"),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\28\127\16\9\22\118", "\120\102\121\29")]=LUAOBFUSACTOR_DECRYPT_STR_0("\136\234\170\56\163\241\189\123\155\230\187\51\163\236\178", "\91\204\131\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\235\233\80\198\170\255\255\201", "\158\174\159\53\180\211\189")]=LUAOBFUSACTOR_DECRYPT_STR_0("\125\243\173\216\97\176\64\228\173\223\118\178", "\213\50\157\141\189\23"),[LUAOBFUSACTOR_DECRYPT_STR_0("\219\48\129\178\107\245\174", "\196\158\70\228\192\18")]=LUAOBFUSACTOR_DECRYPT_STR_0("\111\73\20\92\192\10\14\65\14\219\75\88\2", "\185\42\63\113\46"),[LUAOBFUSACTOR_DECRYPT_STR_0("\241\203\36\43\2\133\141\113", "\123\180\189\65\89")]=LUAOBFUSACTOR_DECRYPT_STR_0("\231\154\245\246\144\130\221\160\180\201\192\141\247\247", "\233\162\236\144\132"),[LUAOBFUSACTOR_DECRYPT_STR_0("\157\202\205\14\182\230", "\63\210\164\158\122\217\150")]=LUAOBFUSACTOR_DECRYPT_STR_0("\28\197\182\237\92\236\60\205\247\254\68\184\32\223\249\252", "\152\83\171\150\140\41"),[LUAOBFUSACTOR_DECRYPT_STR_0("\182\224\144\39\227\30\10\138\234\140\56", "\104\226\133\227\83\180\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\55\14\48\68\67\60\38\82\11\4\44\91", "\48\99\107\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\236\163\119\223\36\117", "\27\190\198\29\176\77")]=LUAOBFUSACTOR_DECRYPT_STR_0("\221\78\247\59\160\64", "\46\143\43\157\84\201"),[LUAOBFUSACTOR_DECRYPT_STR_0("\101\125\90\205\94\23", "\168\55\24\54\162\63\115")]=LUAOBFUSACTOR_DECRYPT_STR_0("\37\255\44\143\211\202\87\217\40\129\192\207\20\238\37\146", "\174\119\154\64\224\178"),[LUAOBFUSACTOR_DECRYPT_STR_0("\11\112\209\114\36\129\49", "\132\74\30\165\27\101\199\122")]=LUAOBFUSACTOR_DECRYPT_STR_0("\14\233\235\174\234\148\146\4", "\212\79\135\159\199\199\213"),[LUAOBFUSACTOR_DECRYPT_STR_0("\73\165\167\65\113\216\28\124", "\120\25\192\213\39\60\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\40\69\45\78\23\82\50\73\22\67\58\8\53\79\59\77", "\40\120\32\95"),[LUAOBFUSACTOR_DECRYPT_STR_0("\8\174\42\127\187\44\46\170\45\105", "\127\90\203\89\26\207")]=LUAOBFUSACTOR_DECRYPT_STR_0("\239\48\188\206\29\189\238\33\174\223\26", "\157\189\85\207\171\105"),[LUAOBFUSACTOR_DECRYPT_STR_0("\227\185\200\186\17\210\146\204\180\23\213", "\99\166\193\184\213")]=LUAOBFUSACTOR_DECRYPT_STR_0("\243\175\144\180\30\158\150\132\148\186\24\153", "\234\182\215\224\219\108"),[LUAOBFUSACTOR_DECRYPT_STR_0("\227\142\171\44\228\136\168\54\207\147\191", "\85\160\225\219")]=LUAOBFUSACTOR_DECRYPT_STR_0("\127\10\147\208\118\248\66\79\6\140\219\50\156\103\85\11\136", "\43\60\101\227\169\86\188"),[LUAOBFUSACTOR_DECRYPT_STR_0("\67\205\221\186\89\216\137\59\113\209\212\173", "\87\16\168\177\223\58\172\217")]=LUAOBFUSACTOR_DECRYPT_STR_0("\7\200\85\216\56\32\141\105\209\58\45\200\75", "\91\84\173\57\189"),[LUAOBFUSACTOR_DECRYPT_STR_0("\34\184\30\245\180\207\54\176\0\232\165\196", "\182\112\217\108\156\192")]=LUAOBFUSACTOR_DECRYPT_STR_0("\152\9\90\230\159\179\72\110\230\135\190\13\90", "\235\202\104\40\143"),[LUAOBFUSACTOR_DECRYPT_STR_0("\44\135\23", "\217\109\235\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\6\133\114", "\221\71\233\30\54\16\176\173")};
	end
end
setLanguage(LUAOBFUSACTOR_DECRYPT_STR_0("\17\242\89\179\61\239\86", "\223\84\156\62"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\207\221\240\152\25\255\208\199\152\230", "\91\182\156\130\189\215")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\96\169\71\87\125\188\64\106\64\169\71\104\122\175\80\59\35", "\53\30\19\204")].TouchEnabled and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\243\117\150\142\247\240\101\144\148\252\242\102\141\164\252\165\32", "\199\153\128\16\228")].KeyboardEnabled;
local function getScale()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\58\160\73", "\199\177\74\133\121")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\200\177\251\37\199\111\232", "\74\216\169\220\158\87\166")].ViewportSize;
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\51\86\124", "\58\136\67\115\76")].X < 700) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\186\157\9", "\61\145\202\184\57\229\64\203")].Y < 500) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\97\182\106\115\112\160\107\121\23\216", "\39\60\50\233")]) then
		return 0.7;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\35\230\124", "\195\122\83\195\76\226\72\210")].X < 1100) then
		return 0.85;
	end
	return 1;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\253\4\205\2\197\248\30\187\113", "\65\132\180\91\158")] = getScale();
local function createFolder(name)
	if (isfolder and not isfolder(name)) then
		makefolder(name);
	end
end
local function saveData(data, file, folder)
	if not writefile then
		return;
	end
	createFolder(folder);
	writefile(folder .. "/" .. file, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\104\197\62\54\121\195\56\12\127\212\107\84", "\78\101\28\177")]:JSONEncode(data));
end
local function loadData(file, folder)
	if not readfile then
		return nil;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\181\244\89\96\228", "\49\69\212\128")] = folder .. "/" .. file;
	if (not isfile or not isfile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\13\196\250\164\71", "\129\119\108\176\146")])) then
		return nil;
	end
	local ok, data = pcall(function()
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\219\19\221\22\11\14\42\198\4\200\96\95", "\124\92\175\103\173\69\110")]:JSONDecode(readfile(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\57\23\63\132\104", "\87\161\88\99")]));
	end);
	return (ok and data) or nil;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\214\195\232\146\226\102\66", "\67\114\153\143\172\215\176")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\139\192\42\145\149\209\58\151\150\194\43\251\242", "\110\222\194\142")];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\220\15\189\91\175\16\202\94\249", "\193\119\185\123\201\50")] = loadData(LUAOBFUSACTOR_DECRYPT_STR_0("\100\13\237\50\6\119\24\100\70\243\53\0\119", "\127\23\104\153\70\111\25"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\40\138\139\14\30\242\227", "\211\105\103\198\207\75\76\215")]) or {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\179\177\251\109\73\234", "\214\174\199\208\143\30\108\218")] = loadData(LUAOBFUSACTOR_DECRYPT_STR_0("\2\144\10\190\182\24\210\90\30\138", "\41\113\228\107\202\197\54\184"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\162\20\120\95\191\125\12", "\60\26\237\88")]) or {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\25\68\217\139\246\11\86\202\139\252\111\36", "\206\184\74\20\134")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\215\222\142\209\107\31\255\7\193\192\144\209\102\29\232\125\180", "\172\88\132\142\209\147\42\88")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\185\252\50\21\212\157\175\175\255\50\19\219\159\165\166\233\41\115\165", "\222\231\234\172\109\86\149")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\220\240\39\221\195\225\33\200\221\243\39\200\193\225\58\193\202\228\93\189", "\120\141\143\160")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\153\130\125\102\141\132\127\127\137\152\115\98\128\147\118\5\252", "\50\32\204\214")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\114\1\86\149\48\180\106\10\84\156\53\163\2\101", "\113\230\39\85\25\211")] = LUAOBFUSACTOR_DECRYPT_STR_0("\252\180\18\224", "\43\190\219\102\136\71\171\203");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\75\4\118\4\95\2\116\29\72\17\107\11\95\30\109\103\46", "\57\66\30\80")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\221\180\1\141\55\243\151\108\136", "\228\73\184\192\117\228\89\148")].autofarmVariant or LUAOBFUSACTOR_DECRYPT_STR_0("\237\133\116\0\206\135\97", "\116\175\233\21");
if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\205\138\105\253\16\13\211\199\136\103\233\24\30\208\204\251\22", "\95\158\152\222\38\187\81")] ~= LUAOBFUSACTOR_DECRYPT_STR_0("\218\177\52\166\162\198\236", "\168\152\221\85\210\195")) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\235\193\168\141\255\199\170\148\232\212\181\130\255\219\179\238\142", "\231\203\190\149")] ~= LUAOBFUSACTOR_DECRYPT_STR_0("\254\60\229\244", "\123\173\93\131\145\220\149"))) then
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\241\217\14\82\216\36\233\210\23\85\203\63\229\195\21\49\169", "\153\118\164\141\65\20")] = LUAOBFUSACTOR_DECRYPT_STR_0("\204\62\135\246\246\14\250", "\96\142\82\230\130\151");
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\159\108\110\205\222\112\149\97\99\198\194\106\148\10\18", "\142\47\208\47\34\132")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\145\60\36\119\101\201\155\42\35\121\112\211\154\65\82", "\60\150\222\100\98\59")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\29\111\105\255\147\2\113\29\121\117\254\255\97", "\81\37\92\55\54\187\218")] = 800;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\104\148\8\178\48\97\136\19\196\80", "\225\96\36\205\87")] = 130;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\137\116\92\81\106\39\221\153\113\73\89\106\45\172\246", "\105\137\198\34\25\28\47")] = 100;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\156\108\70\255\33\134\118\83\242\84\249", "\160\113\201\33\22")] = 50;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\104\137\130\141\146\249\109\128\147\150\130\250\29\252", "\205\180\56\204\199\201")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\235\17\40\188\243\9\52\183\225\19\54\198\142", "\120\227\190\92")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\115\32\93\2\112\245\221\25\125\50\90\4\121\230\199\19\125\61\87\6\120\156\178", "\130\93\60\127\27\67\60\185")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\19\21\107\210\98\66\101\29\28\107\165\19", "\29\40\82\88\46\128\35")] = 1;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\107\224\52\62\154\26\107\235\56\47\153\25\105\241\57\68\232", "\216\91\37\180\125\97")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\87\36\252\100\4\80\57\252\100\21\83\57\231\18\117", "\55\69\22\124\163")] = 180;
local RANDOM_PAUSE_MIN, RANDOM_PAUSE_MAX = 0.05, 0.15;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\246\106\193\254\69\121\219\86\236\125\197\240\68\126\192\61\131", "\148\24\179\60\136\191\17\48")] = 2;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\15\211\143\223\156\21\200\149\211\135\15\198\133\216\147\8\213\133\210\247\122", "\150\210\74\153\192")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\237\26\162\90\85\159\220\253\10\166\48\42", "\212\131\168\88\234\21\26")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\113\157\152\49\41\66\103\204\220", "\71\37\20\233\236\88")].webhookURL or "";
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\99\146\62\111\195\103\99\232\112\149\36\121\211\110\125\234\3\224", "\60\173\38\208\118\32\140\44")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\23\195\251\15\224\106\13\196\229\5\253\120\13\176\131\101\159", "\175\33\82\129\179\64")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\202\18\231\19\157\197\208\21\249\25\128\215\208\97\159\108\247\190", "\210\142\143\80\175\92")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\204\209\238\150\198\216\249\150\199\204\245\141\198\195\131\233", "\166\217\137\147")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\141\70\143\206\103\197\136\77\131\223\103\193\143\87\130\180\22", "\38\131\195\18\198\145")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\229\10\212\10\117\97\255\14\210\125\4", "\52\51\182\90\139\88")] = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\152\226\202\124\196\152\226\206\119\207\252\128", "\35\150\217\176\135")] = {};
for _, r in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\113\57\37\67\122\73\214\98\47\41\69\6\38", "\22\153\48\107\108\23\35")]) do
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\182\139\37\77\84\115\192\58\188\254\74", "\137\110\229\219\122\31\21\33")][r] = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\156\10\86\9\121\5\76\51\137\1\62\102", "\30\122\221\88\27\86\43\68")][r] = true;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\41\236\165\55\61\229\146\61\58\174\214", "\230\88\72\139")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\160\23\15\16\77\8", "\56\18\212\118\123\99\104")].bagCounter or 0;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\230\241\221\203\205\61\230\237\221\203\219\12\172\168", "\190\126\137\152\179\191")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\22\115\223\185\5\120", "\32\72\98\18\171\202")].pointsCounter or 0;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\157\38\123\241\5\154\63\71\227\5\154\38\64\254\9\141\119\36", "\151\100\232\82\20")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\205\247\28\108\156\166", "\104\31\185\150")].autofarmStartTime or os.time();
local ESP_OBJECTS, ValidEntities, IgnoredParts = {}, {}, {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\138\195\200\202\227\196\229\240\138\182\167", "\160\188\217\147\151\135\172\128")] = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\210\31\228\127\153", "\169\111\189\112\144\90")] = nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\134\40\162\171\133\76\210", "\226\173\227\69\205\223\224\105")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\59\50\87\198\24\89\42\39\95\252\15\87\44\35\92\202\94\8", "\123\56\94\66\59\175")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\201\70\125\229\63\240\149\243\87\106", "\225\154\35\19\129\122\158"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\12\234\78\240\245\245\7\106\69\187", "\84\58\96\139\55\149\135\176")] = {};
local infiniteConnection, bodyVelocity = nil, nil;
local boxFlyConnection, boxFlyBodyVel = nil, nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\57\167\35\65\193\48\22\60\183\9\65\193\45\86\111", "\94\115\95\195\96\46\175")] = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\68\45\54\61\61\134\227\70\101\48\30\34\36\151\197\77\74\61\49\43\41\194\176", "\128\35\43\95\93\78\77\231")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\15\63\51\30\112\168\168\62\57\56\27\119\186\173\18\56\7\3\127\189\161\14\115\100", "\201\196\125\86\84\119\30")] = {};
local mainGui, yCheckConnection = nil, nil;
local autofarmThread, autofarmRunning, autofarmStopRequested = nil, false, false;
local isSearching, searchTween, currentFlyTween = false, nil, nil;
local cameraFrozen, savedCameraCFrame = false, nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\232\2\186\192\250\13\169\198\221\20\186\198\234\65\239", "\223\163\142\100")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\58\250\142\139\178\51\230\149\253\210", "\216\226\118\163\209")];
local statsLabel, runtimeLabel = nil, nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\245\21\20\97\121\44\183\242\23\4\18\32", "\95\222\144\123\97\55\16")] = true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\133\184\97\246\13\144\181\77\240\92\212", "\131\121\228\218\35")] = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\209\37\4\77\18\205\220\39\18\60\75", "\123\185\176\66\97\25")] = {};
local function showNotification(text, duration)
	duration = duration or 3;
	if not mainGui then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\14\11\84\27\59\29\97", "\81\168\111\121\49\117\79\56")] = mainGui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\234\11\236\184\240\3\235\178\200\29", "\214\167\106\133")) or mainGui;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\55\88\70\50\58\137", "\185\73\88\44\47\84\31")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\188\210\2\180\255\254\138\210\22", "\159\232\183\122\192\179"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\61\188\40\34\119\248", "\65\68\82\200")].Size = UDim2.new(0.7, 0, 0, 36);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\95\102\41\201\138\46", "\30\69\48\18\64\175\175")].Position = UDim2.new(0.15, 0, 0.85, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\35\11\229\61\181\124", "\91\144\76\127\140")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\0\67\44\214\255\133", "\176\128\104\38\65\179\218\181")].Button;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\203\214\28\214\129\146", "\117\176\164\162")].BackgroundTransparency = 0.2;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\205\17\249\220\60\212", "\25\228\162\101\144\186")].Text = text;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\57\173\7\244\161\24", "\132\40\86\217\110\146")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\195\34\177\162\54\172", "\62\30\171\71\220\199\19\156")].Text;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\74\184\63\91\140\127", "\45\32\37\204\86\61\169\79")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\90\17\181\179\57\5", "\28\53\53\101\220\213")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\83\28\72\92\228\0", "\191\109\60\104\33\58\193\48")].ZIndex = 200;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\216\12\238\129\146\72", "\135\231\183\120")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\11\94\225\59\14\236\182", "\201\134\106\44\132\85\122")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\3\37\84\48\19\2\205\49", "\67\86\108\23\95\97\108\168"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\55\88\3\162\97\133", "\48\196\88\44\106\196\68\181")]).CornerRadius = UDim.new(0, 8);
	task.delay(duration, function()
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\208\200\42\134\225\242", "\76\226\191\188\67\224\196\194")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\39\19\249\251\156\120", "\157\185\72\103\144")].Parent) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\188\158\115\174\244\9", "\209\57\211\234\26\200")]:Destroy();
		end
	end);
end
local function saveSettings()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\203\178\149\89\220\6\221\227\209", "\178\97\174\198\225\48")].autofarmVariant = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\99\48\222\94\199\61\226\105\50\208\74\207\46\225\98\65\161", "\111\175\54\100\145\24\134")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\28\52\1\74\23\39\6\6\73", "\117\35\121\64")].rejoinQueue = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\152\196\249\10\97\226\140\219\243\22\106\226\152\192\247\1\99\248\153\171\134", "\47\189\221\142\182\67")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\186\51\223\65\167\39\58\101\239", "\73\64\223\71\171\40\201\64")].webhookURL = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\168\230\113\143\82\33\178\241\107\140\56\90", "\29\106\237\164\57\192")];
	saveData(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\161\243\174\220\220\167\225\244\244", "\146\209\196\135\218\181\178\192")], LUAOBFUSACTOR_DECRYPT_STR_0("\62\53\151\5\89\169\42\35\205\27\67\168\35", "\199\77\80\227\113\48"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\16\114\233\15\13\27\157", "\173\74\95\62")]);
end
local function saveStats()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\13\93\34\216\66\236", "\220\166\121\60\86\171\103")].bagCounter = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\3\58\147\52\223\20\253\7\47\245\107", "\122\137\98\93\208\91\170")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\245\29\91\198\247\249", "\170\231\129\124\47\181\210\201")].pointsCounter = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\180\51\62\30\57\168\180\47\62\30\47\153\254\106", "\74\235\219\90\80\106")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\215\90\47\41\177\42", "\146\44\163\59\91\90\148\26")].autofarmStartTime = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\56\172\142\79\116\63\181\178\93\116\63\172\181\64\120\40\253\209", "\41\21\77\216\225")];
	saveData(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\89\115\81\7\8\34", "\37\116\45\18")], LUAOBFUSACTOR_DECRYPT_STR_0("\220\235\87\182\184\129\245\69\173\165", "\203\175\159\54\194"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\225\53\31\127\125\135\43", "\162\27\174\121\91\58\47")]);
end
local function sendWebhook(content)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\224\61\221\16\246\248\250\42\199\19\156\131", "\185\179\165\127\149\95")] or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\80\237\220\56\126\94\240\193\37\125\48\159", "\119\49\21\175\148")] == "")) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\180\2\92\104\25", "\149\55\213\118\61\77\41\234")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\24\11\200\195\237\42", "\123\125\102\170\166\137\89\207")]={{[LUAOBFUSACTOR_DECRYPT_STR_0("\90\9\76\49\11", "\201\46\96\56\93\110\227")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\42\192\221\58\246\132\55\199\205\57\228\254\83", "\161\219\99\142\153\117")],[LUAOBFUSACTOR_DECRYPT_STR_0("\120\180\181\112\223\117\161\178\122\194\114", "\173\28\209\198\19")]=content,[LUAOBFUSACTOR_DECRYPT_STR_0("\118\227\187\180\103", "\219\21\140\215")]=16763904,[LUAOBFUSACTOR_DECRYPT_STR_0("\78\183\201\179\93\90", "\56\40\216\166\199")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\50\177\13\59", "\79\70\212\117")]=(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\26\224\223\252\31\226\70", "\109\199\118\129\166\153")].Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\113\248", "\150\81\208\23") .. (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\201\225\146\252\215\165\219", "\235\153\165\128")].DisplayName or "") .. ")")},[LUAOBFUSACTOR_DECRYPT_STR_0("\175\64\175\42\85\50\171\243\171", "\158\219\41\194\79\38\70\202")]=os.date(LUAOBFUSACTOR_DECRYPT_STR_0("\2\96\22\79\171\219\197\6\33\27\71\198\140\205\110\127\106\49\212", "\232\35\69\79\98\142\182"))}}};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\15\27\228\60\80", "\157\25\96\127")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\151\225\21\99\52\181\149\252\6\85\116\246", "\81\199\227\149\101\48")]:JSONEncode(TABLE_TableIndirection["data%0"]);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\87\234\84\166", "\219\29\50\155\113\150\230\92")] = (syn and syn.request) or http_request or request;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\37\212\62\175", "\45\177\64\165\27\159\40")] then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\19\30\239\34", "\18\125\118\111\202")]({[LUAOBFUSACTOR_DECRYPT_STR_0("\101\46\85", "\155\48\92\57\154\80\205\167")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\232\153\151\215\132\110\134\248\137\147\189\251", "\37\217\173\219\223\152\203")],[LUAOBFUSACTOR_DECRYPT_STR_0("\36\0\11\62\64\172", "\150\105\101\127\86\47\200")]=LUAOBFUSACTOR_DECRYPT_STR_0("\254\221\192\129", "\160\174\146\147\213\167"),[LUAOBFUSACTOR_DECRYPT_STR_0("\104\225\27\64\9\83\83", "\33\32\132\122\36\108")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\154\27\124\95\121\183\0\63\127\101\169\17", "\28\217\116\18\43")]=LUAOBFUSACTOR_DECRYPT_STR_0("\211\71\198\88\217\173\61\198\94\217\90\159\164\47\221\89", "\92\178\55\182\52\176\206")},[LUAOBFUSACTOR_DECRYPT_STR_0("\56\58\117\12", "\117\122\85\17")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\224\46\93\227\141", "\189\232\143\74\36\198")]});
		end);
	end
end
local function updateRoot()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\166\11\87\210\24\185\250", "\106\156\202\106\46\183")].Character then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\22\116\39\111\109", "\74\93\121\27\83")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\183\231\103\120\169\163\46", "\30\29\219\134")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\125\178\20\251\250\80\17\10\103\168\22\238\196\94\10\26", "\110\53\199\121\154\148\63\120")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\22\254\38\92\238\68\74", "\156\97\122\159\95\57")].Character:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\230\163\215\249\5\13\54\202\132\213\247\31\50\62\220\162", "\95\174\214\186\152\107\98"), 3);
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\1\126\159\86\150", "\166\233\110\17\235\115")] = nil;
	end
end
local function freezeCamera()
	if cameraFrozen then
		return;
	end
	savedCameraCFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\15\201\196\224\191\57\40", "\28\24\110\164\161\146\222")].CFrame;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\194\91\32\73\194\19\117", "\69\59\163\54")].CameraType = Enum.CameraType.Scriptable;
	cameraFrozen = true;
end
local function unfreezeCamera()
	if not cameraFrozen then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\169\199\79\33\204\243\224", "\214\208\200\170\42\83\173")].CameraType = Enum.CameraType.Custom;
	if savedCameraCFrame then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\32\127\165\103\216\100\34", "\21\185\65\18\192")].CFrame = savedCameraCFrame;
	end
	cameraFrozen = false;
	savedCameraCFrame = nil;
end
local function toggleNoClip(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\121\126\55\136\206\105\120\53\128\220\122\120\63\228\174", "\193\158\54\61\123")] = state;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\29\33\160\48\3\101\233", "\217\85\113\64")].Character then
		for _, p in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\3\205\217\234\144\160\27", "\133\43\111\172\160\143\226")].Character:GetDescendants()) do
			if p:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\233\162\67\212\240\202\177\68", "\160\171\195\48\177")) then
				p.CanCollide = not state;
			end
		end
	end
end
local function setWorkspaceNoClip(state)
	if (state == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\12\100\38\79\209\174\196\214\45\121\14\80\200\191\226\221\2\116\33\89\197\234\151", "\167\179\99\22\77\60\161\207")]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\112\153\83\95\17\126\136\93\98\14\92\135\81\92\36\113\138\90\64\4\123\206\8", "\44\97\31\235\56")] = state;
	if state then
		task.spawn(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\6\249\182\180\94", "\196\145\110\152")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\34\255\235\93\60\187\162", "\146\56\78\158")].Character;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\158\31", "\58\77\187\47\134")] = 0;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\52\177\66\181", "\126\114\85\193\103\133\78\52")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\212\32\115\215\203\51\123\193\158\98", "\24\164\187\82")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\220\219\76", "\145\145\186\60\202")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\223\33\15\245\192\50\7\227\149\99", "\100\134\176\83")];
			for _, obj in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\192\82\248\227", "\117\179\161\34\221\211")]:GetDescendants()) do
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\191\232\205\23\239\164\78\181\212\201\39\243\172\93\149\244\199\6\243\160\73\245\170", "\197\45\208\154\166\100\159")] then
					break;
				end
				if (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\11\245\149\185\3\40\230\146", "\83\73\148\230\220")) and not (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\215\247\242\170\217", "\233\83\191\150\128\143")] and obj:IsDescendantOf(TABLE_TableIndirection["char%0"]))) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\148\198\117\4\249\135\195\81\2\251\138\198\97\4\248\136\252\102\12\227\131\220\55\93", "\109\151\230\175\18")][obj] = obj.CanCollide;
					obj.CanCollide = false;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\191\17", "\224\192\154\33\36")] += 1
				if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\17\72", "\226\227\52\120")] % 80) == 0) then
					task.wait();
				end
			end
		end);
	else
		for obj, old in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\249\229\163\67\177\214\181\38\228\224\168\67\172\222\182\11\216\248\165\94\186\196\252\85", "\217\101\139\140\196\42\223\183")]) do
			if (obj and obj.Parent) then
				obj.CanCollide = old;
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\29\166\29\77\20\14\163\57\75\22\3\166\9\77\21\1\156\14\69\14\10\188\95\20", "\36\122\111\207\122")] = {};
	end
end
local function shouldIgnore(part)
	if (not part or not part.Parent) then
		return true;
	end
	if IgnoredParts[part] then
		return true;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\7\246\179\171\36\13\11\225\253\232", "\84\108\104\132\216\216")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\206\26\200\86\225\166\78\201\25\199\95\243\180\67\219\21\213", "\34\172\123\166\56\128\196")) and part:IsDescendantOf(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\166\186\192\89\99\212\23\161\236\248", "\116\196\201\200\171\42\19\181")].bannablebagspawns)) then
		return true;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\137\233\86\6\16\29\117\131\190\13", "\124\22\230\155\61\117\96")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\231\190\239\231\250\228\251\194\184", "\149\165\203\134\139\158\141")) and part:IsDescendantOf(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\163\82\45\32\188\65\37\54\233\16", "\70\83\204\32")].Buildings)) then
		return true;
	end
	return false;
end
local function removeEntity(part)
	if ESP_OBJECTS[part] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\196\91", "\224\110\225\107")] = ESP_OBJECTS[part];
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\51\141", "\164\148\22\189\81\80\164")].highlight then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\197\39", "\23\210\224\23\211\71\43")].highlight:Destroy();
			end);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\195\64", "\144\201\230\112\215\53\75\188")].billboard then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\128\73", "\197\53\165\121\138\150")].billboard:Destroy();
			end);
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\154\137", "\64\141\191\185")].model and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\217\128\229\218\230\130\38\198\131\159\167", "\198\99\138\208\186\151\169")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\176\211", "\62\109\149\227")].model] == part)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\187\185\235\45\220\172\172\248\51\182\216", "\96\147\232\233\180")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\125\74", "\89\72\88\122\43\237")].model] = nil;
		end
		ESP_OBJECTS[part] = nil;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\254\245", "\123\76\219\197\86")] = getBagModel(part);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\157\69", "\95\56\184\117\108\142")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\241\22\211\221\237\2\201\220\241\99\188", "\140\144\162\70")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\109\9", "\142\176\72\57\18")]] == part)) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\2\32\27\139\30\52\1\138\2\85\116", "\68\198\81\112")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\74\224", "\125\215\111\208\116\44")]] = nil;
	end
	ValidEntities[part] = nil;
end
local function getTypeName(data, part)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\2\31", "\60\103\39\47\147\24")] = data and (data.typ or data.type or data.Type);
	if (typeof(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\79\167", "\46\140\106\151\224\182\147")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\248\57\111\75\229\42", "\34\139\77\29")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\255\10\17\121", "\73\208\144\125\52")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\169\218", "\171\74\140\234\171\167\112\51")]:lower();
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\1\91\26\161", "\205\79\110\44\63\145")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\165\94\56", "\124\199\63\95\168\212\107\196")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\167\68\127\244", "\147\102\200\51\90\196\151\233")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\46\254\230\194\176", "\91\91\144\143\173\222\128"))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\1\161\75", "\46\67\192\44\49\203");
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\217\57\231\116", "\101\100\182\78\194\68\196")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\75\73\51\253\136", "\181\40\40\80\149\237\43\24")) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\54\179\38\58\191", "\114\117\210\69\82\218\42");
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\217\92\118\160\1\134", "\204\36\182\56\19")] = getBagModel(part);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\74\213\141\56\104", "\114\137\43\188\227\29\88")] = getMainPart(part);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\18\172\21\232\88\248", "\112\132\125\200")] or (part and isUUIDName(part.Name))) then
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\185\250\125\31\165", "\149\157\216\147\19\58")] and isRedish(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\135\17\198\140\214", "\168\169\230\120")].Color)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\222\140\131", "\119\156\237\228");
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\148\80", "\30\163\177\96")] = detectRarity(part, data);
		if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\101\5", "\180\122\64\53\233\93\75")] == LUAOBFUSACTOR_DECRYPT_STR_0("\227\25\16\50\219\26\28\51", "\93\182\119\115")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\90\131", "\158\226\127\179\236\215")] == LUAOBFUSACTOR_DECRYPT_STR_0("\195\193\219\211", "\182\145\160\169")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\101\96", "\111\89\64\80\118\199")] == LUAOBFUSACTOR_DECRYPT_STR_0("\154\167\7\69", "\38\223\215\110")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\158\92", "\203\62\187\108\165")] == LUAOBFUSACTOR_DECRYPT_STR_0("\213\113\79\59\127\250\209\235\109", "\176\153\20\40\94\17\158")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\118\235", "\165\200\83\219\51")] == LUAOBFUSACTOR_DECRYPT_STR_0("\242\230\96\114\220\180\168\225", "\132\167\138\20\27\177\213\220"))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\208\212\228", "\92\146\181\131\44");
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\241\69\131\178\5\71", "\189\43\158\33\230\222\32\119")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\207\73\84\132\27\144", "\232\62\160\45\49")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\89\210\252\162", "\193\20\179\149\204"))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\245\0\134", "\162\183\97\225");
		end
		return LUAOBFUSACTOR_DECRYPT_STR_0("\10\196\231\255\25", "\193\73\165\132\151\124\130");
	end
	return LUAOBFUSACTOR_DECRYPT_STR_0("\238\195\170\83\179", "\214\173\162\201\59\214");
end
local function createESP(part, data)
	if (not part or not part.Parent or ESP_OBJECTS[part] or shouldIgnore(part)) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\118\174\68\219\11\38\96\239\17", "\64\67\25\202\33\183")] = getBagModel(part) or (data and data.model) or part;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\221\65\131\3\253\103\204\194\66\249\126", "\35\137\142\17\220\78\178")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\65\33\4\33\101\32\24\104\30", "\97\77\46\69")]] then
		return;
	end
	for p, d in pairs(ESP_OBJECTS) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\154\80", "\197\191\191\96")] = (d and d.model) or getBagModel(p);
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\108\189", "\45\170\73\141\46\56\136")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\74\157", "\103\225\111\173\133\207\231")] == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\139\241\80\64\175\240\76\9\212", "\53\44\228\149")])) then
			return;
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\194\43\64\155", "\68\173\187\91\101\171")] = getTypeName(data, part);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\14\0\206\93\155\56\137", "\185\156\111\114\167\41\226\29")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\28\6\101\228", "\131\107\101\118\64\212")] == LUAOBFUSACTOR_DECRYPT_STR_0("\227\215\43", "\169\161\182\76\75\39\160")) and detectRarity(part, data)) or nil;
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\75\167\206\75", "\200\185\50\215\235\123\66")] == LUAOBFUSACTOR_DECRYPT_STR_0("\208\128\222", "\122\146\225\185\130\234\22")) and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\209\240\240\205\154\158\209\255\234\193\154\155\206\229\235\170\235", "\219\217\130\160\175\143")]) then
		return;
	end
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\165\82\120\110", "\93\94\220\34")] == LUAOBFUSACTOR_DECRYPT_STR_0("\44\201\194\130\223", "\157\111\168\161\234\186\151")) and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\115\69\14\225\152\145\173\94\115\74\20\236\152\144\169\94\100\48\97", "\229\27\32\21\81\162\217\210")]) then
		return;
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\255\203\5\111\2\237\217\22\111\8\137\171", "\42\76\172\155\90")] then
		return;
	end
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\148\145\108\80", "\96\146\237\225\73")] == LUAOBFUSACTOR_DECRYPT_STR_0("\202\127\15", "\194\136\30\104\136\41\26")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\215\17\65\0\169\236\127", "\79\188\182\99\40\116\208\201")] and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\240\26\126\17\30\79\234\30\120\102\111", "\95\29\163\74\33\67")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\51\82\62\107\147\65\44", "\100\28\82\32\87\31\234")]]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\93\236\126\233\147\184", "\94\81\50\128\17\155\182\136")] = nil;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\37\244\124\178", "\231\235\92\132\89\130\212\124")] == LUAOBFUSACTOR_DECRYPT_STR_0("\221\181\247\55\212", "\37\158\212\148\95\177")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\19\168\136\31\49\76", "\109\20\124\196\231")] = Color3.fromRGB(0, 220, 140);
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\178\120\170\35\101\240", "\64\192\221\20\197\81")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\247\240\171\179\182\179\178", "\199\207\150\130\194")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\107\73\193\119\140\117\88\199\111\154\120\72\173\19", "\35\213\42\27\136")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\134\41\182\204\235\229\215", "\146\192\231\91\223\184")]]) or Color3.fromRGB(0, 255, 120);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\253\179\121", "\110\58\145\150\73\177\212\103")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\220\61\205\250\71\194\238\252\32", "\137\148\84\170\146\43\171"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\211\58\173", "\23\97\191\31\157")].Adornee = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\142\66\85", "\82\230\226\103\101\189")].FillColor = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\37\191\190\6\206\122", "\116\235\74\211\209")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\48\155\117", "\69\72\92\190")].OutlineColor = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\55\161\132", "\215\86\91\132\180\203\200\118")].FillTransparency = 0.5;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\226\195\131", "\179\83\142\230")].DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\35\184\101", "\191\186\79\157\85\89\127\151")].Parent = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\120\225\158", "\37\150\26\196\174\228")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\235\249\190\89\53\134\200\226\182\114\34\128", "\233\169\144\210\53\87"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\68\168\140", "\188\66\38\141")].Adornee = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\82\72\97", "\168\129\48\109\81\19\34\104")].Size = UDim2.new(0, 170, 0, 70);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\22\73\96", "\153\23\116\108\80\191\69\219")].StudsOffset = Vector3.new(0, 4, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\29\184\136", "\22\41\127\157\184\152\235")].AlwaysOnTop = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\197\164\154", "\170\119\167\129")].MaxDistance = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\209\132\76\167\119\233\196\157\93\160\123\159\160", "\62\186\144\220\19\227")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\254\169\134", "\182\193\156\140")].Parent = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\84\2\247\182", "\95\161\44\118\210\134")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\210\69\11\25\86\215\231\171\234", "\206\134\32\115\109\26\182\133"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\224\219\86\13", "\61\86\152\175\115\61")].Size = UDim2.new(1, 0, 1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\25\200\117\129", "\167\201\97\188\80\177\225\67")].BackgroundTransparency = 0.4;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\16\144\234\172", "\225\46\104\228\207\156")].BackgroundColor3 = Color3.new(0, 0, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\216\167\11\103", "\223\202\160\211\46\87\51\210")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\230\22\123\31\147\185", "\109\182\137\122\20")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\177\6\191\176", "\28\50\201\114\154\128\183\138")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\158\13\183\250", "\146\202\230\121")].TextScaled = true;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\246\254\91\151", "\94\142\143\142\126\167\210\192")] == LUAOBFUSACTOR_DECRYPT_STR_0("\35\196\30\233\194", "\167\96\165\125\129")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\206\2\3\18", "\232\103\182\118\38\34\70\43")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\22\86\44\235\53", "\17\85\55\79\131\80");
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\157\173\233\111", "\95\168\229\217\204")].Text = string.format("Bag\n[%s]", TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\58\148\128\158\34\195\217", "\233\234\91\230")] or LUAOBFUSACTOR_DECRYPT_STR_0("\114\78\143\126\168\95", "\199\49\33\226\19"));
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\67\87\90\151", "\167\50\59\35\127")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\17\23\188", "\200\40\115\50\140")];
	ESP_OBJECTS[part] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\251\36\112\23\255\36\112\23\231", "\127\147\77\23")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\234\176\36", "\16\235\134\149\20")],[LUAOBFUSACTOR_DECRYPT_STR_0("\216\66\66\170\14\136\13\200\79", "\108\186\43\46\198\108\231")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\189\176\81", "\28\82\223\149\97")],[LUAOBFUSACTOR_DECRYPT_STR_0("\185\48\85\74", "\62\205\85\45")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\20\181\236\82", "\105\21\108\193\201\98\233")],[LUAOBFUSACTOR_DECRYPT_STR_0("\82\132\9\247\215\39", "\186\32\229\123\158\163\94")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\34\99\195\13\188\114\84", "\87\100\67\17\170\121\197")],[LUAOBFUSACTOR_DECRYPT_STR_0("\250\146\170", "\213\142\235\218\224\55")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\187\233\128\88", "\165\104\194\153")],[LUAOBFUSACTOR_DECRYPT_STR_0("\138\63\221\174\245", "\237\231\80\185\203\153\61")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\63\132\119\73\142\53\153\55\21", "\37\197\80\224\18")]};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\113\124\121\153\54\102\105\106\135\92\18", "\212\121\34\44\38")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\181\46\0\114\134\247\71\255\234", "\62\218\218\74\101\30\205\146")]] = part;
end
local function updateBillboard(part)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\166\118\229\152\110", "\79\34\201\25\145\189\94\36")] or not ESP_OBJECTS[part]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\105\186", "\52\32\76\138\106\32")] = ESP_OBJECTS[part];
	if not part.Parent then
		removeEntity(part);
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\243\35\210\63\232", "\26\216\154\80\166")] = (part.Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\198\226\87\56\124", "\76\172\169\141\35\29")].Position).Magnitude;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\208\235\23\153\137", "\99\188\185\152")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\53\142\49\135\251\39\130\47\141\241\49\243\94", "\195\178\116\214\110")]) then
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\178\214", "\134\101\151\230\21\161")].billboard then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\207\106", "\128\201\234\90\52\67\82")].billboard.Enabled = false;
		end
		return;
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\8\110", "\170\196\45\94\20")].billboard then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\1\85", "\80\30\36\101\84\161\64")].billboard.Enabled = true;
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\20\73", "\91\198\49\121\34\184")].text then
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\131\39", "\233\84\166\23\217")].typ == LUAOBFUSACTOR_DECRYPT_STR_0("\91\121\251\238\51", "\65\24\24\152\134\86")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\114\184", "\41\220\87\136")].text.Text = string.format("Cache\n%d studs", math.floor(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\63\240\228\139\251", "\203\69\86\131\144\174")]));
		else
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\91\3", "\113\217\126\51\57\168\48\135")].text.Text = string.format("Bag\n[%s]\n%d studs", TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\80\102", "\174\127\117\86\40\40\31\22")].rarity or LUAOBFUSACTOR_DECRYPT_STR_0("\255\52\65\214\211\53", "\187\188\91\44"), math.floor(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\254\109\49\167\93", "\109\127\151\30\69\130")]));
		end
	end
end
local function clearAllESP()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\192\39", "\118\178\229\23\120\165\176\210")] = {};
	for p in pairs(ESP_OBJECTS) do
		table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\153\28", "\221\101\188\44\105\108\207\65")], p);
	end
	for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\117\71", "\178\54\80\119\194")]) do
		removeEntity(p);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\60\113\253\194\214\157\231\24\60\4\146", "\162\84\111\33\162\143\153\217")] = {};
end
local function rebuildESP()
	clearAllESP();
	for part, data in pairs(ValidEntities) do
		if (part and part.Parent) then
			createESP(part, data);
		end
	end
end
local function addToIgnore(part)
	if (not part or IgnoredParts[part]) then
		return;
	end
	IgnoredParts[part] = true;
	removeEntity(part);
	showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\8\217\23\143\36\207\93\131\32\213\18\152\34\223", "\234\71\187\125"), 2);
end
local function getPlayerRoot(plr)
	return plr.Character and plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\57\41\92\90\240\30\53\85\105\241\30\40\97\90\236\5", "\158\113\92\49\59"));
end
local function removePlayerESP(plr)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\53\17", "\103\140\16\33\16\158\102\186")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\129\188\108\6\46\226\190\141\48\83", "\92\167\237\221\21\99")][plr];
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\101\125", "\70\159\64\77")] then
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\10\2", "\122\183\47\50\159")].highlight then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\116\247", "\224\162\81\199\47")].highlight:Destroy();
			end);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\0\99", "\227\136\37\83\93")].billboard then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\232\88", "\20\57\205\104")].billboard:Destroy();
			end);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\238\72", "\83\72\203\120\217\122\58")].connections then
			for _, c in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\172\235", "\223\220\137\219\195\207\221")].connections) do
				pcall(function()
					c:Disconnect();
				end);
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\68\94\251\41\1\109\108\210\105\67", "\76\115\40\63\130")][plr] = nil;
	end
end
local function createPlayerESP(plr)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\41\29\146\134\253\166\35\8\159\133\238\162\52\12\143\154\244\163\95\125", "\177\231\122\77\205\214")] or (plr == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\31\64\89\172\78\1\67", "\60\36\115\33\32\201")]) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\122\86\95\73\76\24\146\135\51\7", "\193\215\22\55\38\44\62\93")][plr]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\2\75\159", "\155\79\114\110\175\181")] = getPlayerRoot(plr);
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\68\156\180", "\181\56\52\185\132\209\236")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\64\151\248", "\154\82\44\178\200\37\201")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\93\226\5\5\178\65\114\125\255", "\21\21\139\98\109\222\40"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\224\233\220", "\90\100\140\204\236")].Adornee = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\4\123\156", "\120\204\116\94\172\215")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\177\253\88", "\31\99\221\216\104\139\194\16")].FillColor = Color3.fromRGB(255, 100, 100);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\172\175\92", "\131\85\192\138\108\105")].OutlineColor = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\168\58\83", "\99\86\196\31")].FillTransparency = 0.4;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\56\10\173", "\111\48\84\47\157\63\199")].DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\10\197\247", "\78\122\102\224\199")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\8\49\83", "\159\156\120\20\99\84\101\206")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\19\201\47", "\71\28\113\236\31\168\33\23")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\111\247\47\244\219\214\58\181\73\217\54\241", "\199\45\158\67\152\185\185\91"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\123\248\254", "\176\58\25\221\206\176\118\183")].Adornee = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\1\156\86", "\216\82\113\185\102\142")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\89\101\136", "\29\34\59\64\184")].Size = UDim2.new(0, 110, 0, 36);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\28\13\154", "\61\114\126\40\170\85")].StudsOffset = Vector3.new(0, 3, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\42\50\105", "\19\172\72\23\89\163")].AlwaysOnTop = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\94\138\181", "\197\87\60\175\133\85\50")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\110\145\131", "\179\116\30\180")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\222\249\196\187", "\225\139\166\141")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\121\142\236\52\97\138\246\37\65", "\64\45\235\148"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\73\46\167\12", "\181\22\49\90\130\60")].Size = UDim2.new(1, 0, 1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\201\172\76\95", "\105\111\177\216")].BackgroundTransparency = 0.3;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\2\220\87\64", "\179\212\122\168\114\112")].BackgroundColor3 = Color3.new(0, 0, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\98\144\136\41", "\173\25\26\228")].TextColor3 = Color3.fromRGB(255, 100, 100);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\110\221\255\72", "\120\118\22\169\218")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\56\162\163\151", "\134\167\64\214")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\145\234\205\153", "\168\100\233\158\232\169")].Text = plr.Name;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\76\13\185\34", "\156\18\52\121")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\18\158\154", "\191\35\112\187\170\228\213\101")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\160\114\91\45\89\47", "\31\216\207\28\53\94\124")] = {};
	table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\40\165\1\72\100\119", "\59\65\71\203\111")], plr.CharacterAdded:Connect(function()
		task.wait(0.5);
		removePlayerESP(plr);
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\147\76\75\187\32\21\46\133\78\71\180\41\26\54\130\80\81\175\73\100", "\84\119\192\28\20\235\108")] then
			createPlayerESP(plr);
		end
	end));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\242\37\239\31\46\140\114\188\187\116", "\33\236\158\68\150\122\92\201")][plr] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\232\209\254\17\69\248\62\232\204", "\89\128\184\153\121\41\145")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\57\225\209", "\91\140\85\196\225\66\231\96")],[LUAOBFUSACTOR_DECRYPT_STR_0("\49\177\187\189\73\60\185\165\181", "\43\83\216\215\209")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\165\245\91", "\78\43\199\208\107")],[LUAOBFUSACTOR_DECRYPT_STR_0("\102\141\24\10", "\182\18\232\96\126\219\90\165")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\70\51\237\109", "\200\93\62\71")],[LUAOBFUSACTOR_DECRYPT_STR_0("\69\66\64\212\193\177\26\79\66\64\201", "\110\38\45\46\186\164\210")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\177\166\24\45\61\238", "\94\24\222\200\118")]};
end
local function updateAllPlayerESP()
	for _, plr in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\204\39\0\24\210\53\92\77", "\121\125\160\70")]:GetPlayers()) do
		if (plr ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\230\58\171\246\248\126\226", "\210\147\138\91")]) then
			removePlayerESP(plr);
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\206\248\116\0\63\20\196\237\121\3\44\16\211\233\105\28\54\17\184\152", "\115\85\157\168\43\80")] then
				createPlayerESP(plr);
			end
		end
	end
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\86\134\78\137\219\85\140\175", "\169\159\58\231\55\236\169\38")].PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		task.wait(0.5);
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\242\143\47\244\56\93\40\228\141\35\251\49\82\48\227\147\53\224\81\44", "\28\113\161\223\112\164\116")] then
			createPlayerESP(plr);
		end
	end);
end);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\84\70\96\94\212\75\2\41", "\59\166\56\39\25")].PlayerRemoving:Connect(removePlayerESP);
local function getClosestEntity()
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\215\201\220\6\226", "\35\210\184\166\168")] then
		return nil;
	end
	local closest, minDist = nil, math.huge;
	for part, data in pairs(ValidEntities) do
		if (part and part.Parent and not shouldIgnore(part)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\64\109\7\116", "\23\57\57\29\34\68")] = getTypeName(data, part);
			if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\4\43\3\118\16\45\1\111\28\48\8\117\116\79", "\76\48\81\127")] == LUAOBFUSACTOR_DECRYPT_STR_0("\45\164\82\191\15", "\48\110\197\49\215\106\20\189")) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\11\88\233\144", "\108\125\114\40\204\160\75\38")] ~= LUAOBFUSACTOR_DECRYPT_STR_0("\22\113\252\5\48", "\109\85\16\159"))) then
			elseif ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\198\153\116\61\121\130\10\204\128\116\63\125\245\119", "\208\71\147\205\59\123\56")] == LUAOBFUSACTOR_DECRYPT_STR_0("\117\33\131", "\216\55\64\228")) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\145\46\135\233", "\139\223\232\94\162\217\149")] ~= LUAOBFUSACTOR_DECRYPT_STR_0("\247\130\36", "\170\181\227\67\145\219\53"))) then
			elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\156\14\247\9", "\210\57\229\126")] == LUAOBFUSACTOR_DECRYPT_STR_0("\154\50\237", "\227\216\83\138\198\82\165")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\180\164\113\230\50\240\230", "\146\75\213\214\24")] = detectRarity(part, data);
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\95\243\105\69\119\116\120\87\245\125\63\21", "\53\42\30\161\36\26\37")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\248\229\233\233\224\178\176", "\128\157\153\151")]] then
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\114\124\159\61\80\35", "\19\22\21\236\73\117")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\202\173\189\178\237", "\150\23\165\194\201\151\221\77")].Position - part.Position).Magnitude;
					if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\50\251\14\59\107", "\122\30\91\136")] < minDist) then
						minDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\173\246\164\200\239", "\237\223\196\133\208")];
						closest = part;
					end
				end
			else
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\1\208\170\27\170", "\154\188\104\163\222\62")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\226\34\239\85\31", "\162\85\141\77\155\112\47")].Position - part.Position).Magnitude;
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\32\181\90\87\121", "\46\114\73\198")] < minDist) then
					minDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\119\101\251\107\26", "\42\197\30\22\143\78")];
					closest = part;
				end
			end
		end
	end
	return closest;
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
	setWorkspaceNoClip(false);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\100\114\26\65\100\96\18\92\97\122\122\35", "\95\19\37\63")] == 1) then
		unfreezeCamera();
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\9\133\212\94\40\90\19\136\210\78\52\69\3\151\185\33", "\103\17\76\199\156\17")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\43\130\203\83\5\183\238\182\56\192\184", "\154\211\74\229\136\60\112\217")] > 0)) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\16\235\221\22\66\171\89\186", "\39\207\124\138\173\101")] = os.time() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\20\87\207\164\207\19\78\243\182\207\19\87\244\171\195\4\6\144", "\194\174\97\35\160")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\48\53\71\175", "\98\159\64\93")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\189\44\15\2\3\95\97\94", "\68\110\209\77\127\113\102\59")] > 0) and math.floor(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\229\160\108\12\214\160\186\225\181\10\83", "\206\206\132\199\47\99\163")] / (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\206\214\98\66\243\198\146\34", "\49\150\162\183\18")] / 3600))) or 0;
		sendWebhook(string.format("**Autofarm stopped**\nBags: %d | Points: %d\nRuntime: %ds | Bags/Hour: ~%d", TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\43\188\2\21\245\22\93\47\169\100\74", "\120\41\74\219\65\122\128")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\9\85\20\241\180\246\85\19\82\14\224\181\144\10", "\181\58\102\60\122\133\199")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\238\221\9\105\86\230\153\73", "\26\51\130\188\121")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\146\36\92\25", "\57\136\226\76\121\41\126\151")]));
	end
end
local function moveBlatant(target)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\216\6\71\97\179", "\29\66\183\105\51\68\131")] or not target or not target.Parent) then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\44\71\207\73\96\25", "\174\37\69\41")] = target.Position + Vector3.new(0, 3, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\191\93\26\85\209", "\112\225\214\46\110")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\43\44\79\161\237", "\140\126\68\67\59\132\221")].Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\120\9\74\65\90\214", "\230\226\17\103\43\45\127")]).Magnitude;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\69\215\95\194\128", "\231\176\44\164\43")] <= 2) then
		return true;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\211\54\236\254", "\236\193\166\68\201\206")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\50\219\101\65\107", "\17\100\91\168")] / TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\160\138\233\176\55\114\76\163\191\252\182\38\127\31\246", "\27\58\198\236\140\211\67")], 0.12);
	currentFlyTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\218\201\79\135\216\36\223\218\67\138\238\100\157", "\139\65\173\172\42\233")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\67\99\157\148", "\40\231\54\17\184\164\23\128")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\167\239\109\249\136\239", "\138\228\169\31\152\229")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\5\76\52\236\134\156", "\163\172\108\34\85\128")])});
	currentFlyTween:Play();
	currentFlyTween.Completed:Wait();
	currentFlyTween = nil;
	return not autofarmStopRequested and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\36\195\168\253\101\186\121\24\52\217\166\249\104\173\112\98\65", "\52\71\113\151\231\187\36\232")];
end
local function moveSafe(target)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\130\119\185\51\221", "\205\22\237\24")] or not target or not target.Parent) then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\121\97\207\60\170\72\124\219\124\238", "\89\222\24\19\168")] = target.Position;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\80\93\182\29\176\9", "\113\149\57\51\215")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\113\217\177\231\212\73\127\216\243\178", "\160\25\16\171\214\130")] + Vector3.new(0, 3, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\202\56\104\115\214\178\52\136", "\235\17\184\87\29\29\178")] = 5;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\188\107\189\160", "\144\202\201\25\152")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\212\11\106\190\26", "\96\89\187\100\30\155\42\135")].Position;
	if (math.abs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\216\17\15\42", "\29\77\173\99\42\26")].Y - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\240\8\111\85\235\206\72\212", "\109\228\130\103\26\59\143\151")]) > 0.5) then
		currentFlyTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\111\171\220\48\121\42\150\149\113\173\220\123\26", "\228\227\24\206\185\94\42\79")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(0.3, Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\237\4\37\169\185\30", "\80\174\66\87\200\212\123")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\108\44\141\167", "\115\171\25\94\168\151")].X, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\160\235\52\249\8\139\161\113", "\151\108\210\132\65")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\65\27\13\150", "\52\184\52\105\40\166\33\167")].Z)});
		currentFlyTween:Play();
		currentFlyTween.Completed:Wait();
		currentFlyTween = nil;
		if (autofarmStopRequested or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\59\249\135\28\245\254\127\49\232\134\27\246\224\119\42\136\248", "\172\50\110\173\200\90\180")]) then
			return false;
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\168\251\89\245\190\192\77\233\189\241\88\190\234", "\44\155\218\148")] = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\250\62\60\209\51\129\226\232\105\107", "\209\141\155\76\91\180\71")].X, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\111\208\94\20\247\68\154\27", "\122\147\29\191\43")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\209\76\14\223\235\188\113\175\149\14", "\30\220\176\62\105\186\159\236")].Z);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\249\140\163\34\144\231", "\221\232\189\229\208\86\181\215")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\187\251\200\107\92", "\78\108\212\148\188")].Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\2\27\55\226\4\143\59\41\23\17\54\169\80", "\90\91\112\116\66\140\96\219")]).Magnitude;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\115\3\31\244\237\84", "\100\165\55\106\108\128\200")] > 2) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\222\35\246\149", "\211\165\171\81")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\81\219\217\195\153\84", "\188\100\21\178\170\183")] / TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\17\86\182\177\217\119\1\85\128\162\200\123\19\21\227", "\173\30\119\48\211\210")], 0.25);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\220\47\127\11", "\90\59\185\89")] = Vector3.new((math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\213\108\102\26\73\105\223\116\112\26\80\111\197\116\123\126\45", "\29\32\144\58\47\91")], 0, (math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\16\71\148\96\149\58\26\95\130\96\140\60\0\95\137\4\241", "\193\115\85\17\221\33")]);
		currentFlyTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\108\11\27\161\239\232\105\24\23\172\217\168\43", "\188\141\27\110\126\207")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\35\76\50\180", "\105\237\86\62\23\132\136")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\154\111\46\76\46\24", "\125\217\41\92\45\67")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\166\9\74\141\95\109\181\20\88\134\79\28\228", "\59\57\212\102\63\227")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\237\105\66\45", "\103\29\136\31")])});
		currentFlyTween:Play();
		currentFlyTween.Completed:Wait();
		currentFlyTween = nil;
		if (autofarmStopRequested or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\27\238\5\96\63\28\247\21\99\48\15\248\6\99\58\107\138", "\38\126\78\186\74")]) then
			return false;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\110\30\163\120\166\224\110\21\175\105\165\227\108\15\174\2\212", "\228\161\32\74\234\39")] then
			task.wait(RANDOM_PAUSE_MIN + (math.random() * (RANDOM_PAUSE_MAX - RANDOM_PAUSE_MIN)));
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\160\3\166\228\196\100", "\224\94\228\106\213\144\225\84")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\231\72\212\68\224", "\97\208\136\39\160")].Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\32\205\135\85\87\107", "\91\150\73\163\230\57\114")]).Magnitude;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\137\187\69\228\78\238", "\63\46\205\210\54\144\107\222")] > 2) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\57\230\2\140", "\188\144\76\148\39")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\111\124\183\88\73\114", "\53\229\43\21\196\44\108\66")] / TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\51\17\160\48\33\30\179\54\6\7\160\54\49\82\245", "\197\83\85\119")], 0.25);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\255\8\114\31", "\87\47\154\126")] = Vector3.new((math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\93\250\242\243\224\2\87\226\228\243\249\4\77\226\239\151\132", "\180\75\24\172\187\178")], (math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\252\211\42\93\16\208\63\237\230\196\46\83\17\215\36\134\137", "\112\163\185\133\99\28\68\153")] * 0.3, (math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\113\202\226\138\96\213\228\133\107\221\230\132\97\210\255\238\4", "\171\203\52\156")]);
		currentFlyTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\221\120\180\36\178\184\178\172\195\126\180\111\209", "\192\218\170\29\209\74\225\221")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\201\73\69\159", "\157\227\188\59\96\175\45\73")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\156\236\197\23\60\186", "\81\223\170\183\118")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\72\162\186\245\119\65", "\113\70\33\204\219\153\82")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\135\41\121\174", "\208\145\226\95\92\158")])});
		currentFlyTween:Play();
		currentFlyTween.Completed:Wait();
		currentFlyTween = nil;
		if (autofarmStopRequested or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\212\233\99\201\212\157\53\129\196\243\109\205\217\138\60\251\177", "\120\222\129\189\44\143\149\207")]) then
			return false;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\63\41\152\245\105\88\150\187\52\51\144\232\103\92\156\193\65", "\216\228\113\125\209\170\43\25")] then
			task.wait(RANDOM_PAUSE_MIN + (math.random() * (RANDOM_PAUSE_MAX - RANDOM_PAUSE_MIN)));
		end
	end
	return true;
end
local function autofarmLoop()
	autofarmRunning = true;
	local lastSearch, currentTarget = 0, nil;
	while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\207\108\106\84\95\203\215\103\96\92\95\219\214\125\97\55\46", "\30\153\154\56\37\18")] and not autofarmStopRequested do
		while not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\182\248\24\126\77", "\91\125\217\151\108")] do
			task.wait(0.4);
			updateRoot();
			if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\38\146\95\248\216\33\139\79\251\215\50\132\92\251\221\86\246", "\190\153\115\198\16")] or autofarmStopRequested) then
				autofarmRunning = false;
				return;
			end
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\116\165\147\127\43", "\231\90\27\202")].Position.Y < -20) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\139\87\182\27\209", "\62\225\228\56\194")].CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\182\182\57\49\5", "\53\118\217\217\77\20")].Position.X, 10, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\16\235\202\106\249", "\79\201\127\132\190")].Position.Z);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\27\230\221\109\68", "\169\72\116\137")].AssemblyLinearVelocity = Vector3.zero;
		end
		setWorkspaceNoClip(true);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\118\198\181\124\105\221\227\41", "\198\25\26\169")] = getClosestEntity();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\124\202\99\215", "\31\41\19\189\70\231\49\27")] = tick();
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\223\94\245\178\192\69\163\231", "\134\215\179\49")] then
			if (currentTarget ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\248\89\245\80\0\245\177\6", "\115\129\148\54\134\53")]) then
				if currentFlyTween then
					pcall(function()
						currentFlyTween:Cancel();
					end);
					currentFlyTween = nil;
				end
				currentTarget = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\139\95\88\221\27\7\172\215", "\115\137\231\48\43\184\104")];
			end
			lastSearch = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\230\13\166\249", "\95\185\137\122\131\201\192")];
			if isSearching then
				isSearching = false;
				if searchTween then
					pcall(function()
						searchTween:Cancel();
					end);
					searchTween = nil;
				end
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\61\130\67", "\69\22\86\167\115")] = nil;
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\177\115\174\99\6\106\169\120\183\100\21\113\165\105\181\0\119", "\71\56\228\39\225\37")] == LUAOBFUSACTOR_DECRYPT_STR_0("\131\224\226\44", "\66\208\129\132\73\154\141")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\84\147\173", "\157\42\63\182")] = moveSafe(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\50\38\239\202\200\42\108\172", "\175\187\94\73\156")]);
			else
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\52\10\112", "\160\70\95\47\64\123\67")] = moveBlatant(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\86\123\34\219\73\96\116\142", "\81\190\58\20")]);
			end
			if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\70\243\39", "\83\44\45\214\23\227\73\63")] or autofarmStopRequested or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\143\114\145\6\212\136\107\129\5\219\155\100\146\5\209\255\22", "\64\149\218\38\222")]) then
				break;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\171\206\224\14\180\143\128", "\176\122\199\170")] = 0;
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\7\177\201\52\57\87\91", "\75\114\107\208\176\81")].leaderstats and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\39\40\108\252\57\108\37", "\21\153\75\73")].leaderstats:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\57\28\68\252\166\85", "\38\105\115\45\146\210"))) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\26\8\70\39\17\83\92", "\83\98\118\108\22")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\231\120\52\160\150\102\25", "\67\41\139\25\77\197\228")].leaderstats.Points.Value;
			end
			task.wait(0.45);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\171\217\26\66\251\173\254", "\136\136\206\174\74\54")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\255\130\181\71\183\254\116", "\219\68\147\230\229\51\196")];
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\66\247\249\3\85\94\44", "\123\28\46\150\128\102\39")].leaderstats and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\69\28\78\30\155\126\37", "\21\101\41\125\55\123\233\91")].leaderstats:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\178\228\167\253\24\33", "\82\226\139\206\147\108"))) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\3\90\129\216\226\67\29", "\172\145\102\45\209")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\1\13\89\142\108\177\93", "\30\148\109\108\32\235")].leaderstats.Points.Value;
			end
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\66\6\111\0\84\84\15", "\63\116\39\113")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\92\195\220\4\59\237\104", "\200\88\48\167\140\112\72")]) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\95\47\136\237\215\80\60\174\240\135\14", "\130\162\62\72\203")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\182\186\83\136\149\225\233\166\165\248\32", "\157\195\215\221\16\231\224\143")] + 1;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\214\2\130\247\108\250\4\153\237\107\220\25\201\179", "\131\31\185\107\236")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\174\93\20\191\184\15\116", "\68\203\203\42")];
				saveStats();
				if statsLabel then
					statsLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\97\86\114\202\25\23", "\185\35\55\21") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\248\184\167\188\236\177\144\182\235\250\212", "\228\211\153\223")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\20\175\68\125\122\54\91\230\86\41\41\92\20", "\102\52\143\56\93\90") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\24\169\38\241\85\52\175\61\235\82\18\178\109\181", "\133\38\119\192\72")];
				end
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\132\86\211\216\142\95\196\210\151\81\201\206\158\86\218\208\228\36", "\155\151\193\20")] then
					sendWebhook("Bag collected\nBags: " .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\165\7\109\116\59\170\20\75\105\107\244", "\27\78\196\96\46")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\170\231\242\136\117\77\66\254\232\232\248", "\44\138\155\210\216\26\36") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\66\176\84\233\168\110\182\79\243\175\72\171\31\173", "\157\219\45\217\58")]);
				elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\152\20\253\209\159\150\9\240\200\149\143\15\234\175\224\248\102", "\158\208\221\86\181")] and ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\64\237\40\47\170\54\244\68\248\78\112", "\88\128\33\138\107\64\223")] % 10) == 0)) then
					sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\236\251\121\112\190\111\225\207\247\47\53", "\142\161\146\21\21\205\27") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\251\123\32\21\236\194\4\255\110\70\74", "\172\112\154\28\99\122\153")] .. " bags\nPoints: " .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\248\169\16\223\228\131\17\222\249\180\27\217\178\240", "\126\171\151\192")]);
				elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\59\219\52\40\213\114\1\59\207\57\53\195\102\111\78\169\89\87", "\57\94\126\153\124\103\154")] and ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\198\78\58\217\84\25\211\76\11\147\17", "\33\119\167\41\121\182")] % 100) == 0)) then
					sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\106\189\55\83\184\71\19\54\66\238\123", "\88\39\212\91\54\203\51\124") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\173\179\169\116\219\198\56\169\166\207\43", "\168\76\204\212\234\27\174")] .. " bags\nPoints: " .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\11\58\74\29\245\109\131\17\61\80\12\244\11\220", "\46\236\100\83\36\105\134")]);
				end
			end
			removeEntity(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\246\136\147\132\28\45\191\215", "\111\89\154\231\224\225")]);
			currentTarget = nil;
			task.wait(0.12);
		elseif (((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\213\17\224\124", "\177\157\186\102\197\76\153\188")] - lastSearch) > 1) and not isSearching) then
			isSearching = true;
			lastSearch = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\177\55\234\242", "\207\194\222\64")];
			currentTarget = nil;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\97\214\82\156\227\20\102\146\16", "\179\123\21\183\32\232")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\44\195\41\246\82", "\98\166\67\172\93\211")].Position;
			local angle, radius = 0, 900;
			task.spawn(function()
				while isSearching and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\214\227\250\36\107\208\202\220\242\251\35\104\206\194\199\146\133", "\130\135\131\183\181\98\42")] and not autofarmStopRequested do
					if getClosestEntity() then
						isSearching = false;
						break;
					end
					angle = angle + 0.55;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\166\126\179", "\64\163\214\91\131")] = Vector3.new(math.clamp(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\59\25\36\43\33\32\11\115\111", "\95\113\79\120\86")].X + (math.cos(angle) * radius), -5000, 5000), 12, math.clamp(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\224\33\162\146\61\48\218\238\164", "\169\203\148\64\208\230\109\95")].Z + (math.sin(angle) * radius), -5000, 5000));
					searchTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\0\3\183\36\40\57\244\222\30\5\183\111\75", "\134\168\119\102\210\74\123\92")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(0.4 + (math.random() * 0.15), Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\136\40\14\88\166\11", "\57\203\110\124")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\195\80\121", "\96\206\179\117\73")])});
					searchTween:Play();
					searchTween.Completed:Wait();
					searchTween = nil;
					if getClosestEntity() then
						isSearching = false;
						break;
					end
					task.wait(0.05);
				end
				isSearching = false;
			end);
		else
			task.wait(0.12);
		end
		task.wait(0.03);
	end
	setWorkspaceNoClip(false);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\2\90\0\179\2\72\8\174\7\82\96\209", "\69\225\67\23")] == 1) then
		unfreezeCamera();
	end
	isSearching = false;
	autofarmRunning = false;
end
local function startAutofarm()
	if autofarmRunning then
		stopAutofarm();
		task.wait(0.15);
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\180\7\154\250\162\235\86\251\164\29\148\254\175\252\95\129\209", "\27\164\225\83\213\188\227\185")] then
		return;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\46\175\219\245\169\48\175\209\227\173\74\210", "\167\232\111\226\158")] == 1) then
		freezeCamera();
	else
		unfreezeCamera();
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\34\41\29\24\73\249\167\65\23\63\29\30\89\181\225", "\209\36\68\79\120\123\61\144")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\205\106\4\51\124\196\118\31\69\28", "\96\44\129\51\91")];
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\33\56\143\204\202\210\59\48\41\136\210\202\223\48\43\73\246", "\147\117\111\108\198\147\136")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\176\196\81\9\162\203\66\15\133\210\81\15\178\135\4", "\52\106\214\162")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\46\230\155\194\36\41\251\155\194\53\42\251\128\180\85", "\145\101\111\190\196")])) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\203\135\233\76\68\196\151\233\124\64\200\132\232\10\0", "\47\48\173\225\140")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\236\185\231\24\141\101\232\190\235\27\137\102\233\196\136", "\204\35\173\225\184\75")];
	end
	autofarmStopRequested = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\81\247\130\224\167\28\227\119\247\140\244\178\58\231\73\230\200\182", "\110\142\36\131\237\134\198")] = os.time();
	autofarmThread = task.spawn(autofarmLoop);
end
local function showSpectatorWarning(allowSpec, onContinue)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\71\246\160", "\88\27\32\211\144")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\190\168\172\57\206\163\124\101\132", "\16\237\203\222\92\171\205\59"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\182\248\216", "\211\129\209\221\232\127")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\58\95\67\39\203\28\162\72", "\38\105\47\38\68\156\125\208");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\135\224\20", "\72\236\224\197\36\156")].ResetOnSpawn = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\172\1\218", "\234\164\203\36")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\225\129\59\137\76\52\34", "\18\107\141\224\66\236\62\17")].PlayerGui;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\234\76", "\151\203\207\124")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\242\8\240\15\229", "\164\180\122\145\98\128\233\126"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\65\75", "\173\219\100\123")].Size = UDim2.new(0, math.floor(400 * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\1\115\56\48\149\4\105\78\67", "\115\212\72\44\107")]), 0, math.floor(160 * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\198\107\65\222\15\130\97\201\191", "\36\236\143\52\18\157\78\206")]));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\4\104", "\159\48\33\88\47")].Position = UDim2.new(0.5, -math.floor(200 * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\107\38\193\144\192\27\18\90\18", "\87\127\34\121\146\211\129\87")]), 0.5, -math.floor(80 * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\200\186\223\6\31\227\81\238\177", "\20\203\129\229\140\69\94\175")]));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\131\4", "\130\207\166\52\86\143")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\82\22\224\175\62\113", "\65\42\58\115\141\202\27")].Background;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\65\5", "\79\43\100\53\161")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\195\138\31", "\36\144\164\175\47\52\44\86")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\5\38\216\171\109\62\10\233", "\31\80\111\155\196"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\28\177", "\79\51\57\129\180")]).CornerRadius = UDim.new(0, 12);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\166\117\8", "\185\87\210\80\56")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\243\57\157\76\111\246\94\195", "\53\166\112\206\56\29\153"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\7\19\90", "\79\18\115\54\106\149")].Color = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\90\75\83\32\56\221", "\198\42\50\46\62\69\29\237")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\174\83\105", "\59\162\218\118\89\72\192\110")].Thickness = 1.5;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\234\245\15", "\97\229\158\208\63\40\97\18")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\139\34", "\236\77\174\18\38")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\95\195\80\208", "\117\224\61\175")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\223\66\222\156\199\70\196\141\231", "\232\139\39\166"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\83\95\0\39", "\162\131\49\51\37\23")].Size = UDim2.new(0.9, 0, 0.45, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\123\242\111\36", "\20\63\25\158\74")].Position = UDim2.new(0.05, 0, 0.08, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\216\80\232\47", "\217\26\186\60\205\31\176\72")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\115\10\169\139", "\140\187\17\102")].Text = "Spectators are ON.\nPeople can spectate and report you.\nTurn them off?";
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\137\168\4\124", "\33\76\235\196")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\226\247\82\169\117\213", "\229\104\138\146\63\204\80\229")].Text;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\127\18\140\240", "\169\192\29\126")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\199\9\206\97", "\235\81\165\101")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\134\83\92\213", "\172\24\228\63\121\229\100")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\11\133", "\173\234\46\181")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\55\248\122\115", "\67\191\82\139\95")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\9\232\95\214\206\254\41\249\72\204", "\139\93\141\39\162\140"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\166\26\146\78", "\126\76\195\105\183")].Size = UDim2.new(0.4, 0, 0.28, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\77\183\52\9", "\212\63\40\196\17\57")].Position = UDim2.new(0.06, 0, 0.6, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\206\227\191\249", "\154\201\171\144")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\230\173\192\179\74\239", "\221\226\142\200\173\214\111\223")].Success;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\75\172\116\248", "\200\110\46\223\81")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\47\66\47\120\98\198\87\4\73\124\59\36\212", "\34\118\39\92\84\66\178");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\141\34\71\126", "\19\43\232\81\98\78\201\175")].TextColor3 = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\214\235\227\148", "\234\43\179\152\198\164\141")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\95\111\155\215", "\231\197\58\28\190\231\211\173")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\215\45\105\135", "\236\51\178\94\76\183")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\136\130", "\35\138\173\178")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\244\42\107\211\64\115\196\17", "\29\161\99\40\188\50"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\47\179\162\94", "\140\25\74\192\135\110\90\106")]).CornerRadius = UDim.new(0, 8);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\94\1\162", "\194\66\49\36\146\202")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\191\52\213\22\231\158\37\217\13\203", "\165\235\81\173\98"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\138\236\102", "\132\75\229\201\86\217")].Size = UDim2.new(0.4, 0, 0.28, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\125\224\245", "\197\226\18\197")].Position = UDim2.new(0.54, 0, 0.6, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\222\68\1", "\49\124\177\97")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\53\197\179\133\120\144", "\222\224\93\160")].Danger;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\242\55\113", "\88\139\157\18\65")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\100\21\94\81\199\79\27\4\20\139\67\14", "\171\42\122\114\113");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\167\137\178", "\130\237\200\172")].TextColor3 = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\223\235\94", "\110\70\176\206")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\31\120\187", "\90\21\112\93\139")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\212\49\230", "\192\97\187\20\214")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\30\99", "\224\106\59\83\168")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\146\204\33\244\92\134\76\181", "\41\199\133\98\155\46\232"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\169\164\22", "\134\124\198\129\38\221\111")]).CornerRadius = UDim.new(0, 8);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\234\162\101\168", "\64\152\143\209")].MouseButton1Click:Connect(function()
		if allowSpec then
			pcall(function()
				allowSpec.Value = false;
			end);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\78\128\92", "\103\87\41\165\108\42\77\28")]:Destroy();
		showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\145\195\17\244\98\225\182\220\6\228\54\244\183\193\26\242\114\160\173\213\18", "\128\194\179\116\151\22"), 2);
		if onContinue then
			onContinue();
		end
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\61\70\247", "\230\103\82\99\199\188\84")].MouseButton1Click:Connect(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\129\230\248", "\74\220\230\195\200\57")]:Destroy();
		showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\150\154\213\28\31\208\177\133\194\12\75\195\160\135\209\22\5\145\170\132", "\177\197\234\176\127\107"), 2);
		if onContinue then
			onContinue();
		end
	end);
end
local function checkSpectatorsAndStart()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\206\131\24", "\63\19\170\166\40\234\20")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\13\29\36\41\46\193\34\13\9\27\52\34\210\55\15\8\109\112", "\160\86\104\109\72\64\77")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\201\127\239\19\27\152\221\114\250\11", "\234\153\19\142\106\126"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\32\248\72", "\120\65\68\221")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\172\160\236", "\220\120\213\133")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\42\130\0", "\74\56\78\167\48")]:FindFirstChild(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\16\42\217\15\24\125\180", "\88\132\124\75\160\106\106")].Name);
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\47\200\23", "\96\116\86\237\39\123\202\80")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\17\165\105\199\252", "\207\65\116\209\29\226\204")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\73\206\94", "\110\208\48\235")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\150\172\151\153\172\167\132\158", "\237\197\201\227"));
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\38\11\106\224\99", "\26\219\67\127\30\197\83")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\20\210\117\7\188\165", "\153\149\120\190\26\112")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\16\222\180\111\160", "\119\108\117\170\192\74\144\158")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\198\37\141\46\240\26\145\36\228\61\128\53\232\59\146", "\65\135\73\225"));
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\95\93\175\3\90\3", "\116\127\51\49\192")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\12\95\242\249\91\82", "\98\123\96\51\157\142\126")].Value == true)) then
					showSpectatorWarning(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\242\170\193\49\136\174", "\70\173\158\198\174")], startAutofarm);
					return;
				end
			end
		end
	end
	startAutofarm();
end
local function applyWalkSpeed()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\42\66\171\160", "\142\144\95\47")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\33\81\23\18\63\21\94", "\110\119\77\48")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\51\37\76\225\249\122\116", "\132\139\95\68\53")].Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\212\61\240\52\242\39\244\49", "\85\156\72\157"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\39\112\100\138", "\234\27\82\29\65\186\72")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\218\228\251\83", "\99\144\175\137\222")].WalkSpeed = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\68\169\36\29\122\156\101\88\184\62\22\107\244\0", "\209\48\20\236\97\89\37")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\110\104\12\111\217\111\106\22\113\204\100\123\13\7\172", "\34\156\33\62\73")] * 2)) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\93\216\116\37\87\192\101\55\65\222\116\45\86\171\1", "\49\104\18\142")];
	end
end
local function applyJumpPower()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\240\113\78\161", "\107\145\133\28")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\82\178\167\199\76\246\238", "\222\162\62\211")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\125\15\2\52\145\143\243", "\170\195\17\110\123\81\227")].Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\156\33\237\193\243\187\61\228", "\157\212\84\128\160"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\102\237\0\118", "\163\233\19\128\37\70\232\142")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\64\49\92\179", "\121\131\53\92")].UseJumpPower = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\217\70\197\46", "\224\30\172\43")].JumpHeight = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\146\82\238\210\40\146\83\234\210\42\137\58\142", "\141\101\199\31\190")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\114\46\247\229\137\128\108\98\49\130\138", "\207\59\39\99\167\186\217")] * 2)) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\115\150\98\119\205\143\220\34\116\254\2", "\139\103\38\219\50\40\157\192")];
	end
end
local function startInfinite()
	if infiniteConnection then
		return;
	end
	infiniteConnection = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\173\56\241\227\170\32\203\229\189\115\146", "\162\134\216\86")].Heartbeat:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\223\114\124\20\125\220\154\18\219\104\118\30\7\161", "\207\94\143\55\57\80\34\145")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\217\34\104\245\11", "\217\66\177\67\26\208\59\119")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\210\203\179\85\248\189\115", "\152\67\190\170\202\48\138")].Character;
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\33\84\226\158\121", "\144\187\73\53")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\174\55\146\242", "\211\118\219\90\183\194")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\165\137\249\31\161", "\145\152\205\232\139\58")]:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\155\231\179\190\85\167\7\183", "\110\211\146\222\223\59\200"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\68\167\95", "\34\51\52\130\111")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\61\57\209\71\108", "\55\174\85\88\163\98\92")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\229\93\11\132\56\194\65\2\183\57\194\92\54\132\36\217", "\86\173\40\102\229"));
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\177\66\200\84", "\237\100\196\47")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\92\206\250", "\116\44\44\235\202\87\232")]) then
			return;
		end
		if (not bodyVelocity or not bodyVelocity.Parent) then
			bodyVelocity = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\33\216\82\60\52\183\254\12\212\95\49\27", "\146\99\183\54\69\98\210"));
			bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000);
			bodyVelocity.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\239\240\245", "\215\135\159\213\197\92")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\179\173\188", "\140\211\197\136")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\217\49\49\156", "\172\80\172\92\20")].MoveDirection * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\85\231\61\93\236\237\188\33\73\225\61\85\237\134\216", "\232\126\26\177\120\16\169\163")] * 2;
		bodyVelocity.Velocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\240\244\35", "\214\140\134\209\19\34\175")].X, 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\49\237\250", "\202\52\71\200")].Z);
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
local function setupNoFallDamage()
	for _, c in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\78\113\164\225\70\123\130\237\92\124\136\224\91\48\215", "\231\142\40\21")]) do
		if (typeof(c) == LUAOBFUSACTOR_DECRYPT_STR_0("\66\16\253\57\81\17\221\96\38\230\5\92\13\209\115\38\204\5\92", "\180\16\82\165\106\50\99")) then
			c:Disconnect();
		end
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\83\123\221\12\49\91\122\253\23\54\90\113\237\70\111", "\99\95\53\31\158")].bodyForce and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\44\116\114\253\36\126\84\241\62\121\94\252\57\53\1", "\49\146\74\16")].bodyForce.Parent) then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\87\142\121\141\234\95\143\89\150\237\94\132\73\199\180", "\226\132\49\234\58")].bodyForce:Destroy();
		end);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\126\180\199\21\247\28\93\217\108\185\235\20\234\87\8", "\56\186\24\208\132\122\153\114")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\30\33\67\199\147", "\226\163\118\64\49")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\192\62\167\24\235\137\111", "\125\153\172\95\222")].Character;
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\206\226\223\168\138", "\131\27\166\131\173\141\186")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\102\74\98\163", "\71\147\19\39")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\50\231\191\246\186", "\66\101\90\134\205\211\138\154")]:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\52\89\116\173\139\40\21\72", "\71\124\44\25\204\229"));
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\239\36\1\146", "\217\114\154\73\36\162")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\163\190\142\14\134\14\57\166\174\164\14\134\19\121\245", "\96\92\197\218\205\97\232")].health = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\31\177\200\175", "\159\94\106\220\237")].HealthChanged:Connect(function(h)
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\53\59\101\140\54\40\124\137\59\41\98\138\63\59\102\131\59\38\111\136\62\65\19", "\35\205\122\100")] and (h < TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\76\10\2\242", "\39\194\57\103")].MaxHealth)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\238\49\20\86", "\174\194\155\92\49\102\204")].Health = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\157\84\50\215", "\142\164\232\57\23\231\170")].MaxHealth;
		end
	end);
end
local function startBoxFly()
	if boxFlyConnection then
		return;
	end
	boxFlyConnection = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\191\210\206\23\165\188\213\254\23\242\250", "\114\215\202\188\157")].RenderStepped:Connect(function()
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\170\253\68\247\211", "\229\81\197\146\48\210\227\139")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\125\99\92\255\194\98\115\172\115\121\86\246\223\24\6", "\54\226\50\59\26\179\155\61")]) then
			if boxFlyBodyVel then
				boxFlyBodyVel:Destroy();
				boxFlyBodyVel = nil;
			end
			return;
		end
		if (not boxFlyBodyVel or not boxFlyBodyVel.Parent) then
			boxFlyBodyVel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\232\49\60\65\41\207\50\55\91\22\222\39", "\127\170\94\88\56"));
			boxFlyBodyVel.MaxForce = Vector3.new(4000, 4000, 4000);
			boxFlyBodyVel.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\200\187\214\253\109", "\198\128\167\212\162\216\93\153")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\51\246\155\250", "\190\202\90\132")] = Vector3.zero;
		local look, right, up = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\216\126\210\176\39\194\137", "\70\231\185\19\183\194")].CFrame.LookVector, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\193\233\161\161\218\133\180", "\211\187\160\132\196")].CFrame.RightVector, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\129\226\248\90\189\183\124", "\146\76\224\143\157\40\220")].CFrame.UpVector;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\108\179\96\143\55\238\78\107\133\119\180\47\247\88\122\243\34", "\158\59\31\214\18\198\89")]:IsKeyDown(Enum.KeyCode.W) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\0\85\79\13", "\106\61\105\39")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\183\41\170\83", "\18\133\222\91\143\99\162")] + look;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\44\169\76\240\50\83\199\99\12\169\76\207\53\64\215\50\111", "\178\23\95\204\62\185\92\35")]:IsKeyDown(Enum.KeyCode.S) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\255\205\179\13", "\61\65\150\191\150")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\220\155\252\135", "\170\42\181\233\217\183\97")] - look;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\104\234\199\91\69\220\110\251\230\119\89\218\114\236\208\55\27", "\43\172\27\143\181\18")]:IsKeyDown(Enum.KeyCode.A) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\32\181\252\45", "\29\179\73\199\217")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\168\111\136\41", "\173\25\193\29")] - right;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\99\82\13\132\4\198\109\78\67\82\13\187\3\213\125\31\32", "\24\58\16\55\127\205\106\182")]:IsKeyDown(Enum.KeyCode.D) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\14\197\28\112", "\64\199\103\183\57")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\70\65\28\163", "\147\68\47\51\57")] + right;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\92\25\46\175\78\153\90\8\15\131\82\159\70\31\57\195\16", "\32\233\47\124\92\230")]:IsKeyDown(Enum.KeyCode.Space) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\72\144\254\236", "\153\235\33\226\219\220\174")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\84\73\87\209", "\114\225\61\59")] + up;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\96\33\159\245\125\52\152\200\64\33\159\202\122\39\136\153\35", "\237\188\19\68")]:IsKeyDown(Enum.KeyCode.LeftShift) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\225\252\93\176", "\128\157\136\142\120")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\12\151\27\254", "\157\210\101\229\62\206\169\50")] - up;
		end
		boxFlyBodyVel.Velocity = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\47\93\247\73", "\173\45\70\47\210\121\200\121")].Magnitude > 0) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\182\151\20\97", "\49\81\223\229")].Unit * 50)) or Vector3.zero;
	end);
end
local function stopBoxFly()
	if boxFlyConnection then
		boxFlyConnection:Disconnect();
		boxFlyConnection = nil;
	end
	if boxFlyBodyVel then
		boxFlyBodyVel:Destroy();
		boxFlyBodyVel = nil;
	end
end
local function teleportToNearest()
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\137\182\225\119\214", "\149\82\230\217")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\23\42", "\202\88\50\26")] = getClosestEntity();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\60\182", "\55\85\25\134\183\229")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\59\26\187\163\120", "\72\27\84\117\207\134")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\131\4", "\95\207\166\52\93\109\55\229")].CFrame * CFrame.new(0, 3, 0);
	end
end
local function teleportToSpecificPlayer(plrName)
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\204\41\150\173\102", "\205\189\163\70\226\136\86")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\221\151\168\64", "\139\34\177\229\141\112")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\225\121\173\213\49\254\61\228", "\176\67\141\24\212")]:FindFirstChild(plrName);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\213\86\175\127", "\141\179\185\36\138\79\52")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\55\77\230\171", "\195\155\91\63")].Character) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\83\138\172", "\57\182\35\175\156\173\179")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\174\171\154\95", "\216\189\194\217\191\111\100")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\133\91\76\117\62\69\164\74\115\123\63\94\157\79\83\96", "\42\205\46\33\20\80"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\24\108\231", "\215\49\104\73")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\27\9\28\147\68", "\104\182\116\102")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\248\185\177", "\222\70\136\156\129\222\88")].CFrame * CFrame.new(0, 3, 0);
		end
	end
end
local function getPlayerList()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\141\151\173\135\212", "\217\162\228\228")] = {};
	for _, plr in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\209\206\193\171\207\220\157\254", "\184\206\189\175")]:GetPlayers()) do
		if (plr ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\66\248\174\201\75\153\12", "\188\60\46\153\215\172\57")]) then
			table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\248\46\70\124\116", "\68\116\145\93\50\89")], plr.Name);
		end
	end
	if (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\81\185\183\179\3", "\51\207\56\202\195\150")] == 0) then
		table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\65\232\87\196\214", "\195\221\40\155\35\225\230\158")], LUAOBFUSACTOR_DECRYPT_STR_0("\142\115\201\25\232\14\199\100\195\75\235\75", "\98\166\29\166\57\152"));
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\27\146\222\120\249", "\93\201\114\225\170")];
end
local function getAllBadges()
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\239\244\252\48\231", "\142\140\128\155\136\21\215\165")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\164\21\74\165\123", "\218\33\205\102\62\128\75\152")] = {};
	for _, obj in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\116\76\207\229\228\122\93\193\179\164", "\150\148\27\62\164")]:GetDescendants()) do
		if (obj.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\0\232\238\199\39\200\253\193\48\237\239\210", "\160\66\137\138")) then
			if obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\34\194\49\186\15\235\88\100", "\16\96\163\66\223\95\138\42")) then
				table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\221\194\26\159\89", "\105\224\180\177\110\186")], obj);
			elseif obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\140\5\166\71\44", "\199\193\106\194\34\64\60\91")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\243\92", "\198\95\214\108")] = obj.PrimaryPart or obj:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\56\60\185\133\217\13\232\33", "\85\122\93\202\224\137\108\154"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\21\2", "\204\228\48\50\203\163")] then
					table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\190\90\179\74\31", "\88\190\215\41\199\111\47\181")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\114\28", "\190\52\87\44\41\16\161")]);
				end
			end
		end
	end
	for _, part in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\31\20\160\94\113", "\124\35\118\103\212\123\65")]) do
		if (part and part.Parent) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\228\163\171\59\12", "\60\92\139\204\223\30")].CFrame = part.CFrame * CFrame.new(0, 3, 0);
			task.wait(0.45);
		end
	end
	showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\4\28\235\138\192\53\71\175", "\165\70\125\143\237") .. #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\50\230\80\21\228", "\48\212\91\149\36")], 2);
end
local function spawnTour()
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\17\53\16\1\78", "\100\36\126\90")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\203\219\89\19\3\119\98", "\82\113\164\183\61\118\113\82")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\77\227\188\183\223\235\248\71\180\231", "\138\155\34\145\215\196\175")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\153\248\30", "\160\212\153\110\162\105\91\61")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\55\184\212\179\40\171\220\165\125\250", "\191\192\88\202")].Map:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\66\221\232\9\6\223", "\172\17\173\137\126\104")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\115\63\60\197\243\25\222\121\104\103", "\120\189\28\77\87\182\131")].Map.Spawns:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\255\61\16\231\28\235", "\183\172\77\113\144\114\152"));
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\119\52\237\71\215\72\173", "\109\157\24\88\137\34\165")] then
		return;
	end
	for _, spawn in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\78\176\68\183\47\194\248", "\231\200\33\220\32\210\93")]:GetChildren()) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\87\85\168\103", "\87\60\56\38\141")] = nil;
		if spawn:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\226\164\25\63\240\164\24\46", "\90\160\197\106")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\186\57\51\18", "\34\131\213\74\22")] = spawn.Position;
		elseif spawn:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\29\182\18\53\60", "\80\80\217\118")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\71\24\56\85", "\29\101\40\107")] = (spawn.PrimaryPart and spawn.PrimaryPart.Position) or (spawn:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\231\244\195\182\45\196\231\196", "\125\165\149\176\211")) and spawn:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\107\2\57\228\181\72\17\62", "\229\41\99\74\129")).Position);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\10\242\110\99", "\75\83\101\129")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\68\78\196\183\27", "\176\146\43\33")].CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\210\226\84\254", "\27\200\189\145\113\206")] + Vector3.new(0, 3, 0));
			task.wait(0.3);
		end
	end
end
local function startYCheck()
	if yCheckConnection then
		yCheckConnection:Disconnect();
	end
	yCheckConnection = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\158\92\152\74\178\157\91\168\74\229\219", "\47\192\235\50\203")].Heartbeat:Connect(function()
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\200\21\197\169\140", "\233\64\167\122\177\140\188\212")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\123\249\84\174\236", "\144\47\20\150\32\139\220")].Position.Y < -20)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\45\178\237\159\208", "\132\80\66\221\153\186\224")].CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\160\43\3\254\22", "\219\38\207\68\119")].Position.X, 10, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\25\5\37\80\220", "\236\109\118\106\81\117")].Position.Z);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\60\201\59\235\189", "\206\141\83\166\79")].AssemblyLinearVelocity = Vector3.zero;
		end
	end);
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\167\201\195\223\235\162\254\197\240\227\236\141", "\158\141\201\189\170")] = nil;
local function setAntiAfk(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\158\205\146\114\54\150\210\132\104\57\145\219\151\104\51\245\169", "\45\119\208\153\219")] = state;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\87\176\28\50\210\82\135\26\29\218\28\244", "\115\180\57\196\117")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\114\68\253\113\194\33\227\61\114\94\177\0", "\160\82\28\48\148\48\164\74")]:Disconnect();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\222\169\47\27\11\200\243\178\40\52\72\147", "\109\163\176\221\70\90")] = nil;
	end
	if state then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\79\35\93\82\52\217\98\56\90\125\119\130", "\82\178\33\87\52\19")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\183\230\73\121\94\180\225\121\121\9\242", "\28\44\194\136\26")].Heartbeat:Connect(function()
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\118\72\18\51\218", "\174\28\25\39\102\22\234\59")] and (math.random() < 0.002)) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\70\31\204\139\214", "\230\169\41\112\184\174")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\203\122\170\87\68", "\47\170\164\21\222\114\116\179")].CFrame * CFrame.Angles(0, math.rad((math.random() - 0.5) * 2), 0);
			end
		end);
	end
end
if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\130\128\217\233\130\200\134", "\182\157\231\237")] then
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\255\1\175\225\255\73\240", "\192\149\154\108")].OnClientEvent:Connect(function(tbl)
		if (typeof(tbl) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\237\248\229\44\56", "\97\153\153\135\64\93\86")) then
			return;
		end
		for _, data in pairs(tbl) do
			if (data and data.part) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\95\192\60\188\121", "\185\102\62\178\72\153\73\235")] = data.part;
				if (typeof(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\187\57\166\49\234", "\210\20\218\75")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\155\233\21\122\82\30", "\84\232\157\103\19\60\121")) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\114\96\87\89\35", "\35\124\19\18")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\92\6\205\68\244\82\23\195\18\180", "\55\132\51\116\166")]:FindFirstChild(TABLE_TableIndirection["part%0"], true);
				end
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\61\175\96\65\110", "\157\168\92\221\20\100\94")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\208\231\11\95\137", "\22\168\177\149\127\122\185")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\154\168\62\79\243", "\159\215\199\90\42"))) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\206\199\40\182\98", "\147\82\175\174\70")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\131\31\40\4\71", "\33\119\226\109\92")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\151\135\115\247", "\155\218\230\26\153"));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\19\9\215\83\66", "\163\118\114\123")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\231\249\190\240\178", "\213\130\134\144\208")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\61\20\58\0\41", "\73\155\92\125\84\37\25\61")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\99\195\254\214\126\64\208\249", "\46\33\162\141\179")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\173\164\51\109\12", "\72\60\204\205\93")]) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\197\208\160\13\126", "\78\196\164\162\212\40")].PrimaryPart or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\204\219\74\183\153", "\199\59\173\169\62\146\169\192")]:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\21\164\175\166\7\164\174\183", "\195\87\197\220"));
				end
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\240\179\167\144\44", "\84\209\145\193\211\181\28\156")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\226\60\156\130\129", "\167\177\131\78\232")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\138\12\152\66\52\73\28\209", "\165\200\109\235\39\100\40\110")) and not shouldIgnore(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\123\243\60\86\217", "\115\233\26\129\72")])) then
					data.part = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\15\197\147\161\40", "\132\24\110\183\231")];
					ValidEntities[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\112\18\167\31\228", "\35\206\17\96\211\58\212\22")]] = data;
					createESP(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\207\155\45\205\232", "\169\83\174\233\89\232\216\200")], data);
				end
			end
		end
	end);
end
local function registerEntity(obj)
	if (not obj or not obj.Parent) then
		return;
	end
	if (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\113\29\95\56\180", "\118\60\114\59\93\216\171\137")) and isUUIDName(obj.Name)) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\200\77\234\249\2", "\220\50\169\36\132")] = obj:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\220\134\5\191", "\209\145\231\108"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\32\6\9\212\192\103\9", "\66\57\65\104\109\184\165")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\10\243\80\160\237", "\133\221\107\154\62")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\31\188\239\2\146", "\81\187\126\213\129\39\162")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\167\176\62\241\148\132\163\57", "\196\229\209\77\148")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\212\120\18\24\162", "\173\39\181\17\124\61\146")]) or obj.PrimaryPart or obj:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\88\221\224\39\184\123\206\231", "\232\26\188\147\66"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\224\232\31\127\16\164\182", "\19\117\129\134\123")] and not ValidEntities[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\2\199\18\56\38\102\83", "\67\67\99\169\118\84")]] and not shouldIgnore(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\43\235\75\95\179\188\230", "\214\98\74\133\47\51\214\153")])) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\79\100\117\54\7", "\55\106\46\16\20\19")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\89\186\160\36", "\115\41\219\210\80\86\94")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\72\231\30\222\62\229\25", "\91\192\41\137\122\178")],[LUAOBFUSACTOR_DECRYPT_STR_0("\90\42\206\237\91", "\136\55\69\170")]=obj};
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\228\0\127\134", "\173\131\157\112\90\182\147\77")] = getTypeName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\23\52\6\95\70", "\103\122\118\64")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\233\30\192\252\184\181\184", "\221\144\136\112\164\144")]);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\60\109\165\28\109", "\196\57\93\25")].typ = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\85\160\192\31", "\47\170\44\208\229")];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\67\170\27\94\183", "\87\40\34\222\122\123\135")].type = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\36\145\112\145", "\176\33\93\225\85\161")];
			ValidEntities[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\24\131\208\117\167\92\221", "\25\194\121\237\180")]] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\182\45\46\67\26", "\42\212\215\89\79\102")];
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\98\20\47\234\96\102\213\155\116\0\85\159", "\151\215\49\68\112\175\46\39")] then
				createESP(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\124\184\72\129\67\56\230", "\237\38\29\214\44")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\39\99\7\54\22", "\225\118\70\23\102\19\38\213")]);
			end
		end
	elseif (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\2\91\78\39\105\245\162\52", "\208\64\58\61\66\57\148")) and isUUIDName(obj.Name)) then
		if (not ValidEntities[obj] and not shouldIgnore(obj)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\191\178\69\172\238", "\36\137\222\198")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\241\245\240\54", "\41\129\148\130\66\168\194\98")]=obj};
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\51\145\85\19", "\204\113\74\225\112\35\72\16")] = getTypeName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\31\21\33\161\239", "\128\17\126\97\64\132\223\211")], obj);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\135\41\9\255\214", "\104\218\230\93")].typ = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\37\194\51\35", "\22\19\92\178")];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\10\87\47\248\225", "\209\190\107\35\78\221")].type = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\55\198\164\134", "\182\224\78\182\129")];
			ValidEntities[obj] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\12\177\15\147\96", "\36\141\109\197\110\182\80\31")];
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\57\38\184\59\18\194\40\58\162\58\121\179", "\92\131\106\118\231\126")] then
				createESP(obj, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\66\42\164\102\237", "\67\221\35\94\197")]);
			end
		end
	end
end
local function scanMapChunked()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\189\48\31\21", "\58\37\220\64")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\131\230\7\167\188\221\143\241\73\228", "\204\188\236\148\108\212")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\243\221\79", "\210\190\188\63\147\148\114\97"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\207\182\144\84\229", "\113\213\166\197\228")] = nil;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\63\210\22\26", "\129\173\94\162\51\42\229\99")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\61\1\37\243\13", "\214\61\84\114\81")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\226\12\0\157", "\182\39\131\124\37\173")]:GetDescendants();
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\20\169\0\236\36", "\20\90\125\218\116\201")] = {};
		for _, c in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\6\9\140\57\62\92\38\12\94\215", "\61\69\105\123\231\74\78")]:GetChildren()) do
			if ((c.Name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\229\168\168\25\214\216\163", "\183\177\205\218\107")) and (c ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\60\140\102\201\36\64\96", "\86\101\80\237\31\172")].Character)) then
				table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\49\189\64\63\153", "\189\51\88\206\52\26\169")], c);
			end
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\134\27", "\53\70\163\43")] = 0;
	for _, obj in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\171\180\12\51\99", "\42\161\194\199\120\22\83")]) do
		if isUUIDName(obj.Name) then
			registerEntity(obj);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\185\8", "\94\192\156\56\82\18")] += 1
		if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\254\84", "\226\61\219\100\45\29\109")] % 50) == 0) then
			task.wait();
		end
	end
end
task.spawn(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\162\48\5\170", "\32\154\195\64")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\21\72\212\205\49\240\25\95\154\142", "\65\145\122\58\191\190")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\220\22\244", "\163\145\119\132\25")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\14\216\205\75\31\0\201\195\29\95", "\56\111\97\170\166")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\166\126\150", "\23\235\31\230\89\79\236\141"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\93\211\230\158", "\143\178\60\163\195\174\79")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\6\241\130\40", "\85\114\103\129\167\24\97")].DescendantAdded:Connect(function(obj)
			if not (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\230\134\163\233\34\53\22\236\151\162\238\33\43\30\247\247\220", "\103\91\179\210\236\175\99")] or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\198\98\199\117\151\129\160\117\208\118\189\0", "\226\57\149\50\152\48\217\192")]) then
				return;
			end
			if isUUIDName(obj.Name) then
				task.defer(registerEntity, obj);
			end
		end);
	end
end);
task.spawn(function()
	while true do
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\153\30\129\221\98\158\7\145\222\109\141\8\130\222\103\233\122", "\155\35\204\74\206")] or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\241\75\24\226\153\227\89\11\226\147\135\43", "\167\215\162\27\71")]) then
			pcall(scanMapChunked);
		end
		task.wait(((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\182\255\13\27\28\177\230\29\24\19\162\233\14\24\25\198\155", "\93\93\227\171\66")] or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\250\252\145\27\9\239\163\4\236\232\235\110", "\225\72\169\172\206\94\71\174")]) and ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\97\107\202\219\18\97\97\119\17\182", "\40\45\50\52\135\148\80")] and 10) or 6)) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\42\217\175\205\59\207\174\199\92\183", "\226\130\121\134")] and 20) or 12);
	end
end);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\60\208\107\169\58\192\110\133\124\147", "\27\232\89\163")] = 0;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\188\206\240\241\187\214\202\247\172\133\147", "\163\148\201\160")].Heartbeat:Connect(function(dt)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\182\216\217\152\43\127\167\196\195\153\64\14", "\101\62\229\136\134\221")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\64\249\251\91\34", "\126\18\47\150\143")]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\203\219\108\19\114\28\161\195\141\44", "\127\212\174\168\28\82\17")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\175\79\199\43\169\95\194\7\239\12", "\183\106\202\60")] + dt;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\39\225\90\254\21\1\79\47\183\26", "\98\58\66\146\42\191\118")] < 0.35) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\245\111\200\109\205\217\145\253\57\136", "\186\228\144\28\184\44\174")] = 0;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\27\23\83\86", "\118\102\126\122")] = {};
	for part in pairs(ValidEntities) do
		if (not part or not part.Parent) then
			table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\14\133\162\248", "\200\188\107\232\135")], part);
		else
			pcall(updateBillboard, part);
		end
	end
	for _, part in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\249\172\14\107", "\159\76\156\193\43\91")]) do
		pcall(removeEntity, part);
	end
end);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\32\15\108\160\91\6\186", "\138\25\76\110\21\197\41\35")].CharacterAdded:Connect(function()
	task.wait(0.55);
	updateRoot();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\204\23\112\20\107\147\123\208\6\106\31\122\251\30", "\222\46\156\82\53\80\52")] then
		startInfinite();
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\255\32\206\85\23\252\32\204\85\22\241\56\205\75\30\254\62\202\88\30\244\90\184", "\20\91\176\127\136")] then
		setupNoFallDamage();
	end
	startYCheck();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\197\28\138\44\133\197\221\23\128\36\133\213\220\13\129\79\244", "\196\151\144\72\197\106")] then
		if autofarmRunning then
			stopAutofarm();
			task.wait(0.1);
		end
		startAutofarm();
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\253\176\109\36\226\161\107\49\252\179\109\49\224\161\112\56\235\164\23\68", "\50\116\174\224")] then
		task.wait(0.3);
		updateAllPlayerESP();
	end
	applyWalkSpeed();
	applyJumpPower();
end);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\77\37\242\36\250\230\91\50\238\49\241\234\77\50\235\68\148", "\165\181\24\96\167\97")] = LUAOBFUSACTOR_DECRYPT_STR_0("\164\57\40\84\191\119\115\11\171\63\57\65\168\52\52\81\168\55\57\72\160\99\36\93\182\98\48\75\173\41\57\86\226\33\41\69", "\36\204\77\92");
local function setupRejoinQueue()
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\98\17\242\40\16\120\10\232\36\11\98\4\248\47\31\101\23\248\37\123\23", "\97\94\39\91\189")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\99\247\83\244", "\153\85\17\155\118\196\114")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\192\254\242\158\14\244\214\233\238\139\5\248\192\233\235\254\96", "\81\167\149\187\167\219")] or LUAOBFUSACTOR_DECRYPT_STR_0("\241\24\60\209\225\163\67\103\198\224\252\9\44\216\250\236\8\50\196\254\245\66\48\216\232\182\0\39\192\246\252\30\102\205\231\248", "\146\153\108\72\161");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\27\233\226\110\107", "\94\101\116\141\135\75\91")] = string.format([[
		task.spawn(function()
			local g = (getgenv and getgenv()) or _G
			g.GreedyHudzell_v4 = nil
			g.GreedyHudzell_Ready = nil
			g.GreedyHudzell_JobId = nil
			pcall(function()
				if not game:IsLoaded() then game.Loaded:Wait() end
			end)
			local Players = game:GetService("Players")
			local lp = Players.LocalPlayer
			while not lp do task.wait(0.1); lp = Players.LocalPlayer end
			pcall(function() lp:WaitForChild("PlayerGui", 60) end)
			task.wait(1.25)
			local urls = { "%s", "https://greedyhudzell.xyz/loader.lua", "https://greedyhudzell.xyz/script.lua" }
			local loaded = false
			for _, u in ipairs(urls) do
				local ok, err = pcall(function()
					local src = game:HttpGet(u)
					assert(type(src) == "string" and #src > 100, "empty script")
					loadstring(src)()
				end)
				if ok then
					loaded = true
					print("[Greedy] queue loaded from", u)
					break
				else
					warn("[Greedy] queue try fail", u, err)
				end
				task.wait(0.5)
			end
			if not loaded then
				warn("[Greedy] queue_on_teleport: all URLs failed")
			end
		end)
	]], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\178\15\129\21", "\118\82\192\99\164\37\155\143")]);
	if queue_on_teleport then
		queue_on_teleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\180\79\42\103\235", "\79\66\219\43")]);
	elseif (syn and syn.queue_on_teleport) then
		syn.queue_on_teleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\79\247\20\88\16", "\113\125\32\147")]);
	elseif (getgenv and getgenv().queue_on_teleport) then
		getgenv().queue_on_teleport(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\221\205\70\14\228", "\212\188\178\169\35\43")]);
	else
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\133\204\111\47\187\239\100\23\254\250\104\47\171\238\66\37\176\212\105\47\178\238\109\37\172\255\61\36\177\255\61\43\168\234\116\38\191\233\113\47\254\228\115\106\170\227\116\57\254\238\101\47\189\254\105\37\172", "\74\222\139\29"));
	end
end
local function getExecutorInfo()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\221\172\7\231\88", "\136\39\165\201\100\194\104\18")] = LUAOBFUSACTOR_DECRYPT_STR_0("\70\225\71\120\220\241\33", "\178\19\143\44\22\179\134\79");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\136\184\1\13\129", "\228\125\225\203\117\40\177\151")] = {{LUAOBFUSACTOR_DECRYPT_STR_0("\219\176\196\117\154\19\34\168\145", "\71\136\201\170\20\234\96"),function()
		return syn ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\56\54\114\196", "\196\115\68\28\168\166\144"),function()
		return (krnl ~= nil) or (identifyexecutor and (select(1, pcall(identifyexecutor)) == LUAOBFUSACTOR_DECRYPT_STR_0("\243\65\226\112", "\49\184\51\140\28\101\148")));
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\199\237\155\194\208\249\10\189\245\252\140", "\234\148\142\233\171\160\141\39"),function()
		return (is_sirhurt_closure ~= nil) or (identifyexecutor and tostring(pcall(identifyexecutor) and select(2, pcall(identifyexecutor))):find(LUAOBFUSACTOR_DECRYPT_STR_0("\98\27\152\126\157\230", "\37\49\120\234\23\237\146")));
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\155\78\110\173\62\182", "\92\221\34\27\213\75\197"),function()
		return fluxus ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\23\56\226\110\37", "\68\83\93\142\26"),function()
		return (delta ~= nil) or (getexecutorname and tostring(getexecutorname()):lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\134\171\194\25\13", "\207\226\206\174\109\108\101")));
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\153\77\43\250\241\69", "\52\212\44\79\147\132\40\154"),function()
		return (madium ~= nil) or (shared and shared.madium) or (getexecutorname and tostring(getexecutorname()):lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\226\161\202\208\250\173", "\185\143\192\174")));
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\138\68\46\210", "\129\221\37\88\183\152"),function()
		return wave ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\108\232\220\19\34\61", "\92\63\135\176\114\80"),function()
		return solara ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\14\245\91\11", "\43\86\144\53\100\95"),function()
		return xeno ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\159\250\194\53\48", "\60\220\149\166\80\72\151"),function()
		return codex ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\169\36\186\241\152\58\176\252", "\146\236\72\223"),function()
		return electron ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\142\246\80\194\200\3\183\236\73", "\112\222\153\36\163\187"),function()
		return potassium ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\242\252\225\68", "\197\164\147\141\48\68"),function()
		return volt ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\151\92\5\4\60\23\181\64", "\126\193\57\105\107\95"),function()
		return velocity ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\92\28\195\37\47\161\58\120\9", "\85\17\125\160\118\95\205"),function()
		return macsploit ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\219\18\236\242\255\22\242\254", "\155\136\119\128"),function()
		return seliware ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\116\211\2\231\242\164\194\119", "\34\59\171\123\128\151\202\226"),function()
		return oxygen ~= nil;
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\89\247\127\198\92\43\56\221", "\88\24\133\28\163\41"),function()
		return (arceus ~= nil) or (Arceus ~= nil);
	end},{LUAOBFUSACTOR_DECRYPT_STR_0("\219\178\244\217\7\244\174\254", "\104\147\203\144\171"),function()
		return hydrogen ~= nil;
	end}};
	for _, row in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\27\79\169\14\66", "\221\43\114\60")]) do
		local ok, yes = pcall(row[2]);
		if (ok and yes) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\97\126\70\187\148", "\164\161\25\27\37\158")] = row[1];
			break;
		end
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\93\201\180\90\99", "\127\83\37\172\215")] == LUAOBFUSACTOR_DECRYPT_STR_0("\227\208\204\27\69\29\196", "\131\182\190\167\117\42\106\170")) then
		for _, fn in ipairs({identifyexecutor,getexecutorname,get_executor_name}) do
			if fn then
				local ok, name = pcall(fn);
				if (ok and name and (tostring(name) ~= "")) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\155\255\189\28\213", "\188\66\227\154\222\57\229")] = tostring(name);
					break;
				end
			end
		end
	end
	local features, total = 0, 11;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\59\94\86\251\107\118\11", "\144\24\83\59\53")] = {(queue_on_teleport or (syn and syn.queue_on_teleport)),hookfunction,getrawmetatable,loadstring,getgenv,getrenv,(isfile or readfile),writefile,setclipboard,(request or http_request or (syn and syn.request)),(Drawing or (Drawing and Drawing.new))};
	for _, c in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\136\176\206\16\63\197\229", "\123\76\224\213\173")]) do
		if c then
			features = features + 1;
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\203\221\173\32\143\153", "\196\79\170\169")] = features / total;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\46\53\109\140\41\49\56\211", "\29\227\91\69")] = LUAOBFUSACTOR_DECRYPT_STR_0("\241\192\254\129\177\86\39\208\221\170", "\87\191\175\222\210\196\38");
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\233\99\235\204\139\3", "\174\51\136\23\130\163")] >= 0.9) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\0\34\26\237\231\41\80\98", "\149\93\117\82\106\130")] = LUAOBFUSACTOR_DECRYPT_STR_0("\192\168\17\234\139\213\168\13\246\196\244\169\93\174", "\171\134\221\125\134") .. features .. "/" .. total .. ")";
	elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\37\237\127\255\245\116", "\144\208\68\153\22")] >= 0.6) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\15\53\28\202\68\3\139\177", "\174\129\122\69\108\165\54\119")] = LUAOBFUSACTOR_DECRYPT_STR_0("\212\216\222\224\236\208\154\218\236\205\202\230\235\201\154\161", "\137\153\189\186") .. features .. "/" .. total .. ")";
	elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\207\9\76\30\139\77", "\37\113\174\125")] >= 0.3) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\81\84\185\94\86\80\236\1", "\201\49\36\36")] = LUAOBFUSACTOR_DECRYPT_STR_0("\44\47\166\118\68\29\191\96\20\33\184\100\68\102", "\16\100\78\202") .. features .. "/" .. total .. ")";
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\169\96\230\140\80\95\238\237", "\203\221\220\16\150\227\34\43")] = LUAOBFUSACTOR_DECRYPT_STR_0("\215\43\108\56\200\49\107\104\244\54\111\56\179", "\24\155\68\27") .. features .. "/" .. total .. ")";
	end
	task.spawn(function()
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\95\212\75\255\0", "\50\218\48\176")] = game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\70\70\192\224\72\14\1\29\195\245\90\91\0\74\205\234\20\85\94\91\155\227\79\85\90\71\199\191\94\76\94\94\219\249\79\71", "\52\46\50\180\144\59"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\48\49\118\67\105", "\154\109\81\69\23\102\89")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\223\200\68\114\60\232\221\213\87\68\124\171", "\89\154\171\188\52\33")]:JSONDecode(TABLE_TableIndirection["body%0"]);
			if (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\21\24\55\179\68", "\86\150\116\108")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\99\190\46\162\196", "\38\23\223\76\206\161")) then
				for _, ex in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\200\76\58\230\250", "\166\184\169\56\91\195\202")]) do
					if ((type(ex) == LUAOBFUSACTOR_DECRYPT_STR_0("\179\177\115\40\199", "\162\199\208\17\68")) and (type(ex.title) == LUAOBFUSACTOR_DECRYPT_STR_0("\194\242\77\8\226\9", "\123\177\134\63\97\140\110\48"))) then
						if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\76\241\192\183\75", "\137\80\52\148\163\146\123\21")]:lower():find(ex.title:lower(), 1, true) or (ex.title:lower():find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\216\166\253\70\168", "\99\152\160\195\158")]:lower(), 1, true))) then
							if ex.uncPercentage then
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\18\248\8\88\110", "\95\231\87\182\94\125")].GreedyWeaoUnc = ex.uncPercentage;
							end
							if (ex.detected ~= nil) then
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\236\214\2\76\45", "\115\56\169\152\84\105\28")].GreedyWeaoDetected = ex.detected;
							end
							break;
						end
					end
				end
			end
		end);
	end);
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\253\132\76\243\21", "\37\94\133\225\47\214")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\193\70\78\88\198\66\27\7", "\62\55\180\54")], features, total;
end
local EXECUTOR_NAME, EXECUTOR_SUPPORT = getExecutorInfo();
local function createUI()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\239\33\131\18", "\123\155\154\72\166\34\36\206")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\245\220\42\166\32\200\248\45\170", "\69\166\191\88\195"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\111\39\7\214", "\234\217\26\78\34\230\214\78")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\151\13\237\82\78\169\55\253\83\80\181\19\228\98\99", "\42\208\127\136\55");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\77\192\108\246", "\47\17\56\169\73\198\140")].ResetOnSpawn = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\32\85\6\253", "\224\66\85\60\35\205")].ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\47\117\30\98", "\179\152\90\28\59\82\45")].IgnoreGuiInset = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\231\53\69\29", "\36\201\146\92\96\45")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\202\252\92\193\229\185\161", "\145\137\166\157\37\164\151\156")]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\62\21\70\101\222\102\41\12\78", "\20\110\121\39\28\187"));
	mainGui = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\228\13\98\4", "\194\110\145\100\71\52\124")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\234\69\162\193\92\11", "\118\18\137\36\206\164\121\59")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\203\240\208\23\77\242\220", "\44\158\185\131\116"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\137\220\123\222\226\33", "\17\44\234\189\23\187\199")].Scale = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\87\225\57\20\95\242\47\114\46", "\106\87\30\190")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\239\13\112\207\18\18", "\188\182\140\108\28\170\55\34")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\161\225\166\140", "\131\188\212\136")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\7\100\52\19\217", "\54\233\107\17\70")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\210\36\62\23\225\246\46\46\6\208", "\164\144\72\75\101"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\135\90\200\154\14", "\62\156\235\47\186\191")].Size = 0;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\230\251\51\137\247", "\140\109\138\142\65\172\199\76")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\87\176\21\253\200\186\240\27\231", "\212\151\62\215\125\137\161")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\176\10\158\57\167\22\201\101", "\236\85\198\111")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\56\35\118\248\89", "\60\126\81\23\149"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\156\211\152\124\232\92\207\134", "\137\37\234\182\234\16")].Size = UDim2.new(1, 0, 1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\29\92\33\0\67\148\230\169", "\195\153\107\57\83\108\34\237")].BackgroundColor3 = Color3.new(0, 0, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\13\128\209\133\128\230\57\75", "\159\28\123\229\163\233\225")].BackgroundTransparency = 0.3;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\2\48\7\139\21\44\80\215", "\117\231\116\85")].ZIndex = 50;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\76\67\41\112\45\67\3\107", "\28\76\58\38\91")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\187\40\242\177", "\143\216\206\65\215\129\179")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\94\6\251\173\55\89", "\156\194\18\105")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\201\161\37\237\34\204\173\38\239\43", "\71\128\204\68\138"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\126\166\55\125\172\246", "\198\141\50\201\80\18\137")].Size = UDim2.new(0, 110, 0, 110);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\98\130\91\78\122\162", "\146\141\46\237\60\33\95")].Position = UDim2.new(0.5, -55, 0.36, -55);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\133\254\20\178\154\142", "\191\190\201\145\115\221")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\63\226\64\114\139\13", "\84\91\115\141\39\29\174\61")].Image = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\204\116\210\41\202\119\184\70", "\157\118\131\51")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\114\50\172\94\59\190", "\30\142\62\93\203\49")].ImageTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\143\56\140\168\91\243", "\126\195\195\87\235\199")].ScaleType = Enum.ScaleType.Fit;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\170\85\177\246\238\46", "\30\105\230\58\214\153\203")].ZIndex = 51;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\62\249\181\15\238\67", "\203\115\114\150\210\96")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\250\89\45\223\237\69\122\131", "\95\179\140\60")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\206\42\226\208\31\225\128", "\176\64\154\67\150\188\122\196")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\17\76\60\153\98\252\39\76\40", "\157\69\41\68\237\46"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\206\238\228\226\213\128\124", "\165\76\154\135\144\142\176")].Size = UDim2.new(0, 360, 0, 36);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\25\78\19\31\69\252\116", "\217\68\77\39\103\115\32")].Position = UDim2.new(0.5, -180, 0.36, 65);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\184\165\201\222\244\154\247", "\191\199\236\204\189\178\145")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\178\84\91\122\131\24\31", "\47\22\230\61")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\154\15\60\22\53\140\21\49\13\46\150\100\72", "\89\98\211\65\120")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\246\4\70\17\171\82\239", "\119\223\162\109\50\125\206")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\10\8\79\4\90\82", "\97\127\98\109\34")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\62\121\36\161\31\114\90", "\122\87\106\16\80\205")].Font = Enum.Font.GothamBlack;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\60\224\226\239\233\181\152", "\168\128\104\137\150\131\140\144")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\136\209\227\164\72\79\87", "\103\211\220\184\151\200\45\106")].TextTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\62\41\236\214\242\246\111", "\95\220\106\64\152\186\151\211")].ZIndex = 51;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\178\187\171\245\211\148\33", "\177\17\230\210\223\153\182")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\164\239\154\61\215\22\111\226", "\111\74\210\138\232\81\182")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\31\37\161\199\2\77", "\39\125\126\87\227\160")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\114\173\191\128\81", "\237\52\223\222"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\250\146\242\181\82\229", "\119\213\155\224\176\210")].Size = UDim2.new(0, 300, 0, 7);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\226\144\17\117\237\89", "\142\216\131\226\83\18\200\105")].Position = UDim2.new(0.5, -150, 0.78, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\5\233\224\200\164\125", "\134\79\100\155\162\175\129\77")].BackgroundColor3 = Color3.fromRGB(30, 25, 10);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\65\183\201\206\5\245", "\139\169\32\197")].ZIndex = 51;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\114\201\50\23\224\185\239", "\173\16\168\64\85\135\156\223")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\65\241\227\228\90\44\0\69", "\37\117\55\148\145\136\59\85")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\2\62\144\41\37\25\182\52", "\70\87\119\211"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\215\17\28\160\118\225", "\83\209\182\99\94\199")]).CornerRadius = UDim.new(1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\214\146\127\209\219\140\28\136", "\57\184\183\224")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\222\205\226\162\33", "\226\152\191\131\207\68\148\117"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\74\175\244\92\22\71\248\130", "\53\122\43\221\178")].Size = UDim2.new(0, 0, 1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\169\12\56\161\31\9\99\190", "\70\142\200\126\126\200\115\101")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\38\66\207\233\22\126", "\140\51\78\39\162")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\195\201\210\248\239\249\142\94", "\171\110\162\187\148\145\131\149")].ZIndex = 52;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\12\57\104\75\189\1\110\30", "\34\209\109\75\46")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\248\169\158\253\86\169", "\154\115\153\219\220")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\28\56\170\17\48\28\187\59", "\222\73\113\233\126\66\114"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\29\179\36\30\112\26\137\212", "\172\228\124\193\98\119\28\118")]).CornerRadius = UDim.new(1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\223\135\74\13\200\146\11\105", "\46\89\176\230")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\207\15\64\51\168\13\249\15\84", "\108\155\106\56\71\228"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\85\210\53\238\76\52\136\146", "\173\162\58\179\81\186\52\64")].Size = UDim2.new(0, 300, 0, 18);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\79\255\195\127\28\81\123\16", "\37\94\32\158\167\43\100")].Position = UDim2.new(0.5, -150, 0.78, 14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\53\82\53\47\233\162\129\106", "\214\164\90\51\81\123\145")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\164\162\196\47\179\183\133\75", "\160\123\203\195")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\20\113\129\52\112\216", "\85\232\124\20\236\81")].TextDim;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\196\180\34\74\89\223\240\118", "\30\33\171\213\70")].Font = Enum.Font.Code;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\207\54\221\76\144\212\114\137", "\24\232\160\87\185")].TextSize = 12;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\63\240\253\18\198\36\180\169", "\70\190\80\145\153")].ZIndex = 51;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\249\230\250\26\47\24\18\166", "\108\55\150\135\158\78\87")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\18\247\232\196\33\199\65\162", "\64\190\100\146\154\168")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\164\143\29\254\238", "\35\139\197\230\115\219\222\114")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\30\194\235\224\219", "\137\88\176\138\141\190\21"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\241\67\198\244\118", "\209\70\144\42\168")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\33\236\160\94\31\25\2\233\166\71", "\112\108\141\201\48\72");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\64\30\93\102\46", "\30\171\33\119\51\67")].Size = UDim2.new(0, 780, 0, 520);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\175\18\220\200\168", "\152\54\206\123\178\237")].Position = UDim2.new(0.5, -390, 0.5, -260);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\218\162\1\157\219", "\86\140\187\203\111\184\235\174")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\0\115\9\66\136\88", "\39\173\104\22\100")].Background;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\223\83\125\94\227", "\211\34\190\58\19\123")].Visible = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\11\226\228\153\154", "\158\35\106\139\138\188\170")].Active = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\200\238\68\0\86", "\37\102\169\135\42")].Draggable = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\207\23\248\120\103", "\192\235\174\126\150\93\87\231")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\81\119\116\139", "\184\61\36\30\81\187\170")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\42\225\152\200\3\135\26\218", "\233\127\168\219\167\113"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\117\130\124\114\157", "\61\62\20\235\18\87\173\124")]).CornerRadius = UDim.new(0, 14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\68\73\196\143\18", "\170\34\37\32\170")].ClipsDescendants = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\246\45\237\50\69\54\128\105", "\46\83\165\89\159\93")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\60\209\59\184\223\193\2\253", "\174\105\152\104\204\173"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\122\254\29\176\66\239\74\239", "\111\223\41\138")].Color = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\48\63\137\21\62\158", "\80\103\88\90\228\112\27\174")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\245\238\184\225\11\0\68\14", "\97\62\166\154\202\142\96\101")].Thickness = 1.5;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\215\193\12\50\171\225\144\78", "\93\192\132\181\126")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\25\132\26\237\137", "\98\151\120\237\116\200\185")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\3\103\168\131\236\183\250\97\90", "\136\68\106\19\196\230\174\214")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\221\47\90\141\217", "\157\155\93\59\224\188"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\112\221\66\192\91\200\92\128\41", "\46\165\25\169")].Size = UDim2.new(1, 0, 0, 42);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\224\163\193\131\31\214\38\172\231", "\183\84\137\215\173\230\93")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\120\240\41\72\64\64", "\28\74\16\149\68\45\101\112")].TitleBar;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\236\0\80\176\200\12\247\81\12", "\138\109\133\116\60\213")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\17\161\95\72\64", "\49\109\112\200")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\233\247\92\81\204\160\217\204", "\206\188\190\31\62\190"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\79\100\13\187\197\2\188\12\22", "\206\41\38\16\97\222\135\99")]).CornerRadius = UDim.new(0, 14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\164\67\190", "\181\228\194\102\142\145\43")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\18\248\12\2\211", "\51\84\138\109\111\182\79"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\93\94\112", "\130\126\59\123\64\134")].Size = UDim2.new(1, 0, 0, 14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\233\87\108", "\92\118\143\114")].Position = UDim2.new(0, 0, 1, -14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\226\134\178", "\108\52\132\163\130\125")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\26\179\32\196\82\171", "\119\155\114\214\77\161")].TitleBar;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\37\165\233", "\217\215\67\128")].BorderSizePixel = 0;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\30\233\95", "\97\196\120\204\111\91")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\180\1\178\137\108\196\24\26\237", "\106\63\221\117\222\236\46\165")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\153\182\184\130\155\229", "\237\190\213\217\223")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\145\77\247\187\163\148\65\244\185\170", "\198\216\32\150\220"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\96\71\131\95\5\173", "\28\154\44\40\228\48\32\157")].Size = UDim2.new(0, 28, 0, 28);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\20\245\69\85\162\6", "\85\36\88\154\34\58\135\54")].Position = UDim2.new(0, 10, 0.5, -14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\165\140\189\70\242\30", "\215\46\233\227\218\41")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\88\131\233\251\88\36", "\148\125\20\236\142")].Image = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\83\25\221\159\21\131\72\44", "\199\109\28\94\146\192\92")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\91\38\207\198\169\126", "\204\30\23\73\168\169\140\78")].ScaleType = Enum.ScaleType.Fit;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\254\227\203\210\233\22", "\50\78\178\140\172\189\204\38")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\54\212\112\250\38\114\200\122\144", "\19\186\95\160\28\159\100")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\218\215\237\193\111\233", "\74\217\142\178\149\181")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\79\69\154\222\13\12\220\237\119", "\136\27\32\226\170\65\109\190"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\250\175\56\234\245\158", "\158\208\174\202\64")].Size = UDim2.new(1, -120, 1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\19\183\229\73\98\226", "\157\61\71\210")].Position = UDim2.new(0, 46, 0, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\104\116\29\167\20\160", "\144\152\60\17\101\211\49")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\126\239\255\172\132\158", "\161\174\42\138\135\216")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\234\170\15\197\201\161\74\232\216\188\16\197\193\180\74\128\219\236\68\144\131\232", "\160\173\216\106");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\77\116\66\171\182\217", "\147\233\25\17\58\223")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\36\5\22\213\115\30", "\86\46\76\96\123\176")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\152\123\244\177\5\220", "\70\221\204\30\140\197\32\236")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\1\82\237\247\112\7", "\149\131\85\55")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\137\54\179\18\31\164", "\59\121\221\83\203\102\58\148")].TextXAlignment = Enum.TextXAlignment.Left;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\32\63\176\37\30\245", "\59\197\116\90\200\81")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\161\251\206\59\223\169\253\135\110", "\94\157\200\143\162")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\50\253\128\234\53\182\242", "\194\158\91\147")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\152\23\3\166\250\224\184\6\20\188", "\149\204\114\123\210\184"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\53\115\220\46\212\15\147", "\42\163\92\29\158\90\186")].Size = UDim2.new(0, 28, 0, 28);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\47\73\56\49\196\122\145", "\95\161\70\39\122\69\170")].Position = UDim2.new(1, -70, 0.5, -14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\19\251\15\83\202\98\227", "\71\211\122\149\77\39\164")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\143\246\219\128\98\215", "\229\71\231\147\182")].Button;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\195\223\239\148\196\148\157", "\173\224\170\177")].Text = "-";
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\56\131\63\183\124\190\40", "\155\24\81\237\125\195\18")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\43\77\91\189\3\0", "\48\104\67\40\54\216\38")].Text;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\90\55\215\19\93\124\165", "\149\103\51\89")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\76\8\174\105\75\67\220", "\236\29\37\102")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\42\140\17\67\185\102\210", "\55\215\67\226\83")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\118\217\136\177\244\228\109\136\212", "\182\133\31\173\228\212")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\30\43\199\187\192\65\164\205", "\191\75\98\132\212\178\47\193"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\78\230\197\28\196\186\239", "\159\223\39\136\135\104\170")]).CornerRadius = UDim.new(0, 6);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\251\66\232\77\61\157\85\178\29", "\233\59\151\45\155\40\127")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\146\5\230\80\132\21\234\80\169\14", "\36\198\96\158"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\195\5\18\123\221\3\9\97\159", "\103\68\175\106\97\30\159\119")].Size = UDim2.new(0, 28, 0, 28);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\225\19\18\34\207\8\15\98\189", "\97\71\141\124")].Position = UDim2.new(1, -36, 0.5, -14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\213\189\45\52\137\205\188\123\97", "\81\203\185\210\94")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\208\41\160\81\23\224", "\112\177\184\76\205\52\50\208")].Danger;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\208\93\190\165\155\200\92\232\240", "\192\217\188\50\205")].Text = "X";
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\65\89\42\207\39\89\88\124\154", "\170\101\45\54\89")].TextColor3 = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\164\15\70\166\138\20\91\230\248", "\53\195\200\96")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\81\49\43\135\108\185\83\123\104", "\46\205\61\94\88\226")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\200\22\176\12\230\13\173\76\148", "\195\105\164\121")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\176\200\67\6\201\93\171\153\31", "\139\60\217\188\47\99")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\63\212\83\250\4\22\15\239", "\120\106\157\16\149\118"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\211\37\168\187\155\216\122\154\122", "\172\20\191\74\219\222\217")]).CornerRadius = UDim.new(0, 6);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\207\136\4\112\17\215\137\82\37", "\21\83\163\231\119")].MouseButton1Click:Connect(function()
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\33\197\15\153\209\181\246\2\49\223\1\157\220\162\255\120\68", "\187\93\116\145\64\223\144\231")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\37\55\153\117\13\71\61\60\147\125\13\87\60\38\146\22\124", "\76\21\112\99\214\51")] = false;
			stopAutofarm();
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\163\194\96\218", "\205\150\214\171\69\234")].Enabled = false;
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\229\232\79\195\192\228\65\217\172\183", "\46\183\137\135")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\223\68\84\190\83\212\92\65\173\89\248", "\54\150\41\53\217"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\84\2\5\240\226\126\87\3\65\180", "\171\29\56\109\100\132")].Size = UDim2.new(0, 56, 0, 56);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\238\42\211\225\203\38\221\251\167\117", "\178\149\130\69")].Position = UDim2.new(1, -80, 0.5, -28);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\64\235\21\104\195\112\67\234\81\44", "\138\19\44\132\116\28")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\214\60\215\202\155\105", "\186\175\190\89")].Background;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\11\58\161\188\236\4\58\174\237\149", "\200\165\103\85\192")].Image = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\202\148\116\122\31\43\23\254", "\50\206\133\211\59\37\86\111")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\237\10\30\22\232\226\10\17\71\145", "\98\161\129\101\127")].ScaleType = Enum.ScaleType.Fit;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\232\64\193\70\84\71\35\131\161\31", "\76\237\132\47\160\50\29\36")].Visible = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\222\191\218\175\251\179\212\181\151\224", "\187\219\178\208")].Draggable = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\223\143\223\20\228\79\220\142\155\80", "\173\44\179\224\190\96")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\176\127\24\211", "\227\165\197\22\61")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\249\96\125\167\222\71\91\186", "\200\172\41\62"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\224\201\176\188\36\239\201\191\237\93", "\200\109\140\166\209")]).CornerRadius = UDim.new(0, 12);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\86\156\0", "\48\162\37\185")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\27\40\39\190\85\33\10\17", "\39\78\97\116\202"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\253\176\30", "\69\219\142\149\46\130")].Color = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\64\23\67\50\137\24", "\87\172\40\114\46")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\254\167\232", "\101\22\141\130\216")].Thickness = 2;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\58\168\240", "\23\22\73\141\192\43")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\225\232\195\237\196\238\232\204\188\189", "\153\141\141\135\162")];
	local function minimize()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\22\82\243\229\153", "\55\84\119\59\157\192\169")].Visible = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\88\114\202\240\153\0\42\48\17\45", "\69\94\52\29\171\132\208\99")].Visible = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\18\127\182\222\208\4\120\161\228\220\82\33", "\136\185\119\17\195")] = false;
	end
	local function restore()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\208\21\179\162\160\61\211\20\247\230", "\233\94\188\122\210\214")].Visible = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\18\192\138\249\236", "\183\52\115\169\228\220\220")].Visible = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\91\233\202\240\76\12\180\210\82\226\154\150", "\221\176\62\135\191\166\37\127")] = true;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\44\83\215\28\43\24\165", "\149\104\69\61")].MouseButton1Click:Connect(minimize);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\217\13\221\79\252\1\211\85\144\82", "\188\59\181\98")].MouseButton1Click:Connect(restore);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\167\50\161\112\29\230\94\250", "\123\202\206\86\196\18\124\148")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\84\255\131\24\224", "\151\18\141\226\117\133\152\25"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\170\176\169\21\114\177\241\252", "\119\19\195\212\204")].Size = UDim2.new(0, 150, 1, -42);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\201\236\215\4\41\161\95\144", "\211\122\160\136\178\102\72")].Position = UDim2.new(0, 0, 0, 42);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\25\143\123\11\9\247\183\21", "\146\37\112\235\30\105\104\133")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\189\68\122\68\0\229", "\33\37\213\33\23")].Sidebar;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\2\214\133\47\223\212\78\130", "\190\166\107\178\224\77")].BorderSizePixel = 0;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\133\82\21\112\245\158\19\64", "\18\148\236\54\112")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\177\255\49\122\209", "\95\225\208\150\95")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\153\92\196\134\190\123\226\155", "\233\204\21\135"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\137\203\215\221\252\188\197\159", "\157\206\224\175\178\191")]).CornerRadius = UDim.new(0, 14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\127\180\181\52\195\39\178\251", "\151\203\22\208\208\86\162\85")].ClipsDescendants = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\160\137\179\171\116\55\87\236\221", "\68\35\201\237\214\231\29")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\106\53\202\55\76\8\202\63\70\19\243\42", "\94\63\124\134"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\208\75\126\216\208\92\111\177\137", "\27\148\185\47")].Padding = UDim.new(0, 6);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\50\249\43\143\126\255\81\7\107", "\37\34\91\157\78\195\23\140")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\72\237\135\120\50\14\4\185", "\83\124\33\137\226\26")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\80\227\197\229\216\93\162\144", "\181\185\57\135\160")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\236\41\210\51\10\240\169\215\7", "\192\185\96\130\82\110\148"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\216\16\233\19\56\11\2\129", "\111\39\177\116\140\67\89")].PaddingTop = UDim.new(0, 12);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\143\62\1\231\163\113\195\106", "\194\21\230\90\100\183")].PaddingLeft = UDim.new(0, 8);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\238\24\253\4\168\41\134\183", "\77\163\135\124\152\84\201")].PaddingRight = UDim.new(0, 8);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\7\43\234\28\244\91\75\127", "\149\63\110\79\143\76")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\143\164\180\7\63\243\179\214", "\129\150\230\192\209\101\94")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\112\65\18\161\113\91\67\244", "\102\196\31\47")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\201\36\49\117\71", "\51\143\86\80\24\34\34\205"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\20\250\241\78\43\148\204\75", "\224\233\123\148\133\43\69")].Size = UDim2.new(1, -162, 1, -54);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\55\119\149\210\54\109\196\135", "\225\183\88\25")].Position = UDim2.new(0, 156, 0, 48);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\254\189\38\184\14\21\180\227", "\96\97\145\211\82\221")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\230\90\166\9\95\209\172\4", "\49\165\137\52\210\108")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\39\20\184\11\118", "\214\46\70\125")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\194\140\191\197\134\219", "\218\182\163\235")] = {};
	local function createPage(name)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\103\253", "\77\205\66\205\72")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\150\184\237\81\143\193\91\59\162\157\237\95\142\200", "\85\197\219\159\62\227\173\50"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\179\123", "\51\78\150\75\111\86\175")].Size = UDim2.new(1, 0, 1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\200\155", "\37\92\237\171")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\156\154", "\46\45\185\170\99")].Visible = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\142\159", "\150\115\171\175\215")].ScrollBarThickness = 4;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\192\138", "\68\93\229\186\197\225\111\35")].ScrollBarImageColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\71\13\225\136\174\38", "\22\155\47\104\140\237\139")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\109\5", "\44\128\72\53\27\167\189")].AutomaticCanvasSize = Enum.AutomaticSize.Y;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\84\186", "\130\143\113\138\90\118\141\173")].CanvasSize = UDim2.new(0, 0, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\146\108", "\59\230\183\92\77\104")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\72\238\237\52\249\253\2\176", "\151\137\39\128\153\81")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\136\190", "\76\26\173\142\62\159\156\56")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\128\27\46\130\244\23\123\180\43\13\158\243", "\55\213\82\98\235\135\99"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\250\81", "\29\112\223\97\22\193")].Padding = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\141\188", "\205\39\168\140\127")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\100\136", "\77\73\65\184\53\127")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\124\172\55\98", "\214\95\29\200\18\82\144")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\67\217\112\84\226\141\127\254\71", "\233\22\144\32\53\134"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\21\33\98\103", "\56\95\116\69\71\87")].PaddingTop = UDim.new(0, 4);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\126\194\6\232", "\38\229\31\166\35\216\156")].PaddingBottom = UDim.new(0, 16);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\118\211\178\246", "\151\198\23\183")].PaddingLeft = UDim.new(0, 4);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\70\58\148\113", "\172\99\39\94\177\65\223")].PaddingRight = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\29\61\60\249", "\33\39\124\89\25\201\32\207")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\119\7", "\222\72\82\55\72")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\94\194\221\42\26\149", "\184\89\63\165")][name] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\157\40", "\215\108\184\24\108\205\179\195")];
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\48\86", "\37\129\21\102\202")];
	end
	local function switchTab(name)
		for n, p in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\61\126\168\226\121\41", "\205\145\92\25")]) do
			p.Visible = n == name;
		end
		for n, b in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\50\183\201\74\39\161\228\81\32\240\187", "\139\63\83\213")]) do
			if (n == name) then
				b.BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\28\41\49\113\167\68", "\116\127\116\76\92\20\130")].Accent;
				b.TextColor3 = Color3.fromRGB(20, 15, 5);
			else
				b.BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\202\57\30\190\2\216", "\39\232\162\92\115\219")].Button;
				b.TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\255\91\72\47\178\14", "\37\74\151\62")].Text;
			end
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\59\33\13\83\59\169\127\115", "\66\218\90\67\70\54")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\223\37\206\71\162\37\132\65\255\36\198", "\53\150\75\168\40\208\72\229"),LUAOBFUSACTOR_DECRYPT_STR_0("\202\182\86\136\34\226\183\84", "\79\135\217\32\237"),LUAOBFUSACTOR_DECRYPT_STR_0("\132\5\236\75\31\33\162\20", "\78\208\96\128\46\111"),LUAOBFUSACTOR_DECRYPT_STR_0("\16\224\81\22\236\233\70\138", "\231\81\149\37\121\138\136\52"),LUAOBFUSACTOR_DECRYPT_STR_0("\112\68\12", "\21\53\23\92\225"),LUAOBFUSACTOR_DECRYPT_STR_0("\200\24\92\144", "\79\138\121\59\227\201\195\177"),LUAOBFUSACTOR_DECRYPT_STR_0("\32\222\239\4\185\220\67\30", "\45\109\183\156\119\208\179"),LUAOBFUSACTOR_DECRYPT_STR_0("\1\245\141\225\48\238", "\140\85\157\232"),LUAOBFUSACTOR_DECRYPT_STR_0("\42\194\30\112", "\19\103\171\109"),LUAOBFUSACTOR_DECRYPT_STR_0("\210\214\109\106\232\221\126\109", "\30\129\179\25")};
	for _, name in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\241\166\92\133\0\245\84\160", "\134\113\144\196\23\224\121")]) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\172\139\22\189", "\51\141\216\229")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\142\206\37\181\152\222\41\181\181\197", "\193\218\171\93"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\99\61\245\29", "\45\120\23\83\208")].Size = UDim2.new(1, 0, 0, 36);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\9\235\186\182", "\134\34\125\133\159")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\76\222\45\95\241\15", "\63\229\36\187\64\58\212")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\86\63\137\21", "\172\37\34\81")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\62\107", "\106\56\27\91\216\129")][name] or name;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\226\224\188\114", "\174\65\150\142\153\66")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\138\22\140\6\70\125", "\99\77\226\115\225\99")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\165\32\180\159", "\94\224\209\78\145\175")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\99\11\150\248", "\80\145\23\101\179\200\118\20")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\96\92\51\220", "\180\146\20\50\22\236")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\130\253\229\225\83\153\188\176", "\131\50\235\153\128")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\202\102\152\115\110\40\221\237", "\184\159\47\219\28\28\70"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\203\200\56\103", "\29\87\191\166")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\89\177\42\93\234\251\87\189\27\13\174", "\158\143\56\211\104\40")][name] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\186\179\101\240", "\192\62\206\221\64")];
		createPage(name);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\42\66\182\111", "\95\145\94\44\147")].MouseButton1Click:Connect(function()
			switchTab(name);
		end);
	end
	local function section(parent, title)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\227\85", "\83\129\198\101")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\253\24\221\63\163", "\198\187\106\188\82"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\95\166", "\75\66\122\150\93\189\90")].Size = UDim2.new(1, 0, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\23\219", "\147\128\50\235\137")].AutomaticSize = Enum.AutomaticSize.Y;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\129\154", "\64\170\164\170\163\200\223")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\178\160\87\133\57\153", "\169\98\218\197\58\224\28")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\88\181", "\171\144\125\133\147\170\180")].BackgroundTransparency = 0.35;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\54\253", "\17\193\19\205\16\147\49")].Parent = parent;
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\193\92\104\73\220\34\241\103", "\76\148\21\43\38\174"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\162\183", "\120\181\135\135")]).CornerRadius = UDim.new(0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\231\66\153", "\169\134\147\103")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\151\198\46\96\151\173\228\24", "\229\194\143\125\20"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\167\141\179", "\131\228\211\168")].Color = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\217\64\44\3\173\164", "\196\34\177\37\65\102\136\148")].Stroke;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\159\82\37", "\223\132\235\119\21\189\27\51")].Thickness = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\74\188\172", "\36\121\62\153\156\24\191")].Transparency = 0.5;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\28\165\5", "\23\72\104\128\53\65")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\134\244", "\71\161\163\196")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\137\128\94\127", "\212\83\235\236\123\79")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\124\18\61\68\19\165\74\18\41", "\196\40\119\69\48\95"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\195\87\86\142", "\190\62\161\59\115")].Size = UDim2.new(1, -16, 0, 26);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\60\60\30\90", "\84\159\94\80\59\106\185")].Position = UDim2.new(0, 10, 0, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\0\70\96\213", "\229\63\98\42\69")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\25\83\11\109", "\182\191\123\63\46\93\150")].Text = title;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\113\43\21\252", "\118\142\19\71\48\204\112\197")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\67\72\41\135\83\15", "\118\63\43\45\68\226")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\225\64\233\231", "\192\33\131\44\204\215\36")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\237\129\252\174", "\217\158\143\237")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\68\78\124\9", "\113\28\38\34\89\57\190")].TextXAlignment = Enum.TextXAlignment.Left;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\185\189\21\210", "\226\73\219\209\48")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\12\161", "\218\216\41\145\129\202\190")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\16\88\248\92\45", "\29\200\121\43\140\121")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\198\63\17\73\87", "\92\128\77\112\36\50\105\41"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\93\29\182\62\4", "\194\27\52\110")].Size = UDim2.new(1, -16, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\33\223\58\29\15", "\197\149\72\172\78\56\63\191")].Position = UDim2.new(0, 8, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\137\103\105\23\208", "\29\50\224\20")].AutomaticSize = Enum.AutomaticSize.Y;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\87\233\33\65\165", "\75\150\62\154\85\100\149\183")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\31\243\203\5\141", "\112\28\118\128\191\32\189")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\171\117", "\166\96\142\69\66\64")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\199\243\86\15", "\78\80\166\138\115\63")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\123\32\135\25\66\90\37\170\9\94\91\29", "\49\46\105\203\112"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\120\63\56\213", "\110\205\25\70\29\229")].Padding = UDim.new(0, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\196\23\138\124", "\159\197\165\110\175\76\149\122")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\112\22\202\126\67", "\115\184\25\101\190\91")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\60\26\137\43", "\172\27\83\110")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\2\111\177\185\51\66\136\182\48", "\216\87\38\225"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\168\35\114\7", "\57\23\199\87\87\55\75")].PaddingBottom = UDim.new(0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\247\60\236\139", "\187\119\152\72\201")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\181\152", "\152\193\144\168")];
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\170\80\188\127\11", "\194\26\195\35\200\90\59")];
	end
	local function makeToggle(parent, text, default, callback)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\192\19\170\74", "\134\163\180\125\143\122\33")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\245\45\83\249\227\61\95\249\206\38", "\141\161\72\43"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\103\188\76\67", "\187\235\19\210\105\115")].Size = UDim2.new(1, 0, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\43\54\184\28", "\44\196\95\88\157")].BackgroundColor3 = (default and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\12\135\129\143\10\163", "\47\147\100\226\236\234")].Success) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\219\115\3\214\150\38", "\110\179\179\22")].Danger;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\195\77\63\0", "\25\187\183\35\26\48\87\140")].Text = text .. ((default and LUAOBFUSACTOR_DECRYPT_STR_0("\61\159\66\54\61\240\112", "\22\29\191\62")) or LUAOBFUSACTOR_DECRYPT_STR_0("\200\186\211\116\76\155\174\220", "\212\232\154\175\84\108"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\8\194\188\147", "\42\90\124\172\153\163\76\236")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\130\189\117\45\207\232", "\24\72\234\216")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\109\215\27\149", "\165\118\25\185\62")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\93\235\5\85", "\32\101\41\133")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\81\92\228\35", "\179\140\37\50\193\19")].Parent = parent;
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\125\148\50\36\23\246\77\175", "\152\40\221\113\75\101"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\249\181\201\243", "\123\27\141\219\236\195")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\74\227\229\129\0\91", "\84\32\62\130\145\228\37\107")] = default;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\144\71\246\22", "\178\65\228\41\211\38\54")].MouseButton1Click:Connect(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\179\0\203\10\97\10", "\94\20\199\97\191\111\68\58")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\151\225\3\79\149\105", "\89\177\227\128\119\42\176")];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\160\240\26\45", "\111\124\212\158\63\29\89")].BackgroundColor3 = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\75\52\63\61\30\15", "\88\59\63\85\75")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\217\232\138\140\65\226", "\100\210\177\141\231\233")].Success) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\128\50\179\255\167\174", "\130\158\232\87\222\154")].Danger;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\63\72\102\69", "\117\78\75\38\67")].Text = text .. ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\36\93\90\17\189\96", "\116\152\80\60\46")] and LUAOBFUSACTOR_DECRYPT_STR_0("\20\87\56\52\243\42\240", "\126\52\119\68\20\211\101\190")) or LUAOBFUSACTOR_DECRYPT_STR_0("\157\248\77\148\1\242\158\119", "\33\189\216\49\180"));
			if callback then
				callback(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\174\54\59\190\233\234", "\219\204\218\87\79")]);
			end
		end);
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\110\179\12\17", "\229\181\26\221\41\33")];
	end
	local function makeBtn(parent, text, color, callback)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\229\234\75\34", "\37\186\145\132\110\18\123\76")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\183\20\240\29\161\4\252\29\140\31", "\105\227\113\136"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\10\15\198\76", "\20\99\126\97\227\124\237\135")].Size = UDim2.new(1, 0, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\185\234\162\93", "\100\211\205\132\135\109\108")].BackgroundColor3 = color or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\28\204\253\188\228\68", "\217\193\116\169\144")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\90\39\59\224", "\72\121\46\73\30\208")].Text = text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\192\250\197\81", "\228\211\180\148\224\97")].TextColor3 = ((color == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\250\186\230\117\169\3", "\140\51\146\223\139\16")].Accent) and Color3.fromRGB(20, 15, 5)) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\20\135\160\250\170\76", "\159\143\124\226\205")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\233\74\20\65", "\37\26\157\36\49\113\211")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\55\177\128\229", "\213\196\67\223\165")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\114\92\176\177\93", "\109\16\40\222\148")].Parent = parent;
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\224\252\124\190\199\219\90\163", "\209\181\181\63"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\36\249\253\144", "\45\144\80\151\216\160")]).CornerRadius = UDim.new(0, 8);
		if callback then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\41\180\96\14", "\62\68\93\218\69")].MouseButton1Click:Connect(callback);
		end
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\15\61\128\108", "\114\127\123\83\165\92\95")];
	end
	local function makeDrop(parent, label, options, default, callback)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\207\187\227", "\211\166\189\158")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\27\179\217\48\55", "\140\93\193\184\93\82"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\188\183\173", "\143\19\206\146\157\235")].Size = UDim2.new(1, 0, 0, 36);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\3\205\236", "\220\176\113\232")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\9\0\190", "\184\118\123\37\142\142")].Parent = parent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\224\43\77\253", "\104\205\130\71")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\178\23\92\145\39\24\114\228\138", "\129\230\114\36\229\107\121\16"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\13\242\243\147", "\196\32\111\158\214\163\167")].Size = UDim2.new(0.38, 0, 1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\16\192\85\125", "\112\77\114\172")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\66\36\103\228", "\212\237\32\72\66")].Text = label;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\237\112\105\231", "\76\215\143\28")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\205\236\77\129\112\213", "\229\33\165\137\32\228\85")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\128\9\57\68", "\232\215\226\101\28\116\165\216")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\39\175\30\112", "\64\108\69\195\59")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\113\192\29\18", "\34\114\19\172\56")].TextXAlignment = Enum.TextXAlignment.Left;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\39\127\135\129", "\177\174\69\19\162")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\92\13\74", "\196\236\46\40\122\230\122")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\227\122\228\187", "\98\223\151\20\193\139\80")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\102\160\156\206\136\231\82\211\93\171", "\167\50\197\228\186\202\146\38"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\220\40\98\28", "\71\44\168\70")].Size = UDim2.new(0.6, 0, 1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\19\213\137\82", "\172\98\103\187")].Position = UDim2.new(0.4, 0, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\83\142\105\104", "\217\71\39\224\76\88\118\207")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\177\254\164\136\252\171", "\201\237\217\155")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\87\85\137\234", "\203\23\35\59\172\218\232\105")].Text = tostring(default or options[1]);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\189\174\62\114", "\27\66\201\192")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\45\254\120\207\31\114", "\58\66\69\155\21\170")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\75\231\190\172", "\156\143\63\137\155")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\63\115\121\216", "\232\114\75\29\92")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\69\247\19\153", "\170\105\49\153\54\169")].AutoButtonColor = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\74\117\139\65", "\212\127\62\27\174\113\134\232")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\19\246\238", "\219\147\97\211\222\150\62")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\245\105\213\130\151\191\197\82", "\209\160\32\150\237\229"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\46\75\7\40", "\236\211\90\37\34\24\151")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\160\171\197\4", "\224\52\196\211")] = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\66\67\10\39\241\90\23", "\131\127\39\37\89\83")] = tostring(default or options[1]);
		for i, v in ipairs(options) do
			if (tostring(v) == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\18\233\112\78\215\140\71", "\165\169\119\143\35\58")]) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\252\48\240\184", "\182\131\152\72\213\136\113")] = i;
				break;
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\4\187\237\22", "\200\38\112\213")].MouseButton1Click:Connect(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\11\215\15\129", "\84\132\111\175\42\177\191")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\141\53\140\95", "\98\136\233\77\169\111\37\83")] % #options) + 1;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\180\49\235\185", "\185\17\213\93\206\137")] = options[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\62\146\80\234", "\218\220\90\234\117")]];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\5\202\101\1", "\17\162\113\164\64\49\74")].Text = tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\8\217\65\216", "\116\96\105\181\100\232\157")]);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\47\214\73\107", "\59\41\91\184\108\91\110\16")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\79\167\86\22\205\23", "\115\232\39\194\59")].Accent;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\223\233\115\242", "\194\123\171\135\86")].TextColor3 = Color3.fromRGB(20, 15, 5);
			task.delay(0.25, function()
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\150\119\129\100", "\21\63\226\25\164\84\159\124")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\220\177\148\113", "\122\142\168\223\177\65\158")].Parent) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\55\31\64\138", "\72\163\67\113\101\186\54")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\143\241\140\44\194\164", "\225\73\231\148")].Button;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\34\64\19\150", "\166\113\86\46\54")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\221\114\208\228\131\215", "\103\175\181\23\189\129\166\231")].Text;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\12\91\17\141", "\109\209\120\53\52\189")].Text = tostring(options[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\12\229\87\139", "\210\35\104\157\114\187")]]);
				end
			end);
			if callback then
				callback(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\196\185\126\241", "\176\26\165\213\91\193\45\97")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\50\132\165\171", "\138\87\70\234\128\155\115")]);
			end
		end);
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\207\220\5\143", "\173\193\187\178\32\191\194\112")];
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\35\212\226\80\116", "\68\140\66\179\135\117")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\139\79\255\40\16\248", "\200\20\234\40\154\91\53")].Information;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\186\165\181\126\82\254\251", "\27\32\219\203\219")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\15\240\24\185\251\92\83\189\35\241", "\223\70\157\121\222\158\16\50"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\20\160\227\234\92\108\224", "\73\208\117\206\141\143\46")].Size = UDim2.new(1, 0, 0, 120);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\251\95\125\170\232\20\35", "\19\207\154\49")].BackgroundColor3 = Color3.fromRGB(20, 16, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\51\12\242\26\236\126\98", "\158\91\82\98\156\127")].Image = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\165\204\232\23\7\178\152\160\167\150", "\237\209\228\130\166\82\85")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\164\247\203\7\59\178\245", "\73\151\197\153\165\98")].ScaleType = Enum.ScaleType.Crop;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\27\251\196\190\96\96\5", "\69\53\122\149\170\219\18")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\254\19\243\119\6", "\234\81\159\116\150\82\54\140")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\47\233\38\16\8\206\0\13", "\127\122\160\101"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\42\39\231\164\24\63\209", "\225\55\75\73\137\193\106\26")]).CornerRadius = UDim.new(0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\168\3\74", "\122\41\219\38")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\66\138\234\161\101\172\210\176", "\213\23\195\185"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\51\51\252", "\231\232\64\22\204\173\80\34")].Color = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\83\202\169\79\30\159", "\196\42\59\175")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\33\124\64", "\88\66\82\89\112")].Thickness = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\147\106\5", "\62\126\224\79\53")].Transparency = 0.35;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\106\129\216", "\169\60\25\164\232")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\13\142\222\84\31\138\147", "\175\163\108\224\176\49\109")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\49\51\240\127", "\72\175\94\68\213\79")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\253\171\242\198\234", "\143\187\217\147\171"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\23\96\250\87", "\103\189\120\23\223")].Size = UDim2.new(1, 0, 0, 64);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\75\110\65\249", "\129\19\36\25\100\201\110\121")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\16\70\249\86", "\220\102\127\49")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\28\72\201\77\228", "\211\40\125\47\172\104\212\223")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\78\43\1\11\17", "\110\46\33\76")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\157\140\185\216\50\152\128\186\218\59", "\87\212\225\216\191"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\92\194\135\252\182", "\217\134\51\165\232")].Size = UDim2.new(0, 54, 0, 54);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\51\199\10\83\243", "\118\195\92\160\101")].Position = UDim2.new(0, 0, 0.5, -27);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\19\40\32\124\66", "\114\192\124\79\79\89")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\255\176\203\163\216", "\134\232\144\215\164")].Image = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\105\117\122\182\50\234\118\189", "\83\141\38\50\53\233\123\174")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\141\162\90\113\239", "\16\93\226\197\53\84\223\33")].ScaleType = Enum.ScaleType.Fit;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\220\251\21\237\71", "\119\25\179\156\122\200")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\224\63\177\168", "\148\152\143\72")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\17\158\148", "\89\156\125\187\164")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\244\82\221\172\228\241\221\5\204", "\96\160\55\165\216\168\144\191"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\88\48\106", "\90\120\52\21")].Size = UDim2.new(1, -70, 0, 28);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\28\190\5", "\214\235\112\155\53\164")].Position = UDim2.new(0, 64, 0, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\226\68\124", "\76\41\142\97")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\200\139\69", "\118\137\164\174\117\26\126\121")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\137\96\94\83\57\53\148\103\78\80\43\79\240", "\110\106\192\46\26\28")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\64\86\185", "\169\172\44\115\137\161\108")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\253\136\217\89\234\165", "\60\207\149\237\180")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\56\206\182", "\134\151\84\235")].Font = Enum.Font.GothamBlack;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\3\247\93", "\23\43\111\210\109")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\20\181\173", "\137\21\120\144\157\124\42")].TextXAlignment = Enum.TextXAlignment.Left;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\7\84\235", "\105\145\107\113\219\96\195")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\252\5\124\177", "\89\129\147\114")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\185\228\76", "\178\123\213\193\124\49")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\217\44\191\216\241\140\249\113\225", "\20\141\73\199\172\189\237\155"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\15\95\85", "\184\140\99\122\101\91\128\43")].Size = UDim2.new(1, -70, 0, 20);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\0\253\86", "\102\155\108\216")].Position = UDim2.new(0, 64, 0, 36);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\133\16\245", "\219\78\233\53\197\136\144")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\61\182\250", "\49\91\81\147\202\87\145")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\23\3\22\190\204\112\14\65\75\24\174\160\44\79\2\92\24\168\194\7\65\13\83", "\46\97\55\56\142\226\64");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\132\159\171", "\41\103\232\186\155\37\131\106")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\225\212\214\57\172\129", "\187\92\137\177")].TextDim;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\14\204\91", "\56\34\98\233\107\23\57")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\235\84\120", "\126\57\135\113\72\74\68")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\113\54\44", "\65\230\29\19\28\109\142")].TextXAlignment = Enum.TextXAlignment.Left;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\169\240\73", "\50\27\197\213\121\31\232\24")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\74\179\161\8", "\132\56\37\196")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\217\52\242\142", "\135\56\188\87\215\190")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\40\82\13\31\251", "\58\203\73\53\104")], LUAOBFUSACTOR_DECRYPT_STR_0("\56\220\238\221\235\16\8", "\100\123\174\139\185\130"));
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\37\50\115\95", "\199\96\64\81\86\111")], LUAOBFUSACTOR_DECRYPT_STR_0("\34\211\72\65\95\43\215\87\74\19\0\194\68\93\69\79\194\84\93\13\8\199\84\86", "\127\111\178\33\47"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\187\33\223\225\152\160", "\156\111\211\68\178\132\189\144")].Button);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\213\67\161\164", "\62\139\176\32\132\148\139\81")], LUAOBFUSACTOR_DECRYPT_STR_0("\211\39\148\115\128\13\116\1\255\56\220\69\223\91\66\3\255\63\221\86\156", "\109\144\72\185\55\229\123\17"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\208\77\85\112\181\129", "\144\177\184\40\56\21")].Button);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\240\26\226\117", "\218\227\149\121\199\69")], LUAOBFUSACTOR_DECRYPT_STR_0("\142\85\213\235\52\173\128\188\84\209\180\102\191\136\163\66\198\236\39\183\135\170\85", "\233\207\49\163\142\70\217"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\209\199\224\196\245\209", "\225\46\185\162\141\161\208")].Button);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\213\127\24\235", "\219\183\176\28\61")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\70\154", "\60\37\99\170\144\151\159\227")].CopyDiscord, Color3.fromRGB(80, 70, 30), function()
			if setclipboard then
				setclipboard(LUAOBFUSACTOR_DECRYPT_STR_0("\95\191\56\167\102\104\245\1\83\162\63\180\122\32\190\0\80\172\99\164\119\4\175\79\99\242\45\229\65", "\46\55\203\76\215\21\82\218"));
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\162\215\234\63\236\4\232\198\221\246\44\234\19\232", "\140\230\190\153\92\131\118"), 2);
			end
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\237\215\66\91\163\28", "\25\171\168\175\39\56\134\44")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\179\196\52\195\220", "\28\79\210\163\81\230\236")], LUAOBFUSACTOR_DECRYPT_STR_0("\41\213\23\149\242\21\222", "\155\122\176\100\230"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\157\24\39\218\191\139\88\116", "\152\203\229\125\68")] = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\136\60\244\213\232\116", "\145\182\205\68")], LUAOBFUSACTOR_DECRYPT_STR_0("\167\50\67\116\153\32\226\144\112\6", "\141\226\74\38\23\236\84") .. tostring(EXECUTOR_NAME or "?"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\122\125\40\130\55\40", "\69\231\18\24")].Button);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\202\34\8\100\209\119\122", "\74\16\191\82")] = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\48\88\29\124\247\41", "\25\180\117\32\120\31\210")], LUAOBFUSACTOR_DECRYPT_STR_0("\2\104\81\217\62\111\85\147\113", "\169\81\29\33") .. tostring(EXECUTOR_SUPPORT or "?"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\181\215\126\21\184\237", "\112\157\221\178\19")].Button);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\30\18\23\217\38\55\182\75", "\64\147\123\107\68\177\73")] = "—";
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\58\52\30\38\121\181\234\114", "\194\207\66\68\77\78\22")] = "—";
		if (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\56\55\109\100\228", "\126\79\125\121\59\65\213\83")].GreedyAuth) == LUAOBFUSACTOR_DECRYPT_STR_0("\71\194\242\78\86", "\34\51\163\144")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\207\45", "\54\134\234\29\33")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\5\18\221\125\113", "\139\88\64\92")].GreedyAuth.key;
			if ((type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\107\70", "\119\31\78\118\29")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\63\238\93\247\43\239", "\193\76\154\47\158\69\136")) and (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\18\88", "\237\171\55\104\50\142")] > 4)) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\205\211\20\87\122\29\141\154", "\21\106\168\170\71\63")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\16\46", "\216\72\53\30\48")]:sub(1, 4) .. LUAOBFUSACTOR_DECRYPT_STR_0("\28\185\229", "\177\50\151\203\227") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\198\120", "\96\102\227\72\134")]:sub(-4);
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\90\30\70\66", "\114\132\34\110\99")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\223\60\244\182\139", "\29\188\154\114\162\147\186\196")].GreedyAuth.expires_at;
			if (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\26\152\170\20", "\148\98\98\232\143\36")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\165\81\55\17\166\185", "\195\203\36\90\115")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\69\84\70\77\242", "\61\60\32\50\50\104\194\169")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\61\96\92\226", "\121\210\69\16")] - os.time();
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\24\117\85\184\126", "\157\78\125\19\33")] < 0) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\108\224\226\209\123\231\148\137", "\177\185\20\144")] = LUAOBFUSACTOR_DECRYPT_STR_0("\121\108\254\12\182\121\112", "\228\60\52\174\69");
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\25\190", "\25\122\60\142\109")] = math.floor(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\4\119\167\165\65", "\128\113\97\17\211")] / 3600);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\151\190", "\214\126\178\142\177\158")] = math.floor((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\44\50\90\84\110", "\94\33\73\84\46\113")] % 3600) / 60);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\67\75\45\185\84\76\91\225", "\126\209\59\59")] = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\247\75\160\152\228\164\133\242\67\173\222\181", "\232\210\47\200\184\193\192"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\181\157", "\219\234\144\173\45")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\4\185", "\79\44\33\137\101\121\131\57")]);
				end
			elseif (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\78\110\8\117", "\72\189\54\30\45\69\209\157")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\18\173\228\223\88\6", "\54\97\217\150\182")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\167\30\196\9\17\144\158\239", "\231\187\223\110\151\97\126")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\74\107\72\103", "\54\80\50\27\109\87")];
			else
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\198\155\135\114\254\197\149\26", "\176\42\190\235\212\26\145\178")] = LUAOBFUSACTOR_DECRYPT_STR_0("\100\111\111\239\154\134\154\117\48\123\242\212\140\135\121\54", "\232\26\93\91\135\186\224");
			end
		end
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\202\224\237\70\181\83", "\99\107\143\152\136\37\144")], LUAOBFUSACTOR_DECRYPT_STR_0("\8\117\197\211\26", "\184\67\16\188\233\58") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\22\62\121\240\58\24\86\119", "\85\111\115\71\42\152")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\112\46\25\232\49\3", "\153\101\24\75\116\141\20\51")].Button);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\61\221\15\62\93\149", "\106\93\120\165")], LUAOBFUSACTOR_DECRYPT_STR_0("\127\64\100\220\72\93\103\143\26", "\181\58\56\20") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\188\225\183\31\67\179\180\212", "\119\44\196\145\228")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\112\188\78\231\224\142", "\190\147\24\217\35\130\197")].Button);
		task.spawn(function()
			task.wait(2);
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\127\222\212\154\11", "\130\191\58\144")].GreedyWeaoUnc and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\10\229\3\235\124\90\165", "\159\18\127\149\65")]) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\247\2\207\48\0\165\178", "\110\128\130\114\141\68")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\137\68\194\178\45\168\69\136\226", "\66\218\49\178\194") .. tostring(EXECUTOR_SUPPORT) .. LUAOBFUSACTOR_DECRYPT_STR_0("\177\223\199\188\6\158\245", "\33\145\163\231\233\72\221\213") .. tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\122\197\206\252\91", "\106\50\63\139\152\217")].GreedyWeaoUnc) .. "%";
			end
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\228\244\142\30\213", "\59\229\133\147\235")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\80\30\193\182\18\123", "\55\75\49\121\164\197")].Movement;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\140\206\85", "\217\218\189\235\101")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\121\228\56\116\152", "\168\233\24\131\93\81")], LUAOBFUSACTOR_DECRYPT_STR_0("\118\47\39\116\254\127\240\5\21\55\124\234", "\214\37\95\66\17\154\95"));
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\12\27\244", "\175\58\61\62\196\137\106\104")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\2\165", "\128\145\39\149\155\125\99\66")].WalkSpeed, {LUAOBFUSACTOR_DECRYPT_STR_0("\116\87", "\41\65\103\50"),LUAOBFUSACTOR_DECRYPT_STR_0("\96\96\174", "\56\81\80\158\33\217"),LUAOBFUSACTOR_DECRYPT_STR_0("\43\67\64", "\119\26\118\112\58\176\143\188"),LUAOBFUSACTOR_DECRYPT_STR_0("\124\160\112", "\227\78\144\64\18\185"),LUAOBFUSACTOR_DECRYPT_STR_0("\120\166\218", "\38\75\150\234"),LUAOBFUSACTOR_DECRYPT_STR_0("\181\30\69", "\201\128\46\117")}, LUAOBFUSACTOR_DECRYPT_STR_0("\36\234\180", "\182\21\218\132\217\88"), function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\200\201\113\61\146\86\211\192\103\32\146\93\195\186\4", "\215\24\135\159\52\112")] = tonumber(v) or 100;
			applyWalkSpeed();
		end);
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\165\17\209", "\193\115\148\52\225\197\224")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\28\82", "\108\39\57\98\121\221")].JumpPower, {LUAOBFUSACTOR_DECRYPT_STR_0("\181\103", "\156\135\87\233\155\232\138\208"),LUAOBFUSACTOR_DECRYPT_STR_0("\208\19", "\26\228\35\86"),LUAOBFUSACTOR_DECRYPT_STR_0("\190\239", "\65\136\223\200\201\56\139\68"),LUAOBFUSACTOR_DECRYPT_STR_0("\166\170", "\58\158\154\87\151"),LUAOBFUSACTOR_DECRYPT_STR_0("\183\252\190", "\90\134\204\142\233\105\16\87"),LUAOBFUSACTOR_DECRYPT_STR_0("\241\114\161", "\195\192\71\145"),LUAOBFUSACTOR_DECRYPT_STR_0("\217\129\169", "\41\235\177\153\116\58")}, LUAOBFUSACTOR_DECRYPT_STR_0("\189\174", "\72\136\158\180\96\104"), function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\68\236\125\5\65\238\122\31\67\132\29", "\45\90\17\161")] = tonumber(v) or 50;
			applyJumpPower();
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\176\2\179", "\28\175\130\39\131\90\142\65")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\121\184\141\144\36", "\181\20\24\223\232")], LUAOBFUSACTOR_DECRYPT_STR_0("\105\180\119\183\0\35\49", "\66\61\219\16\208\108\70"));
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\250\188\219", "\235\62\200\153")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\233\242", "\195\58\204\194")].SpeedMult, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\151\208\17\192\152\216\1\200\147\202\27\202\226\165", "\84\132\199\149")] = s;
			if s then
				startInfinite();
			else
				stopInfinite();
			end
			applyWalkSpeed();
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\230\195\107", "\61\79\212\230\91\129\132\149")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\195\237", "\102\172\230\221\109\17\190\131")].JumpMult, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\130\228\254\211\33\67\209\208\136\230\224\169\92", "\157\132\215\169\174\140\108\22")] = s;
			applyJumpPower();
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\169\86\255", "\64\215\155\115\207\154\87\173")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\252\190", "\233\116\217\142\119\151\21")].NoFall, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\5\48\134\19\134\6\48\132\19\135\11\40\133\13\143\4\46\130\30\143\14\74\240", "\82\202\74\111\192")] = s;
			if s then
				setupNoFallDamage();
			end
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\8\5\218", "\190\174\58\32\234")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\172\100", "\142\87\137\84\152\83")].NoClip, false, function(s)
			toggleNoClip(s);
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\249\126\166", "\55\224\203\91\150\174\80")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\58\45", "\31\216\31\29\80\163\123\73")].BoxFly, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\34\209\140\255\227\40\40\199\139\241\246\50\41\172\250", "\186\119\109\137\202\179")] = s;
			if s then
				startBoxFly();
			else
				stopBoxFly();
			end
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\90\87\199\253\165", "\138\90\59\48\162\216\149")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\173\55\16\13\132\159", "\51\217\204\80\117\126\161\175")].Teleport;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\245\15\35", "\137\174\196\42\19\170")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\134\224\84\246\2", "\34\29\231\135\49\211\50\91")], LUAOBFUSACTOR_DECRYPT_STR_0("\235\41\238\85\69\208\62\246", "\53\191\76\130\48"));
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\24\242\5", "\53\83\41\215")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\231\17", "\197\59\194\33\40")].TPNearest, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\67\184\231\226\184\235", "\219\237\43\221\138\135\157")].Accent, teleportToNearest);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\178\124\184\120\230\146\116\178\105\177\238", "\29\148\222\29\193")] = getPlayerList();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\71\35\200\213\244\71\43\253\218\225\91\42\223\147\176", "\182\128\34\79\173")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\4\232\249\89\45\36\224\243\72\122\88", "\60\95\104\137\128")][1];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\122\180\80\51\100\145\91\57\102\240\25", "\41\86\22\213")] = makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\88\192\2", "\214\111\105\229\50")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\109\172", "\78\153\72\156\53")].SelectPlayer, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\42\55\243\33\52\26\227\55\50\115\186", "\138\68\70\86")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\77\238\4\211\253\249\48\120\238\0\201\236\238\113\24", "\156\84\40\130\97\176\137")], function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\9\229\8\52\225\234\8\217\1\54\236\234\30\172\93", "\149\143\108\137\109\87")] = v;
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\38\190\88", "\54\90\23\155\104")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\231\148", "\147\81\194\164\116")].TPPlayer, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\163\49\39\205\91\38", "\22\76\203\84\74\168\126")].Button, function()
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\208\233\201\174\29\202\216\229\233\205\180\12\221\153\133", "\175\188\181\133\172\205\105")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\122\164\48\174\233\181\123\152\57\172\228\181\109\237\101", "\157\208\31\200\85\205")] ~= LUAOBFUSACTOR_DECRYPT_STR_0("\21\246\179\114\104\127\53\70\88\234\175\123", "\63\61\152\220\82\24\19\84"))) then
				teleportToSpecificPlayer(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\230\35\210\40\70\171\190\183\239\46\206\46\64\235\234", "\218\231\131\79\183\75\50\206")]);
			else
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\219\7\179\240\177\233\162\248\231\72\224\229\177\237\184\233\240\12", "\157\149\104\147\128\221\136\219"), 2);
			end
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\165\191\145", "\161\224\148\154")], LUAOBFUSACTOR_DECRYPT_STR_0("\13\254\65\237\223\69\55\187\119\243\219\79\58\233\84", "\54\95\155\39\159\186"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\31\178\243\206\82\231", "\158\171\119\215")].Button, function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\64\178\22\136\15", "\178\90\41\193\98\173\63")] = getPlayerList();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\231\245\207\202\23\1\193\23\238\248\211\204\17\65\149", "\165\71\130\153\170\169\99\100")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\46\35\20\71\119", "\96\98\71\80")][1];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\71\82\249\70\46\154\89\92\240\6\108", "\92\222\43\51\128\35")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\187\198\179\89\73\136\179\142\198\183\67\88\159\242\238", "\237\215\222\170\214\58\61")];
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\30\46\4\215\223\175\185\101\60\39\3\220\223\174\162\32\42", "\69\78\66\101\174\186\221\202"), 1.5);
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\87\227\91", "\107\227\102\198")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\133\103", "\91\37\160\87\61\235\56")].SpawnTour, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\67\82\200\59\183\15", "\63\60\43\55\165\94\146")].Button, spawnTour);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\7\170\137", "\193\127\54\143\185\33\47\207")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\6\25", "\184\109\35\41\182\138")].GetBadges, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\228\172\119\235\207\233", "\217\95\140\201\26\142\234")].Button, getAllBadges);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\45\48\122", "\154\141\31\21\74")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\41\69\242\81\21", "\37\142\72\34\151\116")], LUAOBFUSACTOR_DECRYPT_STR_0("\129\47\145\200\35\160", "\70\210\74\227\190"));
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\22\174\70", "\114\142\36\139\118\160\110")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\146\227", "\86\192\183\211\66")].ServerHop, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\83\116\71\240\193\211", "\228\227\59\17\42\149")].Button, function()
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\172\123\198\188\166\101\215\159\172\101\213\165\170\114\134\252", "\163\204\201\23")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
			end);
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\195\29\67\95\146", "\38\122\162\122")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\166\224\250\160\108\247", "\211\73\199\135\159")].Autofarm;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\82\236\122", "\18\151\99\201\74\188")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\5\184\47\116\150", "\127\61\100\223\74\81\166")], LUAOBFUSACTOR_DECRYPT_STR_0("\117\204\212\193", "\201\56\173\189\175"));
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\184\199\167", "\131\87\137\226\151")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\188\89", "\126\209\153\105\232\84\109\57")].AutofarmToggle, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\238\128\111\242\248\233\153\127\241\247\250\150\108\241\253\158\228", "\180\185\187\212\32")] = s;
			if s then
				checkSpectatorsAndStart();
			else
				stopAutofarm();
			end
		end);
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\5\26\81", "\200\185\52\63\97")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\5\25", "\25\26\32\41\184\221\75\124")].Variant, {LUAOBFUSACTOR_DECRYPT_STR_0("\151\204\128\58\166\187\212", "\199\213\160\225\78"),LUAOBFUSACTOR_DECRYPT_STR_0("\187\133\130\180", "\145\232\228\228\209\125\206")}, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\131\203\34\153\151\205\32\128\128\222\63\150\151\209\57\250\230", "\109\223\214\159")], function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\48\231\9\80\52\149\228\212\51\242\20\95\52\137\253\174\85", "\169\139\101\179\70\22\117\199")] = v;
			saveSettings();
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\49\102\228\110\17\18\41\109\238\102\17\2\40\119\239\13\96", "\80\64\100\50\171\40")] then
				stopAutofarm();
				task.wait(0.1);
				startAutofarm();
			end
		end);
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\209\154\156", "\210\43\224\191\172\70\191\61")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\28\212", "\125\85\57\228\161")].FarmMode, {LUAOBFUSACTOR_DECRYPT_STR_0("\14\60\162\167\40", "\207\77\93\193"),LUAOBFUSACTOR_DECRYPT_STR_0("\112\8\189", "\114\50\105\218\198\194\24"),LUAOBFUSACTOR_DECRYPT_STR_0("\205\192\180\221", "\180\143\175\192\181\54\136")}, LUAOBFUSACTOR_DECRYPT_STR_0("\143\80\6\210", "\227\205\63\114\186\55\121\183"), function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\129\124\17\96\131\30\156\139\101\17\98\135\105\225", "\76\209\212\40\94\38\194")] = v;
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\157\138\38", "\100\121\175\175\22\231\216\61")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\221\228\18\130\140", "\119\167\188\131")], LUAOBFUSACTOR_DECRYPT_STR_0("\123\4\173\26\68\211\79\18", "\189\40\97\217\110\45"));
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\148\133\11", "\229\74\166\160\59")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\181\85", "\223\50\144\101\120\218")].Speed, {LUAOBFUSACTOR_DECRYPT_STR_0("\153\247", "\97\171\199\37\221\212\85\68"),LUAOBFUSACTOR_DECRYPT_STR_0("\248\216", "\173\192\232\60\200\35\187"),LUAOBFUSACTOR_DECRYPT_STR_0("\151\150\185", "\115\166\165\137\108\62\25"),LUAOBFUSACTOR_DECRYPT_STR_0("\93\223\43", "\201\108\231\27"),LUAOBFUSACTOR_DECRYPT_STR_0("\13\250\171", "\33\63\207\155\32\33"),LUAOBFUSACTOR_DECRYPT_STR_0("\221\183\245", "\76\233\135\197\42"),LUAOBFUSACTOR_DECRYPT_STR_0("\226\150\220", "\138\212\166\236\175"),LUAOBFUSACTOR_DECRYPT_STR_0("\241\208\143", "\100\201\224\191\68\92\226\125")}, LUAOBFUSACTOR_DECRYPT_STR_0("\21\75\107", "\23\36\120\91\56\46\156"), function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\244\75\35\43\121\202\253\86\89\72", "\41\143\184\18\124\120")] = tonumber(v) or 130;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\9\76\196\81\91\167\25\79\242\66\74\171\11\15\145", "\47\206\111\42\161\50")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\96\252\246\153\250\105\224\237\239\154", "\202\170\44\165\169")];
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\0\127\36\196\12\106\35\196\11\101\44\217\2\110\41\190\126", "\109\155\78\43")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\179\121\31\188\11\45\163\122\41\175\26\33\177\58\74", "\127\68\213\31\122\223")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\205\53\131\0\205\43\153\12\223\61\153\22\200\72\236", "\220\83\140\109")])) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\7\31\197\7\175\161\190\176\50\9\197\1\191\237\248", "\200\213\97\121\160\100\219\200")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\9\227\97\211\50\58\222\192\27\235\123\197\55\89\171", "\155\159\72\187\62\128\115\124")];
			end
		end);
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\175\75\76", "\124\81\157\110")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\58\83", "\67\144\31\99\125\228\178\205")].Camera, {LUAOBFUSACTOR_DECRYPT_STR_0("\245\35\210\45\193\212", "\108\179\81\189\87\164\186\70"),LUAOBFUSACTOR_DECRYPT_STR_0("\229\191\252\243\36\222", "\80\182\210\147\156")}, LUAOBFUSACTOR_DECRYPT_STR_0("\40\220\31\74\46\0", "\75\110\174\112\48"), function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\43\148\105\5\43\134\97\24\46\156\9\103", "\44\87\106\217")] = ((v == LUAOBFUSACTOR_DECRYPT_STR_0("\214\98\1\172\245\126", "\214\144\16\110")) and 1) or 2;
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\144\157\87\156\241\121\106\228\128\135\89\152\252\110\99\158\245", "\39\187\197\201\24\218\176\43")] then
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\159\17\227\117\220\190\43\10\154\25\131\23", "\102\69\222\92\166\39\157\225")] == 1) then
					freezeCamera();
				else
					unfreezeCamera();
				end
			end
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\119\119\157", "\40\30\69\82\173\182\80")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\28\139", "\213\210\57\187\57\69")].AntiBan, true, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\105\239\136\22\28\234\35\193\98\245\128\11\18\238\41\187\23", "\109\158\39\187\193\73\94\171")] = s;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\174\93\140\210\236\222\190\94\186\193\253\210\172\30\217", "\152\183\200\59\233\177")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\142\143\0\200\147\91\59\167\231\230", "\126\227\194\214\95\155\195\30")];
			if (s and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\115\170\237\249\97\165\254\255\70\188\237\255\113\233\184", "\136\154\21\204")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\81\180\130\68\81\137\94\99\67\188\152\82\84\234\43", "\27\60\16\236\221\23\16\207")])) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\7\198\231\212\21\201\244\210\50\208\231\210\5\133\178", "\130\183\97\160")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\100\40\108\115\232\165\158\122\35\99\101\236\167\254\21", "\227\219\37\112\51\32\169")];
			end
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\195\154\248", "\101\92\145\191\200\24\172\72")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\195\235\238\237\13", "\89\205\162\140\139\200\61")], LUAOBFUSACTOR_DECRYPT_STR_0("\131\253\165\138\147\253\176\195\181\229\226\130\128\233\182\197\167\253\176\199\232", "\170\193\156\194"));
		for _, rarity in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\168\121\96\122\178\182\100\123\106\174\187\14\25", "\46\235\233\43\41")]) do
			makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\157\153\67", "\115\58\207\188")], rarity, true, function(s)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\224\57\96\28\151\224\57\100\23\156\132\91", "\67\197\161\107\45")][rarity] = s;
			end);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\229\246\94", "\230\51\214\211\110")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\6\69\179\70\219", "\235\43\103\34\214\99")], LUAOBFUSACTOR_DECRYPT_STR_0("\79\103\69\74\224", "\76\28\19\36\62\147"));
		statsLabel = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\185\231\66", "\173\220\138\194\114\119\33\108")], LUAOBFUSACTOR_DECRYPT_STR_0("\116\222\187\15\142\22", "\180\54\191\220\124") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\11\202\57\132\101\193\12\191\24\136\74", "\120\218\106\173\122\235\16\175")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\228\72\3\171\228\56\16\226\170\28\12\177\228", "\139\196\104\127") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\28\172\46\196\0\134\47\197\29\177\37\194\86\245", "\64\176\115\197")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\255\70\28\27\60\167", "\126\25\151\35\113")].Button);
		runtimeLabel = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\140\132\233", "\112\143\191\161\217\38\117\232")], LUAOBFUSACTOR_DECRYPT_STR_0("\116\221\16\93\175\252\67\146\94\25\181", "\145\38\168\126\41\198"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\47\254\114\234\102\13", "\61\122\71\155\31\143\67")].Button);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\212\177\35", "\19\177\231\148")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\226\215", "\192\207\199\231\182\25\108\62")].ResetStats, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\54\8\94\17\123\93", "\51\116\94\109")].Danger, function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\121\132\214\70\109\141\225\76\106\198\165", "\149\41\24\227")] = 0;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\165\69\167\183\166\60\208\191\66\189\166\167\90\143", "\127\191\202\44\201\195\213")] = 0;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\235\76\67\169\139\237\54\245\234\89\94\187\190\246\54\195\187\8", "\91\166\158\56\44\207\234\159")] = os.time();
			saveStats();
			if statsLabel then
				statsLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\237\212\120\25\71\15\125\143\149\99\74\93\127\34\198\219\107\25\71\15\125", "\77\175\181\31\106\125\47");
			end
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\31\212\224\232\178\108\210\228\239\164\56", "\193\76\160\129\156"), 2);
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\120\1\13", "\233\187\75\36\61\227\178\235")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\5\182", "\206\56\32\134")].ExportStats, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\21\20\0\183\205\104", "\232\88\125\113\109\210")].Button, function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\185\21", "\86\61\156\37\81\170\195\24")] = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\31\204\193\209\80\101\120\201\134\222\74\21\50\196\200\214\25\127\125\136\194\130\22\101\15\216\200\214\3\40\56\151\134\135\14\54", "\69\93\173\166\162\106"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\200\139\12\228\160\187\206\217\219\201\127", "\186\188\169\236\79\139\213\213")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\51\16\211\144\195\31\22\200\138\196\57\11\152\212", "\228\176\92\121\189")], os.time() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\70\214\225\66\214\65\207\221\80\214\65\214\218\77\218\86\135\190", "\36\183\51\162\142")]);
			if setclipboard then
				setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\108\236", "\237\217\73\220\227\154\152")]);
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\141\215\254\31\213\198", "\96\206\184\142\118\176\162\177"), 2);
			end
			if writefile then
				pcall(function()
					writefile(LUAOBFUSACTOR_DECRYPT_STR_0("\255\36\208\220\62\145\40\217\204\55\193\202\116\156\15\254", "\138\184\86\181\185\90\232\119"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\108\212", "\183\22\73\228\130\237")]);
				end);
			end
		end);
		task.spawn(function()
			while true do
				if (statsLabel and statsLabel.Parent) then
					if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\188\14\102\60\173\105\115", "\67\187\208\111\31\89\223\76")].leaderstats and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\137\221\159\67\151\153\214", "\230\38\229\188")].leaderstats:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\218\15\185\114\254\19", "\28\138\96\208"))) then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\186\42\224\59\6\148\40\160\45\250\42\7\242\119", "\215\71\213\67\142\79\117")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\227\11\37\180\227\170\90", "\209\145\143\106\92")].leaderstats.Points.Value;
					end
					statsLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\1\131\216\33\254\96", "\177\67\226\191\82\196\64") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\161\35\80\199\255\196\109\205\178\97\35", "\25\168\192\68\19\168\138\170")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\3\249\89\178\124\134\76\176\75\230\47\236\3", "\214\35\217\37\146\92") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\247\136\112\220\34\115\247\148\112\220\52\66\189\209", "\81\48\152\225\30\168")];
				end
				if (runtimeLabel and runtimeLabel.Parent) then
					runtimeLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\234\73\116\200\78\225\221\6\58", "\140\184\60\26\188\39") .. (os.time() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\16\84\81\90\17\108\118\54\84\95\78\4\74\114\8\69\27\12", "\30\27\101\32\62\60\112")]) .. "s";
				end
				task.wait(1);
			end
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\168\81\66\105\138", "\76\186\201\54\39")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\194\72\176\25\88\103", "\87\112\163\47\213\106\125")].ESP;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\136\122\12", "\60\77\185\95")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\165\249\33\95\244", "\68\122\196\158")], LUAOBFUSACTOR_DECRYPT_STR_0("\234\155\71", "\146\175\200\23\131\21\100"));
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\227\238\24", "\40\229\210\203")], LUAOBFUSACTOR_DECRYPT_STR_0("\212\144\21\245\212\173\36\183\253\166\33", "\213\145\195\69"), false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\134\251\21\194\151\148\233\6\194\157\240\155", "\135\217\213\171\74")] = s;
			if s then
				rebuildESP();
			else
				clearAllESP();
			end
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\100\233\32", "\205\40\85\204\16\59\205\117")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\64\251", "\29\146\101\203")].ESPCaches, true, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\235\230\13\153\220\251\254\23\137\194\253\248\19\152\209\253\242\119\234", "\218\157\184\182\82")] = s;
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\102\129\228\35\3\30\119\157\254\34\104\111", "\77\95\53\209\187\102")] then
				rebuildESP();
			end
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\131\241\228", "\50\77\178\212\212\116\220\56")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\11\234", "\174\133\46\218\39\109")].ESPBags, true, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\104\182\188\41\150\93\0\100\163\173\42\149\86\22\127\195\211", "\26\83\59\230\227\107\215")] = s;
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\225\205\113\44\252\220\108\37\247\217\11\89", "\46\105\178\157")] then
				rebuildESP();
			end
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\16\189\12", "\225\113\33\152\60\171")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\142\238", "\104\54\171\222")].ESPPlayers, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\142\18\199\53\34\143\126\59\143\17\199\32\32\143\101\50\152\6\189\85", "\39\126\221\66\152\101\110\206")] = s;
			if s then
				updateAllPlayerESP();
			else
				for plr in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\252\15\96\208\22\110\221\192\75\41", "\43\142\144\110\25\181\100")]) do
					removePlayerESP(plr);
				end
			end
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\129\106\152", "\182\123\176\79\168\120")], LUAOBFUSACTOR_DECRYPT_STR_0("\214\203\12\55\17\247\198\74\21\24\229\215\15\55\84\193\253\58", "\116\132\174\106\69"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\34\124\161\180\179\122", "\209\150\74\25\204")].Button, updateAllPlayerESP);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\214\54\100", "\231\220\132\19\84\189\205\197")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\83\132\165\225\94", "\126\58\50\227\192\196\110\63")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\51\144", "\157\108\22\160\188")].RarityFilter .. LUAOBFUSACTOR_DECRYPT_STR_0("\51\176\21\196\116\235\126", "\165\19\152\87"));
		for _, rarity in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\37\105\129\178\15\59\116\154\162\19\54\30\248", "\230\86\100\59\200")]) do
			makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\42\73\176", "\162\65\120\108\128\201")], rarity, true, function(s)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\10\220\43\32\193\59\173\13\213\81\66", "\105\228\89\140\116\114\128")][rarity] = s;
				rebuildESP();
			end);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\88\74\228", "\102\28\106\111\212\87")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\49\83\21\121\96", "\112\92\80\52")], LUAOBFUSACTOR_DECRYPT_STR_0("\144\95\173\139\89\235", "\142\217\56\195\228\43"));
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\135\229\29", "\49\60\181\192\45")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\224\136", "\100\71\197\184\41\140")].IgnoreNearest, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\231\47\168\167\170\122", "\197\194\143\74")].Danger, function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\6\178", "\185\226\35\130\191\44\43\91")] = getClosestEntity();
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\158\179", "\34\126\187\131\149")] then
				addToIgnore(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\99\175", "\28\94\70\159\73")]);
			else
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\49\112\120\202\174\21\122\59\209\236\17\122\57\215\174\6", "\204\127\31\88\165"), 2);
			end
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\204\222\60\148\221", "\177\237\173\185\89")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\86\52\248\24\188\148", "\201\58\55\83\157\107\153\164")].Themes;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\135\63\116", "\77\82\182\26\68\129\67")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\191\119\18\169\238", "\119\140\222\16")], LUAOBFUSACTOR_DECRYPT_STR_0("\38\123\92\68\178", "\219\114\19\57\41\215\103"));
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\4\232\152", "\148\86\53\205\168")], LUAOBFUSACTOR_DECRYPT_STR_0("\245\195\169\118\248\118\216\195\172\53\187\82\194\221\186\112\253\69\158", "\49\183\175\200\21\147"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\62\43\28\203\170\13", "\143\61\86\78\113\174")].Accent);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\15\77\236", "\213\70\61\104\220\45")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\18\53\213\150\127", "\179\79\115\82\176")], LUAOBFUSACTOR_DECRYPT_STR_0("\234\136\255\93\6\199\142\244", "\115\166\233\145\58"));
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\109\147\130", "\39\33\95\182\178\217")], LUAOBFUSACTOR_DECRYPT_STR_0("\16\37\196\190\208\33\59\33", "\64\92\68\170\217\165"), {LUAOBFUSACTOR_DECRYPT_STR_0("\49\48\78\187\29\45\65", "\215\116\94\41"),LUAOBFUSACTOR_DECRYPT_STR_0("\217\88\31\4\34\228\177", "\223\139\45\108\119\75\133")}, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\151\15\244\114\39", "\87\23\214\65\179")], function(v)
			setLanguage(v);
			for name, btn in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\13\231\151\226\24\241\186\249\31\160\229", "\213\151\108\133")]) do
				btn.Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\164\235", "\120\125\129\219\222\126")][name] or name;
			end
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\214\233\12\138\45\230\253\237\88\205", "\135\154\136\98\237\88") .. v, 2);
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\141\128\198\240\74", "\197\73\236\231\163\213\122\60")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\18\117\128\182\152\19", "\35\56\115\18\229\197\189")].Misc;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\255\187\125", "\122\220\206\158\77\109")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\179\214\188\156\210", "\60\219\210\177\217\185\226")], LUAOBFUSACTOR_DECRYPT_STR_0("\11\180\167\226\44", "\142\95\219\200"));
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\175\54\124", "\158\183\158\19\76\213\109\178")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\149\250", "\124\155\176\202\231\214")].PerfMode, false, function(s)
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\182\236\72", "\120\66\135\201")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\54\134", "\186\181\19\182\81")].AntiAFK, false, setAntiAfk);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\178\198\124\206\228", "\47\48\211\161\25\235\212\222")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\0\2\136\170\138\126", "\78\202\97\101\237\217\175")].Settings;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\47\154\43", "\70\17\30\191\27\229")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\141\239\73\65\220", "\44\100\236\136")], LUAOBFUSACTOR_DECRYPT_STR_0("\221\46\135\126\60\240\249", "\18\154\75\233\27\78\145\149"));
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\213\60\4", "\146\178\228\25\52\191\156\206")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\63\101", "\201\115\26\85")].QueueRejoin, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\95\105\119\244\202\235\18\79\102\109\248\219\241\13\91\97\116\248\192\145\115", "\180\67\26\35\56\189\132")], function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\88\229\238\198\40\178\13\72\234\244\202\57\168\18\92\237\237\202\34\200\108", "\237\92\29\175\161\143\102")] = s;
			saveSettings();
			if s then
				setupRejoinQueue();
			end
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\27\177\146", "\175\87\42\148\162")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\240\6", "\39\182\213\54\119")].Rejoin, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\76\163\199\36\23\20", "\65\50\36\198\170")].Button, function()
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\85\112\38\140\26\131\213\227\85\111\44\154\17\146\197\244\92\127\45\224\100", "\132\182\16\58\105\197\84\220")] then
				setupRejoinQueue();
			end
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\22\65\121\8\170\229\157\32\72\110\14\172\244\140\86\29", "\151\233\115\45\28\120\197")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
			end);
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\159\13\28", "\44\222\174\40")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\25\34", "\43\82\60\18\86\72")].Reload, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\45\113\172\127\238\119", "\203\71\69\20\193\26")].Button, function()
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\176\50\41\214\250\127\180", "\90\132\220\83\80\179\136")]:LoadCharacter();
			end);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\42\79\241", "\186\113\24\106\193\106")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\136\209\131\240\217", "\230\213\233\182")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\201\86", "\155\172\236\102")].Webhook);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\186\24\145\94", "\27\123\213\96\180\110")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\156\30\235\74\80\167\3", "\18\200\123\147\62"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\179\227\160\136", "\110\98\220\155\133\184\231")].Size = UDim2.new(1, 0, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\172\55\120\41", "\117\23\195\79\93\25\26\235")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\237\167\246\227\160\242", "\155\134\133\194")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\66\110\54\120", "\72\160\45\22\19")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\153\48\240\4\196\35\185\137\32\244\110\187", "\104\230\220\114\184\75\139")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\89\59\73\31", "\47\237\54\67\108")].PlaceholderText = LUAOBFUSACTOR_DECRYPT_STR_0("\35\67\83\19\0\180\4\71\66\15\10\251\24\2\117\53\41\186\93\12", "\148\115\34\32\103\101");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\161\101\131\36", "\20\197\206\29\166")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\35\24\18\208\110\176", "\57\41\75\125\127\181\75\128")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\234\89\94\148", "\41\96\133\33\123\164")].PlaceholderColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\58\77\82\248\231\189", "\19\116\82\40\63\157\194\141")].TextDim;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\3\28\185\171", "\156\155\108\100")].Font = Enum.Font.Code;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\78\10\59\85", "\30\101\33\114")].TextSize = 13;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\239\221\89\122", "\74\209\128\165\124")].ClearTextOnFocus = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\53\200\7\24", "\34\40\90\176")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\170\19\242", "\85\215\152\54\194\105")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\194\192\22\196\2\190\232\229", "\141\151\137\85\171\112\208"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\52\98\232\28", "\205\44\91\26")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\70\18\205\176", "\115\156\41\106\232\128\188\195")].FocusLost:Connect(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\50\137\201\25\254\137\115\208\37\135\164\102", "\44\133\119\203\129\86\177\194")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\245\249\236\108", "\92\162\154\129\201")].Text;
			saveSettings();
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\98\122\161\10\62\139\208\194\70\126\181\7\53", "\226\53\31\195\98\81\228\187"), 2);
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\148\155\13", "\181\38\166\190\61")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\198\166", "\81\154\227\150")].EveryBag, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\136\159\193\41\91\128\146\152\223\35\70\146\146\159\200\33\49\251", "\20\203\205\221\137\102")] = s;
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\87\123\237", "\221\237\101\94")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\83\242", "\193\81\118\194\112\231\112\164")].Every10, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\99\40\240\120\105\33\231\114\112\47\234\110\121\91\136\18\22", "\184\55\38\106")] = s;
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\35\63\40", "\225\148\17\26\24\165\217")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\112\0", "\193\38\85\48\73")].Every100, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\249\154\46\123\156\55\25\82\234\157\52\109\140\77\118\39\153\232", "\70\23\188\216\102\52\211\124")] = s;
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\146\167\239", "\103\207\160\130\223\84\74")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\252\66", "\183\130\217\114\116\219\226")].OnStop, true, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\55\63\23\232\90\57\34\16\233\74\33\41\16\247\48\66", "\167\21\114\125\95")] = s;
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\70\72\30", "\80\174\116\109\46\234")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\157\68", "\174\69\184\116\204")].TestWebhook, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\91\130\116\226\85\9", "\57\101\51\231\25\135\112")].Button, function()
			sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\9\226\204\93\231\241\56\244\204\72\160\249\125\225\205\70\170\188\26\245\218\76\163\229\125\207\202\77\189\249\49\235", "\156\93\135\191\41\199"));
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\123\21\159\18\248\223\74\30\152", "\172\47\112\236\102\216"), 2);
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\224\81\40\67\208", "\224\29\129\54\77\102")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\141\241\41\66\201\166", "\76\49\236\150")].Bags;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\229\124\13\157\213", "\184\229\132\27\104")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\144\69\234", "\220\222\161\96\218\156\21\50")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\54\18\19\139\168", "\17\38\87\117\118\174\152")], LUAOBFUSACTOR_DECRYPT_STR_0("\53\176\58\127\163\106\6\180\39\127\241", "\37\118\209\73\26\131"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\73\161\112\113\230\93\161\59\12", "\60\137\57\196\30")] = LUAOBFUSACTOR_DECRYPT_STR_0("\101\121\107\12", "\56\35\24\24\120\231");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\163\85\69\202\120\82\170\0", "\143\48\211\48\43\163\22\53")] = false;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\253\84\231\45\231\235\163\31", "\134\47\146\48\130\111\147\133")] = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\99\17\81", "\209\106\82\52\97\114\63")], LUAOBFUSACTOR_DECRYPT_STR_0("\136\99\42\64\138\124\43\75\253\51\9\79\180\103", "\46\199\19\79"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\195\180\143\245\201\132", "\236\180\171\209\226\144")].Button, function()
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\18\93\6\81\109\64\64\77", "\46\101\125\57\99\19\25")].MouseButton1Click:Connect(function()
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\198\24\238\145\79\210\24\165\236", "\220\32\182\125\128")] == LUAOBFUSACTOR_DECRYPT_STR_0("\222\244\4\202", "\148\141\152\107\189")) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\244\88\92\202\177\115\225\24\2", "\222\23\132\61\50\135")] = LUAOBFUSACTOR_DECRYPT_STR_0("\138\19\237\69", "\49\204\114\158");
				elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\251\25\181\101\125\165\238\89\235", "\18\193\139\124\219\40")] == LUAOBFUSACTOR_DECRYPT_STR_0("\47\141\70\106", "\93\105\236\53\30\32\131")) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\70\71\24\121\95\68\2\19\18", "\32\103\54\34\118\52\48")] = LUAOBFUSACTOR_DECRYPT_STR_0("\135\62\100\190\182\187\82", "\38\206\80\23\202\215\213");
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\60\31\195\52\0\40\31\136\73", "\121\111\76\122\173")] = LUAOBFUSACTOR_DECRYPT_STR_0("\243\236\245\7", "\40\160\128\154\112\23\224");
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\243\220\124\250\210\14\80\28", "\117\44\156\184\25\184\166\96")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\159\97\17\56\157\126\16\51\234\49", "\86\208\17\116") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\146\22\239\212\197\255\68\199\67", "\155\33\226\115\129\153\170")];
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\107\46\59\246\227\129\61\47", "\194\24\31\79\79\131\144")] = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\252\97\89", "\178\41\205\68\105\52\104\33")], LUAOBFUSACTOR_DECRYPT_STR_0("\227\76\43\134", "\45\170\40\71\227\152\171\89"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\205\143\238\51\48\95", "\21\111\165\234\131\86")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\162\141\246", "\198\87\147\168")], LUAOBFUSACTOR_DECRYPT_STR_0("\125\206\62\255\151\112\20\94\158\115\226\195\80\10\70\145\40\229\216\65\81", "\120\50\190\91\145\183\49"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\206\180\254\39\82\150", "\66\119\166\209\147")].Accent, function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\21\168\0\180\255\2\232\94", "\221\145\101\205\110")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\14\84\90\138\173\25\20\4", "\227\195\126\49\52")];
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\107\241\190\183\21\208\163\47", "\147\134\31\144\202\194\102")].Text = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\40\191\205\225\54\189\134\184", "\163\136\88\218")] and LUAOBFUSACTOR_DECRYPT_STR_0("\198\89\45\226\166\231\78\102\162\225", "\207\137\41\72\140")) or LUAOBFUSACTOR_DECRYPT_STR_0("\52\68\8\226\0\29\166", "\194\103\48\103\146\112\120");
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\211\196\56\171\205\198\115\242", "\86\194\163\161")] then
					return;
				end
				task.spawn(function()
					local opened, fail = 0, 0;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\77\233\85\211\191\6", "\54\201\52\153\48\160\154")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\63\194\8\37\22\21", "\122\124\173\101\72\121\123\141"),LUAOBFUSACTOR_DECRYPT_STR_0("\222\177\11\15\51\31\65\167", "\201\139\223\104\96\94\114\46"),LUAOBFUSACTOR_DECRYPT_STR_0("\48\252\82\55", "\47\98\157\32\82\16"),LUAOBFUSACTOR_DECRYPT_STR_0("\246\246\194\189", "\169\179\134\171\222\231\149\224"),LUAOBFUSACTOR_DECRYPT_STR_0("\149\21\117\63\139\143\244\42\160", "\88\217\112\18\90\229\235\149")};
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\201\52\161\51\130\80\149\116", "\230\40\176\68\196\122")] = 1;
					while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\240\34\45\0\87\29\129\176", "\122\164\128\71\67\105\57")] do
						local ok, res = false, nil;
						if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\196\135\190\155\191\26\233\145\210", "\126\140\180\226\208\214\208")] == LUAOBFUSACTOR_DECRYPT_STR_0("\202\118\0\102\77\94\76", "\237\131\24\115\18\44\48\56")) then
							for _, ty in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\35\166\81\100\180\106", "\23\145\90\214\52")]) do
								if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\153\22\60\76\179\124\204\67", "\221\27\233\115\82\37")] then
									break;
								end
								ok, res = pcall(function()
									return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\213\193\237\210\34\255\168\213\213\210\207\46\236\189\215\212\164\139", "\158\220\176\177\129\187\65")].OpenCase:InvokeServer(ty);
								end);
								if (ok and res) then
									opened += 1
									fail = 0;
								end
							end
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\81\83\199\225\86\113\150\164", "\179\148\37\50")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\244\103\200\48\230\60\142", "\174\187\23\173\94\131\88") .. opened;
							task.wait();
						else
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\181\224\106", "\59\198\204\197\90\39\196\215")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\180\36\183\90\148\127", "\114\141\205\84\210\41\177\79")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\36\34\143\13\215\27\193\109", "\99\228\93\82\234\68\179")]];
							ok, res = pcall(function()
								return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\118\60\73\212\215\80\103\41\65\238\192\94\97\45\66\216\145\1", "\180\49\19\76\37\189")].OpenCase:InvokeServer(TABLE_TableIndirection["ty%0"]);
							end);
							if (ok and res) then
								opened += 1
								fail = 0;
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\82\176\173\66\208\133\86\22", "\198\115\38\209\217\55\163")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\130\65\227\61\14\74\237", "\46\205\49\134\83\107") .. opened;
							else
								fail += 1
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\23\195\85\40\231\175\135\99", "\162\83\110\179\48\97\131\215")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\175\16\198\154\243\37\189\18", "\152\34\214\96\163\211\151\93")] % #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\22\99\171\16\85\19", "\35\124\111\19\206\99\112")]) + 1;
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\6\169\216\5\101\202\27\66", "\137\62\114\200\172\112\22")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\232\173\54\240\72", "\125\174\204\95\156\104\83\137") .. fail;
								if (fail > 40) then
									break;
								end
							end
							if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\62\55\219\5\168\42\55\144\120", "\72\199\78\82\181")] == LUAOBFUSACTOR_DECRYPT_STR_0("\145\217\80\170", "\70\194\181\63\221")) then
								task.wait(0.35);
							else
								task.wait(0.01);
							end
						end
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\106\54\31\172\240\20\63\99", "\158\115\26\83\113\197")] = false;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\173\193\164\0\98\154\133\224", "\117\17\217\160\208")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\113\215\133\84\136\122\15", "\53\53\184\235\49\168") .. opened .. LUAOBFUSACTOR_DECRYPT_STR_0("\151\211\179", "\212\183\149\137") .. fail;
				end);
			end);
		end
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\130\91\15\231\211", "\106\194\227\60")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\71\24\129\51\3\79", "\228\64\38\127")].Missions;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\125\92\245\201\20", "\74\193\28\59\144\236\36\71")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\142\193\117\18\94", "\55\108\203\143\35")] = (getgenv and getgenv()) or _G;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\204\253\221\153\141\199\214\250\205\154\155\216\192\229\199\152\225\164", "\196\148\133\179\130\212")] = 15;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\95\64\29\7\187\167\33\120\88\69\23\28\172\198\78", "\126\49\22\19\94\72\233\227")] = LUAOBFUSACTOR_DECRYPT_STR_0("\140\35\172\148\172\131\203\120\188\141\172\218\139\37\188\202\184\222\203\48\170\129\186\221\157", "\185\228\87\216\228\223");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\240\90\120", "\39\58\192\127\72\98\179\141")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\94\7\205\245\158", "\208\174\63\96\168")], LUAOBFUSACTOR_DECRYPT_STR_0("\175\3\33\173\152\147\14\38\176\133\136\30", "\234\230\109\82\217"));
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\249\105\189", "\141\158\201\76")], LUAOBFUSACTOR_DECRYPT_STR_0("\145\250\104\118\208\215\244\41\91\214\207\161\38\76\143\128\184\45\78\208\204\244\121\13\149\214\189\41\24\244\213\160\39\94\212\210\185", "\181\160\212\72\56"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\5\237\221\1\246\174", "\211\158\109\136\176\100")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\71\154\76", "\44\107\119\191\124\136")], LUAOBFUSACTOR_DECRYPT_STR_0("\135\70\199\13\14\204\178\230\1\137\56\14\206\243\199\72\181\58\9\205\254\217", "\146\181\104\231\95\123\162"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\226\128\211\237\175\213", "\190\136\138\229")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\18\131\215", "\206\155\34\166\231")], LUAOBFUSACTOR_DECRYPT_STR_0("\106\158\106\148\47\251\85\48\222", "\58\89\176\74\198\74\145"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\196\222\92\52\90\243", "\54\125\172\187\49\81\127\195")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\231\142\224", "\72\218\215\171\208\205\206\211")], LUAOBFUSACTOR_DECRYPT_STR_0("\5\156\94\10\215\171\165\205\93\211\12\121\236\160\176\215\93\222\94\56\217\164\171\214", "\184\49\178\126\89\190\197\194"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\18\234\192\20\245\74", "\113\208\122\143\173")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\182\7\138", "\161\123\134\34\186\104\164")], LUAOBFUSACTOR_DECRYPT_STR_0("\174\230\153\76\158\54\105\239\232\237\112\157\50\105\187\137\204\107\133\49\122\233\165\153\112\152\119\95\242\187\218\112\152\51", "\27\155\200\185\31\234\87"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\161\26\29\64\234\85", "\207\101\201\127\112\37")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\212\120\209", "\52\220\228\93\225\30\224")], LUAOBFUSACTOR_DECRYPT_STR_0("\11\5\57\42\59\194\29\74\122\6\56\211\83\95\35\69\4\210\92\89\109\69\3\201\74\78\107\69\22\211\73\68\127\4\37\203", "\166\61\43\25\101\87"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\76\9\203\181\91\24", "\40\146\36\108\166\208\126")].Button, function()
			end);
			local function getLevel()
				local ok, lvl = pcall(function()
					return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\112\150\217\172\118\135\193\160\113\181\193\170\103\135\210\160\48\214", "\181\197\21\230")].PlayerData[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\81\58\93\209\79\126\20", "\36\180\61\91")].Name].Generic.Level.Value;
				end);
				if (ok and (type(lvl) == LUAOBFUSACTOR_DECRYPT_STR_0("\12\70\169\121\213\176", "\194\98\51\196\27\176"))) then
					return lvl;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\66\169\209", "\40\39\49\140\225\224\224")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\42\11\90\41\52\79\19", "\35\76\70\106")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\175\198\182\8\166\209\164\24\162\215\164", "\108\195\163\215"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\3\208", "\134\219\38\224\110")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\8\181\210", "\237\190\123\144\226\152\82\135")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\202\120\69", "\182\141\185\93\117")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\111\166\173\163\18", "\210\35\195\219\198\126\193\88"));
				return (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\111\166", "\237\173\74\150")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\19\151", "\195\141\54\167\63\140")].Value) or 0;
			end
			local function getRuntime()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\73\92\69", "\117\96\61\121")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\47\188\118\63\18\11\216\125\46\159\110\57\3\11\203\125\111\252", "\172\24\74\204\26\86\113\106")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\0\120\247\11\89\7\154\37\122\226\27\81\16\140\49\96\247", "\200\80\20\150\114\60\117"));
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\42\143\36", "\145\69\94\170\20")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\85\11\231", "\57\103\33\46\215\158")]:FindFirstChild(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\29\173\185\221\195\179\65", "\177\150\113\204\192\184")].Name);
			end
			local function getMissionsFolder()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\18\227\96", "\80\226\102\198")] = getRuntime();
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\57\20\255", "\207\232\77\49")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\216\13\138", "\186\96\172\40")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\102\39\212\10\72\26\139\88", "\229\43\78\167\121\33\117"));
			end
			local function patchTimers()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\205\102\23", "\56\136\185\67\39\167\145\184")] = getRuntime();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\100\236\233\181", "\113\103\28\156\204\133\125")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\49\52\161", "\145\217\69\17")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\32\199\174", "\134\224\84\226\158")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\101\39\153\187\231\71\32\190\161\227\77\60\175\176\254\65\60\143", "\142\40\78\234\200"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\8\235\244\164", "\62\77\112\155\209\148\142\86")] then
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\100\64\249\100", "\220\84\28\48")].Value = tick() - 10;
					end);
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\224\243\163", "\147\190\132\214")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\160\97\44\140\166\112\52\128\161\66\52\138\183\112\39\128\224\33", "\64\229\197\17")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\98\116\43\64\226\65\46\189\70\121", "\220\50\24\74\57\135\51\106"));
				pd = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\44\56\181", "\159\158\72\29\133")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\204\99\167", "\85\164\168\70\151\155\72")]:FindFirstChild(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\209\243\31\161\229\49\181", "\133\177\189\146\102\196\151\20")].Name);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\136\159", "\75\150\173\175\139")] = pd and pd:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\214\220\185\172\94\248\218", "\44\145\185\215\201"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\196\200\7", "\121\90\176\237\55\206")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\66\11", "\77\142\103\59\164\95")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\199\138", "\134\105\226\186\147\151")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\135\29\181\158\222\48\40\190\29\171\136\197", "\70\234\116\198\237\183\95"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\197\73\98", "\163\204\177\108\82\28")] then
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\74\198\45", "\29\147\62\227\29")].Value = os.time() - 30;
					end);
				end
			end
			local function rerollAll()
				patchTimers();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\24\61\111", "\198\209\106\24\95\26\188")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\54\49\189\43\61\253\153\54\37\130\54\49\238\140\52\36\244\114", "\156\237\83\65\209\66\94")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\117\78\73\195\95\87\73\104\213\68\87\75\86", "\54\56\39\58\176"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\40\112\17\74\46\122\185", "\137\120\71\28\117\47\92\95")] = getMissionsFolder();
				if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\161\72\24", "\158\137\211\109\40\26")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\254\164\115\169\31\184\157", "\157\173\145\200\23\204\109")]) then
					return 0;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\61\143", "\111\199\24\191")] = 0;
				for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\191\121\191\50\103\233\224", "\21\204\208\21\219\87")]:GetChildren()) do
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\224\185\84", "\190\83\146\156\100\76\113\163")]:FireServer(m.Name);
					end);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\96\113", "\235\194\69\65\102\137\103")] += 1
					task.wait(0.04);
				end
				task.wait(0.12);
				patchTimers();
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\143\42", "\213\210\170\26\28\155\155")];
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\202\232\206\178\214\154\187", "\139\224\133\191")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\214\219\85\153\48\77\161", "\206\128\190\39\237\89\42")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\209\15\203", "\115\184\107\184\131\113\20\192")]={LUAOBFUSACTOR_DECRYPT_STR_0("\29\17\39\72\107\116\22\65\127", "\21\122\116\73\45\25")},[LUAOBFUSACTOR_DECRYPT_STR_0("\218\195\156\246", "\214\177\166\229\133\199\89")]={LUAOBFUSACTOR_DECRYPT_STR_0("\154\72\32\0\64\0\80", "\210\236\45\82\116\41\103\63"),LUAOBFUSACTOR_DECRYPT_STR_0("\19\79\61\49\203\22\9\32\54\130\26\76\38\55\202\6\90", "\162\114\41\79\80")},[LUAOBFUSACTOR_DECRYPT_STR_0("\230\53\159\179", "\57\150\84\235\219\27")]={LUAOBFUSACTOR_DECRYPT_STR_0("\253\23\67", "\109\176\118\51\63"),LUAOBFUSACTOR_DECRYPT_STR_0("\113\24\243\2\197\90\3\253\29", "\161\51\109\154\110"),LUAOBFUSACTOR_DECRYPT_STR_0("\201\58\195\63\54\166\237\63\212\53\26\180\247", "\211\132\83\176\92\116"),LUAOBFUSACTOR_DECRYPT_STR_0("\97\241\219\169\50\241\37", "\74\55\148\169\221\91\150"),LUAOBFUSACTOR_DECRYPT_STR_0("\8\37\187\8\55\39\166\92\18\41\174\20\42", "\124\94\64\201")}},[LUAOBFUSACTOR_DECRYPT_STR_0("\209\234\24\190\53\182", "\206\135\143\106\202\80")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\229\77\54", "\42\140\41\69\197\169\190\106")]={LUAOBFUSACTOR_DECRYPT_STR_0("\179\131\233\182\166\135\235\230\227", "\211\212\230\135")},[LUAOBFUSACTOR_DECRYPT_STR_0("\89\163\110\245", "\190\50\198\23\134")]={LUAOBFUSACTOR_DECRYPT_STR_0("\85\81\177\72\219\105", "\151\35\52\195\60\190\17\159"),LUAOBFUSACTOR_DECRYPT_STR_0("\160\177\105\253\135\174\244\109\236\140\162\161\105\236", "\226\214\212\27\137")},[LUAOBFUSACTOR_DECRYPT_STR_0("\110\62\165\44", "\172\30\95\209\68\139")]={LUAOBFUSACTOR_DECRYPT_STR_0("\219\25\56", "\53\150\120\72"),LUAOBFUSACTOR_DECRYPT_STR_0("\93\17\223\15\73\118\10\209\16", "\45\31\100\182\99"),LUAOBFUSACTOR_DECRYPT_STR_0("\28\126\27\55\58\36\126\4\48\17\63\112\27", "\120\81\23\104\84"),LUAOBFUSACTOR_DECRYPT_STR_0("\254\74\111\99\205\87", "\23\168\47\29"),LUAOBFUSACTOR_DECRYPT_STR_0("\70\190\153\158\117\163\203\166\121\188\131\158", "\234\16\219\235")}},[LUAOBFUSACTOR_DECRYPT_STR_0("\103\4\81\33\63", "\34\36\118\52\82\75\106")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\51\133\8", "\139\90\225\123\210\143\229\60")]={LUAOBFUSACTOR_DECRYPT_STR_0("\247\45\20\54\202\241\252\125\66", "\144\144\72\122\83\184")},[LUAOBFUSACTOR_DECRYPT_STR_0("\225\9\87\85", "\201\138\108\46\38")]={LUAOBFUSACTOR_DECRYPT_STR_0("\56\39\58\153\36", "\119\91\85\95\234\80\79"),LUAOBFUSACTOR_DECRYPT_STR_0("\94\166\79\185\101\29\183\75\184\99\84\177\88", "\17\61\212\42\202")},[LUAOBFUSACTOR_DECRYPT_STR_0("\249\162\249\78", "\36\137\195\141\38\208\119\109")]={LUAOBFUSACTOR_DECRYPT_STR_0("\28\221\42", "\179\81\188\90\47"),LUAOBFUSACTOR_DECRYPT_STR_0("\143\57\173\179\210\164\34\163\172", "\182\205\76\196\223"),LUAOBFUSACTOR_DECRYPT_STR_0("\123\235\225\198\152\33\230\250\82\235\252\194\169", "\150\54\130\146\165\218\84\143"),LUAOBFUSACTOR_DECRYPT_STR_0("\28\5\219\49\21", "\97\95\119\190\66"),LUAOBFUSACTOR_DECRYPT_STR_0("\143\106\33\65\192", "\180\204\24\68\50"),LUAOBFUSACTOR_DECRYPT_STR_0("\211\108\91\99\228\62\114\121\247\118\74", "\16\144\30\62")}}};
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\56\50\228\118\233", "\48\212\72\93\151\83\217\38")] = {};
			local function resolve(path)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\157\28\198\3", "\99\81\232\110\227\51")] = workspace;
				for _, n in ipairs(path) do
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\170\39\172\234", "\229\97\223\85\137\218\24\18")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\201\181\97\160", "\68\144\188\199")]:FindFirstChild(n);
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\17\221\159\93", "\148\115\100\175\186\109\86")] then
						return nil;
					end
				end
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\254\218\146\44", "\183\28\139\168")];
			end
			local function getTowerPos(name, data)
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\161\248\61\200\11", "\218\114\209\151\78\237\59")][name] then
					return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\166\5\77\9\230", "\62\44\214\106")][name];
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\52\4\216\191\99\109", "\203\70\93\99\176")] = resolve(data.path);
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\213\172\37\160\153\251", "\77\212\188\203")] then
					return nil;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\220\246\250\167", "\173\57\179\133\223\151")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\92\76\229\88\191\98", "\183\206\53\43\141\44\154\82")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\206\4\36\25\4\230\233\248", "\155\140\101\87\124\84\135")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\13\62\7\30\5\150", "\32\166\100\89\111\106")].Position;
				if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\33\171\0\122", "\46\149\78\216\37\74\163\39")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\224\122\199\211\101\119", "\71\46\137\29\175\167\64")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\16\240\51\2\232", "\110\93\159\87\103\132\39")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\28\46\42\212\22\69", "\160\51\117\73\66")].PrimaryPart) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\58\152\192\252", "\87\116\85\235\229\204")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\143\19\213\107\120\13", "\61\131\230\116\189\31\93")].PrimaryPart.Position;
				end
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\9\6\191\232", "\121\206\102\117\154\216\34")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\4\6", "\134\181\33\54\128\114\39")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\197\162\77\184\71\156", "\204\98\172\197\37")]:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\237\0\107\36\151\198\195\219", "\177\175\97\24\65\199\167"), true);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\215\237\19\98", "\151\116\184\158\54\82\30\193")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\140\140", "\158\69\169\188\70\212\166")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\157\166", "\184\107\184\150\106")].Position;
				end
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\222\95\128\182", "\134\162\177\44\165")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\56\78\225\130\120", "\146\167\72\33")][name] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\3\188\105\242", "\45\154\108\207\76\194\46")];
				end
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\224\25\159\45", "\186\29\143\106")];
			end
			local function matchTower(m)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\140\246", "\123\201\169\198\119\108\220\74")] = string.lower(m.Name);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\204\66", "\35\66\233\114\54")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\87\140\153\231\193\114\156\164\246\192\118", "\173\19\229\234\151"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\35\41\68\44\111\109", "\40\73\74\93")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\174\174", "\151\154\139\158\83\228")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\239\88", "\184\159\202\104\185")].Value))) or "";
				for tn, data in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\38\136\194\152\96\76\239", "\202\51\105\223\135")]) do
					for _, id in ipairs(data.ids) do
						if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\190\132", "\212\200\155\180")] == id) then
							return tn, data, m;
						end
					end
					for _, k in ipairs(data.keys) do
						if (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\183\241", "\182\38\146\193\205")], k, 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\16\157\174\234\74\73", "\143\111\121\233\194")], k, 1, true)) then
							return tn, data, m;
						end
					end
				end
			end
			local function findTower()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\209\39\213\200\254\155\123", "\173\140\190\75\177")] = getMissionsFolder();
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\59\36\209\85\1\160\187", "\133\139\84\72\181\48\115")] then
					return;
				end
				for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\79\27\197\140\161\18\128", "\55\176\32\119\161\233\211")]:GetChildren()) do
					local a, b, c = matchTower(m);
					if a then
						return a, b, c;
					end
				end
			end
			local function tpPos(pos)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\68\68", "\213\60\97\116\217")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\60\34\110\47\149\117\115", "\74\231\80\67\23")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\219\189\75\85\84\28\154", "\170\99\183\220\50\48\38\57")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\23\7\48\31\49\29\52\26\13\29\50\10\15\19\47\10", "\126\95\114\93"));
				if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\122\34", "\58\205\95\18")] or not pos) then
					return;
				end
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\88\148", "\199\108\125\164\145")].CFrame = CFrame.new(pos + Vector3.new(0, 6, 0));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\109\97", "\77\188\72\81\91\229\129\40")].AssemblyLinearVelocity = Vector3.zero;
				end);
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\214\20\100", "\19\194\231\49\84\128")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\6\172\184\3\137", "\170\56\103\203\221\38\185\34")], LUAOBFUSACTOR_DECRYPT_STR_0("\28\188\76\28\80\244\110\246\30\39\83\239\43\171", "\152\78\217\62\115\60"));
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\226\71\252", "\53\21\211\98\204\214\170")], LUAOBFUSACTOR_DECRYPT_STR_0("\10\211\66\1\166\167\56\200\12\52\182\185\54\214\64\70\251\187\56\206\79\14\248\173\48\200\73\79", "\203\89\186\44\102\211"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\138\202\57\206\224\210", "\171\197\226\175\84")].Accent, function()
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\181\83\97\90\223\139\22", "\179\231\54\19\53") .. tostring(rerollAll()), 2);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\164\242\30", "\176\166\149\215\46\196\37\193")], LUAOBFUSACTOR_DECRYPT_STR_0("\109\121\178\23\14\82\171\29\77\121\176\10", "\110\46\22\194"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\251\63\241\207\235\221", "\206\237\147\90\156\170")].Button, function()
				pcall(function()
					setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\109\25\242\153\57\212\123\3\255\128\34\196\97\111\129", "\107\144\36\74\177\214")]);
				end);
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\95\197\45\197\125\29\127\140\61\201\98\6\126\200", "\111\27\172\94\166\18"), 2);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\94\190\101", "\206\69\111\155\85\80\34\32")], LUAOBFUSACTOR_DECRYPT_STR_0("\142\190\172\3\206\178", "\167\220\219\198\108"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\12\28\51\48\3\84", "\100\202\100\121\94\85\38")].Danger, function()
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\185\207\4\81\242\24\168\240\4\83\235\3\191\198\68\17", "\157\106\220\163\97\33")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
				end);
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\180\214\53\135", "\189\93\192\130\16\183\52")] = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\67\127\100", "\87\105\114\90\84\107\91")], LUAOBFUSACTOR_DECRYPT_STR_0("\71\198\210\181\154\7\129\118\119\197\192", "\31\19\169\165\208\232\61\161"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\168\36\11\254\139\135", "\183\178\192\65\102\155\174")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\191\14\99", "\138\215\142\43\83\108\233\64")], LUAOBFUSACTOR_DECRYPT_STR_0("\76\141\168\78\75\249\189\115\104\188\155\60\94\172\157\115\121\184\155\113\63\241\216\41\52\240", "\28\31\217\233"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\252\168\205\192\79\22", "\38\81\148\205\160\165\106")].Success, function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\88\234\118", "\194\47\46\207\70\21\97\122")] = getLevel();
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\45\146\177", "\187\177\91\183\129\187\169\185")] < TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\251\149\114\248\228\38\225\146\98\251\242\57\247\141\104\249\136\69", "\173\117\178\219\45\181")]) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\10\207\162\217", "\229\155\126\155\135\233\25")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\106\11\143\22\22\198\82\2\202", "\170\36\110\234\114\54") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\98\28\103\208\81\192\159\233\100\28\103\209\93\197\137\236\14\98", "\204\160\43\82\56\157\24\147")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\3\51\139\140\92\248", "\216\35\27\229\227\43") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\78\107\88", "\18\103\56\78\104\209\205\103")] .. ")";
					return;
				end
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\89\34\10\137\101", "\168\182\28\108\92\172\87")].GreedyTowerRunning then
					return;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\100\142\159\168\133", "\183\151\33\192\201\141")].GreedyTowerRunning = true;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\147\228\248\40", "\221\24\231\176")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\115\232\225\83\5\179\70\179\161\19", "\221\33\157\143\61\108");
				task.spawn(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\226\156\178\151\121", "\73\213\139\232\193\178")] = 0;
					while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\175\120\110\25\79", "\125\212\234\54\56\60")].GreedyTowerRunning do
						patchTimers();
						local name, data, mis = findTower();
						if (name and data) then
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\51\106\1\6", "\155\61\92\25\36\54\200")] = getTowerPos(name, data);
							if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\183\95\122\80", "\95\96\216\44")] then
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\64\14\76\248\25", "\209\150\41\122\63\221\41\30")] += 1
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\57\73\127\47", "\60\156\77\29\90\31")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\155\239\164", "\224\207\191\132") .. name .. LUAOBFUSACTOR_DECRYPT_STR_0("\242\114", "\81\210\81\133\40\69\184") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\73\208\245\30\16", "\134\59\32\164")];
								tpPos(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\212\12\192\120", "\156\213\187\127\229\72\35")]);
								task.wait(1);
								if mis then
									pcall(function()
										TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\200\201\123\163\219\69\101\200\221\68\190\215\86\112\202\220\50\250", "\36\17\173\185\23\202\184")].MissionReroll:FireServer(mis.Name);
									end);
								end
								rerollAll();
							else
								rerollAll();
							end
						else
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\92\194\109\191", "\108\126\40\150\72\143\178\198")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\245\59\144\127\124\224\185\8\137\126\138\121\100\255\183", "\38\167\94\226\16\16\140\151") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\12\4\171\137\8", "\172\56\101\112\216")];
							rerollAll();
						end
						task.wait(0.3);
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\73\132\180\137", "\113\235\61\208\145\185")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\190\88\70\25\157\73\77\73\145\12", "\105\237\44\41") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\236\104\65\199\187", "\229\29\133\28\50\226\139")];
				end);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\134\1\32", "\142\178\183\36\16\48\50\183")], LUAOBFUSACTOR_DECRYPT_STR_0("\197\189\220\192\182\189\252\231\243\155", "\144\150\233\147"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\10\170\41\93\16\123", "\53\75\98\207\68\56")].Danger, function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\131\154\24\123\244", "\78\94\198\212")].GreedyTowerRunning = false;
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\230\239\112\240\237\144\175", "\149\137\181\159\21")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\135\203\38\13\227", "\211\26\230\172\67\40")], LUAOBFUSACTOR_DECRYPT_STR_0("\196\39\47\8\231\14\75\25\228\36\35\2\237\93\6\17\226\35\37", "\112\151\87\74\109\131\46\38"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\220\3\221\179\47\204\117\157", "\214\74\168\80\173")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\4\6\167\74\133\49\1\186\82", "\201\80\99\223\62"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\102\47\251\80\64\237\178\34", "\137\151\18\124\139\53\37")].Size = UDim2.new(1, -8, 0, 18);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\99\25\96\164\253\19\50\122", "\152\119\23\74\16\193")].BackgroundTransparency = 1;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\171\1\197\88\206\119\250\98", "\171\19\223\82\181\61")].Font = Enum.Font.Gotham;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\145\225\193\196\30\129\151\129", "\161\123\229\178\177")].TextSize = 12;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\44\1\167\80\90\193\125\98", "\63\165\88\82\215\53")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\212\170\51\125\174\139", "\16\85\188\207\94\24\139\187")].Text or Color3.fromRGB(220, 220, 220);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\36\138\176\72\39\10\117\233", "\66\110\80\217\192\45")].TextXAlignment = Enum.TextXAlignment.Left;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\2\46\40\23\248\18\88\104", "\114\157\118\125\88")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\214\179\19\230\47\147\20\165\236\163\30\247", "\133\133\199\114\146\90\224\46");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\174\220\22\32\122\4\236\234", "\96\201\218\143\102\69\31")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\32\50\44\227\21\224\157", "\173\159\115\66\73\134\113\197")];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\132\230\53\225\211\117\40\134\228\53\241\223\4\89", "\33\105\212\163\112\165\140")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\54\113\185\214\47\118\189\157\51\104\250\201\46\125\250\205\39\123\191", "\189\70\24\218"),LUAOBFUSACTOR_DECRYPT_STR_0("\186\32\25\120\17\97\186\32\21\115\17\45\172", "\65\201\80\124\29\117"),LUAOBFUSACTOR_DECRYPT_STR_0("\221\54\22\193\216\190\180\41\192\54\22\193\222\184\243\54\213\101\66\217\214\185\184\46\193\100", "\65\180\22\98\169\183\203\211"),LUAOBFUSACTOR_DECRYPT_STR_0("\136\12\236\184\38\227\108\136\0\251\178\43\227\32\137\23\251\165\33\233\34", "\76\236\101\154\209\72\134"),LUAOBFUSACTOR_DECRYPT_STR_0("\169\91\50\164\122\168\86\51\164\113\187\86\57\247\63\191\19\46\244\122\187\87\62\229\111", "\31\222\51\93\132"),LUAOBFUSACTOR_DECRYPT_STR_0("\100\98\57\11\234\255\158\120\121\32\13", "\237\23\23\73\110\152\223")};
			local function speedHasTarget()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\169\17\62\7\240\93\217", "\120\233\198\125\90\98\130")] = getMissionsFolder();
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\201\59\229\34\211\106\151", "\167\199\166\87\129\71\161\79")] then
					return nil;
				end
				for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\118\1\73\55\148\119\41", "\230\82\25\109\45\82")]:GetChildren()) do
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\50\107", "\171\45\23\91\162\126\109")] = string.lower(m.Name);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\234\76\241", "\190\128\132\105\193")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\119\219\86\55\183\82\203\107\38\182\86", "\219\51\178\37\71"));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\0\133", "\164\60\37\181\100")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\59\243\108", "\166\118\85\214\92\91\167")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\53\18\240", "\192\60\91\55")].Value))) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\78\182", "\56\106\107\134\17")];
					for _, k in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\108\95\107\16\7\19\58\110\93\107\0\11\98\75", "\71\123\60\26\46\84\88")]) do
						if (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\91\40", "\230\232\126\24\79\229\218\197")], k, 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\22\8", "\228\214\51\56\176\155\146\174")], k, 1, true)) then
							return m, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\59\238", "\139\189\30\222\73\163\36\20")];
						end
					end
				end
				return nil;
			end
			local function speedUnfreeze()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\46\120\31\95\89", "\73\122\107\54")].GreedySpeedFrozen = false;
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\234\114\7\17\38", "\20\116\175\60\81\52")].GreedySpeedFreezeConn then
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\36\61\22\76\83", "\64\105\97\115")].GreedySpeedFreezeConn:Disconnect();
					end);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\205\203\152\189\172", "\158\203\136\133\206\152")].GreedySpeedFreezeConn = nil;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\173\246", "\86\183\136\198\24")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\39\169\216\62\251\237\209", "\200\225\75\200\161\91\137")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\222\113\22\53\248\118\31", "\83\47\178\16\111\80\138")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\43\223\23\163\123\40\51\7\248\21\173\97\23\59\17\222", "\90\99\170\122\194\21\71"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\234\17", "\149\104\207\33\206\201")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\95\71", "\155\167\122\119\65\190")].Anchored = false;
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\242\149", "\182\22\215\165\90")].AssemblyLinearVelocity = Vector3.zero;
					end);
				end
			end
			local function speedFreeze(cf)
				speedUnfreeze();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\42\22\235\172\94", "\195\132\111\88\189\137\108")].GreedySpeedFrozen = true;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\181\160\71\174\234", "\44\139\218\195")] = cf;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\109\73", "\191\66\72\121\119\221\120")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\142\166\32\143\144\2\103", "\39\87\226\199\89\234\226")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\65\201\241\198\83\129\161", "\164\145\45\168\136\163\33")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\26\33\1\53\17\67\231\227\0\59\3\32\47\77\252\243", "\135\82\84\108\84\127\44\142"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\22\77", "\132\236\51\125\138\111\182")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\25\75", "\25\172\60\123\126\116\140\119")].Anchored = true;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\153\26", "\117\231\188\42\49\43")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\90\251\36\197\5", "\79\224\53\152")];
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\127\45\8\176\8", "\94\149\58\99")].GreedySpeedFreezeConn = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\190\202\67\145\137\205\91\171\143\218", "\194\236\191\45")).Heartbeat:Connect(function()
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\130\49\103\64\245", "\49\101\199\127")].GreedySpeedFrozen then
						return;
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\119\164\194\199\138", "\210\122\24\203\182\226\187\25")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\15\177\198\226\17\245\143", "\191\135\99\208")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\38\76\71\253\56\8\14", "\62\152\74\45")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\111\103\69\56\241\226\207\204\117\125\71\45\207\236\212\220", "\168\39\18\40\89\159\141\166"));
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\8\62\235\17\106", "\91\197\103\81\159\52")] then
						return;
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\56\160\83\231\230", "\194\215\87\207\39")].Anchored = true;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\254\244\27\14\186", "\139\24\145\155\111\43")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\186\36\120\225\253", "\221\127\213\71\19\196\205")];
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\84\87\56\68\157", "\98\172\59\56\76\97\172\90")].AssemblyLinearVelocity = Vector3.zero;
					end);
				end);
			end
			local function speedPass()
				speedUnfreeze();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\142\131", "\70\177\171\179\105")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\192\70\240\141\246\197\124", "\224\76\172\39\137\232\132")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\180\27\179\187\66\101\66", "\64\114\216\122\202\222\48")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\29\31\29\91\167\58\3\20\104\166\58\30\32\91\187\33", "\201\85\106\112\58"));
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\26\253", "\167\200\63\205")] then
					return;
				end
				local X1, X2, Y, Z = 3000, 3180, 100, 3000;
				local startCF, endCF = CFrame.new(X1, Y, Z), CFrame.new(X2, Y, Z);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\197\28\60\180", "\57\100\172\110\25\132\191")] = (endCF.Position - startCF.Position).Unit;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\136\99", "\232\84\173\83\214\203\16\233")].Anchored = false;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\234\90", "\97\213\207\106\71\230\213")].CFrame = startCF;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\224\176\250\46\130\166\244", "\88\231\131\196\147")] = true;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\47\126\103", "\213\170\76\91\87\129\19\207")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\187\64\137\120\116\240\228\114\138\80", "\27\233\53\231\43\17\130\146")).Heartbeat:Connect(function()
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\20\44\89\150\18\125\0", "\48\224\119\88")] then
						return;
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\3\171\99\139\186", "\80\223\108\196\23\174\139\75")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\169\246\28\21\183\178\85", "\101\112\197\151")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\27\209\249\186\182\90\151", "\127\167\119\176\128\223\196")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\165\207\8\165\10\77\132\222\55\171\11\86\189\219\23\176", "\34\237\186\101\196\100"));
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\5\226\216\129\145", "\164\160\106\141\172")] then
						return;
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\142\218", "\106\217\171\234\48\104\189\203")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\1\165\6\176", "\134\84\104\215\35\128\166")] * 500;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\88\191\184\193\87", "\228\102\55\208\204")].AssemblyLinearVelocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\242\6", "\26\160\215\54\223\119")].X, 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\253\173", "\22\71\216\157\37\188\186")].Z);
				end);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\97\181\99", "\96\134\22\144\83\118\118")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\5\177\137\21\26\100\224\169\39\175\143\21", "\219\81\198\236\112\116\55\133")):Create(TABLE_TableIndirection["r%0"], TweenInfo.new(0.35, Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\63\231\40\237\17\196", "\140\124\161\90")]=endCF});
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\19\63\176", "\66\203\100\26\128")]:Play();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\156\151\77", "\125\74\235\178")].Completed:Wait();
				active = false;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\174\21\127", "\122\147\205\48\79\137\227\146")]:Disconnect();
				speedFreeze(endCF);
			end
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\122\9\55\234\68\207\227", "\234\211\41\121\82\143\32")], LUAOBFUSACTOR_DECRYPT_STR_0("\213\27\105\59\215\166\60\88\12\230\226\111\78\8\241\235", "\131\134\79\40\105"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\84\44\57\92\25\121", "\84\57\60\73")].Accent, function()
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\228\29\114\4\214", "\105\125\161\83\36\33\228\206")].GreedySpeedFarm then
					return;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\87\200\73\64\245", "\101\199\18\134\31")].GreedySpeedFarm = true;
				task.spawn(function()
					while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\247\151\227\251\216", "\75\92\178\217\181\222\234")].GreedySpeedFarm do
						patchTimers();
						local m, name = speedHasTarget();
						if m then
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\7\146\196\17\22\165\145\68", "\180\116\115\193")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\216\164\112\40\178\197", "\123\136\229\35") .. tostring(name);
							pcall(speedPass);
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\65\11\255\137\93\81\125\191", "\236\56\53\88\143")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\31\199\211\4\55\129\152\73", "\103\92\175\182");
							task.wait(0.35);
						else
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\194\74\194\174\131\16\140\180", "\169\132\182\25\178\203\230\116")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\68\8\17\181\237\122\67\77\244", "\129\22\109\99\218");
							rerollAll();
							task.wait(0.12);
						end
					end
					speedUnfreeze();
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\160\48\205\11\209\212\186\125", "\159\77\212\99\189\110\180\176")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\44\148\212\222\241\177\27", "\212\127\224\187\174\129");
				end);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\120\107\187\207\91\102\27", "\63\67\43\27\222\170")], LUAOBFUSACTOR_DECRYPT_STR_0("\206\196\207\144\156\149\43\248\245\228\224\218\135\41\240", "\91\157\144\128\192\188\230"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\217\6\68\19\126\143", "\191\108\177\99\41\118\91")].Danger, function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\132\112\101\102\235", "\142\227\193\62\51\67\217\58")].GreedySpeedFarm = false;
				speedUnfreeze();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\176\106\55\170\190\217\13\244", "\189\40\196\57\71\207\219")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\219\199\82\171\145\135\235", "\132\136\179\61\219\225\226\143");
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\40\127\157", "\173\132\26\90")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\42\236\64\197\225", "\224\209\75\139\37")], LUAOBFUSACTOR_DECRYPT_STR_0("\217\72\220\23\241\94\193\92\221\73\146\47\228\70\209\25\180\15\240\57\192\102\155", "\124\148\39\178"));
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\145\20\160", "\186\18\163\49\144")], "BETA — blame script = mute", TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\6\246\182\240\175\243", "\138\195\110\147\219\149")].Danger, function()
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\136\211\76\161\84", "\160\17\205\157\24\132\100")] = Vector3.new(-311.12, 85.56, -443.3);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\124\173\76\86", "\105\102\53\224")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\236\215\4\170\4\112\169\227\212\206\3\170\60\112\171\203\221\219\4", "\170\186\190\118\222\113\17\197"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\34\198\149\11\52\215\137\17\37\199\146\10\72\184", "\222\78\109\136")] = 1.9;
			local function monkeyOnce()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\252\241", "\232\68\217\193")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\180\66\53\26\170\6\124", "\76\127\216\35")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\253\60\61\168\249\180\109", "\205\139\145\93\68")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\53\75\207\170\244\18\87\198\153\245\18\74\242\170\232\9", "\154\125\62\162\203"));
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\134\74", "\21\230\163\122\148\226\128")] then
					return;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\91\111", "\142\63\126\95")].AssemblyLinearVelocity = Vector3.zero;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\183\0", "\218\126\146\48\164\108")].CFrame = CFrame.lookAt(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\210\44\153\132\160", "\166\127\151\98\205\161\144")] + Vector3.new(0, 3, 0), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\123\157\3\28\15", "\83\190\62\211\87\57\63")] + Vector3.new(20, 3, 0));
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\236\199\77\34", "\46\136\165\138\104\18\174\157")]:SendKeyEvent(true, Enum.KeyCode.W, false, game);
				end);
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\17\157\103\209", "\66\225\88\208")]:SendKeyEvent(true, Enum.KeyCode.Space, false, game);
				end);
				local w, s = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\10\82\22\205\28\67\10\215\13\83\17\204\96\44", "\93\136\69\28")], 2;
				if (s <= w) then
					task.wait(s);
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\25\215\166\111", "\131\95\80\154")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
					end);
					task.wait(w - s);
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\242\240\52\168", "\97\176\187\189\17\152\23\64")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
					end);
				else
					task.wait(w);
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\220\160\245\87", "\139\115\149\237\208\103\164")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
					end);
					task.wait(s - w);
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\210\227\109\234", "\232\86\155\174\72\218\75")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
					end);
				end
			end
			local function isMonkey(m)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\111\18", "\164\158\74\34\169\145")] = string.lower(m.Name);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\87\128\116", "\220\178\57\165\68\222\156\113")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\223\60\225\192\247\52\235\254\250\56\247", "\176\155\85\146"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\134\65", "\136\99\163\113\177\101\232")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\173\165\108", "\66\41\195\128\92\90\231\187")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\251\130\32", "\16\231\149\167")].Value))) or "";
				return (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\74\255", "\166\175\111\207\91")] == LUAOBFUSACTOR_DECRYPT_STR_0("\139\255\251\195\219\74\39\71\221", "\113\236\154\149\166\169\43\75")) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\25\225", "\158\230\60\209\221\128\32")], LUAOBFUSACTOR_DECRYPT_STR_0("\252\62\22\6\244\226\40\146\248\63\88\30\225\250\56\215", "\178\145\81\120\109\145\155\91"), 1, true);
			end
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\152\196\33", "\30\78\170\225\17\208\25\37")], LUAOBFUSACTOR_DECRYPT_STR_0("\43\30\175\207\83\32\92\93\190\195\83\33\92\15\233\149\16\117\82\7\232\146\17\113\83\13", "\68\124\62\199\160\63"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\112\223\220\210\157\5", "\53\125\24\186\177\183\184")].Button, function()
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\2\84\33\81\51\145\253\18\82\37\88\46\235\154", "\206\170\77\26\106\20\106")] < 1.6) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\213\133\197\228\196\122\30\246\210\132\194\229\184\21", "\73\169\154\203\142\161\157\37")] = 1.9;
				elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\4\223\247\36\18\206\235\62\3\222\240\37\110\161", "\188\97\75\145")] < 2) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\110\247\12\102\203\134\137\126\241\8\111\214\252\238", "\217\222\33\185\71\35\146")] = 2.5;
				elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\203\106\104\17\16\11\211\123\107\27\5\16\161\20", "\73\84\132\36\35\84")] < 2.7) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\200\134\54\167\181\246\208\151\53\173\160\237\162\248", "\236\169\135\200\125\226")] = 3;
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\97\204\93\39\119\221\65\61\102\205\90\38\11\178", "\22\98\46\130")] = 1.5;
				end
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\193\195\14\19\120\88\159\221\182", "\224\150\227\102\124\20\60\191") .. tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\244\24\33\163\199\228\1\53\174\209\247\18\79\214", "\230\158\187\86\106")]), 2);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\100\95\189", "\111\86\86\122\141\88\129")], LUAOBFUSACTOR_DECRYPT_STR_0("\133\30\74\73\173\8\4\77\166\18\65\2\224\37\116\2\155\1\69\65\173\90\115\11", "\34\200\113\36"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\197\254\223\38\133\139", "\187\216\173\155\178\67\160")].Accent, monkeyOnce);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\37\58\228", "\84\220\23\31\212\131\70\21")], LUAOBFUSACTOR_DECRYPT_STR_0("\210\118\11\235\213\2\7\214\239\73\47\192\161\67\63\205\238\2\98\251\196\118\11\144", "\185\129\34\74"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\201\135\235\10\84\157", "\173\27\161\226\134\111\113")].Accent, function()
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\155\48\66\84\123", "\139\26\222\126\20\113\73\19")].GreedyMonkeyRunning then
					return;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\245\101\117\157\130", "\35\184\176\43")].GreedyMonkeyRunning = true;
				task.spawn(function()
					while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\226\141\29\106\88", "\79\106\167\195\75")].GreedyMonkeyRunning do
						patchTimers();
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\191\103\125\59\238", "\24\30\222\17")] = false;
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\206\139\217\206\109\30\145", "\31\59\161\231\189\171")] = getMissionsFolder();
						if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\14\134\74\225\3\68\218", "\132\113\97\234\46")] then
							for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\214\122\213\27\176\156\38", "\126\194\185\22\177")]:GetChildren()) do
								if isMonkey(m) then
									TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\241\32\223\98\104", "\88\135\144\86\186\71")] = true;
									break;
								end
							end
						end
						if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\48\190\25\149\4", "\176\52\81\200\124")] then
							rerollAll();
							task.wait(0.3);
						else
							monkeyOnce();
							task.wait(1);
						end
					end
				end);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\208\99\237", "\221\27\226\70")], LUAOBFUSACTOR_DECRYPT_STR_0("\27\50\200\107\136\91\117\38\13\226\66", "\26\72\102\135\59\168\22"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\60\19\9\46\117\100", "\75\80\84\118\100")].Danger, function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\227\150\13\165\148", "\91\128\166\216")].GreedyMonkeyRunning = false;
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\249\207\205\44", "\210\213\176\130\232\28")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
				end);
			end);
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\188\90\41\223\188\191\74\47\197\183\189\73\50\245\183\234\15", "\150\210\207\63\91")].InputBegan:Connect(function(input, gp)
		if gp then
			return;
		end
		if (input.KeyCode == Enum.KeyCode.Insert) then
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\143\22\98\232\226\71\131\26\123\219\174\4", "\139\52\234\120\23\190")] then
				minimize();
			else
				restore();
			end
		end
	end);
	task.spawn(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\22\128\135\243\96", "\214\80\119\233\233")].Visible = true;
		switchTab(LUAOBFUSACTOR_DECRYPT_STR_0("\146\169\87\247\53\198\186\179\88\247\41", "\171\219\199\49\152\71"));
		pcall(function()
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\216\61\4\14\207\33\83\82", "\118\98\174\88")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\144\68\67\28\125\18\94\214", "\107\123\230\33\49\112\28")]:Destroy();
			end
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\83\97\163\93\229", "\184\217\63\20\209\120\213\140")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\216\242\254\123\161", "\145\109\180\135\140\94")].Parent) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\43\144\72\152\129", "\189\177\71\229\58")]:Destroy();
			end
		end);
	end);
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\215\219\28\68", "\57\116\162\178")];
end
local guiOk, guiErr = pcall(createUI);
if not guiOk then
	warn(LUAOBFUSACTOR_DECRYPT_STR_0("\63\131\93\115\185\113\42\57\228\76\100\185\116\39\1\145\102\54\186\116\58\8\161\75\44", "\83\100\196\47\22\220\21"), guiErr);
end
task.spawn(function()
	task.wait(1.2);
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\230\125", "\192\171\195\77\48\95\146")] = mainGui;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\180\13", "\190\80\145\61\205\44\160\82")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\217\204\193\156\9", "\57\36\184\165\175\185")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\183\7", "\47\204\146\55\189")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\136\224\176\226\192\14\171\229\182\251", "\103\197\129\217\140\151"));
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\247\255\44\77\4", "\115\38\150\150\66\104\52\33")] and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\208\235\193\238\138", "\186\54\177\130\175\203")].Visible) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\65\137\29\11\97", "\75\234\32\224\115\46\81\186")].Visible = true;
				print(LUAOBFUSACTOR_DECRYPT_STR_0("\0\145\203\204\135\69\34\139\153\207\141\83\56\179\221\137\175\64\50\184\238\192\140\69\52\161\153\223\139\82\50\180\213\204", "\33\91\214\185\169\226"));
			end
		end
	end);
end);
task.wait(0.3);
pcall(startYCheck);
pcall(updateRoot);
if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\139\67\5\87\106\125\215", "\24\88\231\34\124\50")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\1\199\100\42\26\217\17\220\99\38\23\210\11\199\103\37\23\215\2\221\102\78\102", "\86\149\78\152\34\107")]) then
	pcall(setupNoFallDamage);
end
if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\204\161\9\148\5\238\216\190\3\136\14\238\204\165\7\159\7\244\205\206\118", "\75\177\137\235\70\221")] then
	pcall(setupRejoinQueue);
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\16\140\159\30\148", "\165\132\85\194\201\59")].GreedyHudzell_Ready = true;
print(LUAOBFUSACTOR_DECRYPT_STR_0("\16\18\186\120\46\49\177\64\107\35\252\51\123\123\248\61\45\32\164\113\107\61\189\127\107\39\173\124\47\44", "\29\75\85\200"));
task.defer(function()
	task.wait(0.5);
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\80\193\212\57\13\183", "\151\169\57\181\184\92\40\135")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\205\113\27\171\148\5\97\205\107\19\161\230\106", "\90\53\132\63\95\228\195")];
		if (typeof(showNotification) == LUAOBFUSACTOR_DECRYPT_STR_0("\221\6\123\66\20\171\51\213", "\92\187\115\21\33\96\194")) then
			showNotification(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\141\38\37\63\195\126", "\78\160\228\82\73\90\230")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\226\202\68\136\219\230", "\75\194\184\33\233\191\159"), 2);
		end
	end);
end);
