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
	duration = duration or 2.5;
	if not mainGui then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\3\29\20\69", "\81\168\111\121\49\117\79\56")] = mainGui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\224\24\224\179\195\19\203\185\211\3\227", "\214\167\106\133"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\52\72\10\100", "\185\73\88\44\47\84\31")] then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\219\30\229\131", "\159\232\183\122\192\179")]:Destroy();
		end);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\61\188\40\34\119\248", "\65\68\82\200")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\17\85\106\52\227\206\124\32\92", "\30\69\48\18\64\175\175"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\35\11\229\61\181\124", "\91\144\76\127\140")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\199\26\67\36\215\163\251\223\244\1\64", "\176\128\104\38\65\179\218\181");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\203\214\28\214\129\146", "\117\176\164\162")].Size = UDim2.new(0, 320, 0, 40);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\205\17\249\220\60\212", "\25\228\162\101\144\186")].Position = UDim2.new(0.5, -160, 0.88, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\57\173\7\244\161\24", "\132\40\86\217\110\146")].AnchorPoint = Vector2.new(0, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\196\51\181\161\54\172", "\62\30\171\71\220\199\19\156")].BackgroundColor3 = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\77\169\59\88\140\127", "\45\32\37\204\86\61\169\79")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\93\0\177\176\57\5", "\28\53\53\101\220\213")].Button) or Color3.fromRGB(40, 40, 40);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\83\28\72\92\228\0", "\191\109\60\104\33\58\193\48")].BackgroundTransparency = 0.15;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\216\12\238\129\146\72", "\135\231\183\120")].Text = tostring(text);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\5\88\237\51\95\249", "\201\134\106\44\132\85\122")].TextColor3 = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\4\114\50\4\73\152", "\67\86\108\23\95\97\108\168")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\48\73\7\161\97\133", "\48\196\88\44\106\196\68\181")].Text) or Color3.fromRGB(240, 240, 240);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\208\200\42\134\225\242", "\76\226\191\188\67\224\196\194")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\39\19\249\251\156\120", "\157\185\72\103\144")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\188\158\115\174\244\9", "\209\57\211\234\26\200")].ZIndex = 500;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\193\178\136\86\151\81", "\178\97\174\198\225\48")].Parent = mainGui;
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\250\127\39\254\106\232\10\221", "\111\175\54\100\145\24\134"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\22\52\28\69\92\112", "\117\35\121\64")]).CornerRadius = UDim.new(0, 8);
	task.delay(duration, function()
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\178\250\223\37\10\141", "\47\189\221\142\182\67")] then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\176\51\194\78\236\112", "\73\64\223\71\171\40\201\64")]:Destroy();
			end);
		end
	end);
end
local function saveSettings()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\136\208\77\169\115\13\158\129\9", "\29\106\237\164\57\192")].autofarmVariant = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\145\211\149\243\243\146\223\142\146\198\136\252\243\142\198\244\244", "\146\209\196\135\218\181\178\192")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\53\151\5\89\169\42\35\198\65", "\199\77\80\227\113\48")].rejoinQueue = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\26\116\226\3\17\97\252\31\26\107\232\21\26\112\236\8\19\123\233\111\111", "\173\74\95\62")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\28\72\34\194\9\187\213\92\12", "\220\166\121\60\86\171\103")].webhookURL = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\39\31\152\20\229\49\214\55\15\156\126\154", "\122\137\98\93\208\91\170")];
	saveData(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\228\8\91\220\188\174\217\194\177", "\170\231\129\124\47\181\210\201")], LUAOBFUSACTOR_DECRYPT_STR_0("\152\190\46\36\3\36\140\168\116\58\25\37\133", "\74\235\219\90\80\106"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\236\119\31\31\198\63\162", "\146\44\163\59\91\90\148\26")]);
end
local function saveStats()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\57\185\149\90\48\125", "\41\21\77\216\225")].bagCounter = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\76\117\102\27\88\124\81\17\95\55\21", "\37\116\45\18")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\235\87\182\184\138\175", "\203\175\159\54\194")].pointsCounter = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\193\16\53\78\92\225\116\219\23\47\95\93\135\43", "\162\27\174\121\91\58\47")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\209\30\225\44\156\131", "\185\179\165\127\149\95")].autofarmStartTime = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\96\219\251\17\80\103\194\199\3\80\103\219\192\30\92\112\138\164", "\119\49\21\175\148")];
	saveData(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\161\23\73\62\12\218", "\149\55\213\118\61\77\41\234")], LUAOBFUSACTOR_DECRYPT_STR_0("\14\18\203\210\250\119\165\8\18\8", "\123\125\102\170\166\137\89\207"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\47\116\25\43\177\236\30", "\201\46\96\56\93\110\227")]);
end
local function sendWebhook(content)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\38\204\209\58\238\144\60\219\203\57\132\235", "\161\219\99\142\153\117")] or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\148\132\91\226\83\154\153\70\255\80\244\246", "\173\28\209\198\19")] == "")) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\237\163\186\48\188", "\219\21\140\215")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\77\181\196\162\92\91", "\56\40\216\166\199")]={{[LUAOBFUSACTOR_DECRYPT_STR_0("\50\189\1\35\35", "\79\70\212\117")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\63\207\226\214\58\152\34\200\242\213\40\226\70", "\109\199\118\129\166\153")],[LUAOBFUSACTOR_DECRYPT_STR_0("\53\181\100\245\35\185\103\226\56\191\121", "\150\81\208\23")]=content,[LUAOBFUSACTOR_DECRYPT_STR_0("\250\202\236\132\235", "\235\153\165\128")]=16763904,[LUAOBFUSACTOR_DECRYPT_STR_0("\189\70\173\59\67\52", "\158\219\41\194\79\38\70\202")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\87\32\55\22", "\232\35\69\79\98\142\182")]=(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\12\30\228\124\18\90\173", "\157\25\96\127")].Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\231\203", "\81\199\227\149\101\48") .. (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\94\250\8\243\148\121\235", "\219\29\50\155\113\150\230\92")].DisplayName or "") .. ")")},[LUAOBFUSACTOR_DECRYPT_STR_0("\197\41\200\126\236\92\76\220\48", "\45\177\64\165\27\159\40")]=os.date(LUAOBFUSACTOR_DECRYPT_STR_0("\92\83\54\231\55\16\91\74\174\70\88\62\85\239\95\71\83\60\144", "\18\125\118\111\202"))}}};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\51\93\227\117\253", "\155\48\92\57\154\80\205\167")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\217\175\175\203\174\87\175\196\184\186\189\250", "\37\217\173\219\223\152\203")]:JSONEncode(TABLE_TableIndirection["data%0"]);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\0\14\115\31", "\150\105\101\127\86\47\200")] = (syn and syn.request) or http_request or request;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\247\226\240\151", "\160\174\146\147\213\167")] then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\225\11\1\92", "\33\32\132\122\36\108")]({[LUAOBFUSACTOR_DECRYPT_STR_0("\140\6\126", "\28\217\116\18\43")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\114\244\124\255\129\23\237\98\228\120\149\254", "\92\178\55\182\52\176\206")],[LUAOBFUSACTOR_DECRYPT_STR_0("\55\48\101\29\21\49", "\117\122\85\17")]=LUAOBFUSACTOR_DECRYPT_STR_0("\184\192\25\112", "\189\232\143\74\36\198"),[LUAOBFUSACTOR_DECRYPT_STR_0("\212\175\11\74\210\24\239", "\106\156\202\106\46\183")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\30\22\117\39\47\51\13\54\7\51\45\28", "\74\93\121\27\83")]=LUAOBFUSACTOR_DECRYPT_STR_0("\124\171\246\114\116\184\231\106\116\180\232\49\119\168\233\112", "\30\29\219\134")},[LUAOBFUSACTOR_DECRYPT_STR_0("\119\168\29\227", "\110\53\199\121\154\148\63\120")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\21\251\38\28\172", "\156\97\122\159\95\57")]});
		end);
	end
end
local function updateRoot()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\186\219\225\14\16\122\158", "\95\174\214\186\152\107\98")].Character then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\1\126\159\86\150", "\166\233\110\17\235\115")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\2\197\216\247\172\57\40", "\28\24\110\164\161\146\222")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\115\214\91\36\85\204\95\33\105\204\89\49\107\194\68\49", "\69\59\163\54")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\164\203\83\54\223\243\224", "\214\208\200\170\42\83\173")].Character:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\241\52\127\161\123\214\40\118\146\122\214\53\66\161\103\205", "\21\185\65\18\192"), 3);
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\89\82\15\228\174", "\193\158\54\61\123")] = nil;
	end
end
local function freezeCamera()
	if cameraFrozen then
		return;
	end
	savedCameraCFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\16\45\188\39\16\101\233", "\217\85\113\64")].CFrame;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\14\193\197\253\131\160\27", "\133\43\111\172\160\143\226")].CameraType = Enum.CameraType.Scriptable;
	cameraFrozen = true;
end
local function unfreezeCamera()
	if not cameraFrozen then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\162\93\212\210\202\230\0", "\160\171\195\48\177")].CameraType = Enum.CameraType.Custom;
	if savedCameraCFrame then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\2\123\40\78\192\234\151", "\167\179\99\22\77\60\161\207")].CFrame = savedCameraCFrame;
	end
	cameraFrozen = false;
	savedCameraCFrame = nil;
end
local function toggleNoClip(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\80\168\116\101\49\64\174\118\109\35\83\174\124\9\81", "\44\97\31\235\56")] = state;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\2\249\189\244\28\189\244", "\196\145\110\152")].Character then
		for _, p in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\34\255\235\93\60\187\162", "\146\56\78\158")].Character:GetDescendants()) do
			if p:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\15\218\92\227\106\44\201\91", "\58\77\187\47\134")) then
				p.CanCollide = not state;
			end
		end
	end
end
local function setWorkspaceNoClip(state)
	if (state == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\58\179\12\246\62\85\29\23\27\174\36\233\39\68\59\28\52\163\11\224\42\17\78", "\126\114\85\193\103\133\78\52")]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\212\32\115\215\203\51\123\193\245\61\91\200\210\34\93\202\218\48\116\193\223\119\40", "\24\164\187\82")] = state;
	if state then
		task.spawn(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\210\93\184\180\161", "\145\145\186\60\202")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\220\50\29\227\194\118\84", "\100\134\176\83")].Character;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\132\18", "\117\179\161\34\221\211")] = 0;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\177\234\131\84", "\197\45\208\154\166\100\159")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\251\148\183\32\57\245\133\185\118\121", "\83\73\148\230\220")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\30\222\230", "\233\83\191\150\128\143")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\137\221\121\30\231\135\204\119\72\167", "\109\151\230\175\18")];
			for _, obj in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\251\81\1\208", "\224\192\154\33\36")]:GetDescendants()) do
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\91\10\137\144\68\25\129\134\122\23\161\143\93\8\167\141\85\26\142\134\80\93\210", "\226\227\52\120")] then
					break;
				end
				if (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\39\234\255\161\122\190\197\173", "\217\101\139\140\196\42\223\183")) and not (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\7\174\8\1\74", "\36\122\111\207\122")] and obj:IsDescendantOf(TABLE_TableIndirection["char%0"]))) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\26\237\191\177\58\13\4\199\183\180\56\5\27\237\183\182\7\24\9\240\189\171\113\92", "\84\108\104\132\216\216")][obj] = obj.CanCollide;
					obj.CanCollide = false;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\94\150", "\34\172\123\166\56\128\196")] += 1
				if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\236\248", "\116\196\201\200\171\42\19\181")] % 80) == 0) then
					task.wait();
				end
			end
		end);
	else
		for obj, old in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\148\242\90\28\14\29\122\165\244\81\25\9\15\127\137\245\110\1\1\8\115\149\190\13", "\124\22\230\155\61\117\96")]) do
			if (obj and obj.Parent) then
				obj.CanCollide = old;
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\185\239\236\247\227\244\201\136\233\231\242\228\230\204\164\232\216\234\236\225\192\184\163\187", "\149\165\203\134\139\158\141")] = {};
	end
end
local function shouldIgnore(part)
	if (not part or not part.Parent) then
		return true;
	end
	if IgnoredParts[part] then
		return true;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\163\82\45\32\188\65\37\54\233\16", "\70\83\204\32")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\12\128\5\142\15\131\7\133\12\128\12\147\30\128\28\142\29", "\224\110\225\107")) and part:IsDescendantOf(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\121\207\58\35\212\197\247\115\152\97", "\164\148\22\189\81\80\164")].bannablebagspawns)) then
		return true;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\143\101\184\52\91\118\177\133\50\227", "\23\210\224\23\211\71\43")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\139\147\25\187\81\34\210\247\186", "\144\201\230\112\215\53\75\188")) and part:IsDescendantOf(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\202\11\225\229\181\84\198\28\175\166", "\197\53\165\121\138\150")].Buildings)) then
		return true;
	end
	return false;
end
local function removeEntity(part)
	if ESP_OBJECTS[part] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\154\137", "\64\141\191\185")] = ESP_OBJECTS[part];
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\175\224", "\198\99\138\208\186\151\169")].highlight then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\176\211", "\62\109\149\227")].highlight:Destroy();
			end);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\205\217", "\96\147\232\233\180")].billboard then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\125\74", "\89\72\88\122\43\237")].billboard:Destroy();
			end);
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\254\245", "\123\76\219\197\86")].model and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\235\37\51\195\16\124\253\57\63\171\111", "\95\56\184\117\108\142")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\135\118", "\140\144\162\70")].model] == part)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\27\105\77\195\255\12\124\94\221\149\120", "\142\176\72\57\18")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\116\64", "\68\198\81\112")].model] = nil;
		end
		ESP_OBJECTS[part] = nil;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\74\224", "\125\215\111\208\116\44")] = getBagModel(part);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\2\31", "\60\103\39\47\147\24")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\57\199\191\251\220\106\201\38\196\197\134", "\46\140\106\151\224\182\147")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\104\45", "\34\139\77\29")]] == part)) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\195\45\107\4\159\212\56\120\26\245\160", "\73\208\144\125\52")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\169\218", "\171\74\140\234\171\167\112\51")]] = nil;
	end
	ValidEntities[part] = nil;
end
local function getTypeName(data, part)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\75\28", "\205\79\110\44\63\145")] = data and (data.typ or data.type or data.Type);
	if (typeof(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\26\111", "\124\199\63\95\168\212\107\196")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\21\188\65\51\170\240", "\147\102\200\51\90\196\151\233")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\255\248\136\238", "\91\91\144\143\173\222\128")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\229\28", "\46\67\192\44\49\203")]:lower();
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\217\57\231\116", "\101\100\182\78\194\68\196")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\74\73\55", "\181\40\40\80\149\237\43\24")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\189\50\119\234", "\114\117\210\69\82\218\42")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\81\216\81\124\162", "\204\36\182\56\19"))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\203\74\219", "\114\137\43\188\227\29\88");
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\18\191\85\180", "\112\132\125\200")]:find(LUAOBFUSACTOR_DECRYPT_STR_0("\254\185\240\123\95", "\149\157\216\147\19\58")) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\234\135\27\192\204", "\168\169\230\120");
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\130\128\18\240\200\212", "\119\156\237\228")] = getBagModel(part);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\208\9\112\134\129", "\30\163\177\96")] = getMainPart(part);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\47\81\140\49\110\132", "\180\122\64\53\233\93\75")] or (part and isUUIDName(part.Name))) then
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\22\26\51\147\71", "\93\182\119\115")] and isRedish(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\30\218\130\242\174", "\158\226\127\179\236\215")].Color)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\211\193\206", "\182\145\160\169");
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\101\96", "\111\89\64\80\118\199")] = detectRarity(part, data);
		if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\242\94", "\38\223\215\110")] == LUAOBFUSACTOR_DECRYPT_STR_0("\107\213\15\202\166\83\212\2", "\203\62\187\108\165")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\49\24", "\176\153\20\40\94\17\158")] == LUAOBFUSACTOR_DECRYPT_STR_0("\154\50\169\86", "\165\200\83\219\51")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\175\36", "\132\167\138\20\27\177\213\220")] == LUAOBFUSACTOR_DECRYPT_STR_0("\215\197\234\79", "\92\146\181\131\44")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\187\17", "\189\43\158\33\230\222\32\119")] == LUAOBFUSACTOR_DECRYPT_STR_0("\114\197\74\84\134\90\193\95\72", "\232\62\160\45\49")) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\150\165", "\193\20\179\149\204")] == LUAOBFUSACTOR_DECRYPT_STR_0("\226\13\149\203\218\0\149\199", "\162\183\97\225"))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\11\196\227", "\193\73\165\132\151\124\130");
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\205\173\94\186\243\157", "\214\173\162\201\59\214")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\118\174\68\219\101\115", "\64\67\25\202\33\183")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\196\239\120\178", "\35\137\142\17\220\78\178"))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\15\79\34", "\97\77\46\69");
		end
		return LUAOBFUSACTOR_DECRYPT_STR_0("\252\222\3\173\218", "\197\191\191\96");
	end
	return LUAOBFUSACTOR_DECRYPT_STR_0("\233\40\238\70\93", "\45\170\73\141\46\56\136");
end
local function createESP(part, data)
	if (not part or not part.Parent or ESP_OBJECTS[part] or shouldIgnore(part)) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\0\201\224\163\172\2\152\74\157", "\103\225\111\173\133\207\231")] = getBagModel(part) or (data and data.model) or part;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\183\197\106\97\171\209\112\96\183\176\5", "\53\44\228\149")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\212\63\0\199\15\200\194\126\85", "\68\173\187\91\101\171")]] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\22\2\130\25", "\185\156\111\114\167\41\226\29")] = getTypeName(data, part);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\4\4\41\160\250\78\85", "\131\107\101\118\64\212")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\207\60\110\23", "\169\161\182\76\75\39\160")] == LUAOBFUSACTOR_DECRYPT_STR_0("\251\83\176", "\200\185\50\215\235\123\66")) and detectRarity(part, data)) or nil;
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\152\201\167\218", "\122\146\225\185\130\234\22")] == LUAOBFUSACTOR_DECRYPT_STR_0("\155\227\199", "\219\217\130\160\175\143")) and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\143\114\2\28\157\101\14\1\153\108\28\28\144\103\25\123\236", "\93\94\220\34")]) then
		return;
	end
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\209\209\207\138", "\157\111\168\161\234\186\151")] == LUAOBFUSACTOR_DECRYPT_STR_0("\88\65\118\57\199", "\229\27\32\21\81\162\217\210")) and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\255\203\5\105\13\239\211\31\121\19\233\213\27\104\0\233\223\127\26", "\42\76\172\155\90")]) then
		return;
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\190\177\22\37\220\172\163\5\37\214\200\209", "\96\146\237\225\73")] then
		return;
	end
	if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\103\24\173\25", "\194\136\30\104\136\41\26")] == LUAOBFUSACTOR_DECRYPT_STR_0("\254\215\4", "\79\188\182\99\40\116\208\201")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\194\56\72\55\38\56\147", "\95\29\163\74\33\67")] and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\1\112\8\77\171\54\85\6\121\114\47", "\100\28\82\32\87\31\234")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\83\242\120\239\207\173\110", "\94\81\50\128\17\155\182\136")]]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\51\232\54\240\241\76", "\231\235\92\132\89\130\212\124")] = nil;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\173\228\122\129", "\37\158\212\148\95\177")] == LUAOBFUSACTOR_DECRYPT_STR_0("\87\29\167\143\8", "\109\20\124\196\231")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\178\120\170\35\101\240", "\64\192\221\20\197\81")] = Color3.fromRGB(0, 220, 140);
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\249\238\173\181\234\166", "\199\207\150\130\194")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\75\105\225\87\172\15\43", "\35\213\42\27\136")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\166\9\150\236\203\159\164\20\147\247\192\147\194\107", "\146\192\231\91\223\184")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\240\228\32\197\173\66\94", "\110\58\145\150\73\177\212\103")]]) or Color3.fromRGB(0, 255, 120);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\56\143\162", "\137\148\84\170\146\43\171")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\41\214\120\245\123\8\216\119\233", "\23\97\191\31\157"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\142\66\85", "\82\230\226\103\101\189")].Adornee = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\38\246\225", "\116\235\74\211\209")].FillColor = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\51\210\42\58\121\142", "\69\72\92\190")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\55\161\132", "\215\86\91\132\180\203\200\118")].OutlineColor = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\226\195\131", "\179\83\142\230")].FillTransparency = 0.5;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\35\184\101", "\191\186\79\157\85\89\127\151")].DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\118\225\158", "\37\150\26\196\174\228")].Parent = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\242\247\5", "\233\169\144\210\53\87")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\0\79\225\208\32\73\236\206\38\97\248\213", "\188\66\38\141"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\82\72\97", "\168\129\48\109\81\19\34\104")].Adornee = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\22\73\96", "\153\23\116\108\80\191\69\219")].Size = UDim2.new(0, 170, 0, 70);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\29\184\136", "\22\41\127\157\184\152\235")].StudsOffset = Vector3.new(0, 4, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\197\164\154", "\170\119\167\129")].AlwaysOnTop = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\242\249\35", "\62\186\144\220\19\227")].MaxDistance = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\221\212\233\133\213\223\226\128\210\207\243\228\172", "\182\193\156\140")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\78\83\226", "\95\161\44\118\210\134")].Parent = part;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\88\7\72\42", "\206\134\32\115\109\26\182\133")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\2\253\215\7\113\92\52\253\195", "\61\86\152\175\115\61"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\25\200\117\129", "\167\201\97\188\80\177\225\67")].Size = UDim2.new(1, 0, 1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\16\144\234\172", "\225\46\104\228\207\156")].BackgroundTransparency = 0.4;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\216\167\11\103", "\223\202\160\211\46\87\51\210")].BackgroundColor3 = Color3.new(0, 0, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\241\14\49\93", "\109\182\137\122\20")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\166\30\245\242\146\186", "\28\50\201\114\154\128\183\138")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\158\13\183\250", "\146\202\230\121")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\247\250\91\151", "\94\142\143\142\126\167\210\192")].TextScaled = true;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\220\13\164\151", "\167\96\165\125\129")] == LUAOBFUSACTOR_DECRYPT_STR_0("\36\215\21\78\71", "\232\103\182\118\38\34\70\43")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\79\59\166\96", "\17\85\55\79\131\80")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\235\132\186\164\58", "\95\168\229\217\204");
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\35\146\204\218", "\233\234\91\230")].Text = string.format("Bag\n[%s]", TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\64\144\122\179\72\4\210", "\199\49\33\226\19")] or LUAOBFUSACTOR_DECRYPT_STR_0("\113\84\78\18\200\92", "\167\50\59\35\127"));
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\11\70\169\248", "\200\40\115\50\140")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\47\50\79", "\127\147\77\23")];
	ESP_OBJECTS[part] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\131\239\242\124\124\130\225\253\96", "\16\235\134\149\20")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\71\11\246", "\108\186\43\46\198\108\231")],[LUAOBFUSACTOR_DECRYPT_STR_0("\48\182\249\13\126\61\190\231\5", "\28\82\223\149\97")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\55\8\14", "\62\205\85\45")],[LUAOBFUSACTOR_DECRYPT_STR_0("\97\9\185\189", "\105\21\108\193\201\98\233")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\157\15\187\147", "\186\32\229\123\158\163\94")],[LUAOBFUSACTOR_DECRYPT_STR_0("\22\34\99\195\13\188", "\87\100\67\17\170\121\197")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\138\168\137\67\172\171\219", "\213\142\235\218\224\55")],[LUAOBFUSACTOR_DECRYPT_STR_0("\28\187\233", "\165\104\194\153")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\41\201\238\169", "\237\231\80\185\203\153\61")],[LUAOBFUSACTOR_DECRYPT_STR_0("\168\63\132\119\73", "\37\197\80\224\18")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\77\72\67\184\50\71\85\3\228", "\212\121\34\44\38")]};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\137\26\58\83\130\214\123\150\137\111\85", "\62\218\218\74\101\30\205\146")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\166\125\244\209\21\65\54\7\249", "\79\34\201\25\145\189\94\36")]] = part;
end
local function updateBillboard(part)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\35\229\30\5\4", "\52\32\76\138\106\32")] or not ESP_OBJECTS[part]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\191\96", "\26\216\154\80\166")] = ESP_OBJECTS[part];
	if not part.Parent then
		removeEntity(part);
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\192\254\87\56\124", "\76\172\169\141\35\29")] = (part.Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\214\247\23\153\137", "\99\188\185\152")].Position).Magnitude;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\29\165\26\230\130", "\195\178\116\214\110")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\214\190\74\229\207\54\195\167\91\226\195\64\167", "\134\101\151\230\21\161")]) then
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\207\106", "\128\201\234\90\52\67\82")].billboard then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\8\110", "\170\196\45\94\20")].billboard.Enabled = false;
		end
		return;
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\1\85", "\80\30\36\101\84\161\64")].billboard then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\20\73", "\91\198\49\121\34\184")].billboard.Enabled = true;
	end
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\131\39", "\233\84\166\23\217")].text then
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\61\168", "\65\24\24\152\134\86")].typ == LUAOBFUSACTOR_DECRYPT_STR_0("\159\54\235\65\185", "\41\220\87\136")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\115\179", "\203\69\86\131\144\174")].text.Text = string.format("Cache\n%d studs", math.floor(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\23\64\77\141\0", "\113\217\126\51\57\168\48\135")]));
		else
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\80\102", "\174\127\117\86\40\40\31\22")].text.Text = string.format("Bag\n[%s]\n%d studs", TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\126\28", "\187\188\91\44")].rarity or LUAOBFUSACTOR_DECRYPT_STR_0("\60\248\115\40\237\3", "\109\127\151\30\69\130"), math.floor(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\140\100\12\128\128", "\118\178\229\23\120\165\176\210")]));
		end
	end
end
local function clearAllESP()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\153\28", "\221\101\188\44\105\108\207\65")] = {};
	for p in pairs(ESP_OBJECTS) do
		table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\117\71", "\178\54\80\119\194")], p);
	end
	for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\74\17", "\162\84\111\33\162\143\153\217")]) do
		removeEntity(p);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\232\45\181\10\244\57\175\11\232\88\218", "\234\71\187\125")] = {};
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
	showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\62\62\91\94\253\5\124\88\92\240\30\46\84\95", "\158\113\92\49\59"), 2);
end
local function getPlayerRoot(plr)
	return plr.Character and plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\196\101\76\113\240\9\211\3\222\127\78\100\206\7\200\19", "\103\140\16\33\16\158\102\186"));
end
local function removePlayerESP(plr)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\200\237", "\92\167\237\221\21\99")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\44\44\63\250\50\8\21\207\101\125", "\70\159\64\77")][plr];
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\10\2", "\122\183\47\50\159")] then
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\116\247", "\224\162\81\199\47")].highlight then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\0\99", "\227\136\37\83\93")].highlight:Destroy();
			end);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\232\88", "\20\57\205\104")].billboard then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\238\72", "\83\72\203\120\217\122\58")].billboard:Destroy();
			end);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\172\235", "\223\220\137\219\195\207\221")].connections then
			for _, c in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\13\15", "\76\115\40\63\130")].connections) do
				pcall(function()
					c:Disconnect();
				end);
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\22\44\180\179\195\162\41\29\232\230", "\177\231\122\77\205\214")][plr] = nil;
	end
