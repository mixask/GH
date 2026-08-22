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
print(LUAOBFUSACTOR_DECRYPT_STR_0("\234\239\212\36\226\190\213\35\145\158\134\120\166\151\238\48\244\131\138\101\187\230\154", "\126\177\163\187\69\134\219\167"));
print(LUAOBFUSACTOR_DECRYPT_STR_0("\24\225\37\196\248\38\223\23\133\254\44\194\62", "\156\67\173\74\165"));
local okAll, errAll = pcall(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\148\123\63\140\18\121\1\133\101\37\249\118", "\38\84\215\41\118\220\70")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\88\2\54\2\237\10\89\109\21\236\85\19\38\11\246\69\18\56\23\242\92\88\58\11\228\31\5\33\0\247\64\2\108\30\235\81", "\158\48\118\66\114"),LUAOBFUSACTOR_DECRYPT_STR_0("\163\48\4\38\96\255\180\228\54\17\33\61\162\242\191\44\5\52\102\182\254\185\39\31\56\103\160\245\191\106\19\57\126\234\246\162\60\17\37\120\234\220\131\107\29\55\122\171\180\172\54\21\51\119\188\181\167\49\17", "\155\203\68\112\86\19\197")};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\252\26\213\100\89\209\221\121\232\4\208\5\40", "\152\38\189\86\156\32\24\133")] = LUAOBFUSACTOR_DECRYPT_STR_0("\244\67\179\86\239\13\232\9\251\69\162\67\248\78\175\83\248\77\162\74\240\25\191\95\230\24\177\71\240\94\163\71\232\82", "\38\156\55\199");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\88\69\23\63\93\212\104\237\45", "\35\200\29\28\72\115\20\154")] = LUAOBFUSACTOR_DECRYPT_STR_0("\17\171\197\207\158\118\123\86\168\222\205\134\98\61\23\180\158\141\213\59\36\86\152\195\218\136\40\45\84\183\196\219\151\41\56\21", "\84\121\223\177\191\237\76");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\121\238\143\5\121\20\132\235", "\161\219\54\169\192\90\48\80")] = LUAOBFUSACTOR_DECRYPT_STR_0("\91\64\24\36\90\81\5\49\64\70\90\106\6\19\80\117\16\19\80\117\25\22\84\117\27\23\83\112", "\69\41\34\96");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\230\229\57\43\4\146\134\135", "\75\220\163\183\106\98")] = LUAOBFUSACTOR_DECRYPT_STR_0("\20\238\197\103\151\82", "\185\98\218\235\87");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\21\9\217\237\133\254\14\4\195\225\134\238\18\98\182", "\202\171\92\71\134\190")] = 8000;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\244\14\183\26\238\10\188\108\145", "\232\73\161\76")] = 25;
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\128\245\77\92\26\190\203\127\29\13\190\203\84\84\29\190\202\12\19\80", "\126\219\185\34\61"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\218\74\98\77\114\225\241\5\205\91\55\46", "\135\108\174\62\18\30\23\147")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\158\253\62\219\43\171\33\209\191\234\47", "\167\214\137\74\171\120\206\83"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\252\51\68\253\181\152\181\98", "\199\235\144\82\61\152")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\55\26\184\50\2\4\170", "\75\103\118\217"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\67\117\17\183\45\194\70\102\29\186\27\130\4", "\126\167\52\16\116\217")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\252\57\37\133\186\42\249\218\56\41\131\177", "\156\168\78\64\224\212\121"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\60\194\170\207\3\235\183\243\71\253\160\220\17\231\166\203\20\174\170\197", "\174\103\142\197"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\13\113\14\96\14", "\152\54\72\63\88\69\62")] = (getgenv and getgenv()) or _G;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\200\239\69\209\214\171\12", "\60\180\164\142")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\82\4\48\34\255\1\29\14", "\114\56\62\101\73\71\141")].LocalPlayer;
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\229\218\221\189\251\158\148", "\164\216\137\187")] then
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\233\202\62\179\162\251\25\239\166\38\179\175\234\2\220\225\113\158\169\253\10\222\214\61\179\191\251\25\156\168\127", "\107\178\134\81\210\198\158"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\94\199\150", "\202\88\110\226\166")] = os.clock();
		repeat
			task.wait(0.05);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\3\131\238\207\209\74\210", "\170\163\111\226\151")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\60\179\33\75\37\58\84\96", "\73\113\80\210\88\46\87")].LocalPlayer;
		until TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\32\204\11\226\147\105\157", "\135\225\76\173\114")] or ((os.clock() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\189\253\224", "\199\122\141\216\208\204\221")]) > 10) 
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\209\17\233\125\228\232\141", "\150\205\189\112\144\24")] then
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\30\168\176\77\0\141\3\45\101\138\176\12\40\135\18\17\41\180\179\77\29\141\3", "\112\69\228\223\44\100\232\113"));
		return;
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\239\51\8\210\178\121\148\233\95\23\223\183\101\131\198", "\230\180\127\103\179\214\28"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\9\94\95\225\83\165\220", "\128\236\101\63\38\132\33")].Name);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\140\63\114\243\187", "\175\204\201\113\36\214\139")].GreedyHudzell_Ready and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\233\27\234\65\23", "\100\39\172\85\188")].GreedyHudzell_JobId == game.JobId)) then
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\150\84\182\129\55\168\106\132\192\59\184\122\249\129\63\191\125\184\132\42\237\106\188\129\55\180\56\244\192\32\166\113\169", "\83\205\24\217\224"));
		return;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\224\227\11\163\149", "\93\134\165\173")].GreedyLoader_Running and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\215\239\244\127\158", "\30\222\146\161\162\90\174\210")].GreedyLoader_JobId == game.JobId)) then
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\222\98\127\11\225\75\98\55\165\66\127\11\225\75\98\74\228\66\98\15\228\74\105\74\247\91\126\4\236\64\119\74\168\14\99\1\236\94", "\106\133\46\16"));
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\5\93\202\31\16", "\32\56\64\19\156\58")].GreedyLoader_Running = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\237\203\96\31\162", "\224\58\168\133\54\58\146")].GreedyLoader_JobId = game.JobId;
	local function httpRequest(opts)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\83\90\184\37", "\107\57\54\43\157\21\230\231")] = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request);
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\142\0\176\233", "\175\187\235\113\149\217\188")] then
			return nil, LUAOBFUSACTOR_DECRYPT_STR_0("\50\160\190\94\230\104\109\57\188\149", "\24\92\207\225\44\131\25");
		end
		local ok, res = pcall(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\214\169\9\75", "\29\43\179\216\44\123")], opts);
		if ok then
			return res, nil;
		end
		return nil, tostring(res);
	end
	local function httpGet(url, timeout)
		timeout = timeout or 14;
		local done, body, err = false, nil, nil;
		task.spawn(function()
			local ok, res = pcall(function()
				return game:HttpGet(url);
			end);
			if (ok and (type(res) == LUAOBFUSACTOR_DECRYPT_STR_0("\174\205\50\69\179\222", "\44\221\185\64")) and (#res > 0)) then
				body = res;
			else
				local r, e = httpRequest({[LUAOBFUSACTOR_DECRYPT_STR_0("\52\245\68", "\19\97\135\40\63")]=url,[LUAOBFUSACTOR_DECRYPT_STR_0("\131\89\39\51\32\53", "\81\206\60\83\91\79")]=LUAOBFUSACTOR_DECRYPT_STR_0("\105\142\228", "\196\46\203\176\18\79\163\45")});
				if r then
					body = r.Body or r.body;
				else
					err = e or tostring(res);
				end
			end
			done = true;
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\114\59\78", "\143\216\66\30\126\68\155")] = os.clock();
		while not done and ((os.clock() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\152\72\155", "\129\202\168\109\171\165\195\183")]) < timeout) do
			task.wait(0.05);
		end
		if not done then
			return nil, LUAOBFUSACTOR_DECRYPT_STR_0("\54\81\58\221\209\1\242", "\134\66\56\87\184\190\116");
		end
		if (type(body) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\47\37\27\178\23\236", "\85\92\81\105\219\121\139\65")) then
			return nil, err or LUAOBFUSACTOR_DECRYPT_STR_0("\248\190\64\81\101", "\191\157\211\48\37\28");
		end
		return body, nil;
	end
	local function isBadContent(s)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\16\227\89\106", "\90\191\127\148\124")] = string.lower(string.sub(s, 1, 900));
		if (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\136\57\82\40", "\119\24\231\78")], LUAOBFUSACTOR_DECRYPT_STR_0("\222\108\161\69\223\84\8\146\40", "\113\226\77\197\42\188\32"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\25\227\240\106", "\213\90\118\148")], LUAOBFUSACTOR_DECRYPT_STR_0("\7\38\160\91\65", "\45\59\78\212\54"), 1, true)) then
			return true;
		end
		if (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\89\148\206\214", "\144\112\54\227\235\230\78\205")], LUAOBFUSACTOR_DECRYPT_STR_0("\176\36\0\233\212\93\191\41\29\249", "\59\211\72\111\156\176"), 1, true) and string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\136\244\104\30", "\77\46\231\131")], "<", 1, true)) then
			return true;
		end
		if string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\91\161\5\234", "\32\218\52\214")], LUAOBFUSACTOR_DECRYPT_STR_0("\26\71\101\232\255\191\81\26\72\24\36\166\245", "\58\46\119\81\200\145\208\37"), 1, true) then
			return true;
		end
		return false;
	end
	local function validateSource(source, url)
		if (type(source) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\56\152\34\165\167\186", "\86\75\236\80\204\201\221")) then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\124\78\99\197\255\203\97\85\101\140\240\140", "\235\18\33\23\229\158");
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\255\145", "\219\48\218\161")] = #source;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\52\44", "\128\132\17\28\41\187\47")] < TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\27\40\5\110\46\7\52\25\120\62\30\35\20\24\81", "\61\97\82\102\90")]) then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\184\33\164\11\212\95\17\27\184\116\235", "\105\204\78\203\43\167\55\126") .. tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\239\115", "\49\197\202\67\126\115\100\167")]) .. LUAOBFUSACTOR_DECRYPT_STR_0("\119\93\205\38\141\22", "\62\87\59\191\73\224\54") .. tostring(url);
		end
		if isBadContent(source) then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\207\54\215\229\168\7\232\219\232\16\186\217\230\5\255\137\225\16\245\196\167", "\169\135\98\154") .. tostring(url);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\114\37\80\184\99", "\168\171\23\68\52\157\83")] = string.sub(source, 1, math.min(8000, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\52\165", "\231\148\17\149\205\69\77")]));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\168\208\190\7", "\159\224\199\167\155\55")] = string.lower(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\246\61\214\178\163", "\178\151\147\92")]);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\156\241\77\59\28\9\42", "\26\236\157\44\82\114\44")] = string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\43\212\95\111\126", "\59\74\78\181")], LUAOBFUSACTOR_DECRYPT_STR_0("\2\195\95\95\183\60", "\211\69\177\58\58"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\224\120\241\172\155", "\171\215\133\25\149\137")], LUAOBFUSACTOR_DECRYPT_STR_0("\198\250\23\223\203\9", "\34\129\168\82\154\143\80\156"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\183\50\15\13\30", "\233\229\210\83\107\40\46")], LUAOBFUSACTOR_DECRYPT_STR_0("\232\81\0\215\12\207\85\51\196\0", "\101\161\34\82\182"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\8\88\250\158\178", "\78\136\109\57\158\187\130\226")], LUAOBFUSACTOR_DECRYPT_STR_0("\25\45\252\244\58\38\209\228\58\37\252\253\50", "\145\94\95\153"), 1, true);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\207\18\144\30", "\215\157\173\116\181\46")] = string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\187\156\183\138", "\186\85\212\235\146")], LUAOBFUSACTOR_DECRYPT_STR_0("\209\149\4\247\55\233\22\193\137\23\236", "\56\162\225\118\158\89\142"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\10\215\234\114", "\184\60\101\160\207\66")], LUAOBFUSACTOR_DECRYPT_STR_0("\34\150\110\181\63\133\50\190\40\150\121", "\220\81\226\28"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\218\149\190\186", "\167\115\181\226\155\138")], LUAOBFUSACTOR_DECRYPT_STR_0("\224\43\243\15\41", "\166\130\66\135\60\27\17"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\69\217\48\96", "\80\36\42\174\21")], LUAOBFUSACTOR_DECRYPT_STR_0("\73\21\35\124\75\30\33", "\26\46\112\87"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\38\170\112\250\239", "\212\217\67\203\20\223\223\37")], LUAOBFUSACTOR_DECRYPT_STR_0("\182\130\169\214\169\153\186\219\180\138", "\178\218\237\200"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\186\241\149\230", "\176\214\213\134")], LUAOBFUSACTOR_DECRYPT_STR_0("\248\162\181\213\164\22\79\164", "\57\148\205\214\180\200\54"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\242\34\113\38", "\22\114\157\85\84")], LUAOBFUSACTOR_DECRYPT_STR_0("\200\196\16\197\81\182\190\149", "\200\164\171\115\164\61\150"), 1, true);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\225\2\76\144\182\177\83", "\227\222\148\99\37")] = string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\93\69\179\169", "\153\83\50\50\150")], LUAOBFUSACTOR_DECRYPT_STR_0("\91\99\125\31\103\162\66\83", "\45\61\22\19\124\19\203"), 1, true) and (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\29\26\176\82", "\217\161\114\109\149\98\16")], LUAOBFUSACTOR_DECRYPT_STR_0("\30\47\59\125\176\52", "\20\114\64\88\28\220"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\14\197\241\168", "\221\81\97\178\212\152\176")], LUAOBFUSACTOR_DECRYPT_STR_0("\223\226\9\238\8\195", "\122\173\135\125\155"), 1, true));
		if not (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\205\1\176\49\116\152", "\168\228\161\96\217\95\81")] or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\211\40\25\127", "\55\187\177\78\60\79")] or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\219\94\226\85\199\197\125", "\224\77\174\63\139\38\175")]) then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\138\78\76\110\168\84\89\97\140\84\90\110\135\78\86\58\129\79\76", "\78\228\33\56");
		end
		return true, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\59\226", "\229\174\30\210\99")];
	end
	local gui, barFill, pctLabel, stageLabel, statusLabel, logBox;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\226\129\125\228\51\60\8\168\214", "\89\123\141\230\49\141\93")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\126\247\8\21\88\215\116\247\8\85\26", "\42\147\17\150\108\112")] = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\169\35\113\244\173\95", "\136\111\198\77\31\135")] = {};
	local function pushLog(msg)
		msg = tostring(msg);
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\57\37\168\87\185\225\5\148", "\201\98\105\199\54\221\132\119"), msg);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\3\132\13\11\59\169\170\73\211", "\204\217\108\227\65\98\85")][#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\204\242\201\37\206\91\208\176\181", "\160\62\163\149\133\76")] + 1] = msg;
		while #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\175\10\3\202\216\165\30\106\147", "\163\182\192\109\79")] > 14 do
			table.remove(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\41\7\236\252\58\35\19\133\165", "\149\84\70\96\160")], 1);
		end
		if logBox then
			pcall(function()
				logBox.Text = table.concat(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\9\10\193\49\8\8\254\125\86", "\141\88\102\109")], "\n");
			end);
		end
	end
	local function setProgress(pct, stage, status)
		pct = tonumber(pct) or 0;
		if (pct < 0) then
			pct = 0;
		elseif (pct > 100) then
			pct = 100;
		end
		pcall(function()
			if barFill then
				barFill.Size = UDim2.new(pct / 100, 0, 1, 0);
			end
			if pctLabel then
				pctLabel.Text = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\246\87\143\53", "\161\211\51\170\16\122\93\53"), math.floor(pct));
			end
			if (stage and stageLabel) then
				stageLabel.Text = stage;
			end
			if (status and statusLabel) then
				statusLabel.Text = status;
			end
		end);
	end
	local function destroyGui()
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\161\179\44\254\188\150\45\250\170\247\120", "\72\155\206\210")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\117\85\10\54\84\94\81\15\55\3\42", "\83\38\26\52\110")] = true;
		for i = 1, #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\24\41\72\75\82\119", "\38\56\119\71")] do
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\224\86\216\54\19\163", "\54\147\143\56\182\69")][i]:Disconnect();
			end);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\142\241\71\204\147\209", "\191\182\225\159\41")] = {};
		if gui then
			pcall(function()
				gui:Destroy();
			end);
			gui = nil;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\55\6\99\206\215", "\162\75\114\72\53\235\231")].GreedyLoader_Running = false;
	end
	local function parentGui(g)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\55\1\178", "\98\236\92\36\130\51")] = pcall(function()
			g.Parent = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\135\22\30\191\98\189\188", "\80\196\121\108\218\37\200\213"));
		end);
		if not g.Parent then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\116\71\47", "\234\96\19\98\31\43\110")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\19\83\222\169\96\206\86", "\235\102\127\50\167\204\18")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\96\173\244\58\65\60\119\180\252", "\78\48\193\149\67\36")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\18\129\1\68\34\91\208", "\33\80\126\224\120")]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\220\164\2\221\89\254\143\22\205", "\60\140\200\99\164"), 5);
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\243\65\118", "\194\231\148\100\70")] then
					g.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\75\132\243", "\168\38\44\161\195\150")];
				end
			end);
		end
		return g.Parent ~= nil;
	end
	local function createGui()
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\187\208\141\119\52\237\164\43\192\219\183\95\112\235\164\19\129\232\139\120\55\166\248\88", "\118\224\156\226\22\80\136\214"));
		gui = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\113\237\75\133\71\224\126\149\75", "\224\34\142\57"));
		gui.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\249\181\192\216\119\232\113\1\223\163\192\207\70\216", "\110\190\199\165\189\19\145\61");
		gui.ResetOnSpawn = false;
		gui.IgnoreGuiInset = true;
		gui.DisplayOrder = 1000;
		if not parentGui(gui) then
			warn(LUAOBFUSACTOR_DECRYPT_STR_0("\225\199\120\233\143\194\200\214\55\235\138\201\212\228\99\168\155\198\200\238\121\252\203\224\239\194", "\167\186\139\23\136\235"));
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\186\135\25\95\229", "\109\122\213\232")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\200\229\163\61\235", "\80\142\151\194"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\201\120\88\70\150", "\44\99\166\23")].Size = UDim2.fromScale(1, 1);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\248\38\34\118\244", "\196\28\151\73\86\83")].BackgroundColor3 = Color3.fromRGB(6, 5, 3);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\12\38\4\199\8", "\22\147\99\73\112\226\56\120")].BackgroundTransparency = 0.2;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\122\237\225\200\232", "\237\216\21\130\149")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\65\80\75\245\153", "\62\226\46\63\63\208\169")].Parent = gui;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\24\71\135\90\93", "\62\133\121\53\227\127\109\79")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\54\6\51\248\211", "\194\112\116\82\149\182\206"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\169\94\28\133\178", "\110\89\200\44\120\160\130")].Size = UDim2.fromOffset(400, 420);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\194\89\66\6\26", "\45\203\163\43\38\35\42\91")].Position = UDim2.fromScale(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\132\206\39\194\249", "\52\178\229\188\67\231\201")].AnchorPoint = Vector2.new(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\64\66\0\178\12", "\67\65\33\48\100\151\60")].BackgroundColor3 = Color3.fromRGB(12, 10, 5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\230\188\220\182\143", "\147\191\135\206\184")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\41\180\197\157\3", "\210\228\72\198\161\184\51")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\70\252\4\54\158", "\174\86\41\147\112\19")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\81\200\91", "\203\59\96\237\107\69\111\113")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\17\63\143\238\35\254\210\54", "\183\68\118\204\129\81\144"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\252\53\180", "\226\110\205\16\132\107")].CornerRadius = UDim.new(0, 14);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\146\165\137", "\33\139\163\128\185")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\89\22\218\18\8", "\190\55\56\100")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\187\121\78", "\147\54\207\92\126\115\131")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\56\24\6\105\31\113\6\52", "\30\109\81\85\29\109"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\101\17\230", "\156\159\17\52\214\86\190")].Color = Color3.fromRGB(212, 175, 55);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\251\248\236", "\220\206\143\221")].Thickness = 1.4;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\105\104\71", "\178\230\29\77\119\184\172")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\191\24\31\50\168", "\152\149\222\106\123\23")];
		task.spawn(function()
			while gui and gui.Parent and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\41\247\71\176\207\2\243\66\177\152\118", "\213\189\70\150\35")] do
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\66\113\13\65\102\113\26\89\92\119\13\10\5", "\104\47\53\20")]:Create(TABLE_TableIndirection["st%0"], TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\151\94\128\18\175\31\162\94\132\18\191\22", "\111\195\44\225\124\220")]=0.05,[LUAOBFUSACTOR_DECRYPT_STR_0("\236\78\9\112\160\165\221\85\19", "\203\184\38\96\19\203")]=2}):Play();
				end);
				task.wait(1.15);
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\124\120\69\203\43\87\124\64\202\124\35", "\174\89\19\25\33")] then
					break;
				end
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\5\87\75\249\180\14\61\4\91\77\242\194\91", "\107\79\114\50\46\151\231")]:Create(TABLE_TableIndirection["st%0"], TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\13\180\180\39\153\41\182\210\60\168\182\48", "\160\89\198\213\73\234\89\215")]=0.4,[LUAOBFUSACTOR_DECRYPT_STR_0("\124\121\189\253\206\70\116\167\237", "\165\40\17\212\158")]=1.2}):Play();
				end);
				task.wait(1.15);
			end
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\214\15\60\99\181", "\70\133\185\104\83")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\45\72\69\45\204\40\68\70\47\197", "\169\100\37\36\74"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\136\165\95\69\215", "\48\96\231\194")].Size = UDim2.fromOffset(64, 64);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\85\9\34\92\136", "\227\168\58\110\77\121\184\207")].Position = UDim2.new(0.5, -32, 0, 18);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\51\184\79\244\139", "\197\27\92\223\32\209\187\17")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\80\196\244\70\15", "\155\99\63\163")].Image = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\254\134\162\134\173\166\148\241", "\228\226\177\193\237\217")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\191\36\233\113\224", "\134\84\208\67")].ScaleType = Enum.ScaleType.Fit;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\163\129\83\86\252", "\60\115\204\230")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\59\249\116\162\106", "\16\135\90\139")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\125\18\63\75\17\40", "\24\52\20\102\83\46\52")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\240\42\57\48\35\197\45\36\40", "\111\164\79\65\68"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\208\151\210\43\175\150", "\138\166\185\227\190\78")].Size = UDim2.new(1, -20, 0, 26);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\125\209\59\87\102\73", "\121\171\20\165\87\50\67")].Position = UDim2.fromOffset(10, 90);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\49\173\58\188\71\150", "\98\166\88\217\86\217")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\255\109\13\131\153\166", "\188\150\150\25\97\230")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\253\187\122\39\40\212\154\161\106\38\54\200\246\165", "\141\186\233\63\98\108");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\227\56\186\32\180\186", "\69\145\138\76\214")].TextColor3 = Color3.fromRGB(255, 205, 70);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\100\198\157\133\186\83\32", "\118\16\175\233\233\223")].Font = Enum.Font.GothamBlack;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\141\33\183\235\206\45", "\29\235\228\85\219\142\235")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\221\174\209\114\11\119", "\50\93\180\218\189\23\46\71")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\165\73\72\1\140", "\40\190\196\59\44\36\188")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\64\206\241\170", "\109\92\37\188\212\154\29")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\48\234\188\215\29\91\6\234\168", "\58\100\143\196\163\81"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\71\49\230\111", "\110\122\34\67\195\95\41\133")].Size = UDim2.new(1, -20, 0, 16);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\180\73\15\134", "\182\21\209\59\42")].Position = UDim2.fromOffset(10, 118);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\82\215\88\113", "\222\215\55\165\125\65")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\212\212\95\162", "\42\76\177\166\122\146\161\141")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\175\55\253\80\89\139\207\85", "\22\197\234\101\174\25")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\109\116\185\156\54\131\248\167\9\17\151", "\230\77\84\197\188\22\207\183");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\17\212\185\220", "\85\153\116\166\156\236\193\144")].TextColor3 = Color3.fromRGB(150, 130, 80);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\229\95\246\180", "\96\196\128\45\211\132")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\136\105\26\130", "\184\85\237\27\63\178\207\212")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\92\27\26\88", "\63\104\57\105")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\134\182\64\78\215", "\36\107\231\196")];
		stageLabel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\105\176\186\147\113\180\160\130\81", "\231\61\213\194"));
		stageLabel.Size = UDim2.new(1, -20, 0, 18);
		stageLabel.Position = UDim2.fromOffset(10, 150);
		stageLabel.BackgroundTransparency = 1;
		stageLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\58\185\60\97\29\164\51\116\71\227\115", "\19\105\205\93");
		stageLabel.TextColor3 = Color3.fromRGB(240, 230, 200);
		stageLabel.Font = Enum.Font.GothamSemibold;
		stageLabel.TextScaled = true;
		stageLabel.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\9\204\133\122\249", "\95\201\104\190\225")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\202\211\236\168\142\145", "\174\207\171\161")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\203\236\12\254\253", "\183\141\158\109\147\152"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\8\244\46\43\76\182", "\108\76\105\134")].Size = UDim2.new(1, -40, 0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\196\163\195\201\174\149", "\174\139\165\209\129")].Position = UDim2.fromOffset(20, 182);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\178\240\227\193\70\32", "\24\195\211\130\161\166\99\16")].BackgroundColor3 = Color3.fromRGB(28, 22, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\2\251\14\84\83\22", "\118\38\99\137\76\51")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\39\23\48\14\101\173", "\64\157\70\101\114\105")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\169\181\231\85\16", "\112\32\200\199\131")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\2\25\232", "\66\76\48\60\216\163\203")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\143\175\90\252\77\192\33\168", "\68\218\230\25\147\63\174"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\120\22\28", "\214\205\74\51\44")].CornerRadius = UDim.new(1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\30\167\172", "\23\154\44\130\156")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\167\191\140\49\86\65", "\115\113\198\205\206\86")];
		barFill = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\162\69\255\87\129", "\58\228\55\158"));
		barFill.Size = UDim2.new(0, 0, 1, 0);
		barFill.BackgroundColor3 = Color3.fromRGB(255, 195, 40);
		barFill.BorderSizePixel = 0;
		barFill.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\136\194\12\59\232\101", "\85\212\233\176\78\92\205")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\11\205\178", "\130\42\56\232")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\223\156\7\236\82\49\239\167", "\95\138\213\68\131\32"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\123\228\19", "\22\74\72\193\35")].CornerRadius = UDim.new(1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\42\161\8", "\56\76\25\132")].Parent = barFill;
		pctLabel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\106\196\179\50\227\95\195\174\42", "\175\62\161\203\70"));
		pctLabel.Size = UDim2.new(1, -20, 0, 16);
		pctLabel.Position = UDim2.fromOffset(10, 200);
		pctLabel.BackgroundTransparency = 1;
		pctLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\108\152", "\85\92\189\163\115");
		pctLabel.TextColor3 = Color3.fromRGB(255, 210, 80);
		pctLabel.Font = Enum.Font.GothamBold;
		pctLabel.TextScaled = true;
		pctLabel.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\173\34\60\108\252", "\88\73\204\80")];
		statusLabel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\26\134\8\82\5\219\44\134\28", "\186\78\227\112\38\73"));
		statusLabel.Size = UDim2.new(1, -20, 0, 16);
		statusLabel.Position = UDim2.fromOffset(10, 220);
		statusLabel.BackgroundTransparency = 1;
		statusLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\204\91\248\84\64\127\188\64\252\92\71", "\26\156\55\157\53\51");
		statusLabel.TextColor3 = Color3.fromRGB(180, 160, 110);
		statusLabel.Font = Enum.Font.Gotham;
		statusLabel.TextScaled = true;
		statusLabel.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\217\4\221\253\0", "\48\236\184\118\185\216")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\178\80\22\221\53\232\184\18\96", "\84\133\221\55\80\175")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\155\245\37\171\194", "\60\221\135\68\198\167"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\178\255\165\80\216\227\184\189\211", "\185\142\221\152\227\34")].Size = UDim2.new(1, -28, 0, 150);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\202\80\220\81\50\250\93\128\7", "\151\56\165\55\154\35\83")].Position = UDim2.fromOffset(14, 250);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\76\2\200\178\66\8\235\229\19", "\142\192\35\101")].BackgroundColor3 = Color3.fromRGB(8, 7, 4);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\122\46\133\245\141\161\19\147\37", "\118\182\21\73\195\135\236\204")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\51\29\102\22\12\240\13\121\74", "\157\104\92\122\32\100\109")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\167\221\206\120\119", "\203\195\198\175\170\93\71\237")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\31\123\133", "\156\78\43\94\181\49\113")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\71\193\231\172\25\77\124\96", "\25\18\136\164\195\107\35"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\121\236\31", "\216\136\77\201\47\18\220\161")].CornerRadius = UDim.new(0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\184\110\138", "\226\77\140\75\186\104\188")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\193\215\25\93\184\195\213\122\31", "\47\217\174\176\95")];
		logBox = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\140\216\110\22\158\85\122\35\180", "\70\216\189\22\98\210\52\24"));
		logBox.Size = UDim2.new(1, -12, 1, -10);
		logBox.Position = UDim2.fromOffset(6, 5);
		logBox.BackgroundTransparency = 1;
		logBox.Text = "";
		logBox.TextColor3 = Color3.fromRGB(200, 185, 140);
		logBox.Font = Enum.Font.Code;
		logBox.TextSize = 12;
		logBox.TextXAlignment = Enum.TextXAlignment.Left;
		logBox.TextYAlignment = Enum.TextYAlignment.Top;
		logBox.TextWrapped = true;
		logBox.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\208\164\161\193\219\210\166\194\131", "\179\186\191\195\231")];
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\194\19\23\229\253\58\10\217\185\24\45\205\185\60\10\225\248\43\29\224", "\132\153\95\120"));
		pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\150\135\39\109\244\200\165\176\166\11\41", "\192\209\210\110\77\151\186"));
	end
	local function showError(stage, err)
		err = tostring(err);
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\219\47\45\232\251\193\242\62\98\204\205\246\207\49", "\164\128\99\66\137\159"), stage, err);
		pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\38\168\192\146\90\201", "\222\96\233\137") .. stage);
		pushLog(string.sub(err, 1, 160));
		setProgress(0, LUAOBFUSACTOR_DECRYPT_STR_0("\149\156\134\59\200\213\209\144\159\130\59", "\144\217\211\199\127\232\147"), stage);
		if not gui then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\46\44\44\144\21", "\36\152\79\94\72\181\37\98")] = gui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\229\215\72\43", "\95\183\184\39")) and gui.Root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\150\62\245\34", "\98\213\95\135\70\52\224"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\172\198\99\17\174", "\52\158\195\169\23")] = gui:GetChildren()[1];
		card = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\104\179\61\96\195\101", "\235\26\220\82\20\230\85\27")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\174\230\214\49\216", "\20\232\193\137\162")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\1\222\215\162", "\17\66\191\165\198\135\236\119"))) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\160\161\7\186\184", "\177\111\207\206\115\159\136\140")];
		if not card then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\140\4\6\205\10\15", "\63\101\233\112\116\180\47")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\247\62\245\6\218\35\215\47\226\28", "\86\163\91\141\114\152"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\14\96\97\35\22\91", "\90\51\107\20\19")].Size = UDim2.new(0.42, 0, 0, 32);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\245\145\253\36\200\160", "\93\237\144\229\143")].Position = UDim2.new(0.06, 0, 1, -44);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\243\228\11\18\3\69", "\38\117\150\144\121\107")].BackgroundColor3 = Color3.fromRGB(45, 36, 12);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\190\250\40\52\254\190", "\90\77\219\142")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\212\33\21\11\117", "\26\134\100\65\89\44\103");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\230\36\49\189\180\179", "\196\145\131\80\67")].TextColor3 = Color3.fromRGB(255, 230, 160);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\181\18\26\1\173\78", "\136\126\208\102\104\120")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\143\218\81\182\23\109", "\49\24\234\174\35\207\50\93")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\247\233\154\104\73\162", "\17\108\146\157\232")].Parent = card;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\192\81\189", "\200\43\163\116\141\79")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\138\31\30\140\162\250\230\173", "\131\223\86\93\227\208\148"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\70\243\230", "\213\131\37\214\214\125")].CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\40\96\239", "\129\70\75\69\223")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\206\231\251\101\170\22", "\143\38\171\147\137\28")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\141\169\234\70\179", "\180\176\226\217\147\99\131")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\231\188\55\19\241\172\59\19\220\183", "\103\179\217\79"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\184\12\204\4\220", "\195\42\215\124\181\33\236")].Size = UDim2.new(0.42, 0, 0, 32);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\86\39\39\96\168", "\152\109\57\87\94\69")].Position = UDim2.new(0.52, 0, 1, -44);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\216\26\186\251\130", "\200\153\183\106\195\222\178\52")].BackgroundColor3 = Color3.fromRGB(30, 24, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\236\152\36\12\10", "\58\82\131\232\93\41")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\160\120\224\44\29\26\177\101\255\39", "\95\227\55\176\117\61");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\113\51\82\238\72", "\203\120\30\67\43")].TextColor3 = Color3.fromRGB(255, 230, 160);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\42\93\246\156\161", "\185\145\69\45\143")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\16\9\191\153\218", "\188\234\127\121\198")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\61\3\154\125\98", "\227\88\82\115")].Parent = card;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\28\255\247", "\19\35\127\218\199\98")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\41\210\41\237\14\245\15\240", "\130\124\155\106"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\200\179\255", "\223\181\171\150\207\195\150\28")].CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\57\166\254", "\105\44\90\131\206")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\239\162\160\77\110", "\94\159\128\210\217\104")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\246\22\166\26\47", "\26\48\153\102\223\63\31\153")].MouseButton1Click:Connect(function()
			pcall(function()
				if setclipboard then
					setclipboard(stage .. "\n" .. err);
				end
			end);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\69\249\225\27\5\189", "\147\98\32\141")].MouseButton1Click:Connect(function()
			destroyGui();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\102\205\252\67\6", "\43\120\35\131\170\102\54")].GreedyLoader_Running = false;
			task.spawn(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\20\132\243\245", "\228\52\102\231\214\197\208")] = select(1, httpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\22\244\97\218\249\209\86\153\25\242\112\207\238\146\17\195\26\250\112\198\230\197\1\207\4\175\121\197\235\143\28\196\80\236\96\203", "\182\126\128\21\170\138\235\121"), 12));
				if ((type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\200\54\163\214", "\102\235\186\85\134\230\115\80")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\68\24\44\86\124\211", "\66\55\108\94\63\18\180")) and (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\159\134\114\119", "\57\116\237\229\87\71")] > 50)) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\191\168\183", "\39\202\209\141\135\23\142")] = loadstring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\33\10\79\98", "\152\159\83\105\106\82")]);
					if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\200\20\162", "\60\225\166\49\146\169")] then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\16\106\122", "\103\79\126\79\74\97")]();
					end
				end
			end);
		end);
	end
	local function readSession()
		local ok, raw = pcall(function()
			if (isfile and isfile(LUAOBFUSACTOR_DECRYPT_STR_0("\157\109\214\118\90\3\146\106\215\105\91\22\182\48\192\118\77\9\179\112\221\61\89\18", "\122\218\31\179\19\62"))) then
				return readfile(LUAOBFUSACTOR_DECRYPT_STR_0("\148\196\200\196\205\184\109\166\210\215\196\197\173\10\160\211\222\210\192\174\75\253\209\197", "\37\211\182\173\161\169\193"));
			end
		end);
		if (ok and (type(raw) == LUAOBFUSACTOR_DECRYPT_STR_0("\228\46\95\208\38\124", "\217\151\90\45\185\72\27")) and (raw ~= "")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\125\245\6\69\134\44", "\54\163\28\135\114")] = {};
			for bit in string.gmatch(raw, LUAOBFUSACTOR_DECRYPT_STR_0("\19\229\65\191\5", "\31\72\187\61\226\46")) do
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\7\81\198\84\59\116", "\68\163\102\35\178\39\30")][#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\113\200\211\16\240\211", "\113\222\16\186\167\99\213\227")] + 1] = bit;
			end
			if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\15\233\226\61\75\171", "\150\78\110\155")][1] == LUAOBFUSACTOR_DECRYPT_STR_0("\162\237\20\196\151\45\150\111\171\250\49\176", "\32\229\165\71\129\196\126\223")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\136\214\149\146\144\147", "\181\163\233\164\225\225")][3]) then
				return {[LUAOBFUSACTOR_DECRYPT_STR_0("\69\152\59\101\94\138\51\114", "\23\48\235\94")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\219\202\73\68\118\130", "\178\28\186\184\61\55\83")][2],[LUAOBFUSACTOR_DECRYPT_STR_0("\207\200\94", "\149\164\173\39\92\146\110")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\38\2\11\9\94\163", "\123\147\71\112\127\122")][3],[LUAOBFUSACTOR_DECRYPT_STR_0("\201\213\146\120\84\201\222\189\112\82", "\38\172\173\226\17")]=tonumber(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\93\16\62\251\94\84\124", "\143\45\113\76")][4])};
			end
		end
		if ((type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\157\50\10\253\232", "\92\216\216\124")].GreedyAuth) == LUAOBFUSACTOR_DECRYPT_STR_0("\79\51\174\76\248", "\157\59\82\204\32")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\27\205\204\172\186", "\209\88\94\131\154\137\138\179")].GreedyAuth.key) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\132\234\74\91\115", "\66\72\193\164\28\126\67\81")].GreedyAuth;
		end
		return nil;
	end
	local function validateKeyOnline(key)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\41\187\29\118", "\22\135\76\200\56\70")] = httpRequest({[LUAOBFUSACTOR_DECRYPT_STR_0("\184\34\244", "\129\237\80\152\68\61")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\137\40\218\56\54\108\116\151\49\193\48\82\8", "\56\49\200\100\147\124\119")],[LUAOBFUSACTOR_DECRYPT_STR_0("\225\59\171\248\195\58", "\144\172\94\223")]=LUAOBFUSACTOR_DECRYPT_STR_0("\20\32\145\115", "\39\68\111\194"),[LUAOBFUSACTOR_DECRYPT_STR_0("\254\163\230\195\124\165\197", "\215\182\198\135\167\25")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\174\70\228\92\136\71\254\5\185\80\250\77", "\40\237\41\138")]=LUAOBFUSACTOR_DECRYPT_STR_0("\198\100\234\244\67\196\117\238\241\69\201\59\240\235\69\201", "\42\167\20\154\152")},[LUAOBFUSACTOR_DECRYPT_STR_0("\104\241\166\91", "\65\42\158\194\34\17")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\51\70\28\30\232\9\248\19\36\87\73\125", "\142\122\71\50\108\77\141\123")]:JSONEncode({[LUAOBFUSACTOR_DECRYPT_STR_0("\30\167\230", "\91\117\194\159\120")]=key,[LUAOBFUSACTOR_DECRYPT_STR_0("\15\14\59\10\59\240\41\31", "\68\122\125\94\120\85\145")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\16\206\71\205\203\255\71", "\218\119\124\175\62\168\185")].Name})});
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\245\91\129\245", "\164\197\144\40")] then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\128\255\164\133\216\181\151\249\165\133\226\176\130\249\166\142\217", "\214\227\144\202\235\189");
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\164\147\122\85\227", "\92\141\197\231\27\112\211\51")] = nil;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\244\207\243", "\177\134\159\234\195")] = pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\234\43\161\140\237", "\169\221\139\95\192")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\159\107\47\17\35\204\157\118\60\39\99\142", "\70\190\235\31\95\66")]:JSONDecode(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\231\9\163\181", "\133\218\130\122\134")].Body or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\250\240\129\140", "\88\92\159\131\164\188\195")].body or "");
		end);
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\37\250\27", "\189\224\78\223\43\183\139")] or (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\253\158\23\132\126", "\161\78\156\234\118")]) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\179\182\203\208\162", "\188\199\215\169"))) then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\245\7\73\122\228\245\13\96\105\237\239\25\80\117\251\249", "\136\156\105\63\27");
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\141\109\53\94\220", "\84\123\236\25")].valid == true) then
			return true, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\138\190\22\233\229", "\213\144\235\202\119\204")].expires_at or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\25\202\43\109\115", "\45\67\120\190\74\72\67")].expiresAt;
		end
		return false, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\35\249\164\188\216", "\137\64\66\141\197\153\232\142")].reason or LUAOBFUSACTOR_DECRYPT_STR_0("\10\222\52\167\132\10\212\29\173\141\26", "\232\99\176\66\198");
	end
	local function ensureKey()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\36\59\21\62\221", "\76\140\65\72\102\27\237\153")] = readSession();
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\223\5\193\146\81", "\222\42\186\118\178\183\97")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\233\87\153\24\188", "\234\61\140\36")].key) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\36\197\170\55\95", "\111\65\189\218\18")] = tonumber(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\78\8\38\78\12", "\207\35\43\123\85\107\60")].expires_at);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\185\165\248\86\123\239\240", "\25\16\202\192\138")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\206\190\241\236\164", "\148\157\171\205\130\201")].username or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\209\103\58\148\166", "\150\67\180\20\73\177")].username == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\20\27\84\136\10\95\29", "\45\237\120\122")].Name);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\225\175\41\248\227\231\124", "\76\183\136\194")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\254\245\125\0", "\116\26\134\133\88\48\47")] or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\217\176\161\237", "\18\126\161\192\132\221")] > os.time());
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\59\171\22\121\84\109\254", "\54\63\72\206\100")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\80\72\127\202\112\141\9", "\27\168\57\37\26\133")]) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\143\82\158\146\125", "\183\77\202\28\200")].GreedyAuth = {[LUAOBFUSACTOR_DECRYPT_STR_0("\28\54\144", "\104\119\83\233")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\253\52\49\6\165", "\35\149\152\71\66")].key,[LUAOBFUSACTOR_DECRYPT_STR_0("\12\251\71\162\52\24\229\71", "\90\121\136\34\208")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\2\84\7\194\28\16\78", "\126\167\110\53")].Name,[LUAOBFUSACTOR_DECRYPT_STR_0("\56\8\62\241\206\58\46\47\47\236", "\95\93\112\78\152\188")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\237\149\80\180", "\178\161\149\229\117\132\222")],[LUAOBFUSACTOR_DECRYPT_STR_0("\156\200", "\67\232\187\189\204\193\118\198")]=os.time()};
				pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\184\43\166\51\50\13\225\203\58\167\53\40\22\234\143", "\143\235\78\213\64\91\98"));
				task.spawn(function()
					local ok, reason = validateKeyOnline(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\77\151\250\53\230", "\214\237\40\228\137\16")].key);
					if (not ok and (reason ~= LUAOBFUSACTOR_DECRYPT_STR_0("\134\236\225\215\6\165\145\234\224\215\60\160\132\234\227\220\7", "\198\229\131\143\185\99")) and (reason ~= LUAOBFUSACTOR_DECRYPT_STR_0("\88\130\190\114\93\133\172\76\67\137\187\99\94\130\187\118", "\19\49\236\200"))) then
						warn(LUAOBFUSACTOR_DECRYPT_STR_0("\197\27\249\182\224\191\236\10\182\181\227\250\245\50\239\237", "\218\158\87\150\215\132"), reason);
					end
				end);
				return true;
			end
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\59\247\212\115\114", "\173\155\126\185\130\86\66")].GreedyOfficial or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\131\148\241\205\188", "\140\133\198\218\167\232")].GreedyLoader_Done) then
			return true;
		end
		pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\158\43\173\61\150\176\63\161\116\150\176\42", "\228\213\78\212\29"));
		setProgress(8, LUAOBFUSACTOR_DECRYPT_STR_0("\172\73\175", "\139\231\44\214\101"), LUAOBFUSACTOR_DECRYPT_STR_0("\252\225\18\91\2\241\61\31\218\234\8\77\21\241\58\19\192", "\118\185\143\102\62\112\209\81"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\126\37\233\166\30\25\60\25\32", "\88\60\16\73\134\197\117\124")] = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\239\189\152", "\33\48\138\152\168")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\80\31\62\85\192\53\126\19\21\71\196\57\102", "\87\18\118\80\49\161"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\25\159\240", "\208\44\126\186\192")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\196\25\182\195\17\242\238\91\254", "\46\151\122\196\166\116\156\169"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\234\3\74", "\155\133\141\38\122")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\2\56\169\68\75\102\142\32\51\139\64\91\122", "\197\69\74\204\33\47\31");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\72\31\215", "\231\144\47\58")].ResetOnSpawn = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\223\159\37", "\89\210\184\186\21\120\93\175")].IgnoreGuiInset = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\84\57\133", "\90\209\51\28\181\25")].DisplayOrder = 1001;
		parentGui(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\124\18\190", "\223\176\27\55\142")]);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\178\195\240\116", "\213\68\219\174")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\45\242\34\234\47", "\31\107\128\67\135\74\165\95"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\225\241\8\17", "\209\184\136\156\45\33")].Size = UDim2.fromScale(1, 1);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\193\120\77\232", "\216\103\168\21\104")].BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\164\78\225\40", "\196\24\205\35")].BackgroundTransparency = 0.45;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\130\238\67\126", "\102\78\235\131")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\39\57\1\23", "\84\154\78\84\36\39\89\215")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\230\19\8", "\101\157\129\54\56")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\165\133\188\102\41", "\25\125\201\234\203\67")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\95\230\25\14\17", "\115\25\148\120\99\116\71"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\49\182\51\4\92", "\33\108\93\217\68")].Size = UDim2.fromOffset(340, 210);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\71\174\186\158\27", "\205\187\43\193")].Position = UDim2.fromScale(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\126\10\200\187\34", "\191\158\18\101")].AnchorPoint = Vector2.new(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\207\136\160\234\149", "\207\165\163\231\215")].BackgroundColor3 = Color3.fromRGB(255, 190, 40);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\245\246\65\97\32", "\16\166\153\153\54\68")].BackgroundTransparency = 0.82;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\191\207\81\113\113", "\153\178\211\160\38\84\65")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\7\85\60\199\91", "\75\226\107\58")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\217\84\42", "\173\56\190\113\26\113\162")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\210\34\18\212\142\142", "\151\171\190\77\101")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\240\6\219\166\234\115\14\215", "\107\165\79\152\201\152\29"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\66\231\220\119\58\7", "\31\55\46\136\171\52")].CornerRadius = UDim.new(0, 22);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\36\211\227\242\109\140", "\148\177\72\188")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\186\88\196\227\230", "\179\198\214\55")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\0\125\97\23\150\160", "\179\144\108\18\22\37")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\224\177\26\132\202", "\175\166\195\123\233"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\206\82\94\162\170\146", "\144\143\162\61\41")].Size = UDim2.fromOffset(320, 190);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\223\18\71\32\194\99", "\83\128\179\125\48\18\231")].Position = UDim2.fromScale(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\187\252\202\21\91\13", "\126\61\215\147\189\39")].AnchorPoint = Vector2.new(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\243\18\82\42\186\77", "\37\24\159\125")].BackgroundColor3 = Color3.fromRGB(255, 210, 80);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\170\122\85\136\227\37", "\34\186\198\21")].BackgroundTransparency = 0.88;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\4\202\74\144\189\88", "\162\152\104\165\61")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\35\189\106\34\160\157", "\133\173\79\210\29\16")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\123\168\123", "\75\237\28\141")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\83\195\166\125\56\162\177", "\129\188\63\172\209\79\123\135")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\117\205\197\194\82\234\227\223", "\173\32\132\134"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\23\7\248\252\18\136\30", "\173\46\123\104\143\206\81")].CornerRadius = UDim.new(0, 18);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\17\45\157\23\160\68\228", "\97\212\125\66\234\37\227")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\239\185\34\76\207\179", "\126\234\131\214\85")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\144\25", "\47\228\181\41\58")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\128\238\216\54\6", "\127\198\156\185\91\99\80"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\95\156", "\190\149\122\172\144\199\107\89")].Size = UDim2.fromOffset(300, 168);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\64\161", "\158\82\101\145\158")].Position = UDim2.fromScale(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\187\82", "\36\16\158\98\118")].AnchorPoint = Vector2.new(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\83\147", "\133\160\118\163\155\56\136\71")].BackgroundColor3 = Color3.fromRGB(14, 11, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\231\33", "\213\150\194\17\146\214\127")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\236\244", "\86\123\201\196\180\38\196\194")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\239\156\255", "\207\151\136\185")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\128\109\210", "\17\200\227\72\226\20\24")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\133\104\56\216\219\255\234\237", "\159\208\33\123\183\169\145\143"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\89\125\102", "\86\146\58\88")].CornerRadius = UDim.new(0, 14);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\220\175\144", "\154\56\191\138\160\206\137\86")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\28\165", "\172\230\57\149\231\28\90\225")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\190\148\221\35\222\71\250", "\187\98\202\230\178\72")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\20\200\151\36\88\46\234\161", "\42\65\129\196\80"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\94\79\213\28\2\71\190", "\142\98\42\61\186\119\103\98")].Color = Color3.fromRGB(255, 200, 60);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\171\16\7\51\186\71\88", "\104\88\223\98")].Thickness = 1.6;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\227\240\193\9\232\1\167", "\141\36\151\130\174\98")].Transparency = 0.15;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\110\208\2\143\127\135\93", "\109\228\26\162")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\160\173", "\134\62\133\157\24\128")];
		task.spawn(function()
			while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\162\95\137", "\182\103\197\122\185\79\209")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\128\164\39", "\40\147\231\129\23\96")].Parent and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\246\128\74\184\167\217\113\189\220", "\188\21\152\236\37\219\204")] do
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\254\50\9\78\218\50\30\86\224\52\9\5\185", "\108\32\137\87")]:Create(TABLE_TableIndirection["stroke%0"], TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\158\250\1\168\60\233\74\75\175\230\3\191", "\57\202\136\96\198\79\153\43")]=0.05,[LUAOBFUSACTOR_DECRYPT_STR_0("\159\43\163\164\134\169\253\184\48", "\152\203\67\202\199\237\199")]=2.2}):Play();
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\84\165\10\17\70\124\244\236\74\163\10\90\37", "\134\154\35\192\111\127\21\25")]:Create(TABLE_TableIndirection["glow%0"], TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\154\39\10\1\39\192\183\51\7\14\20\192\185\40\26\26\33\192\189\40\10\19", "\178\216\70\105\106\64")]=0.72,[LUAOBFUSACTOR_DECRYPT_STR_0("\12\34\96\243", "\224\95\75\26\150\169\181\180")]=UDim2.fromOffset(350, 218)}):Play();
				end);
				task.wait(0.95);
				if (not (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\221\157\120", "\22\107\186\184\72\36\204")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\186\97\30", "\110\135\221\68\46")].Parent) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\56\0\228\205\184\62\231\115\92", "\91\131\86\108\139\174\211")]) then
					break;
				end
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\60\189\18\83\200\46\170\1\84\248\46\253\71", "\61\155\75\216\119")]:Create(TABLE_TableIndirection["stroke%0"], TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\48\185\179\50\75\25\220\22\174\188\63\65", "\189\100\203\210\92\56\105")]=0.35,[LUAOBFUSACTOR_DECRYPT_STR_0("\27\89\244\43\36\95\248\59\60", "\72\79\49\157")]=1.3}):Play();
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\167\52\185\134\131\52\174\158\185\50\185\205\224", "\220\232\208\81")]:Create(TABLE_TableIndirection["glow%0"], TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\215\191\230\59\43\72\174\224\176\225\4\62\91\175\230\174\228\34\41\84\162\236", "\193\149\222\133\80\76\58")]=0.88,[LUAOBFUSACTOR_DECRYPT_STR_0("\245\84\85\215", "\178\166\61\47")]=UDim2.fromOffset(330, 200)}):Play();
				end);
				task.wait(0.95);
			end
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\67\252\118\207\123\171", "\94\155\42\136\26\170")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\176\58\62\161\168\62\36\176\136", "\213\228\95\70"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\178\214\136\114\111\235", "\23\74\219\162\228")].Size = UDim2.new(1, -24, 0, 22);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\239\82\163\62\124\182", "\91\89\134\38\207")].Position = UDim2.fromOffset(12, 12);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\231\220\58\22\149\119", "\71\36\142\168\86\115\176")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\168\102\179\6\251\6", "\41\191\193\18\223\99\222\54")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\142\8\243\15\152\235\13\226\19", "\202\203\70\167\74");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\56\8\200\63\116\105\81", "\17\76\97\188\83")].TextColor3 = Color3.fromRGB(255, 210, 80);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\46\205\59\53\198\27", "\195\229\71\185\87\80\227\43")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\245\20\92\234\165\172", "\143\128\156\96\48")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\172\216\228\30\18\253\129", "\119\216\177\144\114")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\108\169", "\34\169\73\153")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\227\19\206\250", "\235\202\140\107")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\56\113\44\188\203\40\239", "\165\108\20\84\200\137\71\151"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\187\51\205\42", "\232\26\212\75")].Size = UDim2.new(1, -24, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\70\106\173\167", "\151\87\41\18\136")].Position = UDim2.fromOffset(12, 42);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\160\210\149\174", "\158\59\207\170\176")].BackgroundColor3 = Color3.fromRGB(20, 16, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\81\43\12\220", "\236\47\62\83\41")].PlaceholderText = LUAOBFUSACTOR_DECRYPT_STR_0("\221\129\109\3\146\186\194", "\226\154\201\64\91\202");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\70\5\93\26", "\220\161\41\125\120\42")].Text = "";
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\126\184\75\236", "\110\220\17\192")].TextColor3 = Color3.fromRGB(255, 240, 200);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\118\44\95\187", "\199\20\25\84\122\139\87\145")].PlaceholderColor3 = Color3.fromRGB(140, 120, 70);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\6\197\235\75", "\138\39\105\189\206\123")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\8\145\104\163", "\159\127\103\233\77\147\153\175")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\255\252\239\16", "\171\103\144\132\202\32")].ClearTextOnFocus = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\32\241\73\64", "\108\112\79\137")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\135\36", "\85\95\162\20\72\205\97\137")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\254\111\140", "\173\151\157\74\188\109\152")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\17\33\27\210\206\90\208\225", "\147\68\104\88\189\188\52\181"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\139\206\128", "\176\122\232\235")].CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\118\127\31", "\142\224\21\90\47")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\219\63\19\244", "\229\20\180\71\54\196\235")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\109\132\179", "\224\73\30\161\131\149\202")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\196\204\194\68\227\234\250\85", "\48\145\133\145"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\95\240\190", "\76\58\44\213\142\177")].Color = Color3.fromRGB(180, 140, 40);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\55\87\125", "\24\171\68\114\77")].Thickness = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\14\21\2", "\205\143\125\48\50\231\190\100")].Transparency = 0.4;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\180\81\85", "\194\161\199\116\101\129\131\191")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\43\208\237\167", "\194\140\68\168\200\151")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\232\210\96\165", "\149\34\155\181\69")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\55\248\205\238\47\252\215\255\15", "\154\99\157\181"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\128\28\235\229\188", "\140\237\111\140\192")].Size = UDim2.new(1, -24, 0, 14);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\10\122\93\86", "\120\102\121\29")].Position = UDim2.fromOffset(12, 80);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\240\190\126\252", "\91\204\131\217")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\236\82\145\227", "\158\174\159\53\180\211\189")].Text = "";
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\238\234\152\39", "\213\50\157\141\189\23")].TextColor3 = Color3.fromRGB(255, 160, 60);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\53\131\229\34", "\196\158\70\228\192\18")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\76\22\11\137", "\185\42\63\113\46")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\206\38\124\75", "\123\180\189\65\89")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\201\160", "\233\162\236\144\132")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\203\187\74", "\63\210\164\158\122\217\150")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\7\206\238\248\107\237\39\223\249\226", "\152\83\171\150\140\41"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\234\198\99", "\104\226\133\227\83\180\123")].Size = UDim2.new(1, -24, 0, 32);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\4\102\0", "\48\99\107\67")].Position = UDim2.fromOffset(12, 100);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\169\56\128", "\27\190\198\29\176\77")].BackgroundColor3 = Color3.fromRGB(55, 42, 12);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\68\184\100", "\46\143\43\157\84\201")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\98\86\122\237\124\56", "\168\55\24\54\162\63\115");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\245\101\208", "\174\119\154\64\224\178")].TextColor3 = Color3.fromRGB(255, 235, 180);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\113\128\43", "\132\74\30\165\27\101\199\122")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\232\186\247", "\212\79\135\159\199\199\213")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\175\240\23", "\120\25\192\213\39\60\183")].AutoButtonColor = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\79\122\24", "\40\120\32\95")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\238\105", "\127\90\203\89\26\207")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\54\234\155", "\157\189\85\207\171\105")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\243\136\251\186\17\200\164\202", "\99\166\193\184\213"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\180\197\235", "\234\182\215\224\219\108")].CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\130\254\101", "\85\160\225\219")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\10\198\153", "\43\60\101\227\169\86\188")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\219\148\239", "\87\16\168\177\223\58\172\217")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\1\228\106\201\41\59\198\92", "\91\84\173\57\189"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\170\73\172", "\182\112\217\108\156\192")].Color = Color3.fromRGB(255, 200, 50);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\27\13\191", "\235\202\104\40\143")].Thickness = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\152\94\233", "\217\109\235\123")].Transparency = 0.35;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\154\59\6", "\221\71\233\30\54\16\176\173")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\243\27\239", "\223\84\156\62")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\249\246\152\231", "\91\182\156\130\189\215")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\74\118\180\65\92\102\184\65\113\125", "\53\30\19\204"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\229\100\193\247", "\199\153\128\16\228")].Size = UDim2.new(1, -24, 0, 22);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\47\241\92\247", "\199\177\74\133\121")].Position = UDim2.fromOffset(12, 138);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\204\168\187\103", "\74\216\169\220\158\87\166")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\38\7\105\10", "\58\136\67\115\76")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\214\175\204\25\142\37\178", "\61\145\202\184\57\229\64\203");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\87\157\2\12", "\39\60\50\233")].TextColor3 = Color3.fromRGB(190, 165, 90);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\54\183\105\210", "\195\122\83\195\76\226\72\210")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\209\47\187\113", "\65\132\180\91\158")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\121\197\107\85", "\78\101\28\177")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\241\176", "\49\69\212\128")];
		local function finishOk()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\2\220\253\226\28\9\212\183\177", "\129\119\108\176\146")] = true;
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\200\66\157", "\124\92\175\103\173\69\110")]:Destroy();
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\61\70\103", "\87\161\88\99")]:Fire();
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\252\251\137\231", "\67\114\153\143\172\215\176")].MouseButton1Click:Connect(function()
			pcall(function()
				if setclipboard then
					setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\135\215\49\146\139\192\37\251\242", "\110\222\194\142")]);
				end
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\202\28\236\2", "\193\119\185\123\201\50")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\91\1\247\45\79\122\16\103\1\252\34", "\127\23\104\153\70\111\25");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\20\161\234\123", "\211\105\103\198\207\75\76\215")].TextColor3 = Color3.fromRGB(120, 220, 120);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\168\245\191", "\214\174\199\208\143\30\108\218")].MouseButton1Click:Connect(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\129\18\239\245", "\41\113\228\107\202\197\54\184")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\130\32\25\42", "\60\26\237\88")].Text or ""):gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\230\111\103\173", "\206\184\74\20\134"), ""):gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\125\247\165\245", "\172\88\132\142\209\147\42\88"), "");
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\143\213\72\102", "\222\231\234\172\109\86\149")] == "") then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\252\199\93\189", "\120\141\143\160")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\101\162\162\87\82\236\189\87\89", "\50\32\204\214");
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\84\50\60\227", "\113\230\39\85\25\211")].TextColor3 = Color3.fromRGB(255, 160, 60);
				return;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\180\67\184", "\43\190\219\102\136\71\171\203")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\108\48\126", "\57\66\30\80");
			task.spawn(function()
				local ok, expOrReason = validateKeyOnline(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\221\185\80\212", "\228\73\184\192\117\228\89\148")]);
				if ok then
					pcall(function()
						if (makefolder and not isfolder(LUAOBFUSACTOR_DECRYPT_STR_0("\232\155\112\17\203\144\93\1\203\147\112\24\195", "\116\175\233\21"))) then
							makefolder(LUAOBFUSACTOR_DECRYPT_STR_0("\217\234\187\67\223\40\23\235\252\164\67\215\61", "\95\158\152\222\38\187\81"));
						end
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\180\59\183\230\152", "\168\152\221\85\210\195")] = table.concat({LUAOBFUSACTOR_DECRYPT_STR_0("\140\246\198\162\152\237\220\168\133\225\227\214", "\231\203\190\149"),TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\49\226\232\185\231\94\157", "\123\173\93\131\145\220\149")].Name,TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\193\244\100\36", "\153\118\164\141\65\20")],tostring(expOrReason or (os.time() + 86400)),tostring(os.time()),"x"}, "|");
						if writefile then
							writefile(LUAOBFUSACTOR_DECRYPT_STR_0("\201\32\131\231\243\25\198\39\130\248\242\12\226\125\149\231\228\19\231\61\136\172\240\8", "\96\142\82\230\130\151"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\185\65\71\161\190", "\142\47\208\47\34\132")]);
						end
					end);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\155\42\52\30\12", "\60\150\222\100\98\59")].GreedyAuth = {[LUAOBFUSACTOR_DECRYPT_STR_0("\78\57\78", "\81\37\92\55\54\187\218")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\11\65\180\114\209", "\225\96\36\205\87")],[LUAOBFUSACTOR_DECRYPT_STR_0("\252\181\71\107\114\78\4\236", "\105\137\198\34\25\28\47")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\165\64\111\197\3\236\17", "\160\113\201\33\22")].Name,[LUAOBFUSACTOR_DECRYPT_STR_0("\209\64\188\174\187\168\199\103\173\179", "\205\180\56\204\199\201")]=expOrReason,[LUAOBFUSACTOR_DECRYPT_STR_0("\151\205", "\120\227\190\92")]=os.time()};
					finishOk();
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\79\24\62\115", "\130\93\60\127\27\67\60\185")].Text = tostring(expOrReason);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\33\63\11\176", "\29\40\82\88\46\128\35")].TextColor3 = Color3.fromRGB(255, 100, 90);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\74\145\77", "\216\91\37\180\125\97")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\16\88\48\236\116\14", "\55\69\22\124\163");
				end
			end);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\214\25\184", "\148\24\179\60\136\191\17\48")].Event:Wait();
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\36\245\175\245\185\47\253\229\166", "\150\210\74\153\192")];
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\216\228\55\139\113\127\166\222\136\51\143\108\58\167\247\201\63\143\59\52\250", "\212\131\168\88\234\21\26"));
	if not ensureKey() then
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\126\88\134\141\60\34\87\73\201\135\61\62\5\122\134\152\120\55\87\123\159\133\60\34\65", "\71\37\20\233\236\88"));
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\246\106\191\23\68\233\94\97\141\77\181\15\0\226\67\72\141\86\162\25\86\229\72\89\201", "\60\173\38\208\118\32\140\44"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\23\207\229\101\159", "\175\33\82\129\179\64")].GreedyLoader_Running = false;
		return;
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\213\195\63\206\56\183\252\210\112\196\57\171\174\192\27", "\210\142\143\80\175\92"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\204\221\240\252\185", "\166\217\137\147")].GreedyLoader_Auth = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\183\102\182\194\67\241\181\123\165\244\3\179", "\38\131\195\18\198\145")]:GenerateGUID(false);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\243\20\221\125\4", "\52\51\182\90\139\88")].GreedyLoader_Token = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\156\254\209\6\166", "\35\150\217\176\135")].GreedyLoader_Auth;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\117\37\58\50\19", "\22\153\48\107\108\23\35")].GreedyLoader_Done = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\160\149\44\58\37", "\137\110\229\219\122\31\21\33")].GreedyOfficial = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\152\22\77\115\27", "\30\122\221\88\27\86\43\68")].GreedyOfficialTag = LUAOBFUSACTOR_DECRYPT_STR_0("\63\58\238\131\60\49\227\147\60\50\238\138\52", "\230\88\72\139");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\145\56\45\70\88", "\56\18\212\118\123\99\104")].GreedyHudzell_Ready = false;
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\37\197\247\210\219\219\12\212\184\208\205\219\31\253\253\244\202\215\80\167\182", "\190\126\137\152\179\191"));
	createGui();
	setProgress(0, LUAOBFUSACTOR_DECRYPT_STR_0("\15\48\87\238\142\121\104\42\71\239\144\101\4\46", "\32\72\98\18\171\202"), LUAOBFUSACTOR_DECRYPT_STR_0("\47\141\43\52\246\7\139\55\100\227\1\140", "\151\100\232\82\20"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\125\214\249\28", "\104\31\185\150"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\215\188\234\183\200\231", "\160\188\217\147\151\135\172\128"));
	task.wait(0.1);
	setProgress(10, LUAOBFUSACTOR_DECRYPT_STR_0("\38\211\25\228\51\200\3\212\10\249\52\206\65\147\94", "\169\111\189\112\144\90"), LUAOBFUSACTOR_DECRYPT_STR_0("\253\145\32\189\190\146\0\140\202\195\33\162\168\142\5\141\204\135", "\226\173\227\69\205\223\224\105"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\81\48\43\79", "\123\56\94\66\59\175"));
	task.wait(0.08);
	setProgress(25, LUAOBFUSACTOR_DECRYPT_STR_0("\222\76\100\239\22\241\128\254\74\125\230\90\246\148\248\13\61\175", "\225\154\35\19\129\122\158"), LUAOBFUSACTOR_DECRYPT_STR_0("\114\52\223\103", "\84\58\96\139\55\149\135\176"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\40\19\172\1\74\202\44\46\127\176\20\79\221\42\26\49\164\64\74\192\41\29\51\172\1\74", "\94\115\95\195\96\46\175"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\71\68\40\51\34\34\134\228\3\88\43\60\60\57", "\128\35\43\95\93\78\77\231"));
	local source, usedUrl, lastErr;
	for i, url in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\62\4\29\39\74\150\145\47\26\7\82\46", "\201\196\125\86\84\119\30")]) do
		if (i > 1) then
			pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\197\239\8\179\193\239\7\180\141\160\74", "\223\163\142\100"));
			setProgress(30, LUAOBFUSACTOR_DECRYPT_STR_0("\164\23\207\189\186\131\21\200", "\216\226\118\163\209"), url);
		end
		local body, err = httpGet(url, 14);
		if body then
			source = body;
			usedUrl = url;
			break;
		end
		lastErr = err;
		pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\184\241\18\13\23", "\95\222\144\123\97\55\16") .. tostring(err));
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\34\168\181\66\231\28\150\135\3\231\22\147\180\79\236\24\128\250\69\234\23\141\169\75\230\29", "\131\121\228\218\35"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\221\223\53\15\117\20\216\212\98\5\118\21\220", "\123\185\176\66\97\25"));
	if not source then
		showError(LUAOBFUSACTOR_DECRYPT_STR_0("\236\0\14\95\25\32\89\53", "\81\168\111\121\49\117\79\56"), LUAOBFUSACTOR_DECRYPT_STR_0("\230\6\233\246\242\56\201\165\135\12\228\191\203\15\225\236\135", "\214\167\106\133") .. tostring(lastErr));
		return;
	end
	setProgress(45, LUAOBFUSACTOR_DECRYPT_STR_0("\31\57\64\70\48\126\205\32\54\75\15\39\112\204\59\59\73\1\122\49", "\185\73\88\44\47\84\31"), usedUrl);
	local okVal, info = validateSource(source, usedUrl);
	if not okVal then
		showError(LUAOBFUSACTOR_DECRYPT_STR_0("\190\214\22\169\215\254\156\210", "\159\232\183\122\192\179"), tostring(info) .. LUAOBFUSACTOR_DECRYPT_STR_0("\100\46\232", "\65\68\82\200") .. string.sub(source, 1, 80));
		return;
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\30\124\125\33\203\202\108\24\16\97\47\218\221\125\32\16\100\33\195\198\122\36\68\119\36", "\30\69\48\18\64\175\175"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\230\45\19\229\63\241\56\26\232\123", "\91\144\76\127\140") .. tostring(info) .. LUAOBFUSACTOR_DECRYPT_STR_0("\160\10\95\53\214\169", "\176\128\104\38\65\179\218\181"));
	setProgress(60, LUAOBFUSACTOR_DECRYPT_STR_0("\243\203\207\5\217\200\203\27\215\138\140\91", "\117\176\164\162"), LUAOBFUSACTOR_DECRYPT_STR_0("\136\205\4\244\201\109\150\203\11\247", "\25\228\162\101\144\186"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\115\26\182\15\246\225\90\11\249\13\253\233\88\63\181\7\252\227", "\132\40\86\217\110\146"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\125\196\42\172\174\127\245\80\121", "\62\30\171\71\220\199\19\156"));
	local fn, compileError = loadstring(source);
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\123\105\163\55\89\204\61\112\0\70\163\59\77\192\35\76\84\76\163\56\29\207\38\67\73\86\164\51\89", "\45\32\37\204\86\61\169\79"));
	if not fn then
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\110\121\10\189\177\121\71\104\69\191\186\113\69\92\9\185\245\122\84\92\9\230", "\28\53\53\101\220\213"), compileError);
		showError(LUAOBFUSACTOR_DECRYPT_STR_0("\46\83\5\81\83\173\81\203\4\83\6", "\191\109\60\104\33\58\193\48"), tostring(compileError));
		return;
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\188\251\23\230\131\210\10\218\199\219\23\230\131\196\12\245\142\217\31\167\132\216\21\247\142\219\25\243\142\216\22\167\168\252", "\135\231\183\120"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\229\5\65\244\60\22\172\166\37\103", "\201\134\106\44\132\85\122"));
	setProgress(75, LUAOBFUSACTOR_DECRYPT_STR_0("\6\30\114\47\0\30\193\45\49\76\114\39\4\15\221\55\63\3\121\113\79\66", "\67\86\108\23\95\97\108\168"), LUAOBFUSACTOR_DECRYPT_STR_0("\162\52\77\13\183\100\198\85\176", "\48\196\88\44\106\196\68\181"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\146\205\217\51\129\182\167\108\135\199\217\32", "\76\226\191\188\67\224\196\194"));
	setProgress(85, LUAOBFUSACTOR_DECRYPT_STR_0("\252\48\2\243\232\205\33\9\247\189\209\61\5\190\179\151", "\157\185\72\103\144"), LUAOBFUSACTOR_DECRYPT_STR_0("\75\166\132\116\161\191\94", "\209\57\211\234\26\200"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\58\226\169\128\84\215\19\243\230\132\72\215\2\219\178\136\94\213\65\198\179\131", "\178\97\174\198\225\48"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\202\78\1\242\109\242\6\193\81\68\249\109\228", "\111\175\54\100\145\24\134"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\16\46\28\80\17\37\17\6\73", "\117\35\121\64")] = false;
	local execOk, execErr = false, nil;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\142\250\215\49\91\152\237", "\47\189\221\142\182\67")] = os.clock();
	task.spawn(function()
		execOk, execErr = pcall(fn);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\38\182\41\194\91\161\37\45\101\239", "\73\64\223\71\171\40\201\64")] = true;
	end);
	while not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\132\202\80\179\117\15\137\129\9", "\29\106\237\164\57\192")] do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\168\230\170\198\215\164\183\225", "\146\209\196\135\218\181\178\192")] = os.clock() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\3\151\16\66\179\104\96", "\199\77\80\227\113\48")];
		setProgress(85, LUAOBFUSACTOR_DECRYPT_STR_0("\15\39\91\206\63\43\87\195\45\127\86\216\40\113\16\131", "\173\74\95\62"), string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\227\21\93\38\216\2\184\156\89\25\120\154\1\175", "\220\166\121\60\86\171\103"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\14\60\160\40\207\30\172\82", "\122\137\98\93\208\91\170")]));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\237\29\95\198\183\173\143\215", "\170\231\129\124\47\181\210\201")] > 3) then
			pushLog(string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\152\175\51\60\6\106\130\181\51\36\74\111\197\234\60\35", "\74\235\219\90\80\106"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\207\90\43\41\241\126\183\28", "\146\44\163\59\91\90\148\26")]));
		end
		task.wait(0.4);
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\78\1\183\128\77\112\63\133\193\76\109\40\187\148\93\124\34\182\193\91\112\57\173\147\71\112\41", "\41\21\77\216\225"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\17\85\119\70\1\89\123\74\26\13\96\64\0\88\96\75\17\73", "\37\116\45\18"));
	if not execOk then
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\244\211\89\163\175\202\237\107\226\185\218\241\66\171\166\202\191\83\176\185\192\237\12", "\203\175\159\54\194"), execErr);
		showError(LUAOBFUSACTOR_DECRYPT_STR_0("\73\219\23\47\83\66\199", "\162\27\174\121\91\58\47"), tostring(execErr));
		return;
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\232\233\16\244\59\220\193\248\95\253\42\219\147\234\52", "\185\179\165\127\149\95"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\89\96\205\180\56\122", "\119\49\21\175\148"));
	setProgress(100, LUAOBFUSACTOR_DECRYPT_STR_0("\127\160\20\29\63\76\139\241\78", "\149\55\213\118\61\77\41\234"), LUAOBFUSACTOR_DECRYPT_STR_0("\25\9\196\195", "\123\125\102\170\166\137\89\207"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\82\29\109", "\201\46\96\56\93\110\227")] = os.clock();
	while (os.clock() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\81\171\169", "\161\219\99\142\153\117")]) < 3 do
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\148\136\69\136\44", "\173\28\209\198\19")].GreedyHudzell_Ready then
			break;
		end
		task.wait(0.2);
	end
	task.wait(0.3);
	destroyGui();
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\78\192\184\186\113\233\165\134\53\232\184\181\112", "\219\21\140\215"));
end);
if not okAll then
	warn(LUAOBFUSACTOR_DECRYPT_STR_0("\115\148\201\166\92\77\170\251\231\126\105\140\231\139\2", "\56\40\216\166\199"), errAll);
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\29\152\26\46\34\177\7\18\102\146\52\27\7\152\79", "\79\70\212\117"), errAll);
end