end
local function createPlayerESP(plr)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\32\113\127\153\112\101\42\100\114\154\99\97\61\96\98\133\121\96\86\17", "\60\36\115\33\32\201")] or (plr == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\122\86\95\73\76\120\241", "\193\215\22\55\38\44\62\93")]) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\30\15\214\208\233\10\33\62\138\133", "\155\79\114\110\175\181")][plr]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\68\156\180", "\181\56\52\185\132\209\236")] = getPlayerRoot(plr);
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\92\151\248", "\154\82\44\178\200\37\201")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\231\71\93", "\21\21\139\98\109\222\40")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\44\229\171\132\54\13\235\164\152", "\90\100\140\204\236"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\24\123\156", "\120\204\116\94\172\215")].Adornee = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\173\253\88", "\31\99\221\216\104\139\194\16")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\172\175\92", "\131\85\192\138\108\105")].FillColor = Color3.fromRGB(255, 100, 100);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\168\58\83", "\99\86\196\31")].OutlineColor = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\56\10\173", "\111\48\84\47\157\63\199")].FillTransparency = 0.4;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\10\197\247", "\78\122\102\224\199")].DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\20\49\83", "\159\156\120\20\99\84\101\206")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\1\201\47", "\71\28\113\236\31\168\33\23")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\252\102\168", "\199\45\158\67\152\185\185\91")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\120\112\177\162\210\25\214\194\94\94\168\167", "\176\58\25\221\206\176\118\183"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\19\156\86", "\216\82\113\185\102\142")].Adornee = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\75\101\136", "\29\34\59\64\184")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\28\13\154", "\61\114\126\40\170\85")].Size = UDim2.new(0, 110, 0, 36);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\42\50\105", "\19\172\72\23\89\163")].StudsOffset = Vector3.new(0, 3, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\94\138\181", "\197\87\60\175\133\85\50")].AlwaysOnTop = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\124\145\131", "\179\116\30\180")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\214\168\209", "\225\139\166\141")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\147\224\101\29", "\64\45\235\148")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\66\84\34\246\112\212\116\84\54", "\181\22\49\90\130\60"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\201\172\76\95", "\105\111\177\216")].Size = UDim2.new(1, 0, 1, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\2\220\87\64", "\179\212\122\168\114\112")].BackgroundTransparency = 0.3;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\98\144\136\41", "\173\25\26\228")].BackgroundColor3 = Color3.new(0, 0, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\110\221\255\72", "\120\118\22\169\218")].TextColor3 = Color3.fromRGB(255, 100, 100);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\56\162\163\151", "\134\167\64\214")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\145\234\205\153", "\168\100\233\158\232\169")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\76\13\185\34", "\156\18\52\121")].Text = plr.Name;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\8\207\143\212", "\191\35\112\187\170\228\213\101")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\173\57\5", "\31\216\207\28\53\94\124")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\40\165\1\72\100\119", "\59\65\71\203\111")] = {};
	table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\175\114\122\152\73\100", "\84\119\192\28\20\235\108")], plr.CharacterAdded:Connect(function()
		task.wait(0.5);
		removePlayerESP(plr);
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\205\20\201\42\16\136\120\169\204\23\201\63\18\136\99\160\219\0\179\74", "\33\236\158\68\150\122\92\201")] then
			createPlayerESP(plr);
		end
	end));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\212\248\0\76\227\28\211\232\188\73", "\89\128\184\153\121\41\145")][plr] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\228\60\163\137\46\142\7\51\248", "\91\140\85\196\225\66\231\96")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\180\242\225", "\43\83\216\215\209")],[LUAOBFUSACTOR_DECRYPT_STR_0("\73\174\188\7\44\68\166\162\15", "\78\43\199\208\107")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\138\69\78", "\182\18\232\96\126\219\90\165")],[LUAOBFUSACTOR_DECRYPT_STR_0("\41\91\63\188", "\200\93\62\71")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\85\90\159\148", "\110\38\45\46\186\164\210")],[LUAOBFUSACTOR_DECRYPT_STR_0("\123\177\166\24\59\123\170\161\25\48\107", "\94\24\222\200\118")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\207\40\23\14\133\118", "\121\125\160\70")]};
end
local function updateAllPlayerESP()
	for _, plr in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\230\58\171\246\248\40\247\163", "\210\147\138\91")]:GetPlayers()) do
		if (plr ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\241\201\82\53\1\112\173", "\115\85\157\168\43\80")]) then
			removePlayerESP(plr);
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\105\183\104\188\229\103\240\218\104\180\104\169\231\103\235\211\127\163\18\220", "\169\159\58\231\55\236\169\38")] then
				createPlayerESP(plr);
			end
		end
	end
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\205\190\9\193\6\111\84\145", "\28\113\161\223\112\164\116")].PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		task.wait(0.5);
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\107\119\70\107\234\121\126\92\105\245\103\98\87\122\228\116\98\93\30\150", "\59\166\56\39\25")] then
			createPlayerESP(plr);
		end
	end);
end);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\212\199\209\70\160\203\131\152", "\35\210\184\166\168")].PlayerRemoving:Connect(removePlayerESP);
local function getClosestEntity()
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\86\114\86\97\39", "\23\57\57\29\34\68")] then
		return nil;
	end
	local closest, minDist = nil, math.huge;
	for part, data in pairs(ValidEntities) do
		if (part and part.Parent and not shouldIgnore(part)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\40\15\105\0", "\76\48\81\127")] = getTypeName(data, part);
			if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\144\101\152\44\85\239\125\49\136\126\147\47\49\141", "\48\110\197\49\215\106\20\189")] == LUAOBFUSACTOR_DECRYPT_STR_0("\62\19\75\164\197", "\108\125\114\40\204\160\75\38")) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\105\239\72\101", "\109\85\16\159")] ~= LUAOBFUSACTOR_DECRYPT_STR_0("\4\242\174\83\30", "\208\71\147\205\59\123\56"))) then
			elseif ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\21\176\151\113\1\182\149\104\13\171\156\114\101\212", "\216\55\64\228")] == LUAOBFUSACTOR_DECRYPT_STR_0("\157\137\57", "\139\223\232\94\162\217\149")) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\154\51\180\235", "\170\181\227\67\145\219\53")] ~= LUAOBFUSACTOR_DECRYPT_STR_0("\123\132\25", "\210\57\229\126"))) then
			elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\42\250\227\98", "\227\216\83\138\198\82\165")] == LUAOBFUSACTOR_DECRYPT_STR_0("\9\180\177", "\146\75\213\214\24")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\127\211\77\110\92\16\26", "\53\42\30\161\36\26\37")] = detectRarity(part, data);
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\216\197\205\194\203\214\210\212\205\206\165\173", "\128\157\153\151")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\116\158\32\1\106\51\37", "\19\22\21\236\73\117")]] then
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\204\177\189\178\237", "\150\23\165\194\201\151\221\77")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\52\231\14\59\107", "\122\30\91\136")].Position - part.Position).Magnitude;
					if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\173\246\164\200\239", "\237\223\196\133\208")] < minDist) then
						minDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\1\208\170\27\170", "\154\188\104\163\222\62")];
						closest = part;
					end
				end
			else
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\228\62\239\85\31", "\162\85\141\77\155\112\47")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\38\169\90\87\121", "\46\114\73\198")].Position - part.Position).Magnitude;
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\119\101\251\107\26", "\42\197\30\22\143\78")] < minDist) then
					minDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\76\76\43\54\21", "\95\19\37\63")];
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
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\13\138\217\67\38\78\1\136\216\84\66\33", "\103\17\76\199\156\17")] == 1) then
		unfreezeCamera();
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\15\167\192\115\63\146\197\156\4\186\219\104\63\137\191\227", "\154\211\74\229\136\60\112\217")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\29\237\238\10\82\161\8\239\223\64\23", "\39\207\124\138\173\101")] > 0)) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\13\66\208\177\203\5\6\144", "\194\174\97\35\160")] = os.time() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\53\41\13\249\33\47\15\204\52\60\16\235\20\52\15\250\101\109", "\98\159\64\93")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\161\37\90\65", "\68\110\209\77\127\113\102\59")] = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\232\166\95\16\198\170\235\180", "\206\206\132\199\47\99\163")] > 0) and math.floor(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\195\208\81\94\227\204\195\119\67\179\146", "\49\150\162\183\18")] / (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\38\186\49\9\229\28\12\122", "\120\41\74\219\65\122\128")] / 3600))) or 0;
		sendWebhook(string.format("**Autofarm stopped**\nBags: %d | Points: %d\nRuntime: %ds | Bags/Hour: ~%d", TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\7\91\57\234\178\219\78\3\78\95\181", "\181\58\102\60\122\133\199")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\237\213\23\110\64\193\211\12\116\71\231\206\92\42", "\26\51\130\188\121")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\142\45\9\90\27\243\28\184", "\57\136\226\76\121\41\126\151")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\199\1\22\116", "\29\66\183\105\51\68\131")]));
	end
end
local function moveBlatant(target)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\42\70\218\0\117", "\174\37\69\41")] or not target or not target.Parent) then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\191\64\15\28\196\230", "\112\225\214\46\110")] = target.Position + Vector3.new(0, 3, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\45\48\79\161\237", "\140\126\68\67\59\132\221")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\126\8\95\8\79", "\230\226\17\103\43\45\127")].Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\69\202\74\139\149\28", "\231\176\44\164\43")]).Magnitude;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\207\55\189\235\220", "\236\193\166\68\201\206")] <= 2) then
		return true;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\46\218\52\84", "\17\100\91\168")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\175\159\248\246\115", "\27\58\198\236\140\211\67")] / TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\203\202\79\138\255\40\219\201\121\153\238\36\201\137\26", "\139\65\173\172\42\233")], 0.12);
	currentFlyTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\65\116\221\202\68\229\90\145\95\114\221\129\39", "\40\231\54\17\184\164\23\128")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\220\109\189\213", "\138\228\169\31\152\229")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\239\42\80\52\237\198", "\163\172\108\34\85\128")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\24\249\134\215\1\216", "\52\71\113\151\231\187\36\232")])});
	currentFlyTween:Play();
	currentFlyTween.Completed:Wait();
	currentFlyTween = nil;
	return not autofarmStopRequested and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\184\76\130\80\172\74\128\73\168\86\140\84\161\93\137\51\221", "\205\22\237\24")];
end
local function moveSafe(target)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\119\124\220\124\238", "\89\222\24\19\168")] or not target or not target.Parent) then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\88\65\176\20\225\105\92\164\84\165", "\113\149\57\51\215")] = target.Position;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\121\197\183\238\133\41", "\160\25\16\171\214\130")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\217\37\122\120\198\187\126\203\114\45", "\235\17\184\87\29\29\178")] + Vector3.new(0, 3, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\187\118\237\254\174\144\60\168", "\144\202\201\25\152")] = 5;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\206\22\59\171", "\96\89\187\100\30\155\42\135")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\194\12\94\63\45", "\29\77\173\99\42\26")].Position;
	if (math.abs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\247\21\63\11", "\109\228\130\103\26\59\143\151")].Y - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\106\161\204\48\78\22\193\211", "\228\227\24\206\185\94\42\79")]) > 0.5) then
		currentFlyTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\53\50\173\186\40\53\220\52\62\171\177\94\96", "\80\174\66\87\200\212\123")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(0.3, Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\232\95\44\201\250\22", "\115\171\25\94\168\151")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\167\246\100\167", "\151\108\210\132\65")].X, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\70\6\93\200\69\254\17\136", "\52\184\52\105\40\166\33\167")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\27\223\237\106", "\172\50\110\173\200\90\180")].Z)});
		currentFlyTween:Play();
		currentFlyTween.Completed:Wait();
		currentFlyTween = nil;
		if (autofarmStopRequested or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\143\192\99\221\155\198\97\196\159\218\109\217\150\209\104\190\234", "\44\155\218\148")]) then
			return false;
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\233\35\46\218\35\133\236\233\43\62\192\98\225", "\209\141\155\76\91\180\71")] = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\124\205\76\31\231\77\208\88\95\163", "\122\147\29\191\43")].X, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\194\81\28\212\251\181\59\236", "\30\220\176\62\105\186\159\236")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\220\151\183\51\193\135\178\155\152\213", "\221\232\189\229\208\86\181\215")].Z);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\144\253\207\58\73\228", "\78\108\212\148\188")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\31\27\54\169\80", "\90\91\112\116\66\140\96\219")].Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\69\5\25\238\172\48\196\69\13\9\244\237\84", "\100\165\55\106\108\128\200")]).Magnitude;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\239\56\160\209\142\97", "\211\165\171\81")] > 2) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\96\192\143\135", "\188\100\21\178\170\183")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\51\89\160\166\136\46", "\173\30\119\48\211\210")] / TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\223\63\63\88\205\48\44\94\234\41\63\94\221\124\106", "\90\59\185\89")], 0.25);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\245\76\10\107", "\29\32\144\58\47\91")] = Vector3.new((math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\16\71\148\96\149\58\26\95\130\96\140\60\0\95\137\4\241", "\193\115\85\17\221\33")], 0, (math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\94\56\55\142\232\196\84\32\33\142\241\194\78\32\42\234\140", "\188\141\27\110\126\207")]);
		currentFlyTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\33\91\114\234\219\12\159\32\87\116\225\173\89", "\105\237\86\62\23\132\136")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\92\46\8\115", "\125\217\41\92\45\67")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\122\146\20\94\142\94", "\59\57\212\102\63\227")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\250\112\18\115\236\75\6\111\239\122\19\56\184", "\103\29\136\31")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\43\204\111\22", "\38\126\78\186\74")])});
		currentFlyTween:Play();
		currentFlyTween.Completed:Wait();
		currentFlyTween = nil;
		if (autofarmStopRequested or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\117\30\165\97\165\243\109\21\175\105\165\227\108\15\174\2\212", "\228\161\32\74\234\39")]) then
			return false;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\170\62\156\207\163\21\174\1\161\36\148\210\173\17\164\123\212", "\224\94\228\106\213\144\225\84")] then
			task.wait(RANDOM_PAUSE_MIN + (math.random() * (RANDOM_PAUSE_MAX - RANDOM_PAUSE_MIN)));
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\204\78\211\21\245\184", "\97\208\136\39\160")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\38\204\146\28\66", "\91\150\73\163\230\57\114")].Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\164\188\87\252\78\238", "\63\46\205\210\54\144\107\222")]).Magnitude;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\8\253\84\200\181\124", "\188\144\76\148\39")] > 2) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\94\103\225\28", "\53\229\43\21\196\44\108\66")] = math.max(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\17\30\182\39\112\71", "\197\83\85\119")] / TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\252\24\50\76\238\23\33\74\201\14\50\74\254\91\103", "\87\47\154\126")], 0.25);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\125\218\158\130", "\180\75\24\172\187\178")] = Vector3.new((math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\252\211\42\93\16\208\63\237\230\196\46\83\17\215\36\134\137", "\112\163\185\133\99\28\68\153")], (math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\113\202\226\138\96\213\228\133\107\221\230\132\97\210\255\238\4", "\171\203\52\156")] * 0.3, (math.random() - 0.5) * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\239\75\152\11\181\148\143\148\245\92\156\5\180\147\148\255\154", "\192\218\170\29\209\74\225\221")]);
		currentFlyTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\203\94\5\193\126\44\239\149\213\88\5\138\29", "\157\227\188\59\96\175\45\73")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\223\197\83\97", "\81\223\170\183\118")], Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\5\103\190\186\244\55", "\113\70\33\204\219\153\82")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\139\49\61\242\245\161", "\208\145\226\95\92\158")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\228\203\9\191", "\120\222\129\189\44\143\149\207")])});
		currentFlyTween:Play();
		currentFlyTween.Completed:Wait();
		currentFlyTween = nil;
		if (autofarmStopRequested or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\36\41\158\236\106\75\149\187\52\51\144\232\103\92\156\193\65", "\216\228\113\125\209\170\43\25")]) then
			return false;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\212\108\108\77\92\216\212\103\96\92\95\219\214\125\97\55\46", "\30\153\154\56\37\18")] then
			task.wait(RANDOM_PAUSE_MIN + (math.random() * (RANDOM_PAUSE_MAX - RANDOM_PAUSE_MIN)));
		end
	end
	return true;
end
local function autofarmLoop()
	autofarmRunning = true;
	local lastSearch, currentTarget = 0, nil;
	while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\140\195\35\29\60\139\218\51\30\51\152\213\32\30\57\252\167", "\91\125\217\151\108")] and not autofarmStopRequested do
		while not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\28\169\100\155\169", "\190\153\115\198\16")] do
			task.wait(0.4);
			updateRoot();
			if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\78\158\168\28\90\152\170\5\94\132\166\24\87\143\163\127\43", "\231\90\27\202")] or autofarmStopRequested) then
				autofarmRunning = false;
				return;
			end
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\139\87\182\27\209", "\62\225\228\56\194")].Position.Y < -20) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\182\182\57\49\5", "\53\118\217\217\77\20")].CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\16\235\202\106\249", "\79\201\127\132\190")].Position.X, 10, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\27\230\221\109\68", "\169\72\116\137")].Position.Z);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\117\198\178\60\42", "\198\25\26\169")].AssemblyLinearVelocity = Vector3.zero;
		end
		setWorkspaceNoClip(true);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\127\210\53\130\66\111\58\25", "\31\41\19\189\70\231\49\27")] = getClosestEntity();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\220\70\163\231", "\134\215\179\49")] = tick();
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\248\89\245\80\0\245\177\6", "\115\129\148\54\134\53")] then
			if (currentTarget ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\139\95\88\221\27\7\172\215", "\115\137\231\48\43\184\104")]) then
				if currentFlyTween then
					pcall(function()
						currentFlyTween:Cancel();
					end);
					currentFlyTween = nil;
				end
				currentTarget = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\229\21\240\172\179\43\156\185", "\95\185\137\122\131\201\192")];
			end
			lastSearch = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\57\208\86\117", "\69\22\86\167\115")];
			if isSearching then
				isSearching = false;
				if searchTween then
					pcall(function()
						searchTween:Cancel();
					end);
					searchTween = nil;
				end
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\143\2\209", "\71\56\228\39\225\37")] = nil;
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\212\208\6\220\204\16\157\222\210\8\200\196\3\158\213\161\121", "\66\208\129\132\73\154\141")] == LUAOBFUSACTOR_DECRYPT_STR_0("\121\94\208\248", "\157\42\63\182")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\53\108\172", "\175\187\94\73\156")] = moveSafe(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\51\64\51\30\48\212\99\111", "\160\70\95\47\64\123\67")]);
			else
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\81\49\97", "\81\190\58\20")] = moveBlatant(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\65\185\100\134\58\75\118\28", "\83\44\45\214\23\227\73\63")]);
			end
			if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\177\3\238", "\64\149\218\38\222")] or autofarmStopRequested or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\146\254\255\60\134\248\253\37\130\228\241\56\139\239\244\95\247", "\176\122\199\170")]) then
				break;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\7\180\224\37\56\87\91", "\75\114\107\208\176\81")] = 0;
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\39\40\108\252\57\108\37", "\21\153\75\73")].leaderstats and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\31\76\235\183\84\76\67", "\38\105\115\45\146\210")].leaderstats:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\50\25\5\120\39\17", "\83\98\118\108\22"))) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\231\125\29\177\151\102\25", "\67\41\139\25\77\197\228")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\162\207\51\83\250\173\254", "\136\136\206\174\74\54")].leaderstats.Points.Value;
			end
			task.wait(0.45);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\246\145\181\71\183\254\116", "\219\68\147\230\229\51\196")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\66\242\208\18\84\94\44", "\123\28\46\150\128\102\39")];
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\69\28\78\30\155\126\37", "\21\101\41\125\55\123\233\91")].leaderstats and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\231\175\234\9\32\199\187", "\82\226\139\206\147\108")].leaderstats:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\193\9\68\191\216\226", "\172\145\102\45\209"))) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\8\27\112\159\109\177\93", "\30\148\109\108\32\235")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\75\16\70\17\85\84\15", "\63\116\39\113")].leaderstats.Points.Value;
			end
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\85\208\220\4\59\237\104", "\200\88\48\167\140\112\72")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\82\44\155\246\209\27\120", "\130\162\62\72\203")]) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\182\186\83\136\149\225\233\166\165\248\32", "\157\195\215\221\16\231\224\143")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\216\12\175\236\106\215\31\137\241\58\137", "\131\31\185\107\236")] + 1;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\164\67\42\191\184\105\43\190\165\94\33\185\238\26", "\68\203\203\42")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\82\98\233\87\68\48\137", "\185\35\55\21")];
				saveStats();
				if statsLabel then
					statsLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\145\248\184\151\233\185", "\228\211\153\223") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\238\95\30\53\19\90\251\93\47\127\86", "\102\52\143\56\93\90")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\6\87\188\104\165\118\24\169\38\241\85\77\224", "\133\38\119\192\72") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\174\125\245\227\178\87\244\226\175\96\254\229\228\36", "\155\151\193\20")];
				end
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\129\34\102\84\1\143\63\107\77\11\150\57\113\89\15\131\69\30", "\27\78\196\96\46")] then
					sendWebhook("Bag collected\nBags: " .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\250\181\155\117\81\66\254\254\160\253\42", "\44\138\155\210\216\26\36")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\251\81\249\106\242\178\67\173\73\167\251", "\157\219\45\217\58") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\178\63\219\234\163\158\57\192\240\164\184\36\144\174", "\158\208\221\86\181")]);
				elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\100\200\35\15\144\19\223\100\220\46\18\134\7\177\17\175\91", "\88\128\33\138\107\64\223")] and ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\243\114\86\162\110\224\213\247\103\48\253", "\142\161\146\21\21\205\27")] % 10) == 0)) then
					sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\61\243\112\6\9\237\195\30\255\38\67", "\172\112\154\28\99\122\153") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\246\167\61\196\226\174\10\206\229\229\78", "\126\171\151\192")] .. " bags\nPoints: " .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\17\240\18\19\233\122\49\11\247\8\2\232\28\110", "\57\94\126\153\124\103\154")]);
				elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\226\107\49\249\110\60\248\108\47\243\115\46\248\24\73\134\4\71", "\33\119\167\41\121\182")] and ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\181\60\117\164\70\18\44\66\166\126\6", "\88\39\212\91\54\203\51\124")] % 100) == 0)) then
					sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\1\165\184\143\104\218\199\34\169\238\202", "\168\76\204\212\234\27\174") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\5\52\103\6\243\64\152\1\33\1\89", "\46\236\100\83\36\105\134")] .. " bags\nPoints: " .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\245\142\142\149\28\26\245\146\142\149\10\43\191\215", "\111\89\154\231\224\225")]);
				end
			end
			removeEntity(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\214\9\182\41\234\200\148\173", "\177\157\186\102\197\76\153\188")]);
			currentTarget = nil;
			task.wait(0.12);
		elseif (((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\177\55\234\242", "\207\194\222\64")] - lastSearch) > 1) and not isSearching) then
			isSearching = true;
			lastSearch = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\122\192\5\216", "\179\123\21\183\32\232")];
			currentTarget = nil;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\55\205\47\167\50\201\48\137\109", "\98\166\67\172\93\211")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\236\216\193\71\26", "\130\135\131\183\181\98\42")].Position;
			local angle, radius = 0, 900;
			task.spawn(function()
				while isSearching and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\131\15\204\6\226\132\22\220\5\237\151\25\207\5\231\243\107", "\64\163\214\91\131")] and not autofarmStopRequested do
					if getClosestEntity() then
						isSearching = false;
						break;
					end
					angle = angle + 0.55;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\63\93\102", "\95\113\79\120\86")] = Vector3.new(math.clamp(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\224\33\162\146\61\48\218\238\164", "\169\203\148\64\208\230\109\95")].X + (math.cos(angle) * radius), -5000, 5000), 12, math.clamp(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\3\7\160\62\43\51\245\141\71", "\134\168\119\102\210\74\123\92")].Z + (math.sin(angle) * radius), -5000, 5000));
					searchTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\25\25\92\165\61\25\75\189\7\31\92\238\94", "\57\203\110\124")]:Create(TABLE_TableIndirection["root%0"], TweenInfo.new(0.4 + (math.random() * 0.15), Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\141\245\7\40\13\171", "\96\206\179\117\73")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\51\50\117", "\69\225\67\23")])});
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
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\160\30\144\238\162\230\86\235\165\22\240\140", "\27\164\225\83\213\188\227\185")] == 1) then
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
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\58\182\209\225\169\61\175\193\226\166\46\160\210\226\172\74\210", "\167\232\111\226\158")] then
		return;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\5\2\61\41\124\207\156\107\0\10\93\75", "\209\36\68\79\120\123\61\144")] == 1) then
		freezeCamera();
	else
		unfreezeCamera();
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\231\85\62\3\88\232\69\62\51\92\228\86\63\69\28", "\96\44\129\51\91")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\35\53\153\192\216\214\48\43\73\246", "\147\117\111\108\198\147\136")];
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\152\246\125\53\148\227\122\53\147\236\117\40\154\231\112\79\230", "\52\106\214\162")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\9\216\161\242\17\6\200\161\194\21\10\219\160\180\85", "\145\101\111\190\196")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\236\185\211\124\113\235\164\211\124\96\232\164\200\10\0", "\47\48\173\225\140")])) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\203\135\221\40\184\74\219\132\235\59\169\70\201\196\136", "\204\35\173\225\184\75")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\101\219\178\213\135\40\203\123\208\189\195\131\42\171\20", "\110\142\36\131\237\134\198")];
	end
	autofarmStopRequested = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\85\167\255\62\122\82\190\195\44\122\82\167\196\49\118\69\246\160", "\88\27\32\211\144")] = os.time();
	autofarmThread = task.spawn(autofarmLoop);
end
local function showSpectatorWarning(allowSpec, onContinue)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\172\251\108", "\16\237\203\222\92\171\205\59")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\210\178\175\141\26\189\198\164\180", "\211\129\209\221\232\127"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\72\3\116", "\38\105\47\38\68\156\125\208")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\191\144\160\71\203\41\158\142", "\72\236\224\197\36\156");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\172\1\218", "\234\164\203\36")].ResetOnSpawn = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\234\197\114", "\18\107\141\224\66\236\62\17")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\163\29\238\174\189\89\167", "\151\203\207\124")].PlayerGui;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\95\161", "\164\180\122\145\98\128\233\126")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\157\22\26\192\190", "\173\219\100\123"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\109\28", "\115\212\72\44\107")].Size = UDim2.new(0, math.floor(400 * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\198\107\65\222\15\130\97\201\191", "\36\236\143\52\18\157\78\206")]), 0, math.floor(160 * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\104\7\124\220\113\109\29\10\175", "\159\48\33\88\47")]));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\7\73", "\87\127\34\121\146\211\129\87")].Position = UDim2.new(0.5, -math.floor(200 * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\200\186\223\6\31\227\81\238\177", "\20\203\129\229\140\69\94\175")]), 0.5, -math.floor(80 * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\239\107\5\204\195\131\227\17\102", "\130\207\166\52\86\143")]));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\31\67", "\65\42\58\115\141\202\27")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\12\80\204\42\14\84", "\79\43\100\53\161")].Background;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\129\159", "\36\144\164\175\47\52\44\86")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\8\190\244", "\31\80\111\155\196")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\102\112\194\219\61\93\92\243", "\79\51\57\129\180"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\247\96", "\185\87\210\80\56")]).CornerRadius = UDim.new(0, 12);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\4\235\8", "\53\166\112\206\56\29\153")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\71\58\101\30\231\32\121\22", "\79\18\115\54\106\149"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\70\11\14", "\198\42\50\46\62\69\29\237")].Color = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\178\19\52\45\229\94", "\59\162\218\118\89\72\192\110")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\234\245\15", "\97\229\158\208\63\40\97\18")].Thickness = 1.5;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\218\55\22", "\236\77\174\18\38")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\24\159", "\117\224\61\175")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\69\202\205\187", "\232\139\39\166")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\215\84\75\81\91\195\225\84\95", "\162\131\49\51\37\23"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\123\242\111\36", "\20\63\25\158\74")].Size = UDim2.new(0.9, 0, 0.45, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\216\80\232\47", "\217\26\186\60\205\31\176\72")].Position = UDim2.new(0.05, 0, 0.08, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\115\10\169\139", "\140\187\17\102")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\137\168\4\124", "\33\76\235\196")].Text = "Spectators are ON.\nPeople can spectate and report you.\nTurn them off?";
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\232\254\26\252", "\229\104\138\146\63\204\80\229")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\117\27\196\165\56\78", "\169\192\29\126")].Text;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\199\9\206\97", "\235\81\165\101")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\134\83\92\213", "\172\24\228\63\121\229\100")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\76\217\136\218", "\173\234\46\181")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\119\187", "\67\191\82\139\95")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\232\84\135\188", "\139\93\141\39\162\140")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\24\166\17\195\60\57\183\29\216\16", "\126\76\195\105\183"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\77\183\52\9", "\212\63\40\196\17\57")].Size = UDim2.new(0.4, 0, 0.28, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\206\227\191\249", "\154\201\171\144")].Position = UDim2.new(0.06, 0, 0.6, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\235\187\136\230", "\221\226\142\200\173\214\111\223")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\70\186\60\173\75\30", "\200\110\46\223\81")].Success;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\66\47\113\114", "\34\118\39\92\84\66\178")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\114\141\34\78\110\189\218\97\69\200\62\4\40", "\19\43\232\81\98\78\201\175");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\214\235\227\148", "\234\43\179\152\198\164\141")].TextColor3 = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\95\111\155\215", "\231\197\58\28\190\231\211\173")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\215\45\105\135", "\236\51\178\94\76\183")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\200\193\6\186", "\35\138\173\178")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\70\24", "\29\161\99\40\188\50")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\76\3\131\232\28\52\15\254", "\140\25\74\192\135\110\90\106"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\84\87\183\250", "\194\66\49\36\146\202")]).CornerRadius = UDim.new(0, 8);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\62\136\82", "\165\235\81\173\98")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\31\128\177\34\155\241\63\145\166\56", "\132\75\229\201\86\217"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\125\224\245", "\197\226\18\197")].Size = UDim2.new(0.4, 0, 0.28, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\222\68\1", "\49\124\177\97")].Position = UDim2.new(0.54, 0, 0.6, 0);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\50\133\238", "\222\224\93\160")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\245\119\44\61\174\173", "\88\139\157\18\65")].Danger;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\21\87\65", "\171\42\122\114\113")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\163\167\128\162\129\173\205\244\136\232\197\246", "\130\237\200\172");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\223\235\94", "\110\70\176\206")].TextColor3 = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\31\120\187", "\90\21\112\93\139")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\212\49\230", "\192\97\187\20\214")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\84\118\152", "\224\106\59\83\168")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\160\82", "\41\199\133\98\155\46\232")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\41\143\194\73\175\1\227\14", "\134\124\198\129\38\221\111"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\224\244\112", "\64\152\143\209")]).CornerRadius = UDim.new(0, 8);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\76\214\73\26", "\103\87\41\165\108\42\77\28")].MouseButton1Click:Connect(function()
		if allowSpec then
			pcall(function()
				allowSpec.Value = false;
			end);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\212\81\167", "\128\194\179\116\151\22")]:Destroy();
		showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\52\34\6\164\200\53\146\8\32\16\231\200\33\148\9\55\7\231\211\50\128", "\230\103\82\99\199\188\84"), 2);
		if onContinue then
			onContinue();
		end
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\137\230\248", "\74\220\230\195\200\57")].MouseButton1Click:Connect(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\141\149\79", "\177\197\234\176\127\107")]:Destroy();
		showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\64\218\195\75\158\117\75\124\216\213\8\152\113\82\114\195\200\8\133\122", "\63\19\170\166\40\234\20"), 2);
		if onContinue then
			onContinue();
		end
	end);
end
local function checkSpectatorsAndStart()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\12\72\120", "\160\86\104\109\72\64\77")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\118\254\6\23\137\248\103\235\14\45\158\246\97\239\13\27\207\169", "\234\153\19\142\106\126")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\17\40\188\1\36\54\153\25\53\37", "\120\65\68\221"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\177\160\236", "\220\120\213\133")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\55\130\0", "\74\56\78\167\48")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\24\110\144", "\88\132\124\75\160\106\106")]:FindFirstChild(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\58\140\94\30\184\117\80", "\96\116\86\237\39\123\202\80")].Name);
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\13\244\45", "\207\65\116\209\29\226\204")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\85\159\26\245\0", "\110\208\48\235")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\176\198\221", "\237\197\201\227")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\136\38\11\106\172\61\125\168", "\26\219\67\127\30\197\83"));
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\29\202\110\85\169", "\153\149\120\190\26\112")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\25\198\175\61\181\174", "\119\108\117\170\192\74\144\158")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\44\149\53\162\121", "\65\135\73\225")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\62\95\93\175\3\44\67\84\163\0\30\71\94\178\7", "\116\127\51\49\192"));
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\12\95\242\249\91\82", "\98\123\96\51\157\142\126")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\242\170\193\49\136\174", "\70\173\158\198\174")].Value == true)) then
					showSpectatorWarning(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\51\67\225\231\122\31", "\142\144\95\47")], startAutofarm);
					return;
				end
			end
		end
	end
	startAutofarm();
end
local function applyWalkSpeed()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\56\93\75\71", "\110\119\77\48")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\51\37\76\225\249\122\116", "\132\139\95\68\53")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\36\252\44\249\58\184\101", "\85\156\72\157")].Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\83\39\112\32\212\39\131\127", "\234\27\82\29\65\186\72"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\218\228\251\83", "\99\144\175\137\222")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\97\129\68\105", "\209\48\20\236\97\89\37")].WalkSpeed = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\113\123\12\102\195\108\107\5\118\195\110\112\108\18", "\34\156\33\62\73")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\93\216\116\37\87\192\101\55\65\222\116\45\86\171\1", "\49\104\18\142")] * 2)) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\202\74\46\220\192\82\63\206\214\76\46\212\193\57\91", "\107\145\133\28")];
	end
end
local function applyJumpPower()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\75\190\251\146", "\222\162\62\211")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\125\15\2\52\145\143\243", "\170\195\17\110\123\81\227")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\56\225\217\248\166\113\176", "\157\212\84\128\160")].Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\161\102\237\68\40\135\231\199", "\163\233\19\128\37\70\232\142"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\64\49\92\179", "\121\131\53\92")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\217\70\197\46", "\224\30\172\43")].UseJumpPower = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\178\114\155\189", "\141\101\199\31\190")].JumpHeight = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\114\46\247\229\148\154\119\115\60\232\244\252\255", "\207\59\39\99\167\186\217")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\115\150\98\119\205\143\220\34\116\254\2", "\139\103\38\219\50\40\157\192")] * 2)) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\141\27\242\217\136\25\245\195\138\115\146", "\162\134\216\86")];
	end
end
local function startInfinite()
	if infiniteConnection then
		return;
	end
	infiniteConnection = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\250\89\106\53\80\231\166\61\234\18\9", "\207\94\143\55\57\80\34\145")].Heartbeat:Connect(function()
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\225\6\95\148\100\58\140\14\229\28\85\158\30\71", "\217\66\177\67\26\208\59\119")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\214\203\184\21\186", "\152\67\190\170\202\48\138")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\37\84\233\222\59\16\160", "\144\187\73\53")].Character;
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\179\59\197\231\227", "\211\118\219\90\183\194")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\184\133\174\10", "\145\152\205\232\139\58")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\250\191\173\30\248", "\110\211\146\222\223\59\200")]:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\123\65\239\14\76\92\93\230", "\34\51\52\130\111"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\37\125\147", "\55\174\85\88\163\98\92")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\64\7\151\115\157", "\86\173\40\102\229")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\44\177\66\140\10\171\70\137\54\171\64\153\52\165\93\153", "\237\100\196\47"));
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\89\134\239\103", "\116\44\44\235\202\87\232")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\199\19\117", "\146\99\183\54\69\98\210")]) then
			return;
		end
		if (not bodyVelocity or not bodyVelocity.Parent) then
			bodyVelocity = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\197\240\177\188\10\178\235\240\182\172\40\174", "\215\135\159\213\197\92"));
			bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000);
			bodyVelocity.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\181\173\188", "\140\211\197\136")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\218\121\36", "\172\80\172\92\20")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\111\220\93\32", "\232\126\26\177\120\16\169\163")].MoveDirection * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\201\135\86\111\234\152\216\217\130\67\103\234\146\169\182", "\214\140\134\209\19\34\175")] * 2;
		bodyVelocity.Velocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\49\237\250", "\202\52\71\200")].X, 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\94\48\215", "\231\142\40\21")].Z);
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
	for _, c in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\52\193\41\93\13\218\117\49\209\3\93\13\199\53\98", "\180\16\82\165\106\50\99")]) do
		if (typeof(c) == LUAOBFUSACTOR_DECRYPT_STR_0("\13\119\71\205\0\45\92\111\234\32\48\91\113\251\0\43\92\112\240", "\99\95\53\31\158")) then
			c:Disconnect();
		end
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\44\116\114\253\36\126\84\241\62\121\94\252\57\53\1", "\49\146\74\16")].bodyForce and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\87\142\121\141\234\95\143\89\150\237\94\132\73\199\180", "\226\132\49\234\58")].bodyForce.Parent) then
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\126\180\199\21\247\28\93\217\108\185\235\20\234\87\8", "\56\186\24\208\132\122\153\114")].bodyForce:Destroy();
		end);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\16\36\114\141\205\24\37\82\150\202\25\46\66\199\147", "\226\163\118\64\49")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\196\62\172\88\169", "\125\153\172\95\222")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\202\226\212\232\200\166\43", "\131\27\166\131\173\141\186")].Character;
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\123\70\53\182\35", "\71\147\19\39")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\47\235\232\227", "\66\101\90\134\205\211\138\154")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\68\120\190\192\119", "\71\124\44\25\204\229")]:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\58\239\36\69\204\182\27\254", "\217\114\154\73\36\162"));
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\176\183\232\81", "\96\92\197\218\205\97\232")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\12\184\174\240\48\4\185\142\235\55\5\178\158\186\110", "\159\94\106\220\237")].health = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\15\9\6\253", "\35\205\122\100")].HealthChanged:Connect(function(h)
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\118\56\97\131\117\43\120\134\120\42\102\133\124\56\98\140\120\37\107\135\125\66\23", "\39\194\57\103")] and (h < TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\238\49\20\86", "\174\194\155\92\49\102\204")].MaxHealth)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\157\84\50\215", "\142\164\232\57\23\231\170")].Health = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\191\209\184\66", "\114\215\202\188\157")].MaxHealth;
		end
	end);
end
local function startBoxFly()
	if boxFlyConnection then
		return;
	end
	boxFlyConnection = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\176\252\99\183\145\253\140\50\160\183\0", "\229\81\197\146\48\210\227\139")].RenderStepped:Connect(function()
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\93\84\110\150\171", "\54\226\50\59\26\179\155\61")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\17\0\126\51\243\1\29\118\62\232\18\29\124\90\154", "\127\170\94\88\56")]) then
			if boxFlyBodyVel then
				boxFlyBodyVel:Destroy();
				boxFlyBodyVel = nil;
			end
			return;
		end
		if (not boxFlyBodyVel or not boxFlyBodyVel.Parent) then
			boxFlyBodyVel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\194\200\176\219\142\56\245\169\227\206\160\219", "\198\128\167\212\162\216\93\153"));
			boxFlyBodyVel.MaxForce = Vector3.new(4000, 4000, 4000);
			boxFlyBodyVel.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\53\235\202\239\106", "\190\202\90\132")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\208\97\146\242", "\70\231\185\19\183\194")] = Vector3.zero;
		local look, right, up = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\193\233\161\161\218\133\180", "\211\187\160\132\196")].CFrame.LookVector, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\129\226\248\90\189\183\124", "\146\76\224\143\157\40\220")].CFrame.RightVector, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\126\187\119\180\56\187\11", "\158\59\31\214\18\198\89")].CFrame.UpVector;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\26\66\24\116\7\87\31\73\58\66\24\75\0\68\15\24\89", "\106\61\105\39")]:IsKeyDown(Enum.KeyCode.W) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\183\41\170\83", "\18\133\222\91\143\99\162")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\54\190\27\137", "\178\23\95\204\62\185\92\35")] + look;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\229\218\228\116\47\230\202\226\110\36\228\201\255\94\36\179\143", "\61\65\150\191\150")]:IsKeyDown(Enum.KeyCode.S) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\220\155\252\135", "\170\42\181\233\217\183\97")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\114\253\144\34", "\43\172\27\143\181\18")] - look;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\58\162\171\84\221\57\178\173\78\214\59\177\176\126\214\108\247", "\29\179\73\199\217")]:IsKeyDown(Enum.KeyCode.A) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\168\111\136\41", "\173\25\193\29")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\121\69\90\253", "\24\58\16\55\127\205\106\182")] - right;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\20\210\75\9\169\23\194\77\19\162\21\193\80\35\162\66\135", "\64\199\103\183\57")]:IsKeyDown(Enum.KeyCode.D) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\70\65\28\163", "\147\68\47\51\57")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\70\14\121\214", "\32\233\47\124\92\230")] + right;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\82\135\169\149\192\233\158\85\177\190\174\216\240\136\68\199\235", "\153\235\33\226\219\220\174")]:IsKeyDown(Enum.KeyCode.Space) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\84\73\87\209", "\114\225\61\59")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\122\54\200\140", "\237\188\19\68")] + up;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\251\235\10\201\243\248\251\12\211\248\250\248\17\227\248\173\190", "\128\157\136\142\120")]:IsKeyDown(Enum.KeyCode.LeftShift) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\12\151\27\254", "\157\210\101\229\62\206\169\50")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\47\93\247\73", "\173\45\70\47\210\121\200\121")] - up;
		end
		boxFlyBodyVel.Velocity = ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\182\151\20\97", "\49\81\223\229")].Magnitude > 0) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\143\171\176\98", "\149\82\230\217")].Unit * 50)) or Vector3.zero;
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
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\93\117\190\125\2", "\202\88\50\26")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\60\182", "\55\85\25\134\183\229")] = getClosestEntity();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\113\69", "\72\27\84\117\207\134")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\201\91\41\72\7", "\95\207\166\52\93\109\55\229")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\134\118", "\205\189\163\70\226\136\86")].CFrame * CFrame.new(0, 3, 0);
	end
end
local function teleportToSpecificPlayer(plrName)
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\222\138\249\85\187", "\139\34\177\229\141\112")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\225\106\241\128", "\176\67\141\24\212")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\213\69\243\42\70\254\150\137", "\141\179\185\36\138\79\52")]:FindFirstChild(plrName);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\55\77\230\171", "\195\155\91\63")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\79\221\185\157", "\57\182\35\175\156\173\179")].Character) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\178\252\143", "\216\189\194\217\191\111\100")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\66\83\49\96", "\42\205\46\33\20\80")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\121\29\36\182\95\7\32\179\99\7\38\163\97\9\59\163", "\215\49\104\73"));
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\4\67\88", "\104\182\116\102")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\231\243\245\251\104", "\222\70\136\156\129\222\88")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\148\193\233", "\217\162\228\228")].CFrame * CFrame.new(0, 3, 0);
		end
	end
end
local function getPlayerList()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\212\220\204\235\141", "\184\206\189\175")] = {};
	for _, plr in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\66\248\174\201\75\207\25\30", "\188\60\46\153\215\172\57")]:GetPlayers()) do
		if (plr ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\253\60\75\60\54\81\161", "\68\116\145\93\50\89")]) then
			table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\81\185\183\179\3", "\51\207\56\202\195\150")], plr.Name);
		end
	end
	if (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\65\232\87\196\214", "\195\221\40\155\35\225\230\158")] == 0) then
		table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\116\213\77\189\82", "\98\166\29\166\57\152")], LUAOBFUSACTOR_DECRYPT_STR_0("\225\28\142\138\45\165\19\152\207\47\186\91", "\93\201\114\225\170"));
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\233\232\252\48\231", "\142\140\128\155\136\21\215\165")];
end
local function getAllBadges()
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\162\9\74\165\123", "\218\33\205\102\62\128\75\152")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\114\77\208\179\164", "\150\148\27\62\164")] = {};
	for _, obj in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\230\248\203\49\249\235\195\39\172\186", "\160\66\137\138")]:GetDescendants()) do
		if (obj.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\34\194\38\184\58\203\93\113\18\199\39\173", "\16\96\163\66\223\95\138\42")) then
			if obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\162\213\194\11\234\8\146\192", "\105\224\180\177\110\186")) then
				table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\3\177\86\101\12", "\199\193\106\194\34\64\60\91")], obj);
			elseif obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\18\185\8\163\51", "\198\95\214\108")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\120\250", "\85\122\93\202\224\137\108\154")] = obj.PrimaryPart or obj:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\166\81\65\174\243\173\150\68", "\204\228\48\50\203\163"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\242\25", "\88\190\215\41\199\111\47\181")] then
					table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\62\95\93\53\145", "\190\52\87\44\41\16\161")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\83\87", "\124\35\118\103\212\123\65")]);
				end
			end
		end
	end
	for _, part in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\226\191\171\59\12", "\60\92\139\204\223\30")]) do
		if (part and part.Parent) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\18\224\153\128\118", "\165\70\125\143\237")].CFrame = part.CFrame * CFrame.new(0, 3, 0);
			task.wait(0.45);
		end
	end
	showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\150\58\241\67\85\167\97\181", "\48\212\91\149\36") .. #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\23\41\16\1\78", "\100\36\126\90")], 2);
end
local function spawnTour()
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\203\216\73\83\65", "\82\113\164\183\61\118\113\82")] then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\77\253\179\161\221\175\171", "\138\155\34\145\215\196\175")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\246\28\201\26\43\92\195\177\188\94", "\160\212\153\110\162\105\91\61")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\141\57\186", "\191\192\88\202")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\194\251\21\27\220\112\206\236\91\88", "\172\17\173\137\126\104")].Map:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\238\108\44\32\216\240", "\120\189\28\77\87\182\131")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\34\3\251\1\232\214\207\40\84\160", "\183\172\77\113\144\114\152")].Map.Spawns:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\206\104\57\254\76\214", "\109\157\24\88\137\34\165"));
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\78\176\68\183\47\194\248", "\231\200\33\220\32\210\93")] then
		return;
	end
	for _, spawn in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\87\74\233\50\78\29\22", "\87\60\56\38\141")]:GetChildren()) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\170\25\127\144", "\90\160\197\106")] = nil;
		if spawn:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\193\180\57\115\114\226\167\62", "\34\131\213\74\22")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\182\5\117\96", "\80\80\217\118")] = spawn.Position;
		elseif spawn:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\40\71\15\120\9", "\29\101\40\107")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\250\195\246\77", "\125\165\149\176\211")] = (spawn.PrimaryPart and spawn.PrimaryPart.Position) or (spawn:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\107\2\57\228\181\72\17\62", "\229\41\99\74\129")) and spawn:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\17\4\242\46\3\4\243\63", "\75\83\101\129")).Position);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\68\82\149\162", "\176\146\43\33")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\210\254\5\235\43", "\27\200\189\145\113\206")].CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\132\65\238\31", "\47\192\235\50\203")] + Vector3.new(0, 3, 0));
			task.wait(0.3);
		end
	end
end
local function startYCheck()
	if yCheckConnection then
		yCheckConnection:Disconnect();
	end
	yCheckConnection = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\210\20\226\233\206\162\128\35\194\95\129", "\233\64\167\122\177\140\188\212")].Heartbeat:Connect(function()
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\123\249\84\174\236", "\144\47\20\150\32\139\220")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\45\178\237\159\208", "\132\80\66\221\153\186\224")].Position.Y < -20)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\160\43\3\254\22", "\219\38\207\68\119")].CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\25\5\37\80\220", "\236\109\118\106\81\117")].Position.X, 10, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\60\201\59\235\189", "\206\141\83\166\79")].Position.Z);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\166\210\222\187\189", "\158\141\201\189\170")].AssemblyLinearVelocity = Vector3.zero;
		end
	end);
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\190\237\178\108\17\187\218\180\67\25\245\169", "\45\119\208\153\219")] = nil;
local function setAntiAfk(state)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\119\144\60\44\245\127\143\42\54\250\120\134\57\54\240\28\244", "\115\180\57\196\117")] = state;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\114\68\253\113\194\33\227\61\114\94\177\0", "\160\82\28\48\148\48\164\74")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\222\169\47\27\11\200\243\178\40\52\72\147", "\109\163\176\221\70\90")]:Disconnect();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\79\35\93\82\52\217\98\56\90\125\119\130", "\82\178\33\87\52\19")] = nil;
	end
	if state then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\172\252\115\93\74\169\203\117\114\66\231\184", "\28\44\194\136\26")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\108\73\53\115\152\77\199\127\124\2\86", "\174\28\25\39\102\22\234\59")].Heartbeat:Connect(function()
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\70\31\204\139\214", "\230\169\41\112\184\174")] and (math.random() < 0.002)) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\203\122\170\87\68", "\47\170\164\21\222\114\116\179")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\136\130\194\184\215", "\182\157\231\237")].CFrame * CFrame.Angles(0, math.rad((math.random() - 0.5) * 2), 0);
			end
		end);
	end
end
if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\255\1\175\225\255\73\240", "\192\149\154\108")] then
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\252\234\47\41\51\68\169", "\97\153\153\135\64\93\86")].OnClientEvent:Connect(function(tbl)
		if (typeof(tbl) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\18\95\208\36\252", "\185\102\62\178\72\153\73\235")) then
			return;
		end
		for _, data in pairs(tbl) do
			if (data and data.part) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\187\57\166\49\234", "\210\20\218\75")] = data.part;
				if (typeof(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\252\21\103\25\73", "\84\232\157\103\19\60\121")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\15\103\96\74\18\116", "\35\124\19\18")) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\82\6\210\18\180", "\55\132\51\116\166")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\51\175\127\23\46\252\203\57\248\36", "\157\168\92\221\20\100\94")]:FindFirstChild(TABLE_TableIndirection["part%0"], true);
				end
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\208\231\11\95\137", "\22\168\177\149\127\122\185")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\166\40\94\186\231", "\159\215\199\90\42")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\31\192\202\35\255", "\147\82\175\174\70"))) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\131\4\50\4\71", "\33\119\226\109\92")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\135\104\237\190\234", "\155\218\230\26\153")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\59\19\18\205", "\163\118\114\123"));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\231\226\164\240\178", "\213\130\134\144\208")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\61\20\58\0\41", "\73\155\92\125\84\37\25\61")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\195\228\221\11\17", "\46\33\162\141\179")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\126\173\190\56\24\93\190\185", "\72\60\204\205\93")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\197\203\186\13\126", "\78\196\164\162\212\40")]) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\204\219\74\183\153", "\199\59\173\169\62\146\169\192")].PrimaryPart or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\164\174\183\114\245", "\195\87\197\220")]:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\147\240\178\182\229\125\238\32", "\84\209\145\193\211\181\28\156"));
				end
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\226\60\156\130\129", "\167\177\131\78\232")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\12\153\83\65\24", "\165\200\109\235\39\100\40\110")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\171\123\242\45\35\136\104\245", "\115\233\26\129\72")) and not shouldIgnore(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\15\197\147\161\40", "\132\24\110\183\231")])) then
					data.part = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\112\18\167\31\228", "\35\206\17\96\211\58\212\22")];
					ValidEntities[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\207\155\45\205\232", "\169\83\174\233\89\232\216\200")]] = data;
					createESP(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\19\73\41\253\155", "\118\60\114\59\93\216\171\137")], data);
				end
			end
		end
	end);
end
local function registerEntity(obj)
	if (not obj or not obj.Parent) then
		return;
	end
	if (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\127\198\64\225\176", "\220\50\169\36\132")) and isUUIDName(obj.Name)) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\134\5\191\180\215", "\209\145\231\108")] = obj:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\116\32\1\3", "\66\57\65\104\109\184\165"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\10\244\90\233\184\78\170", "\133\221\107\154\62")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\31\188\239\2\146", "\81\187\126\213\129\39\162")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\176\36\250\225\213", "\196\229\209\77\148")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\101\212\98\25\109\243\223\83", "\173\39\181\17\124\61\146")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\221\250\44\205\42", "\232\26\188\147\66")]) or obj.PrimaryPart or obj:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\55\224\245\30\67\20\243\242", "\19\117\129\134\123"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\2\199\18\56\38\102\83", "\67\67\99\169\118\84")] and not ValidEntities[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\43\235\75\95\179\188\230", "\214\98\74\133\47\51\214\153")]] and not shouldIgnore(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\79\126\112\127\82\79\30", "\55\106\46\16\20\19")])) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\186\166\49\115\110", "\115\41\219\210\80\86\94")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\176\72\251\14", "\91\192\41\137\122\178")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\36\196\236\91\32\143\184", "\136\55\69\170")],[LUAOBFUSACTOR_DECRYPT_STR_0("\238\242\20\63\218", "\173\131\157\112\90\182\147\77")]=obj};
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\15\48\66\74", "\103\122\118\64")] = getTypeName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\233\4\197\181\237", "\221\144\136\112\164\144")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\60\119\160\85\56\60\244", "\196\57\93\25")]);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\77\164\132\10\154", "\47\170\44\208\229")].typ = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\91\174\95\75", "\87\40\34\222\122\123\135")];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\60\149\52\132\128", "\176\33\93\225\85\161")].type = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\0\157\145\41", "\25\194\121\237\180")];
			ValidEntities[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\182\55\43\10\79\241\231", "\42\212\215\89\79\102")]] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\80\48\17\138\30", "\151\215\49\68\112\175\46\39")];
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\78\134\115\168\104\92\148\96\168\98\56\230", "\237\38\29\214\44")] then
				createESP(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\39\121\2\127\67\240\209", "\225\118\70\23\102\19\38\213")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\91\73\35\28\164", "\208\64\58\61\66\57\148")]);
			end
		end
	elseif (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\203\191\181\65\217\191\180\80", "\36\137\222\198")) and isUUIDName(obj.Name)) then
		if (not ValidEntities[obj] and not shouldIgnore(obj)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\245\246\35\141\242", "\41\129\148\130\66\168\194\98")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\1\43\147\4", "\204\113\74\225\112\35\72\16")]=obj};
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\7\17\101\180", "\128\17\126\97\64\132\223\211")] = getTypeName(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\135\41\9\255\214", "\104\218\230\93")], obj);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\61\198\119\54\108", "\22\19\92\178")].typ = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\18\83\107\237", "\209\190\107\35\78\221")];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\47\194\224\147\208", "\182\224\78\182\129")].type = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\20\181\75\134", "\36\141\109\197\110\182\80\31")];
			ValidEntities[obj] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\11\2\134\91\108", "\92\131\106\118\231\126")];
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\112\14\154\6\147\98\28\137\6\153\6\110", "\67\221\35\94\197")] then
				createESP(obj, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\189\52\91\0\236", "\58\37\220\64")]);
			end
		end
	end
end
local function scanMapChunked()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\141\228\73\228", "\204\188\236\148\108\212")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\211\77\248\231\2\0\177\219\153\15", "\210\190\188\63\147\148\114\97")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\152\199\181", "\113\213\166\197\228"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\55\209\71\15\213", "\129\173\94\162\51\42\229\99")] = nil;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\53\2\116\230", "\214\61\84\114\81")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\234\15\81\136\134", "\182\39\131\124\37\173")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\28\170\81\249", "\20\90\125\218\116\201")]:GetDescendants();
	else
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\0\8\147\111\126", "\61\69\105\123\231\74\78")] = {};
		for _, c in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\162\168\0\196\193\172\185\14\146\129", "\183\177\205\218\107")]:GetChildren()) do
			if ((c.Name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\49\53\159\109\205\63\11", "\86\101\80\237\31\172")) and (c ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\52\175\77\127\219\152\3", "\189\51\88\206\52\26\169")].Character)) then
				table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\202\88\65\99\147", "\53\70\163\43")], c);
			end
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\231\247", "\42\161\194\199\120\22\83")] = 0;
	for _, obj in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\245\75\38\55\110", "\94\192\156\56\82\18")]) do
		if isUUIDName(obj.Name) then
			registerEntity(obj);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\254\84", "\226\61\219\100\45\29\109")] += 1
		if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\230\112", "\32\154\195\64")] % 50) == 0) then
			task.wait();
		end
	end
end
task.spawn(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\27\74\154\142", "\65\145\122\58\191\190")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\24\246\114\208\225\22\231\124\134\161", "\163\145\119\132\25")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\34\0\218", "\56\111\97\170\166")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\112\148\50\60\156\236\116\142\58\214", "\23\235\31\230\89\79\236\141")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\255\93\211", "\143\178\60\163\195\174\79"));
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\6\241\130\40", "\85\114\103\129\167\24\97")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\210\162\201\159", "\103\91\179\210\236\175\99")].DescendantAdded:Connect(function(obj)
			if not (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\192\102\215\118\152\146\175\102\208\124\217\114\149\133\166\28\165", "\226\57\149\50\152\48\217\192")] or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\159\26\145\222\109\141\8\130\222\103\233\122", "\155\35\204\74\206")]) then
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
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\247\79\8\225\150\240\86\24\226\153\227\89\11\226\147\135\43", "\167\215\162\27\71")] or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\176\251\29\24\19\162\233\14\24\25\198\155", "\93\93\227\171\66")]) then
			pcall(scanMapChunked);
		end
		task.wait(((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\252\248\129\24\6\252\172\23\236\226\143\28\11\235\165\109\153", "\225\72\169\172\206\94\71\174")] or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\97\100\216\209\30\105\111\126\113\195\177\96", "\40\45\50\52\135\148\80")]) and ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\42\217\175\205\59\207\174\199\92\183", "\226\130\121\134")] and 14) or 10)) or 30);
	end
end);
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\60\208\107\169\58\192\110\133\124\147", "\27\232\89\163")] = 0;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\188\206\240\241\187\214\202\247\172\133\147", "\163\148\201\160")].Heartbeat:Connect(function(dt)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\182\216\217\152\43\127\167\196\195\153\64\14", "\101\62\229\136\134\221")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\64\249\251\91\34", "\126\18\47\150\143")]) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\203\219\108\19\114\28\161\195\141\44", "\127\212\174\168\28\82\17")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\175\79\199\43\169\95\194\7\239\12", "\183\106\202\60")] + dt;
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\39\225\90\254\21\1\79\47\183\26", "\98\58\66\146\42\191\118")] < 0.85) then
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
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\126\239\255\172\132\158", "\161\174\42\138\135\216")].Text = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\145\36\228\226\143\53\244\228\140\38\229\136\232", "\160\173\216\106")] or LUAOBFUSACTOR_DECRYPT_STR_0("\174\107\116\95\187\234\201\81\100\94\165\246\133\117", "\147\233\25\17\58\223")) .. LUAOBFUSACTOR_DECRYPT_STR_0("\14\108\22\79\158\102\0\124", "\86\46\76\96\123\176");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\152\123\244\177\5\220", "\70\221\204\30\140\197\32\236")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\61\82\248\230\112\7", "\149\131\85\55")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\137\54\179\18\31\164", "\59\121\221\83\203\102\58\148")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\32\63\176\37\30\245", "\59\197\116\90\200\81")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\156\234\218\42\184\248", "\94\157\200\143\162")].TextXAlignment = Enum.TextXAlignment.Left;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\15\246\186\234\126\163", "\194\158\91\147")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\27\15\190\221\215\173\0\94\226", "\149\204\114\123\210\184")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\53\115\220\46\212\15\147", "\42\163\92\29\158\90\186")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\245\35\95\14\7\223\43\213\41\73", "\95\161\70\39\122\69\170"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\19\251\15\83\202\98\227", "\71\211\122\149\77\39\164")].Size = UDim2.new(0, 28, 0, 28);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\142\253\244\145\41\194\163", "\229\71\231\147\182")].Position = UDim2.new(1, -70, 0.5, -14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\195\223\239\148\196\148\157", "\173\224\170\177")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\57\136\16\166\55\171", "\155\24\81\237\125\195\18")].Button;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\42\70\116\172\72\21\88", "\48\104\67\40\54\216\38")].Text = "-";
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\90\55\215\19\93\124\165", "\149\103\51\89")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\77\3\129\120\0\86", "\236\29\37\102")].Text;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\42\140\17\67\185\102\210", "\55\215\67\226\83")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\118\195\166\160\216\160\47", "\182\133\31\173\228\212")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\11\234\150\198\65\228\143", "\191\75\98\132\212\178\47\193")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\78\252\235\13\232\254\173\2\184", "\159\223\39\136\135\104\170")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\110\222\110\244\90\17\140\73", "\233\59\151\45\155\40\127"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\9\240\102\178\14\187\20", "\36\198\96\158")]).CornerRadius = UDim.new(0, 6);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\195\5\18\123\221\3\9\97\159", "\103\68\175\106\97\30\159\119")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\19\232\4\21\5\248\8\21\40\227", "\97\71\141\124"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\213\189\45\52\137\205\188\123\97", "\81\203\185\210\94")].Size = UDim2.new(0, 28, 0, 28);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\212\35\190\81\112\164\30\148\136", "\112\177\184\76\205\52\50\208")].Position = UDim2.new(1, -36, 0.5, -14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\208\93\190\165\155\200\92\232\240", "\192\217\188\50\205")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\69\83\52\207\64\29", "\170\101\45\54\89")].Danger;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\164\15\70\166\138\20\91\230\248", "\53\195\200\96")].Text = "X";
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\81\49\43\135\108\185\83\123\104", "\46\205\61\94\88\226")].TextColor3 = Color3.new(1, 1, 1);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\200\22\176\12\230\13\173\76\148", "\195\105\164\121")].Font = Enum.Font.GothamBold;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\181\211\92\6\201\72\183\153\31", "\139\60\217\188\47\99")].TextScaled = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\241\127\230\19\58\30\243\53\165", "\120\106\157\16\149\118")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\214\62\183\187\155\205\102\154\122", "\172\20\191\74\219\222\217")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\6\234\164\24\103\61\198\149", "\21\83\163\231\119"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\24\254\51\186\210\147\213\120\68", "\187\93\116\145\64\223\144\231")]).CornerRadius = UDim.new(0, 6);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\28\12\165\86\14\97\30\70\230", "\76\21\112\99\214\51")].MouseButton1Click:Connect(function()
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\131\255\10\172\140\196\155\244\0\164\140\212\154\238\1\207\253", "\205\150\214\171\69\234")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\220\211\97\241\200\213\99\232\204\201\111\245\197\194\106\146\185", "\46\183\137\135")] = false;
			stopAutofarm();
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\92\92\252\6", "\54\150\41\53\217")].Enabled = false;
	end);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\84\2\5\240\226\126\87\3\65\180", "\171\29\56\109\100\132")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\220\239\36\213\240\192\48\198\225\237\43", "\178\149\130\69"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\64\235\21\104\195\112\67\234\81\44", "\138\19\44\132\116\28")].Size = UDim2.new(0, 56, 0, 56);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\210\54\219\219\247\58\213\193\155\105", "\186\175\190\89")].Position = UDim2.new(1, -80, 0.5, -28);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\11\58\161\188\236\4\58\174\237\149", "\200\165\103\85\192")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\237\182\86\64\115\95", "\50\206\133\211\59\37\86\111")].Background;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\237\10\30\22\232\226\10\17\71\145", "\98\161\129\101\127")].Image = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\203\104\239\109\84\96\105\221", "\76\237\132\47\160\50\29\36")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\222\191\218\175\251\179\212\181\151\224", "\187\219\178\208")].ScaleType = Enum.ScaleType.Fit;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\223\143\223\20\228\79\220\142\155\80", "\173\44\179\224\190\96")].Visible = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\169\121\92\151\236\166\121\83\198\149", "\227\165\197\22\61")].Draggable = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\69\81\169\216\96\93\167\194\12\14", "\200\172\41\62")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\249\207\244\248", "\200\109\140\166\209")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\247\108\250\95\208\75\220\66", "\48\162\37\185"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\13\27\171\83\7\2\27\164\2\126", "\39\78\97\116\202")]).CornerRadius = UDim.new(0, 12);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\253\176\30", "\69\219\142\149\46\130")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\249\97\33\90\37\195\67\23", "\87\172\40\114\46"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\254\167\232", "\101\22\141\130\216")].Color = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\33\232\173\78\50\38", "\23\22\73\141\192\43")].Accent;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\254\162\146", "\153\141\141\135\162")].Thickness = 2;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\4\30\173", "\55\84\119\59\157\192\169")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\88\114\202\240\153\0\42\48\17\45", "\69\94\52\29\171\132\208\99")];
	local function minimize()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\22\120\173\173\137", "\136\185\119\17\195")].Visible = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\208\21\179\162\160\61\211\20\247\230", "\233\94\188\122\210\214")].Visible = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\31\198\133\168\149\212\91\29\140\212", "\183\52\115\169\228\220\220")].ZIndex = 100;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\91\233\202\240\76\12\180\210\82\226\154\150", "\221\176\62\135\191\166\37\127")] = false;
	end
	local function restore()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\41\82\244\28\12\94\250\6\96\13", "\149\104\69\61")].Visible = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\212\11\210\30\133", "\188\59\181\98")].Visible = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\171\56\177\68\21\231\18\168\162\51\225\34", "\123\202\206\86\196\18\124\148")] = true;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\228\140\55\241\246\60\167", "\151\18\141\226\117\133\152\25")].MouseButton1Click:Connect(minimize);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\175\187\173\3\90\160\187\162\82\35", "\119\19\195\212\204")].MouseButton1Click:Connect(restore);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\204\231\211\18\1\176\21\206\173\130", "\211\122\160\136\178\102\72")].Activated:Connect(restore);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\25\143\123\11\9\247\183\21", "\146\37\112\235\30\105\104\133")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\99\167\64\122\68", "\33\37\213\33\23"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\2\214\133\47\223\212\78\130", "\190\166\107\178\224\77")].Size = UDim2.new(0, 150, 1, -42);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\133\82\21\112\245\158\19\64", "\18\148\236\54\112")].Position = UDim2.new(0, 0, 0, 42);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\185\242\58\61\128\162\179\111", "\95\225\208\150\95")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\125\226\132\169\48\183", "\233\204\21\135")].Sidebar;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\137\203\215\221\252\188\197\159", "\157\206\224\175\178\191")].BorderSizePixel = 0;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\127\180\181\52\195\39\178\251", "\151\203\22\208\208\86\162\85")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\168\132\184\194\45", "\68\35\201\237\214\231\29")];
	Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\106\53\197\49\77\18\227\44", "\94\63\124\134"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\208\75\126\246\216\93\62\164", "\27\148\185\47")]).CornerRadius = UDim.new(0, 14);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\50\249\43\161\118\254\0\18", "\37\34\91\157\78\195\23\140")].ClipsDescendants = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\72\237\135\86\58\15\85\172\210", "\83\124\33\137\226\26")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\236\112\203\201\198\205\117\230\217\218\204\77", "\181\185\57\135\160"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\9\230\55\34\253\179\205\69\178", "\192\185\96\130\82\110\148")].Padding = UDim.new(0, 6);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\216\16\233\15\48\28\83\148\68", "\111\39\177\116\140\67\89")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\143\62\1\213\163\103\195\106", "\194\21\230\90\100\183")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\238\24\253\4\168\41\134\183", "\77\163\135\124\152\84\201")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\106\39\31\238\40\241\86\0\40", "\149\63\110\79\143\76"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\143\164\180\53\63\229\179\214", "\129\150\230\192\209\101\94")].PaddingTop = UDim.new(0, 12);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\118\75\3\148\126\75\67\244", "\102\196\31\47")].PaddingLeft = UDim.new(0, 8);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\63\52\125\114\67\169\22\191", "\51\143\86\80\24\34\34\205")].PaddingRight = UDim.new(0, 8);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\18\240\224\123\36\132\204\75", "\224\233\123\148\133\43\69")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\49\125\132\213\57\107\196\135", "\225\183\88\25")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\254\189\38\184\14\21\180\227", "\96\97\145\211\82\221")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\227\251\85\191\9", "\49\165\137\52\210\108"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\41\19\162\75\40\9\243\30", "\214\46\70\125")].Size = UDim2.new(1, -162, 1, -54);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\204\133\174\211\205\159\255\134", "\218\182\163\235")].Position = UDim2.new(0, 156, 0, 48);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\45\163\60\40\163\54\232\120", "\77\205\66\205\72")].BackgroundTransparency = 1;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\180\241\74\134\195\70\112\245", "\85\197\219\159\62\227\173\50")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\247\34\1\115\159", "\51\78\150\75\111\86\175")];
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\140\204\64\47\200\155", "\37\92\237\171")] = {};
	local function createPage(name)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\156\154", "\46\45\185\170\99")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\32\200\221\184\250\31\194\193\176\208\1\202\194\178", "\150\115\171\175\215"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\192\138", "\68\93\229\186\197\225\111\35")].Size = UDim2.new(1, 0, 1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\10\88", "\22\155\47\104\140\237\139")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\109\5", "\44\128\72\53\27\167\189")].Visible = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\84\186", "\130\143\113\138\90\118\141\173")].ScrollBarThickness = 4;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\146\108", "\59\230\183\92\77\104")].ScrollBarImageColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\79\229\244\52\178\185", "\151\137\39\128\153\81")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\136\190", "\76\26\173\142\62\159\156\56")].AutomaticCanvasSize = Enum.AutomaticSize.Y;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\119\82", "\55\213\82\98\235\135\99")].CanvasSize = UDim2.new(0, 0, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\250\81", "\29\112\223\97\22\193")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\199\226\11\168\73\220\169\79", "\205\39\168\140\127")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\100\136", "\77\73\65\184\53\127")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\10\84\132\123\33\228\154\62\100\167\103\38", "\214\95\29\200\18\82\144"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\181\16", "\233\22\144\32\53\134")].Padding = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\81\117", "\56\95\116\69\71\87")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\58\150", "\38\229\31\166\35\216\156")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\118\211\178\246", "\151\198\23\183")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\54\110\14\208\37\187\197\13\64", "\172\99\39\94\177\65\223"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\29\61\60\249", "\33\39\124\89\25\201\32\207")].PaddingTop = UDim.new(0, 4);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\51\83\109\238", "\222\72\82\55\72")].PaddingBottom = UDim.new(0, 16);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\94\193\157\105", "\184\89\63\165")].PaddingLeft = UDim.new(0, 4);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\217\124\73\253", "\215\108\184\24\108\205\179\195")].PaddingRight = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\116\2\239\21", "\37\129\21\102\202")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\121\41", "\205\145\92\25")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\50\178\238\76\118\229", "\139\63\83\213")][name] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\81\124", "\116\127\116\76\92\20\130")];
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\135\108", "\39\232\162\92\115\219")];
	end
	local function switchTab(name)
		for n, p in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\246\89\64\57\178\14", "\37\74\151\62")]) do
			p.Visible = n == name;
		end
		for n, b in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\59\33\4\67\54\174\53\45\53\19\114", "\66\218\90\67\70\54")]) do
			if (n == name) then
				b.BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\35\205\69\181\109\213", "\53\150\75\168\40\208\72\229")].Accent;
				b.TextColor3 = Color3.fromRGB(20, 15, 5);
			else
				b.BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\177\69\128\42\162\233", "\79\135\217\32\237")].Button;
				b.TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\8\229\67\10\107\224", "\78\208\96\128\46\111")].Text;
			end
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\244\71\50\239\241\71\194\97", "\231\81\149\37\121\138\136\52")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\124\121\58\142\103\88\118\40\136\122\91", "\21\53\23\92\225"),LUAOBFUSACTOR_DECRYPT_STR_0("\199\22\77\134\164\166\223\59", "\79\138\121\59\227\201\195\177"),LUAOBFUSACTOR_DECRYPT_STR_0("\57\210\240\18\160\220\95\25", "\45\109\183\156\119\208\179"),LUAOBFUSACTOR_DECRYPT_STR_0("\20\232\156\227\51\252\154\225", "\140\85\157\232"),LUAOBFUSACTOR_DECRYPT_STR_0("\34\248\61", "\19\103\171\109"),LUAOBFUSACTOR_DECRYPT_STR_0("\195\210\126\109", "\30\129\179\25"),LUAOBFUSACTOR_DECRYPT_STR_0("\60\249\183\100\137\22\232\2", "\134\113\144\196\23\224\121"),LUAOBFUSACTOR_DECRYPT_STR_0("\217\176\128\94\232\171", "\51\141\216\229"),LUAOBFUSACTOR_DECRYPT_STR_0("\151\194\46\162", "\193\218\171\93"),LUAOBFUSACTOR_DECRYPT_STR_0("\43\114\39\164\68\22\112\32", "\45\120\23\83\208")};
	for _, name in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\28\231\212\227\91\14\160\175", "\134\34\125\133\159")]) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\80\213\101\10", "\63\229\36\187\64\58\212")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\113\71\41\216\103\87\37\216\74\76", "\172\37\34\81"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\111\53\253\177", "\106\56\27\91\216\129")].Size = UDim2.new(1, 0, 0, 36);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\226\224\188\114", "\174\65\150\142\153\66")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\138\22\140\6\70\125", "\99\77\226\115\225\99")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\165\32\180\159", "\94\224\209\78\145\175")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\50\85", "\80\145\23\101\179\200\118\20")][name] or name;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\96\92\51\220", "\180\146\20\50\22\236")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\131\252\237\230\23\219", "\131\50\235\153\128")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\91\181\57\44", "\184\159\47\219\28\28\70")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\203\200\56\103", "\29\87\191\166")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\76\189\77\24", "\158\143\56\211\104\40")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\167\185\37\162\95\188\248\112", "\192\62\206\221\64")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\196\23\111\252\45\255\59\94", "\95\145\94\44\147"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\178\11\118\177", "\83\129\198\101")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\11\222\16\179\207\30\211\60\181\158\90", "\198\187\106\188\82")][name] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\14\248\120\141", "\75\66\122\150\93\189\90")];
		createPage(name);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\70\133\172\163", "\147\128\50\235\137")].MouseButton1Click:Connect(function()
			switchTab(name);
		end);
	end
	local function section(parent, title)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\129\154", "\64\170\164\170\163\200\223")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\36\168\164\87\133", "\169\98\218\197\58\224\28"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\88\181", "\171\144\125\133\147\170\180")].Size = UDim2.new(1, 0, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\54\253", "\17\193\19\205\16\147\49")].AutomaticSize = Enum.AutomaticSize.Y;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\48\27", "\76\148\21\43\38\174")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\239\226\21\208\162\183", "\120\181\135\135")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\182\87", "\169\134\147\103")].BackgroundTransparency = 0.35;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\170\77", "\229\194\143\125\20")].Parent = parent;
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\177\154\235\236\150\189\205\241", "\131\228\211\168"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\148\21", "\196\34\177\37\65\102\136\148")]).CornerRadius = UDim.new(0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\159\82\37", "\223\132\235\119\21\189\27\51")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\44\119\202\232\106\208\79\28", "\36\121\62\153\156\24\191"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\28\165\5", "\23\72\104\128\53\65")].Color = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\203\161\42\196\134\244", "\71\161\163\196")].Stroke;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\159\201\75", "\212\83\235\236\123\79")].Thickness = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\3\96\0", "\196\40\119\69\48\95")].Transparency = 0.5;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\213\30\67", "\190\62\161\59\115")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\123\96", "\84\159\94\80\59\106\185")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\0\70\96\213", "\229\63\98\42\69")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\235\30\71\90\17\247\212\218\23", "\182\191\123\63\46\93\150"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\113\43\21\252", "\118\142\19\71\48\204\112\197")].Size = UDim2.new(1, -16, 0, 26);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\73\65\97\210", "\118\63\43\45\68\226")].Position = UDim2.new(0, 10, 0, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\225\64\233\231", "\192\33\131\44\204\215\36")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\237\129\252\174", "\217\158\143\237")].Text = title;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\68\78\124\9", "\113\28\38\34\89\57\190")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\179\180\93\135\108\235", "\226\73\219\209\48")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\75\253\164\250", "\218\216\41\145\129\202\190")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\27\71\169\73", "\29\200\121\43\140\121")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\47\28\1\2", "\92\128\77\112\36\50\105\41")].TextXAlignment = Enum.TextXAlignment.Left;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\86\2\231\43", "\194\27\52\110")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\109\156", "\197\149\72\172\78\56\63\191")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\137\103\105\23\208", "\29\50\224\20")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\208\76\251\56\1", "\75\150\62\154\85\100\149\183"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\31\243\203\5\141", "\112\28\118\128\191\32\189")].Size = UDim2.new(1, -16, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\231\54\54\101\150", "\166\96\142\69\66\64")].Position = UDim2.new(0, 8, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\207\249\7\26\126", "\78\80\166\138\115\63")].AutomaticSize = Enum.AutomaticSize.Y;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\0\184\4\20\30", "\49\46\105\203\112")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\112\53\105\192\94", "\110\205\25\70\29\229")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\128\94", "\159\197\165\110\175\76\149\122")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\120\28\155\107", "\115\184\25\101\190\91")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\78\26\34\197\104\39\34\205\98\60\27\216", "\172\27\83\110"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\71\152\253\103", "\216\87\38\225")].Padding = UDim.new(0, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\166\46\114\7", "\57\23\199\87\87\55\75")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\241\59\189\158\71", "\187\119\152\72\201")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\255\220\189\241", "\152\193\144\168")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\79\138\115\169\62\95\171\116\164", "\194\26\195\35\200\90\59"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\219\9\170\74", "\134\163\180\125\143\122\33")].PaddingBottom = UDim.new(0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\39\95\168\145", "\141\161\72\43")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\54\226", "\187\235\19\210\105\115")];
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\54\43\233\9\244", "\44\196\95\88\157")];
	end
	local function makeToggle(parent, text, default, callback)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\16\140\201\218", "\47\147\100\226\236\234")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\231\214\110\26\241\198\98\26\220\221", "\110\179\179\22"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\195\77\63\0", "\25\187\183\35\26\48\87\140")].Size = UDim2.new(1, 0, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\203\80\51\45", "\22\29\191\62")].AutoButtonColor = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\238\193\113\92", "\212\232\154\175\84\108")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\20\201\244\198\105\220", "\42\90\124\172\153\163\76\236")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\158\182\61\120", "\24\72\234\216")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\109\215\27\149", "\165\118\25\185\62")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\93\235\5\85", "\32\101\41\133")].Parent = parent;
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\217\108\113\174\97\221\233\87", "\179\140\37\50\193\19"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\169\31\110\85", "\152\40\221\113\75\101")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\249\186\152\166\94\43", "\123\27\141\219\236\195")] = (default and true) or false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\95\224\244\136\0\91", "\84\32\62\130\145\228\37\107")] = tostring(text);
		local function paint()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\144\71\246\22", "\178\65\228\41\211\38\54")].BackgroundColor3 = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\179\0\203\10\97\10", "\94\20\199\97\191\111\68\58")] and Color3.fromRGB(40, 120, 55)) or Color3.fromRGB(120, 40, 40);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\151\238\82\26", "\89\177\227\128\119\42\176")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\181\252\90\113\124\95", "\111\124\212\158\63\29\89")] .. ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\75\52\63\61\30\15", "\88\59\63\85\75")] and LUAOBFUSACTOR_DECRYPT_STR_0("\242\145\241\199\201\43\156", "\100\210\177\141\231\233")) or LUAOBFUSACTOR_DECRYPT_STR_0("\190\200\43\254\186\205\216\174", "\130\158\232\87\222\154"));
		end
		paint();
		local function flip()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\63\71\55\16\107\123", "\117\78\75\38\67")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\36\93\90\17\189\96", "\116\152\80\60\46")];
			paint();
			if callback then
				pcall(callback, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\3\37\96\182\64\142", "\126\52\119\68\20\211\101\190")]);
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\172\95\145\17", "\33\189\216\49\180")].MouseButton1Click:Connect(flip);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\174\57\106\235", "\219\204\218\87\79")].Activated:Connect(function()
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\110\179\12\17", "\229\181\26\221\41\33")]:SetAttribute(LUAOBFUSACTOR_DECRYPT_STR_0("\238\254\227\9\126\30\0\68\216\244\232", "\37\186\145\132\110\18\123\76"), TABLE_TableIndirection["label%0"]);
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\5\230\76\211", "\105\227\113\136")];
	end
	local function makeBtn(parent, text, color, callback)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\10\15\198\76", "\20\99\126\97\227\124\237\135")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\135\168\252\243\47\25\16\167\162\234", "\100\211\205\132\135\109\108"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\0\199\181\233", "\217\193\116\169\144")].Size = UDim2.new(1, 0, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\90\39\59\224", "\72\121\46\73\30\208")].BackgroundColor3 = color or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\220\241\141\4\193\227", "\228\211\180\148\224\97")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\230\177\174\32", "\140\51\146\223\139\16")].Text = text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\8\140\232\175", "\159\143\124\226\205")].TextColor3 = ((color == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\245\65\92\20\246\21", "\37\26\157\36\49\113\211")].Accent) and Color3.fromRGB(20, 15, 5)) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\43\186\200\176\225\115", "\213\196\67\223\165")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\114\92\176\177\93", "\109\16\40\222\148")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\193\81\244\133", "\209\181\181\63")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\36\249\253\144", "\45\144\80\151\216\160")].Parent = parent;
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\17\20\153\42\76\42\56\168", "\62\68\93\218\69"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\15\61\128\108", "\114\127\123\83\165\92\95")]).CornerRadius = UDim.new(0, 8);
		if callback then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\201\240\246\150", "\211\166\189\158")].MouseButton1Click:Connect(callback);
		end
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\181\214\120\98", "\140\93\193\184\93\82")];
	end
	local function makeDrop(parent, label, options, default, callback)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\188\183\173", "\143\19\206\146\157\235")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\246\3\137\177\213", "\220\176\113\232"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\9\0\190", "\184\118\123\37\142\142")].Size = UDim2.new(1, 0, 0, 36);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\240\98\88", "\104\205\130\71")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\0\1\213", "\129\230\114\36\229\107\121\16")].Parent = parent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\13\242\243\147", "\196\32\111\158\214\163\167")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\25\23\212\4\1\19\206\21\33", "\112\77\114\172"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\66\36\103\228", "\212\237\32\72\66")].Size = UDim2.new(0.38, 0, 1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\237\112\105\231", "\76\215\143\28")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\199\229\5\212", "\229\33\165\137\32\228\85")].Text = label;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\128\9\57\68", "\232\215\226\101\28\116\165\216")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\45\166\86\37\73\117", "\64\108\69\195\59")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\113\192\29\18", "\34\114\19\172\56")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\39\127\135\129", "\177\174\69\19\162")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\76\68\95\214", "\196\236\46\40\122\230\122")].TextXAlignment = Enum.TextXAlignment.Left;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\245\120\228\187", "\98\223\151\20\193\139\80")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\183\193\138", "\167\50\197\228\186\202\146\38")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\220\40\98\28", "\71\44\168\70")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\54\2\195\216\32\18\207\216\13\9", "\172\98\103\187"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\83\142\105\104", "\217\71\39\224\76\88\118\207")].Size = UDim2.new(0.6, 0, 1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\173\245\236\221", "\201\237\217\155")].Position = UDim2.new(0.4, 0, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\87\85\137\234", "\203\23\35\59\172\218\232\105")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\161\165\118\39\236\240", "\27\66\201\192")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\49\245\48\154", "\58\66\69\155\21\170")].Text = tostring(default or options[1]);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\75\231\190\172", "\156\143\63\137\155")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\35\120\49\141\87\123", "\232\114\75\29\92")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\69\247\19\153", "\170\105\49\153\54\169")].Font = Enum.Font.GothamSemibold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\74\117\139\65", "\212\127\62\27\174\113\134\232")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\21\189\251\166", "\219\147\97\211\222\150\62")].AutoButtonColor = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\84\248\200\213", "\209\160\32\150\237\229")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\40\0\18", "\236\211\90\37\34\24\151")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\97\141\144\143\70\170\182\146", "\224\52\196\211"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\83\75\124\99", "\131\127\39\37\89\83")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\19\247\6\10", "\165\169\119\143\35\58")] = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\253\46\134\252\3\147\179", "\182\131\152\72\213\136\113")] = tostring(default or options[1]);
		for i, v in ipairs(options) do
			if (tostring(v) == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\21\179\155\82\2\240\248", "\200\38\112\213")]) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\11\215\15\129", "\84\132\111\175\42\177\191")] = i;
				break;
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\157\35\140\95", "\98\136\233\77\169\111\37\83")].MouseButton1Click:Connect(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\177\37\235\185", "\185\17\213\93\206\137")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\62\146\80\234", "\218\220\90\234\117")] % #options) + 1;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\16\200\101\1", "\17\162\113\164\64\49\74")] = options[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\13\205\65\216", "\116\96\105\181\100\232\157")]];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\47\214\73\107", "\59\41\91\184\108\91\110\16")].Text = tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\70\174\30\67", "\115\232\39\194\59")]);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\223\233\115\242", "\194\123\171\135\86")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\138\124\201\49\186\76", "\21\63\226\25\164\84\159\124")].Accent;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\220\177\148\113", "\122\142\168\223\177\65\158")].TextColor3 = Color3.fromRGB(20, 15, 5);
			task.delay(0.25, function()
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\55\31\64\138", "\72\163\67\113\101\186\54")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\147\250\196\121", "\225\73\231\148")].Parent) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\34\64\19\150", "\166\113\86\46\54")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\221\114\208\228\131\215", "\103\175\181\23\189\129\166\231")].Button;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\12\91\17\141", "\109\209\120\53\52\189")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\0\248\31\222\247\19", "\210\35\104\157\114\187")].Text;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\209\187\126\241", "\176\26\165\213\91\193\45\97")].Text = tostring(options[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\34\146\165\171", "\138\87\70\234\128\155\115")]]);
				end
			end);
			if callback then
				callback(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\218\222\5\143", "\173\193\187\178\32\191\194\112")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\54\221\162\69", "\68\140\66\179\135\117")]);
			end
		end);
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\158\70\191\107", "\200\20\234\40\154\91\53")];
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\186\172\190\62\16", "\27\32\219\203\219")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\252\30\187\237\53\2", "\223\70\157\121\222\158\16\50")].Information;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\20\160\227\234\92\108\224", "\73\208\117\206\141\143\46")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\134\247\80\116\170\214\80\113\170\246", "\19\207\154\49"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\51\12\242\26\236\126\98", "\158\91\82\98\156\127")].Size = UDim2.new(1, 0, 0, 120);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\133\236\200\55\39\200\225", "\237\209\228\130\166\82\85")].BackgroundColor3 = Color3.fromRGB(20, 16, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\164\247\203\7\59\178\245", "\73\151\197\153\165\98")].Image = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\59\219\228\158\64\26\124\62\176\154", "\69\53\122\149\170\219\18")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\254\26\248\55\68\169\218", "\234\81\159\116\150\82\54\140")].ScaleType = Enum.ScaleType.Crop;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\193\11\17\31\210\64\79", "\127\122\160\101")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\42\46\236\228\90", "\225\55\75\73\137\193\106\26")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\124\146\101\21\91\181\67\8", "\122\41\219\38"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\162\215\187\114\177\156\229", "\213\23\195\185")]).CornerRadius = UDim.new(0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\51\51\252", "\231\232\64\22\204\173\80\34")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\127\114\252\176\88\84\196\161", "\196\42\59\175"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\33\124\64", "\88\66\82\89\112")].Color = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\136\42\88\91\91\208", "\62\126\224\79\53")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\106\129\216", "\169\60\25\164\232")].Thickness = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\31\197\128", "\175\163\108\224\176\49\109")].Transparency = 0.35;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\45\97\229", "\72\175\94\68\213\79")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\184\253\197\234\201\252\163", "\143\187\217\147\171")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\23\96\250\87", "\103\189\120\23\223")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\85\86\120\9\172", "\129\19\36\25\100\201\110\121"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\16\70\249\86", "\220\102\127\49")].Size = UDim2.new(1, 0, 0, 64);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\18\88\137\88", "\211\40\125\47\172\104\212\223")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\78\59\75\30", "\110\46\33\76")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\128\191\218\114\228", "\87\212\225\216\191")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\92\194\135\252\182", "\217\134\51\165\232")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\138\49\193\2\19\143\61\194\0\26", "\118\195\92\160\101"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\19\40\32\124\66", "\114\192\124\79\79\89")].Size = UDim2.new(0, 54, 0, 54);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\255\176\203\163\216", "\134\232\144\215\164")].Position = UDim2.new(0, 0, 0.5, -27);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\73\85\90\204\75", "\83\141\38\50\53\233\123\174")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\141\162\90\113\239", "\16\93\226\197\53\84\223\33")].Image = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\252\219\53\151\62\93\150\172", "\119\25\179\156\122\200")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\224\47\251\189\191", "\148\152\143\72")].ScaleType = Enum.ScaleType.Fit;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\18\220\203\124\172", "\89\156\125\187\164")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\88\210\253\152", "\96\160\55\165\216\168\144\191")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\88\48\106", "\90\120\52\21")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\191\21\227\65\232\183\137\21\247", "\214\235\112\155\53\164"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\226\68\124", "\76\41\142\97")].Size = UDim2.new(1, -70, 0, 28);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\200\139\69", "\118\137\164\174\117\26\126\121")].Position = UDim2.new(0, 64, 0, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\172\11\42", "\110\106\192\46\26\28")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\64\86\185", "\169\172\44\115\137\161\108")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\220\163\240\115\152\202\185\253\104\131\208\200\132", "\60\207\149\237\180")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\56\206\182", "\134\151\84\235")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\7\183\0\114\14\95", "\23\43\111\210\109")].Accent;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\20\181\173", "\137\21\120\144\157\124\42")].Font = Enum.Font.GothamBlack;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\7\84\235", "\105\145\107\113\219\96\195")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\255\87\105", "\89\129\147\114")].TextXAlignment = Enum.TextXAlignment.Left;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\185\228\76", "\178\123\213\193\124\49")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\38\176\137\141", "\20\141\73\199\172\189\237\155")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\15\95\85", "\184\140\99\122\101\91\128\43")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\207\9\160\18\215\13\186\3\247", "\102\155\108\216"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\133\16\245", "\219\78\233\53\197\136\144")].Size = UDim2.new(1, -70, 0, 20);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\61\182\250", "\49\91\81\147\202\87\145")].Position = UDim2.new(0, 64, 0, 36);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\91\29\190", "\46\97\55\56\142\226\64")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\132\159\171", "\41\103\232\186\155\37\131\106")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\42\189\159\139\114\185\145\155\32\169\145\249\48\232\210\208\124\175\145\252\51\229\213", "\187\92\137\177");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\14\204\91", "\56\34\98\233\107\23\57")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\239\20\37\47\97\78", "\126\57\135\113\72\74\68")].TextDim;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\113\54\44", "\65\230\29\19\28\109\142")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\169\240\73", "\50\27\197\213\121\31\232\24")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\73\225\180", "\132\56\37\196")].TextXAlignment = Enum.TextXAlignment.Left;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\208\114\231", "\135\56\188\87\215\190")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\38\66\77\10", "\58\203\73\53\104")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\203\232\156\178", "\100\123\174\139\185\130")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\33\54\51\74\247", "\199\96\64\81\86\111")], LUAOBFUSACTOR_DECRYPT_STR_0("\44\192\68\75\22\27\193", "\127\111\178\33\47"));
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\182\39\151\180", "\156\111\211\68\178\132\189\144")], LUAOBFUSACTOR_DECRYPT_STR_0("\198\209\73\234\180\207\52\72\238\220\79\244\241\249\107\30\251\197\82\246\243\254\36\71", "\62\139\176\32\132\148\139\81"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\32\220\90\128\94\33", "\109\144\72\185\55\229\123\17")].Button);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\221\75\29\37", "\144\177\184\40\56\21")], LUAOBFUSACTOR_DECRYPT_STR_0("\160\250\84\131\32\172\134\249\22\183\32\168\217\181\42\169\42\173\135\244\0", "\218\227\149\121\199\69"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\89\198\227\35\252\217", "\233\207\49\163\142\70\217")].Button);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\220\193\168\145", "\225\46\185\162\141\161\208")], LUAOBFUSACTOR_DECRYPT_STR_0("\246\212\106\88\169\195\217\111\88\169\141\144\122\92\183\196\213\126\92\181\217\213\120", "\219\183\176\28\61"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\11\207\253\242\186\211", "\60\37\99\170\144\151\159\227")].Button);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\174\47\242\37", "\46\55\203\76\215\21\82\218")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\155\169", "\140\230\190\153\92\131\118")].CopyDiscord, Color3.fromRGB(80, 70, 30), function()
			if setclipboard then
				setclipboard(LUAOBFUSACTOR_DECRYPT_STR_0("\195\220\219\87\75\188\3\54\207\193\220\68\87\244\72\55\204\207\128\84\90\208\89\120\255\145\206\21\108", "\25\171\168\175\39\56\134\44"));
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\11\187\208\50\137\158\120\111\177\204\33\143\137\120", "\28\79\210\163\81\230\236"), 2);
			end
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\245\28\131\248\95\128", "\155\122\176\100\230")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\132\26\33\189\251", "\152\203\229\125\68")], LUAOBFUSACTOR_DECRYPT_STR_0("\229\168\55\226\223\162\42", "\145\182\205\68"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\50\67\116\174\32\227\199\122", "\141\226\74\38\23\236\84")] = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\87\96\32\132\55\40", "\69\231\18\24")], LUAOBFUSACTOR_DECRYPT_STR_0("\85\199\55\41\101\203\61\56\42\159", "\74\16\191\82") .. tostring(EXECUTOR_NAME or "?"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\29\69\21\122\247\41", "\25\180\117\32\120\31\210")].Button);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\104\81\235\37\115\4\153", "\169\81\29\33")] = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\152\202\118\19\184\237", "\112\157\221\178\19")], LUAOBFUSACTOR_DECRYPT_STR_0("\192\14\27\52\222\59\52\169\91", "\64\147\123\107\68\177\73") .. tostring(EXECUTOR_SUPPORT or "?"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\42\33\32\43\51\242", "\194\207\66\68\77\78\22")].Button);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\24\0\104\41\186\36\91\127", "\126\79\125\121\59\65\213\83")] = "—";
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\219\224\113\91\204\231\7\3", "\34\51\163\144")] = "—";
		if (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\175\83\119\19\183", "\54\134\234\29\33")].GreedyAuth) == LUAOBFUSACTOR_DECRYPT_STR_0("\44\33\62\231\61", "\139\88\64\92")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\107\70", "\119\31\78\118\29")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\223\97\200\96\185", "\193\76\154\47\158\69\136")].GreedyAuth.key;
			if ((type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\18\88", "\237\171\55\104\50\142")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\25\220\216\46\81\114", "\21\106\168\170\71\63")) and (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\16\46", "\216\72\53\30\48")] > 4)) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\242\178\176\217\93\224\238\211", "\177\50\151\203\227")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\198\120", "\96\102\227\72\134")]:sub(1, 4) .. LUAOBFUSACTOR_DECRYPT_STR_0("\170\12\64", "\114\132\34\110\99") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\191\66", "\29\188\154\114\162\147\186\196")]:sub(-4);
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\26\152\170\20", "\148\98\98\232\143\36")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\97\20\37\230\250", "\195\203\36\90\115")].GreedyAuth.expires_at;
			if (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\88\66\23\88", "\61\60\32\50\50\104\194\169")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\188\48\125\27\183\55", "\121\210\69\16")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\24\117\85\184\126", "\157\78\125\19\33")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\108\224\148\137", "\177\185\20\144")] - os.time();
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\81\200\49\193\12", "\228\60\52\174\69")] < 0) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\68\254\62\113\21\75\171\93", "\25\122\60\142\109")] = LUAOBFUSACTOR_DECRYPT_STR_0("\52\57\65\154\210\52\37", "\128\113\97\17\211");
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\151\190", "\214\126\178\142\177\158")] = math.floor(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\44\50\90\84\110", "\94\33\73\84\46\113")] / 3600);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\30\11", "\126\209\59\59")] = math.floor((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\74\174\204\228\240", "\232\210\47\200\184\193\192")] % 3600) / 60);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\232\221\126\179\133\231\136\29", "\219\234\144\173\45")] = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\9\69\225\69\92\231\84\111\64\68\239\17", "\79\44\33\137\101\121\131\57"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\19\46", "\72\189\54\30\45\69\209\157")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\252\166", "\54\97\217\150\182")]);
				end
			elseif (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\167\30\178\81", "\231\187\223\110\151\97\126")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\35\70\105\4\57\81", "\54\80\50\27\109\87")) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\198\155\135\114\254\197\149\26", "\176\42\190\235\212\26\145\178")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\37\43\162\138", "\232\26\93\91\135\186\224")];
			else
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\247\232\219\77\255\20\78\191", "\99\107\143\152\136\37\144")] = LUAOBFUSACTOR_DECRYPT_STR_0("\61\34\136\129\26\222\49\127\209\201\79\214\47\127\223\130", "\184\67\16\188\233\58");
			end
		end
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\54\63\79\251\112\95", "\85\111\115\71\42\152")], LUAOBFUSACTOR_DECRYPT_STR_0("\46\125\50\78\173", "\153\101\24\75\116\141\20\51") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\29\220\57\53\23\210\79\109", "\106\93\120\165")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\80\113\216\95\29\36", "\181\58\56\20")].Button);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\129\233\129\20\9\244", "\119\44\196\145\228")], LUAOBFUSACTOR_DECRYPT_STR_0("\214\96\169\74\240\160\205\169\56", "\190\147\24\217\35\130\197") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\66\224\209\215\85\231\167\143", "\130\191\58\144")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\23\240\44\250\55\79", "\159\18\127\149\65")].Button);
		task.spawn(function()
			task.wait(2);
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\199\60\219\97\95", "\110\128\130\114\141\68")].GreedyWeaoUnc and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\68\194\128\54\180\20\130", "\66\218\49\178\194")]) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\214\151\171\60\179\240\17", "\33\145\163\231\233\72\221\213")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\97\74\251\232\182\24\70\5\171", "\106\50\63\139\152\217") .. tostring(EXECUTOR_SUPPORT) .. LUAOBFUSACTOR_DECRYPT_STR_0("\197\249\179\190\117\166\165", "\59\229\133\147\235") .. tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\116\55\242\224\6", "\55\75\49\121\164\197")].GreedyWeaoUnc) .. "%";
			end
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\220\140\0\252\234", "\217\218\189\235\101")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\121\228\56\34\141\217", "\168\233\24\131\93\81")].Movement;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\110\103\33", "\214\37\95\66\17\154\95")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\92\89\161\172\90", "\175\58\61\62\196\137\106\104")], LUAOBFUSACTOR_DECRYPT_STR_0("\194\87\240\254\25\67\100\160\219\82\248\235", "\128\145\39\149\155\125\99\66"));
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\86\23\25", "\41\65\103\50")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\117\174", "\56\81\80\158\33\217")].WalkSpeed, {LUAOBFUSACTOR_DECRYPT_STR_0("\47\70", "\119\26\118\112\58\176\143\188"),LUAOBFUSACTOR_DECRYPT_STR_0("\127\160\112", "\227\78\144\64\18\185"),LUAOBFUSACTOR_DECRYPT_STR_0("\122\163\218", "\38\75\150\234"),LUAOBFUSACTOR_DECRYPT_STR_0("\178\30\69", "\201\128\46\117"),LUAOBFUSACTOR_DECRYPT_STR_0("\38\234\180", "\182\21\218\132\217\88"),LUAOBFUSACTOR_DECRYPT_STR_0("\45\183\175", "\215\24\135\159\52\112")}, LUAOBFUSACTOR_DECRYPT_STR_0("\66\164\4", "\193\115\148\52\225\197\224"), function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\118\52\60\144\41\105\109\61\42\141\41\98\125\71\73", "\108\39\57\98\121\221")] = tonumber(v) or 100;
			applyWalkSpeed();
		end);
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\102\204\171", "\156\135\87\233\155\232\138\208")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\6\102", "\26\228\35\86")].JumpPower, {LUAOBFUSACTOR_DECRYPT_STR_0("\186\239", "\65\136\223\200\201\56\139\68"),LUAOBFUSACTOR_DECRYPT_STR_0("\170\170", "\58\158\154\87\151"),LUAOBFUSACTOR_DECRYPT_STR_0("\176\252", "\90\134\204\142\233\105\16\87"),LUAOBFUSACTOR_DECRYPT_STR_0("\248\119", "\195\192\71\145"),LUAOBFUSACTOR_DECRYPT_STR_0("\218\129\169", "\41\235\177\153\116\58"),LUAOBFUSACTOR_DECRYPT_STR_0("\185\171\132", "\72\136\158\180\96\104"),LUAOBFUSACTOR_DECRYPT_STR_0("\104\33\145", "\45\90\17\161")}, LUAOBFUSACTOR_DECRYPT_STR_0("\154\178", "\28\175\130\39\131\90\142\65"), function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\77\146\184\234\68\87\136\173\231\49\40", "\181\20\24\223\232")] = tonumber(v) or 50;
			applyJumpPower();
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\233\53\224", "\66\61\219\16\208\108\70")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\169\254\142\27\248", "\235\62\200\153")], LUAOBFUSACTOR_DECRYPT_STR_0("\110\163\165\164\86\169\177", "\195\58\204\194"));
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\245\176\100", "\84\132\199\149")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\241\214", "\61\79\212\230\91\129\132\149")].SpeedMult, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\182\152\40\85\225\206\51\224\178\130\34\95\155\179", "\102\172\230\221\109\17\190\131")] = s;
			if s then
				startInfinite();
			else
				stopInfinite();
			end
			applyWalkSpeed();
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\229\140\158", "\157\132\215\169\174\140\108\22")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\190\67", "\64\215\155\115\207\154\87\173")].JumpMult, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\140\195\39\200\88\188\56\141\209\56\217\48\217", "\233\116\217\142\119\151\21")] = s;
			applyJumpPower();
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\120\74\240", "\82\202\74\111\192")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\31\16", "\190\174\58\32\234")].NoFall, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\198\11\222\18\194\27\214\16\217\30\207\16\204\11\221\29\207\21\197\17\220\118\190", "\142\87\137\84\152\83")] = s;
			if s then
				setupNoFallDamage();
			end
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\249\126\166", "\55\224\203\91\150\174\80")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\58\45", "\31\216\31\29\80\163\123\73")].NoClip, false, function(s)
			toggleNoClip(s);
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\95\172\250", "\186\119\109\137\202\179")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\30\0", "\138\90\59\48\162\216\149")].BoxFly, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\131\8\51\50\248\240\118\151\141\18\57\59\229\138\3", "\51\217\204\80\117\126\161\175")] = s;
			if s then
				startBoxFly();
			else
				stopBoxFly();
			end
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\165\77\118\143\185", "\137\174\196\42\19\170")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\134\224\84\160\23\107", "\34\29\231\135\49\211\50\91")].Teleport;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\125\167\0", "\53\191\76\130\48")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\72\176\80\118\25", "\53\83\41\215")], LUAOBFUSACTOR_DECRYPT_STR_0("\111\167\77\77\181\84\176\85", "\197\59\194\33\40"));
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\26\248\186", "\219\237\43\221\138\135\157")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\251\45", "\29\148\222\29\193")].TPNearest, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\74\42\192\211\165\18", "\182\128\34\79\173")].Accent, teleportToNearest);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\4\232\249\89\45\36\224\243\72\122\88", "\60\95\104\137\128")] = getPlayerList();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\115\185\76\53\98\176\77\6\122\180\80\51\100\240\25", "\41\86\22\213")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\5\132\75\179\29\37\140\65\162\74\89", "\214\111\105\229\50")][1];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\36\253\76\43\235\12\238\90\62\188\120", "\78\153\72\156\53")] = makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\119\115\186", "\138\68\70\86")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\13\178", "\156\84\40\130\97\176\137")].SelectPlayer, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\0\232\20\50\231\195\5\250\25\114\165", "\149\143\108\137\109\87")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\114\247\13\85\46\114\255\56\90\59\110\254\26\19\106", "\54\90\23\155\104")], function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\167\200\17\240\37\167\192\36\255\48\187\193\6\182\97", "\147\81\194\164\116")] = v;
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\250\113\122", "\22\76\203\84\74\168\126")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\144\181", "\175\188\181\133\172\205\105")].TPPlayer, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\119\173\56\168\184\224", "\157\208\31\200\85\205")].Button, function()
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\253\176\55\123\103\49\91\109\244\189\43\125\97\113\15", "\63\61\152\220\82\24\19\84")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\230\35\210\40\70\171\190\183\239\46\206\46\64\235\234", "\218\231\131\79\183\75\50\206")] ~= LUAOBFUSACTOR_DECRYPT_STR_0("\189\6\252\160\173\228\186\228\240\26\224\169", "\157\149\104\147\128\221\136\219"))) then
				teleportToSpecificPlayer(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\241\246\196\131\224\255\197\176\248\251\216\133\230\191\145", "\161\224\148\154")]);
			else
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\17\244\7\239\214\87\38\254\85\191\201\83\51\254\68\235\223\82", "\54\95\155\39\159\186"), 2);
			end
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\70\242\174", "\158\171\119\215")], LUAOBFUSACTOR_DECRYPT_STR_0("\8\76\167\16\200\76\218\122\121\173\3\212\90\192\41", "\178\90\41\193\98\173\63"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\234\252\199\204\70\84", "\165\71\130\153\170\169\99\100")].Button, function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\46\35\20\71\119", "\96\98\71\80")] = getPlayerList();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\78\95\229\64\40\187\79\99\236\66\37\187\89\22\176", "\92\222\43\51\128\35")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\183\217\162\31\13", "\237\215\222\170\214\58\61")][1];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\46\4\215\223\175\142\55\33\50\64\158", "\69\78\66\101\174\186\221\202")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\3\170\14\128\18\163\15\179\10\167\18\134\20\227\91", "\107\227\102\198")];
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\117\204\54\68\142\74\40\5\210\50\91\153\93\40\77\197\51", "\91\37\160\87\61\235\56"), 1.5);
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\26\18\149", "\63\60\43\55\165\94\146")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\19\191", "\193\127\54\143\185\33\47\207")].SpawnTour, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\75\76\219\239\157\93", "\184\109\35\41\182\138")].Button, spawnTour);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\189\236\42", "\217\95\140\201\26\142\234")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\58\37", "\154\141\31\21\74")].GetBadges, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\32\71\250\17\0\190", "\37\142\72\34\151\116")].Button, getAllBadges);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\120\198\142", "\70\210\74\227\190")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\69\236\19\133\94", "\114\142\36\139\118\160\110")], LUAOBFUSACTOR_DECRYPT_STR_0("\147\210\161\52\51\178", "\86\192\183\211\66"));
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\9\52\26", "\228\227\59\17\42\149")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\236\39", "\163\204\201\23")].ServerHop, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\202\31\75\31\135\74", "\38\122\162\122")].Button, function()
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\162\235\250\163\38\181\243\204\182\59\177\238\252\182\108\247", "\211\73\199\135\159")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
			end);
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\2\174\47\153\34", "\18\151\99\201\74\188")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\5\184\47\34\131\79", "\127\61\100\223\74\81\166")].Autofarm;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\156\152\159", "\201\56\173\189\175")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\232\133\242\166\103", "\131\87\137\226\151")], LUAOBFUSACTOR_DECRYPT_STR_0("\156\248\0\134", "\126\209\153\105\232\84\109\57"));
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\138\241\16", "\180\185\187\212\32")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\17\15", "\200\185\52\63\97")].AutofarmToggle, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\117\125\247\155\10\46\84\69\101\103\249\159\7\57\93\63\16", "\25\26\32\41\184\221\75\124")] = s;
			if s then
				checkSpectatorsAndStart();
			else
				stopAutofarm();
			end
		end);
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\145\196\126", "\199\213\160\225\78")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\193\212", "\145\232\228\228\209\125\206")].Variant, {LUAOBFUSACTOR_DECRYPT_STR_0("\157\186\254\25\190\184\235", "\109\223\214\159"),LUAOBFUSACTOR_DECRYPT_STR_0("\216\4\213\35", "\169\139\101\179\70\22\117\199")}, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\49\102\228\110\17\18\41\109\253\105\2\9\37\124\255\13\96", "\80\64\100\50\171\40")], function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\181\235\227\0\254\111\159\116\182\254\254\15\254\115\134\14\208", "\210\43\224\191\172\70\191\61")] = v;
			saveSettings();
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\108\176\238\59\20\107\169\254\56\27\120\166\237\56\17\28\212", "\125\85\57\228\161")] then
				stopAutofarm();
				task.wait(0.1);
				startAutofarm();
			end
		end);
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\108\228\255", "\207\77\93\193")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\76\234", "\114\50\105\218\198\194\24")].FarmMode, {LUAOBFUSACTOR_DECRYPT_STR_0("\204\206\163\221\83", "\180\143\175\192\181\54\136"),LUAOBFUSACTOR_DECRYPT_STR_0("\143\94\21", "\227\205\63\114\186\55\121\183"),LUAOBFUSACTOR_DECRYPT_STR_0("\147\187\92\54", "\76\209\212\40\94\38\194")}, LUAOBFUSACTOR_DECRYPT_STR_0("\59\192\219\126", "\100\121\175\175\22\231\216\61"), function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\233\215\56\225\253\209\58\248\241\204\51\226\153\179", "\119\167\188\131")] = v;
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\83\252\94", "\189\40\97\217\110\45")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\199\199\94\192\122", "\229\74\166\160\59")], LUAOBFUSACTOR_DECRYPT_STR_0("\97\245\17\12\179\177\85\227", "\223\50\144\101\120\218"));
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\245\0\237", "\97\171\199\37\221\212\85\68")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\205\12", "\173\192\232\60\200\35\187")].Speed, {LUAOBFUSACTOR_DECRYPT_STR_0("\148\149", "\115\166\165\137\108\62\25"),LUAOBFUSACTOR_DECRYPT_STR_0("\84\215", "\201\108\231\27"),LUAOBFUSACTOR_DECRYPT_STR_0("\14\252\171", "\33\63\207\155\32\33"),LUAOBFUSACTOR_DECRYPT_STR_0("\216\191\245", "\76\233\135\197\42"),LUAOBFUSACTOR_DECRYPT_STR_0("\230\147\220", "\138\212\166\236\175"),LUAOBFUSACTOR_DECRYPT_STR_0("\253\208\143", "\100\201\224\191\68\92\226\125"),LUAOBFUSACTOR_DECRYPT_STR_0("\18\72\107", "\23\36\120\91\56\46\156"),LUAOBFUSACTOR_DECRYPT_STR_0("\183\136\34", "\41\143\184\18\124\120")}, LUAOBFUSACTOR_DECRYPT_STR_0("\255\92\26", "\47\206\111\42\161\50"), function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\96\252\246\153\250\105\224\237\239\154", "\202\170\44\165\169")] = tonumber(v) or 130;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\40\77\8\248\58\66\27\254\29\91\8\254\42\14\93", "\109\155\78\43")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\153\70\37\140\47\1\144\91\95\239", "\127\68\213\31\122\223")];
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\194\57\149\12\206\44\146\12\201\35\157\17\192\40\152\118\188", "\220\83\140\109")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\7\31\197\7\175\161\190\176\50\9\197\1\191\237\248", "\200\213\97\121\160\100\219\200")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\9\227\97\211\50\58\222\192\27\235\123\197\55\89\171", "\155\159\72\187\62\128\115\124")])) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\251\8\25\50\233\7\10\52\206\30\25\52\249\75\76", "\124\81\157\110")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\94\59\34\183\243\139\6\207\76\51\56\161\246\232\115", "\67\144\31\99\125\228\178\205")];
			end
		end);
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\99\152\103", "\108\179\81\189\87\164\186\70")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\247\163", "\80\182\210\147\156")].Camera, {LUAOBFUSACTOR_DECRYPT_STR_0("\40\220\31\74\46\0", "\75\110\174\112\48"),LUAOBFUSACTOR_DECRYPT_STR_0("\4\7\182\67\35\2", "\44\87\106\217")}, LUAOBFUSACTOR_DECRYPT_STR_0("\214\98\1\172\245\126", "\214\144\16\110"), function(v)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\132\132\93\136\241\116\106\244\129\140\61\234", "\39\187\197\201\24\218\176\43")] = ((v == LUAOBFUSACTOR_DECRYPT_STR_0("\3\172\51\220\66\243", "\102\69\222\92\166\39\157\225")) and 1) or 2;
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\16\6\226\240\17\122\83\26\23\227\247\18\100\91\1\119\157", "\40\30\69\82\173\182\80")] then
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\120\246\124\23\148\141\116\244\125\0\240\226", "\213\210\57\187\57\69")] == 1) then
					freezeCamera();
				else
					unfreezeCamera();
				end
			end
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\21\158\241", "\109\158\39\187\193\73\94\171")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\237\11", "\152\183\200\59\233\177")].AntiBan, true, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\140\130\22\196\129\95\48\188\135\152\30\217\143\91\58\198\242", "\126\227\194\214\95\155\195\30")] = s;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\115\170\237\249\97\165\254\255\70\188\237\255\113\233\184", "\136\154\21\204")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\92\181\130\68\64\138\94\120\53\220", "\27\60\16\236\221\23\16\207")];
			if (s and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\7\198\231\212\21\201\244\210\50\208\231\210\5\133\178", "\130\183\97\160")] > TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\100\40\108\115\232\165\158\122\35\99\101\236\167\254\21", "\227\219\37\112\51\32\169")])) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\247\217\173\123\216\33\19\57\194\207\173\125\200\109\85", "\101\92\145\191\200\24\172\72")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\227\212\212\155\124\31\136\253\223\219\141\120\29\232\146", "\89\205\162\140\139\200\61")];
			end
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\206\231\154", "\170\193\156\194")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\136\76\76\11\219", "\46\235\233\43\41")], LUAOBFUSACTOR_DECRYPT_STR_0("\120\174\219\83\104\174\206\26\78\182\156\91\123\186\200\28\92\174\206\30\19", "\115\58\207\188"));
		for _, rarity in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\224\57\100\23\156\254\36\127\7\128\243\78\29", "\67\197\161\107\45")]) do
			makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\132\246\94", "\230\51\214\211\110")], rarity, true, function(s)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\38\112\155\60\185\106\53\107\130\58\206\27", "\235\43\103\34\214\99")][rarity] = s;
			end);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\32\1\14", "\76\28\19\36\62\147")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\235\165\23\82\17", "\173\220\138\194\114\119\33\108")], LUAOBFUSACTOR_DECRYPT_STR_0("\101\203\189\8\199", "\180\54\191\220\124"));
		statsLabel = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\89\136\74", "\120\218\106\173\122\235\16\175")], LUAOBFUSACTOR_DECRYPT_STR_0("\134\9\24\248\254\72", "\139\196\104\127") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\18\162\3\223\6\171\52\213\1\224\112", "\64\176\115\197")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\57\183\95\81\94\73\248\74\31\10\106\173\3", "\126\25\151\35\113") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\208\200\183\82\6\171\31\250\209\213\188\84\80\216", "\112\143\191\161\217\38\117\232")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\114\192\27\68\163\180\22", "\145\38\168\126\41\198")].Button);
		runtimeLabel = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\116\190\47", "\61\122\71\155\31\143\67")], LUAOBFUSACTOR_DECRYPT_STR_0("\227\146\250\103\216\138\241\41\145\215\231", "\19\177\231\148"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\175\130\219\124\73\14", "\192\207\199\231\182\25\108\62")].Button);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\109\72\3", "\51\116\94\109")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\61\211", "\149\41\24\227")].ResetStats, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\162\73\164\166\240\79", "\127\191\202\44\201\195\213")].Danger, function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\255\95\111\160\159\241\47\195\236\29\28", "\91\166\158\56\44\207\234\159")] = 0;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\218\118\4\9\92\14\192\192\113\30\24\93\104\159", "\77\175\181\31\106\125\47")] = 0;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\213\245\243\167\45\210\236\207\181\45\210\245\200\168\33\197\164\172", "\193\76\160\129\156")] = os.time();
			saveStats();
			if statsLabel then
				statsLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\249\42\67\78\217\146\219\201\155\55\4\29\179\221\130\135\207\56\30\29\211", "\233\187\75\36\61\227\178\235");
			end
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\107\84\231\186\75\0\244\171\75\69\242", "\206\56\32\134"), 2);
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\78\84\93", "\232\88\125\113\109\210")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\185\21", "\86\61\156\37\81\170\195\24")].ExportStats, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\197\195\207\15\96\109", "\69\93\173\166\162\106")].Button, function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\140\220", "\186\188\169\236\79\139\213\213")] = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\242\61\30\206\222\144\121\29\157\152\144\12\22\212\138\196\47\67\157\193\212\124\5\157\182\197\50\13\212\137\213\102\89\152\128\195", "\228\176\92\121\189"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\82\197\205\75\194\93\214\235\86\146\3", "\36\183\51\162\142")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\38\181\141\238\235\174\182\60\178\151\255\234\200\233", "\237\217\73\220\227\154\152")], os.time() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\205\250\25\214\195\195\13\157\204\239\4\196\246\216\13\171\157\190", "\96\206\184\142\118\176\162\177")]);
			if setclipboard then
				setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\115\133", "\138\184\86\181\185\90\232\119")]);
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\85\38\148\235\136\211", "\183\22\73\228\130\237"), 2);
			end
			if writefile then
				pcall(function()
					writefile(LUAOBFUSACTOR_DECRYPT_STR_0("\252\162\10\122\61\166\19\16\207\177\27\108\119\171\52\55", "\67\187\208\111\31\89\223\76"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\192\140", "\230\38\229\188")]);
				end);
			end
		end);
		task.spawn(function()
			while true do
				if (statsLabel and statsLabel.Parent) then
					if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\12\177\101\239\18\245\44", "\28\138\96\208")].leaderstats and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\185\34\247\42\7\242\119", "\215\71\213\67\142\79\117")].leaderstats:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\193\224\3\50\165\226", "\209\145\143\106\92"))) then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\141\214\60\176\51\242\44\151\209\38\161\50\148\115", "\177\67\226\191\82\196\64")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\172\37\106\205\248\143\41", "\25\168\192\68\19\168\138\170")].leaderstats.Points.Value;
					end
					statsLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\97\184\66\225\102\246", "\214\35\217\37\146\92") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\249\134\93\199\36\94\236\132\108\141\97", "\81\48\152\225\30\168")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\152\28\102\156\7\220\215\85\116\200\84\182\152", "\140\184\60\26\188\39") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\10\73\80\72\3\93\116\16\78\74\89\2\59\43", "\30\27\101\32\62\60\112")];
				end
				if (runtimeLabel and runtimeLabel.Parent) then
					runtimeLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\232\188\88\83\37\215\172\12\7", "\76\186\201\54\39") .. (os.time() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\214\91\186\12\28\37\29\240\91\180\24\9\3\25\206\74\240\90", "\87\112\163\47\213\106\125")]) .. "s";
				end
				task.wait(1);
			end
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\216\56\89\104\137", "\60\77\185\95")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\165\249\33\9\225\174", "\68\122\196\158")].ESP;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\249\50\179", "\146\175\200\23\131\21\100")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\179\172\77\192\226", "\40\229\210\203")], LUAOBFUSACTOR_DECRYPT_STR_0("\212\144\21", "\213\145\195\69"));
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\228\142\122", "\135\217\213\171\74")], LUAOBFUSACTOR_DECRYPT_STR_0("\109\6\156\48\126\163\20\175\68\48\168", "\205\40\85\204\16\59\205\117"), false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\54\155\66\215\43\138\95\222\32\143\56\162", "\29\146\101\203")] = s;
			if s then
				rebuildESP();
			else
				clearAllESP();
			end
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\137\147\98", "\218\157\184\182\82")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\16\225", "\77\95\53\209\187\102")].ESPCaches, true, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\225\132\139\55\157\123\122\8\225\139\145\58\157\122\126\8\246\241\228", "\50\77\178\212\212\116\220\56")] = s;
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\125\138\120\40\224\196\108\150\98\41\139\181", "\174\133\46\218\39\109")] then
				rebuildESP();
			end
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\10\195\211", "\26\83\59\230\227\107\215")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\151\173", "\46\105\178\157")].ESPBags, true, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\114\200\99\233\160\54\114\199\121\229\160\51\109\221\120\142\209", "\225\113\33\152\60\171")] = s;
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\248\142\55\115\229\159\42\122\238\154\77\6", "\104\54\171\222")] then
				rebuildESP();
			end
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\236\103\168", "\39\126\221\66\152\101\110\206")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\181\94", "\43\142\144\110\25\181\100")].ESPPlayers, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\227\31\247\40\250\58\233\10\250\43\233\62\254\14\234\52\243\63\149\127", "\182\123\176\79\168\120")] = s;
			if s then
				updateAllPlayerESP();
			else
				for plr in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\194\11\60\17\246\235\57\21\81\180", "\116\132\174\106\69")]) do
					removePlayerESP(plr);
				end
			end
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\123\60\252", "\209\150\74\25\204")], LUAOBFUSACTOR_DECRYPT_STR_0("\142\225\117\38\216\190\173\199\140\232\114\45\216\191\229\162\143\212", "\231\220\132\19\84\189\205\197"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\90\134\173\161\75\15", "\126\58\50\227\192\196\110\63")].Button, updateAllPlayerESP);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\68\133\140", "\157\108\22\160\188")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\249\48\192\54\168", "\165\19\152\87")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\65\11", "\230\86\100\59\200")].RarityFilter .. LUAOBFUSACTOR_DECRYPT_STR_0("\97\80\46\225\174\209\104", "\162\65\120\108\128\201"));
		for _, rarity in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\24\222\61\38\217\54\171\11\200\49\32\165\89", "\105\228\89\140\116\114\128")]) do
			makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\56\74\228", "\102\28\106\111\212\87")], rarity, true, function(s)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\3\100\47\14\17\102\57\8\9\17\64", "\112\92\80\52")][rarity] = s;
				rebuildESP();
			end);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\10\230\212", "\142\217\56\195\228\43")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\212\167\72\20\12", "\49\60\181\192\45")], LUAOBFUSACTOR_DECRYPT_STR_0("\14\162\214\70\254\1", "\100\71\197\184\41\140"));
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\189\111\245", "\197\194\143\74")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\6\178", "\185\226\35\130\191\44\43\91")].IgnoreNearest, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\211\230\248\71\91\139", "\34\126\187\131\149")].Danger, function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\99\175", "\28\94\70\159\73")] = getClosestEntity();
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\58\104", "\204\127\31\88\165")] then
				addToIgnore(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\136\137", "\177\237\173\185\89")]);
			else
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\116\88\115\242\9\243\193\170\78\23\61\248\10\235\198\176", "\201\58\55\83\157\107\153\164"), 2);
			end
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\215\125\33\164\115", "\77\82\182\26\68\129\67")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\191\119\18\255\251\32", "\119\140\222\16")].Themes;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\34\28\25", "\219\114\19\57\41\215\103")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\84\170\205\177\102", "\148\86\53\205\168")], LUAOBFUSACTOR_DECRYPT_STR_0("\227\199\173\120\246", "\49\183\175\200\21\147"));
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\103\107\65", "\143\61\86\78\113\174")], LUAOBFUSACTOR_DECRYPT_STR_0("\4\81\9\191\70\146\41\81\12\252\5\182\51\79\26\185\67\161\111", "\213\70\61\104\220\45"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\27\55\221\214\106\67", "\179\79\115\82\176")].Accent);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\219\180\10", "\115\166\233\145\58")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\62\209\215\252\23", "\39\33\95\182\178\217")], LUAOBFUSACTOR_DECRYPT_STR_0("\16\37\196\190\208\33\59\33", "\64\92\68\170\217\165"));
		makeDrop(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\108\12\231", "\215\116\94\41")], LUAOBFUSACTOR_DECRYPT_STR_0("\199\76\2\16\62\228\184\238", "\223\139\45\108\119\75\133"), {LUAOBFUSACTOR_DECRYPT_STR_0("\82\184\38\223\62\100\190", "\87\23\214\65\179"),LUAOBFUSACTOR_DECRYPT_STR_0("\197\25\246\166\254\13\235", "\213\151\108\133")}, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\192\149\153\91\72", "\120\125\129\219\222\126")], function(v)
			setLanguage(v);
			for name, btn in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\233\0\175\45\243\238\231\12\158\125\183", "\135\154\136\98\237\88")]) do
				btn.Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\201\215", "\197\73\236\231\163\213\122\60")][name] or name;
			end
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\116\18\124\130\176\220\68\93\73\50", "\35\56\115\18\229\197\189") .. v, 2);
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\175\249\40\72\74", "\122\220\206\158\77\109")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\179\214\188\202\199\12", "\60\219\210\177\217\185\226")].Misc;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\234\237\190", "\142\95\219\200")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\255\116\41\240\93", "\158\183\158\19\76\213\109\178")], LUAOBFUSACTOR_DECRYPT_STR_0("\207\223\165\139\165", "\124\155\176\202\231\214"));
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\182\236\72", "\120\66\135\201")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\54\134", "\186\181\19\182\81")].PerfMode, false, function(s)
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\226\132\41", "\47\48\211\161\25\235\212\222")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\68\85", "\78\202\97\101\237\217\175")].AntiAFK, false, setAntiAfk);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\127\216\126\192\118", "\70\17\30\191\27\229")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\141\239\73\23\201\184", "\44\100\236\136")].Settings;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\122\204\43", "\18\154\75\233\27\78\145\149")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\133\126\81\154\172", "\146\178\228\25\52\191\156\206")], LUAOBFUSACTOR_DECRYPT_STR_0("\52\127\59\172\1\123\57", "\201\115\26\85"));
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\43\6\8", "\180\67\26\35\56\189\132")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\56\159", "\237\92\29\175\161\143\102")].QueueRejoin, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\111\222\237\230\25\117\197\247\234\2\111\203\231\225\22\104\216\231\235\114\26", "\175\87\42\148\162")], function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\144\124\56\110\248\138\103\34\98\227\144\105\50\105\247\151\122\50\99\147\229", "\39\182\213\54\119")] = s;
			saveSettings();
			if s then
				setupRejoinQueue();
			end
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\21\227\154", "\65\50\36\198\170")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\53\10", "\132\182\16\58\105\197\84\220")].Rejoin, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\27\72\113\29\224\167", "\151\233\115\45\28\120\197")].Button, function()
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\235\98\99\151\224\119\125\139\235\125\105\129\235\102\109\156\226\109\104\251\158", "\44\222\174\40")] then
				setupRejoinQueue();
			end
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\89\126\51\56\68\32\72\65\51\58\93\59\95\119\115\120", "\43\82\60\18\86\72")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
			end);
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\116\49\241", "\203\71\69\20\193\26")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\249\99", "\90\132\220\83\80\179\136")].Reload, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\112\15\172\15\159\65", "\186\113\24\106\193\106")].Button, function()
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\133\215\159\176\155\147\214", "\230\213\233\182")]:LoadCharacter();
			end);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\222\67\171", "\155\172\236\102")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\180\7\209\75\43", "\27\123\213\96\180\110")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\94\163", "\18\200\123\147\62")].Webhook);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\179\227\160\136", "\110\98\220\155\133\184\231")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\67\166\55\41\91\117\147", "\117\23\195\79\93\25\26\235"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\234\186\190\182", "\155\134\133\194")].Size = UDim2.new(1, 0, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\66\110\54\120", "\72\160\45\22\19")].BackgroundColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\180\23\213\46\174\88", "\104\230\220\114\184\75\139")].Button;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\89\59\73\31", "\47\237\54\67\108")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\103\98\47\42\219\56\125\117\53\41\177\67", "\148\115\34\32\103\101")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\161\101\131\36", "\20\197\206\29\166")].PlaceholderText = LUAOBFUSACTOR_DECRYPT_STR_0("\121\42\14\11\208\107\247\92\75\35\18\16\222\107\213\107\101\101\83\81", "\57\41\75\125\127\181\75\128");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\234\89\94\148", "\41\96\133\33\123\164")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\58\77\82\248\231\189", "\19\116\82\40\63\157\194\141")].Text;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\3\28\185\171", "\156\155\108\100")].PlaceholderColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\73\23\115\0\4\66", "\30\101\33\114")].TextDim;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\239\221\89\122", "\74\209\128\165\124")].Font = Enum.Font.Code;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\53\200\7\24", "\34\40\90\176")].TextSize = 13;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\247\78\231\89", "\85\215\152\54\194\105")].ClearTextOnFocus = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\230\45\142\64", "\141\151\137\85\171\112\208")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\105\63\253", "\205\44\91\26")];
		Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\201\96\41\135\242\210\166\1", "\115\156\41\106\232\128\188\195"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\24\179\164\102", "\44\133\119\203\129\86\177\194")]).CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\245\249\236\108", "\92\162\154\129\201")].FocusLost:Connect(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\90\129\42\30\171\240\189\96\77\143\71\97", "\226\53\31\195\98\81\228\187")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\201\198\24\133", "\181\38\166\190\61")].Text;
			saveSettings();
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\205\134\244\57\245\140\253\113\233\130\224\52\254", "\81\154\227\150"), 2);
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\255\248\185", "\20\203\205\221\137\102")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\64\110", "\221\237\101\94")].EveryBag, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\51\128\56\168\63\239\158\20\32\135\34\190\47\230\128\22\83\242", "\193\81\118\194\112\231\112\164")] = s;
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\20\79\136", "\184\55\38\106")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\52\42", "\225\148\17\26\24\165\217")].Every10, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\16\114\1\142\105\30\111\12\151\99\7\105\22\240\22\112\0", "\193\38\85\48\73")] = s;
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\142\253\86", "\70\23\188\216\102\52\211\124")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\133\178", "\103\207\160\130\223\84\74")].Every100, false, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\156\48\60\148\173\252\221\156\36\49\137\187\232\179\233\66\81\235", "\183\130\217\114\116\219\226")] = s;
		end);
		makeToggle(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\64\88\111", "\167\21\114\125\95")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\81\93", "\80\174\116\109\46\234")].OnStop, true, function(s)
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\253\54\132\225\10\243\43\131\224\26\235\32\131\254\96\136", "\174\69\184\116\204")] = s;
		end);
		makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\1\194\41", "\57\101\51\231\25\135\112")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\162\143", "\156\93\135\191\41\199")].TestWebhook, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\24\137\11\189\137\31", "\172\47\112\236\102\216")].Button, function()
			sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\73\228\69\57\70\141\120\242\69\44\1\133\61\231\68\34\11\192\90\243\83\40\2\153\61\201\67\41\28\133\113\237", "\224\29\129\54\77\102"));
			showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\101\137\229\56\17\159\243\34\69", "\76\49\236\150"), 2);
		end);
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\229\124\13\157\213", "\184\229\132\27\104")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\192\7\191\239\48\2", "\220\222\161\96\218\156\21\50")].Bags;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\54\18\19\139\168", "\17\38\87\117\118\174\152")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\224\108\42", "\37\118\209\73\26\131")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\88\163\123\25\185", "\60\137\57\196\30")], LUAOBFUSACTOR_DECRYPT_STR_0("\96\121\107\29\199\119\83\125\118\29\149", "\56\35\24\24\120\231"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\163\85\69\238\121\81\234\21\227", "\143\48\211\48\43\163\22\53")] = LUAOBFUSACTOR_DECRYPT_STR_0("\105\243\67\246", "\134\47\146\48\130\111\147\133");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\34\81\15\27\81\182\79\98", "\209\106\82\52\97\114\63")] = false;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\124\43\75\133\103\33\11\247", "\46\199\19\79")] = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\154\244\210", "\236\180\171\209\226\144")], LUAOBFUSACTOR_DECRYPT_STR_0("\42\13\92\13\94\118\74\0\71\25\37\114\106\90", "\46\101\125\57\99\19\25"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\222\24\237\185\5\134", "\220\32\182\125\128")].Button, function()
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\247\15\216\214\249\246\78\141", "\148\141\152\107\189")].MouseButton1Click:Connect(function()
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\244\88\92\202\177\115\225\24\2", "\222\23\132\61\50\135")] == LUAOBFUSACTOR_DECRYPT_STR_0("\159\30\241\70", "\49\204\114\158")) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\251\25\181\101\125\165\238\89\235", "\18\193\139\124\219\40")] = LUAOBFUSACTOR_DECRYPT_STR_0("\47\141\70\106", "\93\105\236\53\30\32\131");
				elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\70\71\24\121\95\68\2\19\18", "\32\103\54\34\118\52\48")] == LUAOBFUSACTOR_DECRYPT_STR_0("\136\49\100\190", "\38\206\80\23\202\215\213")) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\60\31\195\52\0\40\31\136\73", "\121\111\76\122\173")] = LUAOBFUSACTOR_DECRYPT_STR_0("\233\238\233\4\118\142\92", "\40\160\128\154\112\23\224");
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\236\221\119\245\201\4\16\9\172", "\117\44\156\184\25\184\166\96")] = LUAOBFUSACTOR_DECRYPT_STR_0("\131\125\27\33", "\86\208\17\116");
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\141\23\228\219\222\245\4\210", "\155\33\226\115\129\153\170")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\87\111\42\33\206\255\166\125\37\111", "\194\24\31\79\79\131\144") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\189\33\7\121\7\69\215\12\253", "\178\41\205\68\105\52\104\33")];
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\92\38\151\237\216\26\8\154", "\45\170\40\71\227\152\171\89")] = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\148\207\179", "\21\111\165\234\131\86")], LUAOBFUSACTOR_DECRYPT_STR_0("\30\247\196\163", "\198\87\147\168"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\214\62\252\210\20\72", "\120\50\190\91\145\183\49")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\151\244\163", "\66\119\166\209\147")], LUAOBFUSACTOR_DECRYPT_STR_0("\222\21\168\0\253\208\9\161\78\245\226\17\172\28\169\190\22\185\1\173\184", "\221\145\101\205\110"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\22\84\89\134\230\78", "\227\195\126\49\52")].Accent, function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\111\245\164\171\8\244\163\47", "\147\134\31\144\202\194\102")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\40\191\205\225\54\189\134\184", "\163\136\88\218")];
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\93\41\248\186\250\106\109\188", "\207\137\41\72\140")].Text = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\64\2\252\25\22\165\66\0", "\194\103\48\103\146\112\120")] and LUAOBFUSACTOR_DECRYPT_STR_0("\141\211\196\56\171\205\198\120\236\141", "\86\194\163\161")) or LUAOBFUSACTOR_DECRYPT_STR_0("\154\64\246\64\208\255\82", "\54\201\52\153\48\160\154");
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\221\0\38\16\21\234\95\76", "\122\124\173\101\72\121\123\141")] then
					return;
				end
				task.spawn(function()
					local opened, fail = 0, 0;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\166\24\5\45\87\30", "\201\139\223\104\96\94\114\46")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\33\242\77\63\127\65", "\47\98\157\32\82\16"),LUAOBFUSACTOR_DECRYPT_STR_0("\230\232\200\177\138\248\143\199", "\169\179\134\171\222\231\149\224"),LUAOBFUSACTOR_DECRYPT_STR_0("\139\17\96\63", "\88\217\112\18\90\229\235\149"),LUAOBFUSACTOR_DECRYPT_STR_0("\109\192\45\167", "\230\40\176\68\196\122"),LUAOBFUSACTOR_DECRYPT_STR_0("\232\229\32\38\7\93\27\214\249", "\122\164\128\71\67\105\57")};
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\205\146\181\159\180\6\169\132", "\126\140\180\226\208\214\208")] = 1;
					while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\104\22\124\69\94\95\200\179", "\237\131\24\115\18\44\48\56")] do
						local ok, res = false, nil;
						if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\42\179\90\90\254\62\179\17\39", "\23\145\90\214\52")] == LUAOBFUSACTOR_DECRYPT_STR_0("\82\135\0\38\68\179\111", "\221\27\233\115\82\37")) then
							for _, ty in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\201\193\228\200\100\174", "\158\220\176\177\129\187\65")]) do
								if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\85\87\221\253\75\85\150\164", "\179\148\37\50")] then
									break;
								end
								ok, res = pcall(function()
									return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\114\221\50\234\59\207\207\114\201\13\247\55\220\218\112\200\123\179", "\174\187\23\173\94\131\88")].OpenCase:InvokeServer(ty);
								end);
								if (ok and res) then
									opened += 1
									fail = 0;
								end
							end
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\184\164\46\82\183\148\30\246", "\59\198\204\197\90\39\196\215")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\194\189\49\188\76\213\111", "\114\141\205\84\210\41\177\79") .. opened;
							task.wait();
						else
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\36\119\218", "\99\228\93\82\234\68\179")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\106\60\64\206\145\1", "\180\49\19\76\37\189")][TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\95\161\188\126\199\190\86\22", "\198\115\38\209\217\55\163")]];
							ok, res = pcall(function()
								return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\84\246\63\2\77\172\69\227\55\56\90\162\67\231\52\14\11\253", "\46\205\49\134\83\107")].OpenCase:InvokeServer(TABLE_TableIndirection["ty%0"]);
							end);
							if (ok and res) then
								opened += 1
								fail = 0;
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\26\210\68\20\240\148\135\99", "\162\83\110\179\48\97\131\215")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\109\166\5\205\182\243\125", "\152\34\214\96\163\211\151\93") .. opened;
							else
								fail += 1
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\22\99\171\42\20\91\89\95", "\35\124\111\19\206\99\112")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\11\184\201\57\114\241\27\66", "\137\62\114\200\172\112\22")] % #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\181\47\249\27\118\185", "\125\174\204\95\156\104\83\137")]) + 1;
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\58\51\193\61\180\13\119\133", "\72\199\78\82\181")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\132\212\86\177\102", "\70\194\181\63\221") .. fail;
								if (fail > 40) then
									break;
								end
							end
							if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\106\54\31\136\241\23\127\118\65", "\158\115\26\83\113\197")] == LUAOBFUSACTOR_DECRYPT_STR_0("\66\181\207\167", "\117\17\217\160\208")) then
								task.wait(0.35);
							else
								task.wait(0.01);
							end
						end
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\200\142\95\193\91\82\157\219", "\53\53\184\235\49\168")] = false;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\225\232\160\194\230\202\241\135", "\212\183\149\137")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\134\140\82\15\226\172\6", "\106\194\227\60") .. opened .. LUAOBFUSACTOR_DECRYPT_STR_0("\96\96\69", "\228\64\38\127") .. fail;
				end);
			end);
		end
	end
	do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\125\92\245\201\20", "\74\193\28\59\144\236\36\71")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\170\232\70\68\73\251", "\55\108\203\143\35")].Missions;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\228\212\231\241\244", "\196\148\133\179\130\212")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\83\93\8\109\219", "\126\49\22\19\94\72\233\227")] = (getgenv and getgenv()) or _G;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\30\150\187\146\240\183\4\145\171\145\230\168\18\142\161\147\156\212", "\185\228\87\216\228\223")] = 15;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\137\44\11\45\225\201\120\115\142\41\1\54\246\168\23", "\39\58\192\127\72\98\179\141")] = LUAOBFUSACTOR_DECRYPT_STR_0("\198\75\20\216\163\148\16\79\204\185\221\92\15\218\180\128\88\7\135\183\220\90\5\204\169", "\208\174\63\96\168");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\93\119\233", "\234\230\109\82\217")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\168\43\232\187\249", "\141\158\201\76")], LUAOBFUSACTOR_DECRYPT_STR_0("\233\186\59\76\199\213\183\60\81\218\206\167", "\181\160\212\72\56"));
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\93\173\128", "\211\158\109\136\176\100")], LUAOBFUSACTOR_DECRYPT_STR_0("\90\89\159\50\237\91\75\22\220\31\231\89\5\3\133\92\228\73\29\18\211\92\185\25\75\1\214\29\168\109\30\3\208\26\233\94\6", "\44\107\119\191\124\136"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\0\130\50\30\135\162", "\146\181\104\231\95\123\162")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\186\192\142", "\190\136\138\229")], LUAOBFUSACTOR_DECRYPT_STR_0("\169\12\134\181\187\245\2\245\142\160\252\87\202\134\188\187\112\195\149\161\247\78", "\206\155\34\166\231"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\216\47\171\47\180\10", "\58\89\176\74\198\74\145")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\156\158\1", "\54\125\172\187\49\81\127\195")], LUAOBFUSACTOR_DECRYPT_STR_0("\233\249\139\130\168\164\188\33\180", "\72\218\215\171\208\205\206\211"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\218\27\52\219\224\242", "\184\49\178\126\89\190\197\194")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\74\170\157", "\113\208\122\143\173")], LUAOBFUSACTOR_DECRYPT_STR_0("\79\168\2\233\1\202\198\14\234\67\200\72\246\196\9\233\78\214\72\197\198\26\239\76", "\161\123\134\34\186\104\164"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\160\220\114\143\114\43", "\27\155\200\185\31\234\87")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\249\90\64", "\207\101\201\127\112\37")], LUAOBFUSACTOR_DECRYPT_STR_0("\233\202\125\178\106\129\70\168\196\9\142\105\133\70\252\165\40\149\113\134\85\174\137\125\142\108\192\112\181\151\62\142\108\132", "\52\220\228\93\225\30\224"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\67\124\8\50\131\13", "\166\61\43\25\101\87")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\20\73\150", "\40\146\36\108\166\208\126")], LUAOBFUSACTOR_DECRYPT_STR_0("\243\59\198\250\169\113\198\212\166\118\137\192\171\97\220\149\150\97\135\199\177\53\178\218\178\112\148\149\132\96\146\218\163\116\148\216", "\181\197\21\230"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\85\62\73\209\24\107", "\36\180\61\91")].Button, function()
			end);
			local function getLevel()
				local ok, lvl = pcall(function()
					return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\86\180\119\217\161\3\71\161\127\227\182\13\65\165\124\213\231\82", "\194\98\51\196\27\176")].PlayerData[TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\93\237\152\133\146\13\23", "\40\39\49\140\225\224\224")].Name].Generic.Level.Value;
				end);
				if (ok and (type(lvl) == LUAOBFUSACTOR_DECRYPT_STR_0("\34\51\7\65\41\52", "\35\76\70\106"))) then
					return lvl;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\208\242\92", "\108\195\163\215")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\74\129\23\227\169\3\208", "\134\219\38\224\110")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\210\30\241\134\253\32\244\153\223\15\227", "\237\190\123\144\226\152\82\135"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\156\109", "\182\141\185\93\117")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\176\254\246", "\210\35\195\219\198\126\193\88")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\57\179\221", "\237\173\74\150")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\193\83\209\90\224", "\195\141\54\167\63\140"));
				return (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\24\73", "\117\96\61\121")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\111\252", "\172\24\74\204\26\86\113\106")].Value) or 0;
			end
			local function getRuntime()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\96\179\66", "\200\80\20\150\114\60\117")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\59\218\120\248\38\63\222\113\245\22\42\197\102\240\34\59\143\36", "\145\69\94\170\20")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\55\77\79\174\251\75\53\84\64\163\247\84\2\101\79\163\255", "\57\103\33\46\215\158"));
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\5\233\240", "\177\150\113\204\192\184")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\18\227\96", "\80\226\102\198")]:FindFirstChild(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\33\80\182\141\63\20\255", "\207\232\77\49")].Name);
			end
			local function getMissionsFolder()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\216\13\138", "\186\96\172\40")] = getRuntime();
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\58\130\73", "\229\43\78\167\121\33\117")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\205\102\23", "\56\136\185\67\39\167\145\184")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\42\117\239\191\236\18\31\20", "\113\103\28\156\204\133\125"));
			end
			local function patchTimers()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\49\52\161", "\145\217\69\17")] = getRuntime();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\44\146\187\182", "\134\224\84\226\158")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\58\207\248", "\142\40\78\234\200")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\4\190\225", "\62\77\112\155\209\148\142\86")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\25\117\67\175\61\115\94\136\61\113\85\174\17\100\64\181\38\121", "\220\84\28\48"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\252\166\182\142", "\147\190\132\214")] then
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\189\97\101\213", "\64\229\197\17")].Value = tick() - 10;
					end);
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\124\111\9", "\220\50\24\74\57\135\51\106")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\45\109\233\246\253\41\105\224\251\205\60\114\247\254\249\45\56\181", "\159\158\72\29\133")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\244\196\39\238\254\58\17\197\220\39", "\85\164\168\70\151\155\72"));
				pd = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\217\183\86", "\133\177\189\146\102\196\151\20")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\201\138\187", "\75\150\173\175\139")]:FindFirstChild(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\213\182\176\73\227\156\231", "\44\145\185\215\201")].Name);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\149\221", "\121\90\176\237\55\206")] = pd and pd:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\201\2\85\193\45\36\237", "\77\142\103\59\164\95"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\150\159\163", "\134\105\226\186\147\151")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\81\246", "\70\234\116\198\237\183\95")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\148\92", "\163\204\177\108\82\28")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\254\87\144\110\116\252\80\183\116\112\246\76", "\29\147\62\227\29"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\30\61\111", "\198\209\106\24\95\26\188")] then
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\39\100\225", "\156\237\83\65\209\66\94")].Value = os.time() - 30;
					end);
				end
			end
			local function rerollAll()
				patchTimers();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\85\31\128", "\54\56\39\58\176")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\34\108\25\70\63\62\253\29\35\79\1\64\46\62\238\29\98\44", "\137\120\71\28\117\47\92\95")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\196\186\30\91\115\241\231\129\8\90\117\242\229", "\158\137\211\109\40\26"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\254\164\115\169\31\184\157", "\157\173\145\200\23\204\109")] = getMissionsFolder();
				if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\106\154\95", "\111\199\24\191")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\191\121\191\50\103\233\224", "\21\204\208\21\219\87")]) then
					return 0;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\183\172", "\190\83\146\156\100\76\113\163")] = 0;
				for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\42\45\2\236\21\206\242", "\235\194\69\65\102\137\103")]:GetChildren()) do
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\216\63\44", "\213\210\170\26\28\155\155")]:FireServer(m.Name);
					end);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\160\143", "\139\224\133\191")] += 1
					task.wait(0.04);
				end
				task.wait(0.12);
				patchTimers();
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\155\23", "\206\128\190\39\237\89\42")];
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\36\239\198\35\71\229\67", "\115\184\107\184\131\113\20\192")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\44\17\59\89\112\114\21", "\21\122\116\73\45\25")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\216\194\150", "\214\177\166\229\133\199\89")]={LUAOBFUSACTOR_DECRYPT_STR_0("\139\72\60\17\91\6\83\231\218", "\210\236\45\82\116\41\103\63")},[LUAOBFUSACTOR_DECRYPT_STR_0("\25\76\54\35", "\162\114\41\79\80")]={LUAOBFUSACTOR_DECRYPT_STR_0("\224\49\153\175\114\94\249", "\57\150\84\235\219\27"),LUAOBFUSACTOR_DECRYPT_STR_0("\209\16\65\94\4\212\86\92\89\77\216\19\90\88\5\196\5", "\109\176\118\51\63")},[LUAOBFUSACTOR_DECRYPT_STR_0("\67\12\238\6", "\161\51\109\154\110")]={LUAOBFUSACTOR_DECRYPT_STR_0("\201\50\192", "\211\132\83\176\92\116"),LUAOBFUSACTOR_DECRYPT_STR_0("\117\225\192\177\63\255\36\80\231", "\74\55\148\169\221\91\150"),LUAOBFUSACTOR_DECRYPT_STR_0("\19\41\186\31\28\53\160\16\58\41\167\27\45", "\124\94\64\201"),LUAOBFUSACTOR_DECRYPT_STR_0("\209\234\24\190\57\169\232", "\206\135\143\106\202\80"),LUAOBFUSACTOR_DECRYPT_STR_0("\218\76\55\177\192\217\5\10\192\64\34\173\221", "\42\140\41\69\197\169\190\106")}},[LUAOBFUSACTOR_DECRYPT_STR_0("\130\131\245\167\177\158", "\211\212\230\135")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\91\162\100", "\190\50\198\23\134")]={LUAOBFUSACTOR_DECRYPT_STR_0("\68\81\173\89\204\112\243\162\20", "\151\35\52\195\60\190\17\159")},[LUAOBFUSACTOR_DECRYPT_STR_0("\189\177\98\250", "\226\214\212\27\137")]={LUAOBFUSACTOR_DECRYPT_STR_0("\104\58\163\48\238\212", "\172\30\95\209\68\139"),LUAOBFUSACTOR_DECRYPT_STR_0("\224\29\58\65\243\0\104\67\243\22\60\64\228\29", "\53\150\120\72")},[LUAOBFUSACTOR_DECRYPT_STR_0("\111\5\194\11", "\45\31\100\182\99")]={LUAOBFUSACTOR_DECRYPT_STR_0("\28\118\24", "\120\81\23\104\84"),LUAOBFUSACTOR_DECRYPT_STR_0("\234\90\116\123\204\70\115\112\219", "\23\168\47\29"),LUAOBFUSACTOR_DECRYPT_STR_0("\93\178\152\137\82\174\130\134\116\178\133\141\99", "\234\16\219\235"),LUAOBFUSACTOR_DECRYPT_STR_0("\114\19\70\38\46\18", "\34\36\118\52\82\75\106"),LUAOBFUSACTOR_DECRYPT_STR_0("\12\132\9\166\234\157\28\199\51\134\19\166", "\139\90\225\123\210\143\229\60")}},[LUAOBFUSACTOR_DECRYPT_STR_0("\211\58\31\32\204", "\144\144\72\122\83\184")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\227\8\93", "\201\138\108\46\38")]={LUAOBFUSACTOR_DECRYPT_STR_0("\60\48\49\143\34\46\27\110\109", "\119\91\85\95\234\80\79")},[LUAOBFUSACTOR_DECRYPT_STR_0("\86\177\83\185", "\17\61\212\42\202")]={LUAOBFUSACTOR_DECRYPT_STR_0("\234\177\232\85\164", "\36\137\195\141\38\208\119\109"),LUAOBFUSACTOR_DECRYPT_STR_0("\50\206\63\92\199\113\223\59\93\193\56\217\40", "\179\81\188\90\47")},[LUAOBFUSACTOR_DECRYPT_STR_0("\189\45\176\183", "\182\205\76\196\223")]={LUAOBFUSACTOR_DECRYPT_STR_0("\123\227\226", "\150\54\130\146\165\218\84\143"),LUAOBFUSACTOR_DECRYPT_STR_0("\29\2\215\46\5\54\25\217\49", "\97\95\119\190\66"),LUAOBFUSACTOR_DECRYPT_STR_0("\129\113\55\81\246\185\113\40\86\221\162\127\55", "\180\204\24\68\50"),LUAOBFUSACTOR_DECRYPT_STR_0("\211\108\91\99\228", "\16\144\30\62"),LUAOBFUSACTOR_DECRYPT_STR_0("\151\58\56\228\39", "\48\212\72\93\151\83\217\38"),LUAOBFUSACTOR_DECRYPT_STR_0("\18\154\11\144\71\67\29\129\9\139\71", "\99\81\232\110\227\51")}}};
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\175\58\250\255\40", "\229\97\223\85\137\218\24\18")] = {};
			local function resolve(path)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\201\181\97\160", "\68\144\188\199")] = workspace;
				for _, n in ipairs(path) do
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\17\221\159\93", "\148\115\100\175\186\109\86")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\254\218\146\44", "\183\28\139\168")]:FindFirstChild(n);
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\164\229\107\221", "\218\114\209\151\78\237\59")] then
						return nil;
					end
				end
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\163\24\27\28", "\62\44\214\106")];
			end
			local function getTowerPos(name, data)
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\45\12\195\238\118", "\203\70\93\99\176")][name] then
					return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\204\164\62\241\140", "\77\212\188\203")][name];
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\218\226\183\227\136\9", "\173\57\179\133\223\151")] = resolve(data.path);
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\92\76\229\88\191\98", "\183\206\53\43\141\44\154\82")] then
					return nil;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\10\36\89\100", "\155\140\101\87\124\84\135")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\13\62\7\30\5\150", "\32\166\100\89\111\106")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\215\47\171\64\26\194\85\90", "\46\149\78\216\37\74\163\39")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\224\122\199\211\101\119", "\71\46\137\29\175\167\64")].Position;
				if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\240\36\66\180", "\110\93\159\87\103\132\39")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\28\46\42\212\22\69", "\160\51\117\73\66")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\57\58\143\128\160", "\87\116\85\235\229\204")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\143\19\213\107\120\13", "\61\131\230\116\189\31\93")].PrimaryPart) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\9\6\191\232", "\121\206\102\117\154\216\34")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\72\81\232\6\2\182", "\134\181\33\54\128\114\39")].PrimaryPart.Position;
				end
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\195\182\0\252", "\204\98\172\197\37")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\68\40", "\177\175\97\24\65\199\167")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\209\249\94\38\59\241", "\151\116\184\158\54\82\30\193")]:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\7\200\207\35\132\199\236\49", "\158\69\169\188\70\212\166"), true);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\215\229\79\136", "\184\107\184\150\106")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\148\28", "\134\162\177\44\165")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\109\17", "\146\167\72\33")].Position;
				end
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\3\188\105\242", "\45\154\108\207\76\194\46")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\255\5\201\56\191", "\186\29\143\106")][name] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\198\181\82\92", "\123\201\169\198\119\108\220\74")];
				end
				return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\134\1\19\19", "\35\66\233\114\54")];
			end
			local function matchTower(m)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\192\218", "\173\19\229\234\151")] = string.lower(m.Name);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\111\109", "\40\73\74\93")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\222\226\237\35\136\246\227\197\255\62\129", "\151\154\139\158\83\228"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\163\28\213\221\186\250", "\184\159\202\104\185")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\76\239", "\202\51\105\223\135")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\190\132", "\212\200\155\180")].Value))) or "";
				for tn, data in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\114\221\150\136\228\117\183\241", "\182\38\146\193\205")]) do
					for _, id in ipairs(data.ids) do
						if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\92\217", "\143\111\121\233\194")] == id) then
							return tn, data, m;
						end
					end
					for _, k in ipairs(data.keys) do
						if (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\155\123", "\173\140\190\75\177")], k, 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\61\60\217\85\86\181", "\133\139\84\72\181\48\115")], k, 1, true)) then
							return tn, data, m;
						end
					end
				end
			end
			local function findTower()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\79\27\197\140\161\18\128", "\55\176\32\119\161\233\211")] = getMissionsFolder();
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\14\24\189\176\78\68\68", "\213\60\97\116\217")] then
					return;
				end
				for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\63\47\115\47\149\117\115", "\74\231\80\67\23")]:GetChildren()) do
					local a, b, c = matchTower(m);
					if a then
						return a, b, c;
					end
				end
			end
			local function tpPos(pos)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\146\236", "\170\99\183\220\50\48\38\57")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\30\60\7\58\0\120\78", "\126\95\114\93")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\51\115\67\168\45\55\10", "\58\205\95\18")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\36\8\201\240\169\3\20\192\195\168\3\9\244\240\181\24", "\199\108\125\164\145"));
				if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\109\97", "\77\188\72\81\91\229\129\40")] or not pos) then
					return;
				end
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\194\1", "\19\194\231\49\84\128")].CFrame = CFrame.new(pos + Vector3.new(0, 6, 0));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\66\251", "\170\56\103\203\221\38\185\34")].AssemblyLinearVelocity = Vector3.zero;
				end);
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\232\27\67", "\152\78\217\62\115\60")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\178\5\169\243\154", "\53\21\211\98\204\214\170")], LUAOBFUSACTOR_DECRYPT_STR_0("\11\223\94\9\191\167\121\149\12\50\188\188\60\200", "\203\89\186\44\102\211"));
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\211\138\100", "\171\197\226\175\84")], LUAOBFUSACTOR_DECRYPT_STR_0("\180\95\125\82\198\139\87\97\21\225\130\68\124\89\223\199\30\99\84\199\132\94\56\83\218\149\83\58", "\179\231\54\19\53"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\253\178\67\161\0\241", "\176\166\149\215\46\196\37\193")].Accent, function()
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\124\115\176\1\66\122\226", "\110\46\22\194") .. tostring(rerollAll()), 2);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\162\127\172", "\206\237\147\90\156\170")], LUAOBFUSACTOR_DECRYPT_STR_0("\211\75\58\200\246\47\249\87\41\222\164\15", "\107\144\36\74\177\214"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\196\59\203\119\74\43", "\111\27\172\94\166\18")].Button, function()
				pcall(function()
					setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\38\200\22\31\112\100\145\12\33\205\28\4\103\5\254", "\206\69\111\155\85\80\34\32")]);
				end);
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\152\178\181\15\200\174\191\230\15\200\172\178\163\8", "\167\220\219\198\108"), 2);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\85\92\110", "\100\202\100\121\94\85\38")], LUAOBFUSACTOR_DECRYPT_STR_0("\56\185\201\14\72\243", "\157\106\220\163\97\33"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\168\231\125\210\17\141", "\189\93\192\130\16\183\52")].Danger, function()
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\23\54\49\27\52\37\29\33\63\38\29\50\52\12\87\106", "\87\105\114\90\84\107\91")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
				end);
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\221\241\245\216", "\31\19\169\165\208\232\61\161")] = makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\241\100\86", "\183\178\192\65\102\155\174")], LUAOBFUSACTOR_DECRYPT_STR_0("\131\225\92\54\30\211\96\227\179\226\78", "\138\215\142\43\83\108\233\64"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\177\140\113\122\252\217", "\28\31\217\233")].Button, function()
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\165\232\144", "\38\81\148\205\160\165\106")], LUAOBFUSACTOR_DECRYPT_STR_0("\124\122\142\20\65\65\46\173\88\75\189\102\84\20\14\173\73\79\189\43\53\73\75\247\4\7", "\194\47\46\207\70\21\97\122"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\51\210\236\222\140\137", "\187\177\91\183\129\187\169\185")].Success, function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\196\254\29", "\173\117\178\219\45\181")] = getLevel();
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\8\190\183", "\229\155\126\155\135\233\25")] < TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\39\164\45\123\227\119\61\163\61\120\245\104\43\188\55\122\143\20", "\170\36\110\234\114\54")]) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\95\6\29\173", "\204\160\43\82\56\157\24\147")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\109\126\128\135\11\180\85\119\197", "\216\35\27\229\227\43") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\113\0\55\156\132\52\65\46\119\0\55\157\136\49\87\43\29\126", "\18\103\56\78\104\209\205\103")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\150\52\2\51\219\119", "\168\182\28\108\92\172\87") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\87\229\249", "\183\151\33\192\201\141")] .. ")";
					return;
				end
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\162\254\139\61\213", "\221\24\231\176")].GreedyTowerRunning then
					return;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\216\193\107\73\239", "\221\33\157\143\61\108")].GreedyTowerRunning = true;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\255\188\228\130", "\73\213\139\232\193\178")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\134\159\88\86\85\19\179\196\24\22", "\125\212\234\54\56\60");
				task.spawn(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\53\109\87\19\248", "\155\61\92\25\36\54\200")] = 0;
					while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\157\98\9\69\234", "\95\96\216\44")].GreedyTowerRunning do
						patchTimers();
						local name, data, mis = findTower();
						if (name and data) then
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\70\9\26\237", "\209\150\41\122\63\221\41\30")] = getTowerPos(name, data);
							if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\34\110\127\47", "\60\156\77\29\90\31")] then
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\214\240\147\234\143", "\224\207\191\132")] += 1
								TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\37\209\13\117", "\81\210\81\133\40\69\184")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\111\112\132", "\134\59\32\164") .. name .. LUAOBFUSACTOR_DECRYPT_STR_0("\245\152", "\156\213\187\127\229\72\35") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\196\205\100\239\136", "\36\17\173\185\23\202\184")];
								tpPos(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\71\229\109\191", "\108\126\40\150\72\143\178\198")]);
								task.wait(1);
								if mis then
									pcall(function()
										TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\59\146\124\121\239\246\82\194\58\177\100\127\254\246\65\194\123\210", "\38\167\94\226\16\16\140\151")].MissionReroll:FireServer(mis.Name);
									end);
								end
								rerollAll();
							else
								rerollAll();
							end
						else
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\17\36\253\156", "\172\56\101\112\216")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\185\88\162\254\213\29\197\19\254\177\209\24\159\78\240", "\113\235\61\208\145\185") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\69\93\26\200\28", "\105\237\44\41")];
							rerollAll();
						end
						task.wait(0.3);
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\241\72\23\210", "\229\29\133\28\50\226\139")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\225\195\75\96\64\87\211\174\206\151", "\142\178\183\36\16\48\50\183") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\128\231\227\179\217", "\144\150\233\147")];
				end);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\83\234\116", "\53\75\98\207\68\56")], LUAOBFUSACTOR_DECRYPT_STR_0("\13\146\155\30\126\146\187\57\59\180", "\78\94\198\212"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\221\250\120\240\172\133", "\149\137\181\159\21")].Danger, function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\163\226\21\13\225", "\211\26\230\172\67\40")].GreedyTowerRunning = false;
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\4\58\8\230\74\3\64", "\112\151\87\74\109\131\46\38")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\201\55\200\243\122", "\214\74\168\80\173")], LUAOBFUSACTOR_DECRYPT_STR_0("\3\19\186\91\173\112\14\182\77\186\57\12\177\77\233\49\22\171\81", "\201\80\99\223\62"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\102\47\251\80\64\237\178\34", "\137\151\18\124\139\53\37")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\35\114\50\100\141\249\21\114\38", "\152\119\23\74\16\193"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\171\1\197\88\206\119\250\98", "\171\19\223\82\181\61")].Size = UDim2.new(1, -8, 0, 18);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\145\225\193\196\30\129\151\129", "\161\123\229\178\177")].BackgroundTransparency = 1;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\44\1\167\80\90\193\125\98", "\63\165\88\82\215\53")].Font = Enum.Font.Gotham;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\200\156\46\125\238\223\53\101", "\16\85\188\207\94\24\139\187")].TextSize = 12;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\36\138\176\72\39\10\117\233", "\66\110\80\217\192\45")].TextColor3 = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\30\24\53\23\184\70", "\114\157\118\125\88")].Text or Color3.fromRGB(220, 220, 220);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\179\33\226\63\133\74\160\181", "\133\133\199\114\146\90\224\46")].TextXAlignment = Enum.TextXAlignment.Left;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\174\220\22\32\122\4\236\234", "\96\201\218\143\102\69\31")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\204\7\35\61\243\2\255\141\246\23\46\44", "\173\159\115\66\73\134\113\197");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\160\240\0\192\233\69\76\228", "\33\105\212\163\112\165\140")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\75\170\216\35\124\255\141", "\189\70\24\218")];
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\0\57\88\49\30\157\17\46\90\48\21\154\117\76", "\65\201\80\124\29\117")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\196\127\1\194\222\165\180\97\193\102\66\221\223\174\243\49\213\117\7", "\65\180\22\98\169\183\203\211"),LUAOBFUSACTOR_DECRYPT_STR_0("\159\21\255\180\44\166\63\156\12\244\181\36\227", "\76\236\101\154\209\72\134"),LUAOBFUSACTOR_DECRYPT_STR_0("\183\19\41\236\112\171\84\53\240\63\170\91\52\247\63\169\82\46\164\111\191\65\54\235\106\172", "\31\222\51\93\132"),LUAOBFUSACTOR_DECRYPT_STR_0("\115\126\63\7\246\186\205\115\114\40\13\251\186\129\114\101\40\26\241\176\131", "\237\23\23\73\110\152\223"),LUAOBFUSACTOR_DECRYPT_STR_0("\158\174\18\122\7\244\29\135\230\19\63\7\230\11\201\167\93\41\18\231\29\141\165\28\42", "\120\233\198\125\90\98\130"),LUAOBFUSACTOR_DECRYPT_STR_0("\180\211\39\228\53\129\60\200\169\207\52", "\167\199\166\87\129\71\161\79")};
			local function speedHasTarget()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\118\1\73\55\148\119\41", "\230\82\25\109\45\82")] = getMissionsFolder();
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\120\55\198\27\31\142\29", "\171\45\23\91\162\126\109")] then
					return nil;
				end
				for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\235\5\165\219\242\161\89", "\190\128\132\105\193")]:GetChildren()) do
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\151\21", "\219\51\178\37\71")] = string.lower(m.Name);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\75\144\84", "\164\60\37\181\100")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\50\60\165\44\55\198\223\56\52\187\57", "\166\118\85\214\92\91\167"));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\126\7", "\192\60\91\55")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\5\163\33", "\56\106\107\134\17")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\82\63\30", "\71\123\60\26\46\84\88")].Value))) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\91\40", "\230\232\126\24\79\229\218\197")];
					for _, k in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\99\125\245\223\205\250\165\132\116\125\228\200\183\158", "\228\214\51\56\176\155\146\174")]) do
						if (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\59\238", "\139\189\30\222\73\163\36\20")], k, 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\78\6", "\73\122\107\54")], k, 1, true)) then
							return m, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\138\12", "\20\116\175\60\81\52")];
						end
					end
				end
				return nil;
			end
			local function speedUnfreeze()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\36\61\22\76\83", "\64\105\97\115")].GreedySpeedFrozen = false;
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\205\203\152\189\172", "\158\203\136\133\206\152")].GreedySpeedFreezeConn then
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\205\136\78\115\133", "\86\183\136\198\24")].GreedySpeedFreezeConn:Disconnect();
					end);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\14\134\247\126\187", "\200\225\75\200\161\91\137")].GreedySpeedFreezeConn = nil;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\151\32", "\83\47\178\16\111\80\138")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\198\27\187\112\53\127\83", "\90\99\170\122\194\21\71")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\163\64\183\172\231\77\255", "\149\104\207\33\206\201")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\239\15\26\32\208\244\206\30\37\46\209\239\247\27\5\53", "\155\167\122\119\65\190"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\242\149", "\182\22\215\165\90")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\74\104", "\195\132\111\88\189\137\108")].Anchored = false;
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\255\243", "\44\139\218\195")].AssemblyLinearVelocity = Vector3.zero;
					end);
				end
			end
			local function speedFreeze(cf)
				speedUnfreeze();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\13\55\33\248\74", "\191\66\72\121\119\221\120")].GreedySpeedFrozen = true;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\141\164\50\207\210", "\39\87\226\199\89\234\226")] = cf;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\8\152", "\164\145\45\168\136\163\33")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\56\13\45\26\94\171\183", "\135\82\84\108\84\127\44\142")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\95\28\243\10\196\161\220", "\132\236\51\125\138\111\182")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\228\73\22\31\26\227\30\125\254\83\20\10\36\237\5\109", "\25\172\60\123\126\116\140\119"));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\153\26", "\117\231\188\42\49\43")] then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\16\168", "\79\224\53\152")].Anchored = true;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\31\83", "\94\149\58\99")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\208\78\169\201\143", "\194\236\191\45")];
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\130\49\103\64\245", "\49\101\199\127")].GreedySpeedFreezeConn = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\40\109\165\229\135\201\111\187\25\125", "\210\122\24\203\182\226\187\25")).Heartbeat:Connect(function()
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\38\158\233\162\81", "\191\135\99\208")].GreedySpeedFrozen then
						return;
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\37\66\74\189\123", "\62\152\74\45")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\126\73\32\250\255\131\152", "\168\39\18\40\89\159\141\166")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\11\48\230\81\41\224\87", "\91\197\103\81\159\52")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\159\34\162\70\172\184\62\171\117\173\184\35\159\70\176\163", "\194\215\87\207\39"));
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\254\244\27\14\186", "\139\24\145\155\111\43")] then
						return;
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\186\40\103\225\252", "\221\127\213\71\19\196\205")].Anchored = true;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\84\87\56\68\157", "\98\172\59\56\76\97\172\90")].CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\196\208\2\99\129", "\70\177\171\179\105")];
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\195\72\253\205\181", "\224\76\172\39\137\232\132")].AssemblyLinearVelocity = Vector3.zero;
					end);
				end);
			end
			local function speedPass()
				speedUnfreeze();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\253\74", "\64\114\216\122\202\222\48")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\6\17\67\172\39\79\64", "\201\85\106\112\58")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\83\172\222\173\77\232\151", "\167\200\63\205")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\44\217\3\120\234\208\80\0\254\1\118\240\239\88\22\216", "\57\100\172\110\25\132\191"));
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\136\99", "\232\84\173\83\214\203\16\233")] then
					return;
				end
				local X1, X2, Y, Z = 3000, 3180, 100, 3000;
				local startCF, endCF = CFrame.new(X1, Y, Z), CFrame.new(X2, Y, Z);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\166\24\98\214", "\97\213\207\106\71\230\213")] = (endCF.Position - startCF.Position).Unit;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\166\244", "\88\231\131\196\147")].Anchored = false;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\105\107", "\213\170\76\91\87\129\19\207")].CFrame = startCF;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\86\147\66\103\231\183\43", "\27\233\53\231\43\17\130\146")] = true;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\20\125\0", "\48\224\119\88")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\141\25\170\68\203\249\61\57\188\9", "\80\223\108\196\23\174\139\75")).Heartbeat:Connect(function()
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\166\227\12\6\160\178\85", "\101\112\197\151")] then
						return;
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\24\223\244\250\245", "\127\167\119\176\128\223\196")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\214\4\189\1\80\200\138", "\34\237\186\101\196\100")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\6\236\213\193\210\79\189", "\164\160\106\141\172")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\145\222\135\81\6\210\162\14\139\196\133\68\56\220\185\30", "\106\217\171\234\48\104\189\203"));
					if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\7\184\87\165\151", "\134\84\104\215\35\128\166")] then
						return;
					end
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\18\224", "\228\102\55\208\204")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\190\68\250\71", "\26\160\215\54\223\119")] * 500;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\183\242\81\153\139", "\22\71\216\157\37\188\186")].AssemblyLinearVelocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\51\160", "\96\134\22\144\83\118\118")].X, 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\227\220", "\219\81\198\236\112\116\55\133")].Z);
				end);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\214\127\188", "\140\124\161\90")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\159\19\127\229\44\152\1\104\246\43\168\1", "\66\203\100\26\128")):Create(TABLE_TableIndirection["r%0"], TweenInfo.new(0.35, Enum.EasingStyle.Linear), {[LUAOBFUSACTOR_DECRYPT_STR_0("\9\173\192\28\39\142", "\125\74\235\178")]=endCF});
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\186\21\127", "\122\147\205\48\79\137\227\146")]:Play();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\94\92\98", "\234\211\41\121\82\143\32")].Completed:Wait();
				active = false;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\44\13\89", "\131\134\79\40\105")]:Disconnect();
				speedFreeze(endCF);
			end
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\111\57\49\92\88\108\100", "\84\57\60\73")], LUAOBFUSACTOR_DECRYPT_STR_0("\46\245\18\118\117\196\189\25\24\196\55\4\71\133\188\4", "\105\125\161\83\36\33\228\206"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\122\227\114\0\226\34", "\101\199\18\134\31")].Accent, function()
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\247\151\227\251\216", "\75\92\178\217\181\222\234")].GreedySpeedFarm then
					return;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\54\143\226\81\65", "\180\116\115\193")].GreedySpeedFarm = true;
				task.spawn(function()
					while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\160\109\45\173\215", "\123\136\229\35")].GreedySpeedFarm do
						patchTimers();
						local m, name = speedHasTarget();
						if m then
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\65\11\255\137\93\81\125\191", "\236\56\53\88\143")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\12\238\229\52\102\143", "\103\92\175\182") .. tostring(name);
							pcall(speedPass);
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\194\74\194\174\131\16\140\180", "\169\132\182\25\178\203\230\116")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\85\5\6\185\234\56\67\77", "\129\22\109\99\218");
							task.wait(0.35);
						else
							TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\160\48\205\11\209\212\186\125", "\159\77\212\99\189\110\180\176")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\45\133\201\193\237\184\81\206\149", "\212\127\224\187\174\129");
							rerollAll();
							task.wait(0.12);
						end
					end
					speedUnfreeze();
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\95\72\174\207\90\39\14\43", "\63\67\43\27\222\170")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\206\228\239\176\204\131\63", "\91\157\144\128\192\188\230");
				end);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\226\19\76\19\63\154\92", "\191\108\177\99\41\118\91")], LUAOBFUSACTOR_DECRYPT_STR_0("\176\149\113\99\99\170\74\235\134\165\30\85\34\171\87", "\142\227\193\62\51\67\217\58"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\172\92\42\170\254\141", "\189\40\196\57\71\207\219")].Danger, function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\246\115\141\196\208", "\132\136\179\61\219\225\226\143")].GreedySpeedFarm = false;
				speedUnfreeze();
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\110\9\221\225\127\62\136\180", "\173\132\26\90")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\130\63\228\85\144\180\47", "\224\209\75\139\37");
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\21\151\76", "\124\148\39\178")] = section(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\194\86\245\159\34", "\186\18\163\49\144")], LUAOBFUSACTOR_DECRYPT_STR_0("\142\1\253\176\240\243\227\24\242\174\249\254\227\15\230\175\250\236\162\28\254", "\138\195\110\147\219\149"));
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\255\184\40", "\160\17\205\157\24\132\100")], "Monkey vault — BETA", TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\93\133\4\3\16\208", "\105\102\53\224")].Button, function()
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\251\56\138\84\33", "\170\186\190\118\222\113\17\197")] = Vector3.new(-311.12, 85.56, -443.3);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\36\197\251\126", "\222\78\109\136")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\18\176\179\156\49\184\173\161\42\169\180\156\9\184\175\137\35\188\179", "\232\68\217\193"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\151\109\7\58\129\124\27\32\144\108\0\59\253\19", "\76\127\216\35")] = 1.9;
			local function monkeyOnce()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\180\109", "\205\139\145\93\68")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\82\195\178\255\15\27\146", "\154\125\62\162\203")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\207\27\237\135\242\48\214", "\21\230\163\122\148\226\128")].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\119\11\50\239\81\17\54\234\109\17\48\250\111\31\45\250", "\142\63\126\95"));
				if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\183\0", "\218\126\146\48\164\108")] then
					return;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\178\82", "\166\127\151\98\205\161\144")].AssemblyLinearVelocity = Vector3.zero;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\27\227", "\83\190\62\211\87\57\63")].CFrame = CFrame.lookAt(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\224\196\60\55\158", "\46\136\165\138\104\18\174\157")] + Vector3.new(0, 3, 0), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\29\158\22\196\104", "\66\225\88\208")] + Vector3.new(20, 3, 0));
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\12\81\120\184", "\93\136\69\28")]:SendKeyEvent(true, Enum.KeyCode.W, false, game);
				end);
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\25\215\166\111", "\131\95\80\154")]:SendKeyEvent(true, Enum.KeyCode.Space, false, game);
				end);
				local w, s = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\244\243\90\221\78\31\54\239\243\242\93\220\50\112", "\97\176\187\189\17\152\23\64")], 2;
				if (s <= w) then
					task.wait(s);
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\220\160\245\87", "\139\115\149\237\208\103\164")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
					end);
					task.wait(w - s);
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\210\227\109\234", "\232\86\155\174\72\218\75")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
					end);
				else
					task.wait(w);
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\3\111\140\161", "\164\158\74\34\169\145")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
					end);
					task.wait(s - w);
					pcall(function()
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\112\232\97\238", "\220\178\57\165\68\222\156\113")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
					end);
				end
			end
			local function isMonkey(m)
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\112\162", "\176\155\85\146")] = string.lower(m.Name);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\205\84\129", "\136\99\163\113\177\101\232")] = m:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\109\170\243\44\54\134\194\12\72\174\229", "\66\41\195\128\92\90\231\187"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\176\151", "\16\231\149\167")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\1\234\107", "\166\175\111\207\91")] and string.lower(tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\244\176\150", "\113\236\154\149\166\169\43\75")].Value))) or "";
				return (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\25\225", "\158\230\60\209\221\128\32")] == LUAOBFUSACTOR_DECRYPT_STR_0("\246\52\22\8\227\250\55\132\160", "\178\145\81\120\109\145\155\91")) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\143\209", "\30\78\170\225\17\208\25\37")], LUAOBFUSACTOR_DECRYPT_STR_0("\17\81\169\203\90\61\15\30\174\206\31\55\12\95\164\197", "\68\124\62\199\160\63"), 1, true);
			end
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\42\159\129", "\53\125\24\186\177\183\184")], LUAOBFUSACTOR_DECRYPT_STR_0("\253\109\114\5\120\14\238\201\52\121\6\113\74\255\132\120\53\91\58\83\225\152\99\47\69\39", "\206\170\77\26\106\20\106"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\242\174\227\196\184\21", "\73\169\154\203\142\161\157\37")].Button, function()
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\4\223\247\36\18\206\235\62\3\222\240\37\110\161", "\188\97\75\145")] < 1.6) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\110\247\12\102\203\134\137\126\241\8\111\214\252\238", "\217\222\33\185\71\35\146")] = 1.9;
				elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\203\106\104\17\16\11\211\123\107\27\5\16\161\20", "\73\84\132\36\35\84")] < 2) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\200\134\54\167\181\246\208\151\53\173\160\237\162\248", "\236\169\135\200\125\226")] = 2.5;
				elseif (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\97\204\93\39\119\221\65\61\102\205\90\38\11\178", "\22\98\46\130")] < 2.7) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\172\40\55\81\101\224\183\201\171\41\48\80\25\143", "\224\150\227\102\124\20\60\191")] = 3;
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\244\24\33\163\199\228\1\53\174\209\247\18\79\214", "\230\158\187\86\106")] = 1.5;
				end
				showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\1\118\18\226\52\229\79\107\118", "\111\86\86\122\141\88\129") .. tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\62\106\105\141\40\123\117\151\57\107\110\140\84\20", "\34\200\113\36")]), 2);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\159\190\130", "\187\216\173\155\178\67\160")], LUAOBFUSACTOR_DECRYPT_STR_0("\145\120\113\191\230\63\53\59\178\116\122\244\171\18\69\116\143\103\126\183\230\109\66\125", "\84\220\23\31\212\131\70\21"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\74\47\212\228\7\122", "\185\129\34\74")].Accent, monkeyOnce);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\147\199\182", "\173\27\161\226\134\111\113")], LUAOBFUSACTOR_DECRYPT_STR_0("\73\138\63\70\37\105\94\228\116\181\27\109\81\63\114\254\118\170\94\117\4\61\124\237\123\172\19", "\139\26\222\126\20\113\73\19"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\216\78\78\221\149\27", "\35\184\176\43")].Accent, function()
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\226\141\29\106\88", "\79\106\167\195\75")].GreedyMonkeyRunning then
					return;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\155\95\78\59\236", "\24\30\222\17")].GreedyMonkeyRunning = true;
				task.spawn(function()
					while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\228\169\235\142\45", "\31\59\161\231\189\171")].GreedyMonkeyRunning do
						patchTimers();
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\0\156\75\161\65", "\132\113\97\234\46")] = false;
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\214\122\213\27\176\156\38", "\126\194\185\22\177")] = getMissionsFolder();
						if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\255\58\222\34\42\162\160", "\88\135\144\86\186\71")] then
							for _, m in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\62\164\24\213\70\116\248", "\176\52\81\200\124")]:GetChildren()) do
								if isMonkey(m) then
									TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\131\48\184\62\210", "\221\27\226\70")] = true;
									break;
								end
							end
						end
						if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\7\241\94\141\38", "\26\72\102\135\59\168\22")] then
							rerollAll();
							task.wait(0.3);
						else
							monkeyOnce();
							task.wait(1);
						end
					end
				end);
			end);
			makeBtn(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\102\83\84", "\75\80\84\118\100")], LUAOBFUSACTOR_DECRYPT_STR_0("\211\242\151\11\160\235\183\53\235\195\161\123\246\199\173\55\244\134\185\46\244\201\190\58\242\203", "\91\128\166\216"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\216\231\133\121\247\229", "\210\213\176\130\232\28")].Danger, function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\138\113\13\179\224", "\150\210\207\63\91")].GreedyMonkeyRunning = false;
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\163\53\50\142", "\139\52\234\120\23\190")]:SendKeyEvent(false, Enum.KeyCode.Space, false, game);
				end);
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\62\164\204\230", "\214\80\119\233\233")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
				end);
			end);
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\142\180\84\234\14\197\171\178\69\203\34\217\173\174\82\253\98\155", "\171\219\199\49\152\71")].InputBegan:Connect(function(input, gp)
		if gp then
			return;
		end
		if (input.KeyCode == Enum.KeyCode.Insert) then
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\203\54\3\52\199\43\31\0\194\61\83\82", "\118\98\174\88")] then
				minimize();
			else
				restore();
			end
		end
	end);
	task.spawn(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\135\72\95\85\44", "\107\123\230\33\49\112\28")].Visible = true;
		switchTab(LUAOBFUSACTOR_DECRYPT_STR_0("\144\81\114\190\10\184\237\204\176\80\122", "\184\217\63\20\209\120\213\140"));
		pcall(function()
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\194\226\254\50\240\20\145\183", "\145\109\180\135\140\94")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\49\128\72\209\208\62\192\10", "\189\177\71\229\58")]:Destroy();
			end
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\206\199\75\81\146", "\57\116\162\178")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\168\90\100\249\37", "\83\100\196\47\22\220\21")].Parent) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\175\56\66\122\162", "\192\171\195\77\48\95\146")]:Destroy();
			end
		end);
	end);
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\228\84\232\28", "\190\80\145\61\205\44\160\82")];
end
local guiOk, guiErr = pcall(createUI);
if not guiOk then
	warn(LUAOBFUSACTOR_DECRYPT_STR_0("\127\255\215\202\220\93\93\229\133\204\203\92\69\204\192\250\240\25\66\217\204\195\220\93\30", "\57\36\184\165\175\185"), guiErr);
end
task.spawn(function()
	task.wait(1.2);
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\183\7", "\47\204\146\55\189")] = mainGui;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\164\233", "\103\197\129\217\140\151")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\247\255\44\77\4", "\115\38\150\150\66\104\52\33")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\148\178", "\186\54\177\130\175\203")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\167\65\137\29\121\56\212\47\133\87", "\75\234\32\224\115\46\81\186"));
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\183\208\199\199\17", "\33\91\214\185\169\226")] and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\134\75\18\23\40", "\24\88\231\34\124\50")].Visible) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\47\241\76\78\102", "\86\149\78\152\34\107")].Visible = true;
				print(LUAOBFUSACTOR_DECRYPT_STR_0("\234\206\153\35\184\47\200\212\203\32\178\57\210\236\143\102\144\42\216\231\188\47\179\47\222\254\203\48\180\56\216\235\135\35", "\75\177\137\235\70\221"));
			end
		end
	end);
end);
task.wait(0.3);
pcall(startYCheck);
pcall(updateRoot);
if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\57\163\176\94\215\161\101", "\165\132\85\194\201\59")].Character and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\26\151\91\10\25\132\66\15\20\133\92\12\16\151\88\5\20\138\81\14\17\237\45", "\29\75\85\200")]) then
	pcall(setupNoFallDamage);
end
if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\124\255\247\21\102\216\198\252\124\224\253\3\109\201\214\235\117\240\252\121\24", "\151\169\57\181\184\92\40\135")] then
	pcall(setupRejoinQueue);
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\114\193\113\9\193\242", "\90\53\132\63\95\228\195")].GreedyHudzell_Ready = true;
print(LUAOBFUSACTOR_DECRYPT_STR_0("\224\52\103\68\5\166\37\230\83\99\21\78\242\114\139\83\115\84\12\174\124\211\6\119\1\18\167\61\223\10", "\92\187\115\21\33\96\194"));
task.defer(function()
	task.wait(0.5);
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\141\38\37\63\195\126", "\78\160\228\82\73\90\230")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\241\111\173\240\200\20\150\241\117\165\250\186\123", "\75\194\184\33\233\191\159")];
		if (typeof(showNotification) == LUAOBFUSACTOR_DECRYPT_STR_0("\212\46\49\6\198\50\48\11", "\101\178\91\95")) then
			showNotification(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\44\47\30\185\162\163", "\147\122\69\91\114\220\135")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\165\42\0\67\219\252", "\191\133\88\101\34"), 2);
		end
	end);
end);
