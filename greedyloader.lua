--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~   Much Love, Ferib 

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
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\114\37\80\184\99", "\168\171\23\68\52\157\83")] = string.sub(source, 1, math.min(5000, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\52\165", "\231\148\17\149\205\69\77")]));
		if not (string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\162\198\255\18\175", "\159\224\199\167\155\55")], LUAOBFUSACTOR_DECRYPT_STR_0("\208\225\57\215\243\234", "\178\151\147\92"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\248\77\54\87\28", "\26\236\157\44\82\114\44")], LUAOBFUSACTOR_DECRYPT_STR_0("\13\28\240\126\14\23", "\59\74\78\181"), 1, true) or string.find(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\212\91\94\246\117", "\211\69\177\58\58")], LUAOBFUSACTOR_DECRYPT_STR_0("\158\246\75\244\224\197\160\228\107\240", "\171\215\133\25\149\137"), 1, true)) then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\239\199\38\186\200\34\249\71\229\209\114\242\250\50\188\65\238\198\38\255\225\36", "\34\129\168\82\154\143\80\156");
		end
		return true, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\247\99", "\233\229\210\83\107\40\46")];
	end
	local gui, barFill, pctLabel, stageLabel, statusLabel, logBox;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\77\53\250\12\207\71\33\147\85", "\101\161\34\82\182")] = {};
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\2\88\250\222\240\166\43\233\9\28\174", "\78\136\109\57\158\187\130\226")] = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\48\247\255\45\122\169", "\145\94\95\153")] = {};
	local function pushLog(msg)
		msg = tostring(msg);
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\198\225\27\212\74\178\239\240", "\215\157\173\116\181\46"), msg);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\187\140\222\211\59\177\152\183\138", "\186\85\212\235\146")][#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\142\17\210\48\224\93\209\196\70", "\56\162\225\118\158\89\142")] + 1] = msg;
		while #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\10\199\131\43\214\89\22\133\255", "\184\60\101\160\207\66")] > 14 do
			table.remove(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\141\123\144\56\140\121\175\116\210", "\220\81\226\28")], 1);
		end
		if logBox then
			pcall(function()
				logBox.Text = table.concat(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\218\133\215\227\201\22\198\199\171", "\167\115\181\226\155\138")], "\n");
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
				pctLabel.Text = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\167\38\162\25", "\166\130\66\135\60\27\17"), math.floor(pct));
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
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\69\207\113\53\86\110\203\116\52\1\26", "\80\36\42\174\21")] then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\31\54\126\75\2\19\127\79\20\114\42", "\26\46\112\87")] = true;
		for i = 1, #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\44\165\122\172\250\21", "\212\217\67\203\20\223\223\37")] do
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\130\166\220\169\200\248", "\178\218\237\200")][i]:Disconnect();
			end);
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\186\232\222\165\240\182", "\176\214\213\134")] = {};
		if gui then
			pcall(function()
				gui:Destroy();
			end);
			gui = nil;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\136\152\226\237\6", "\57\148\205\214\180\200\54")].GreedyLoader_Running = false;
	end
	local function parentGui(g)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\246\112\100", "\22\114\157\85\84")] = pcall(function()
			g.Parent = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\231\196\1\193\122\227\161", "\200\164\171\115\164\61\150"));
		end);
		if not g.Parent then
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\174\243\70\21", "\227\222\148\99\37")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\94\83\239\252\33\23\2", "\153\83\50\50\150")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\109\122\114\5\118\185\106\72\127", "\45\61\22\19\124\19\203")) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\30\12\236\7\98\252\145", "\217\161\114\109\149\98\16")]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\34\44\57\101\185\102\53\53\49", "\20\114\64\88\28\220"), 5);
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\6\151\228", "\221\81\97\178\212\152\176")] then
					g.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\224\88\171", "\122\173\135\125\155")];
				end
			end);
		end
		return g.Parent ~= nil;
	end
	local function createGui()
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\191\237\15\184\59\52\218\185\129\39\140\22\113\203\150\196\1\173\54\63\207\202\143\78", "\168\228\161\96\217\95\81"));
		gui = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\232\210\60\89\42\89\252\196\39", "\55\187\177\78\60\79"));
		gui.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\10\220\90\238\66\214\172\34\207\91\238\84\250\169", "\224\77\174\63\139\38\175");
		gui.ResetOnSpawn = false;
		gui.IgnoreGuiInset = true;
		gui.DisplayOrder = 1000;
		if not parentGui(gui) then
			warn(LUAOBFUSACTOR_DECRYPT_STR_0("\191\109\87\47\128\68\74\19\196\66\89\32\138\78\76\110\148\64\74\43\138\85\24\9\177\104", "\78\228\33\56"));
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\113\189\23\192\158", "\229\174\30\210\99")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\61\255\135\92\232", "\89\123\141\230\49\141\93"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\126\249\24\85\26", "\42\147\17\150\108\112")].Size = UDim2.fromScale(1, 1);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\169\34\107\162\184", "\136\111\198\77\31\135")].BackgroundColor3 = Color3.fromRGB(6, 5, 3);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\6\168\66\248\180", "\201\98\105\199\54\221\132\119")].BackgroundTransparency = 0.2;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\3\140\53\71\101", "\204\217\108\227\65\98\85")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\204\250\241\105\144", "\160\62\163\149\133\76")].Parent = gui;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\161\31\43\134\134", "\163\182\192\109\79")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\18\52\1\205\240", "\149\84\70\96\160"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\7\31\233\125\86", "\141\88\102\109")].Size = UDim2.fromOffset(400, 420);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\82\216\116\95\109", "\161\211\51\170\16\122\93\53")].Position = UDim2.fromScale(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\175\160\44\190\254", "\72\155\206\210")].AnchorPoint = Vector2.new(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\123\70\10\118\22", "\83\38\26\52\110")].BackgroundColor3 = Color3.fromRGB(12, 10, 5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\91\22\53\66\29\71", "\38\56\119\71")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\238\74\210\96\6", "\54\147\143\56\182\69")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\142\240\93\154\134", "\191\182\225\159\41")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\67\109\5", "\162\75\114\72\53\235\231")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\185\21\103\237\65\12\137\46", "\98\236\92\36\130\51"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\72\73\234", "\80\196\121\108\218\37\200\213")].CornerRadius = UDim.new(0, 14);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\34\71\47", "\234\96\19\98\31\43\110")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\30\64\195\233\34", "\235\102\127\50\167\204\18")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\181\176\115", "\78\48\193\149\67\36")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\5\55\179\12\83\63\21\133", "\33\80\126\224\120"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\188\70\148", "\60\140\200\99\164")].Color = Color3.fromRGB(212, 175, 55);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\224\65\118", "\194\231\148\100\70")].Thickness = 1.4;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\88\132\243", "\168\38\44\161\195\150")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\253\144\114\117\184", "\118\224\156\226\22\80\136\214")];
		task.spawn(function()
			while gui and gui.Parent and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\225\88\132\71\252\125\133\67\234\28\208", "\224\34\142\57")] do
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\176\192\216\125\194\88\28\200\174\198\216\54\161", "\110\190\199\165\189\19\145\61")]:Create(TABLE_TableIndirection["st%0"], TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\238\249\118\230\152\215\219\249\114\230\136\222", "\167\186\139\23\136\235")]=0.05,[LUAOBFUSACTOR_DECRYPT_STR_0("\46\189\129\14\17\187\141\30\9", "\109\122\213\232")]=2}):Play();
				end);
				task.wait(1.15);
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\248\163\52\235\229\134\53\239\243\231\96", "\80\142\151\194")] then
					break;
				end
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\209\114\73\13\245\114\94\21\207\116\73\70\150", "\44\99\166\23")]:Create(TABLE_TableIndirection["st%0"], TweenInfo.new(1.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\72\229\40\56\32\180\125\229\44\56\48\189", "\196\28\151\73\86\83")]=0.4,[LUAOBFUSACTOR_DECRYPT_STR_0("\199\11\32\19\137\86\29\101\224", "\22\147\99\73\112\226\56\120")]=1.2}):Play();
				end);
				task.wait(1.15);
			end
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\122\229\250\200\232", "\237\216\21\130\149")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\171\67\94\88\181\229\95\128\75\83", "\62\226\46\63\63\208\169"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\22\82\140\90\93", "\62\133\121\53\227\127\109\79")].Size = UDim2.fromOffset(64, 64);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\27\53\250\147\254", "\194\112\116\82\149\182\206")].Position = UDim2.new(0.5, -32, 0, 18);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\167\75\23\133\178", "\110\89\200\44\120\160\130")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\204\76\73\6\26", "\45\203\163\43\38\35\42\91")].Image = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\170\251\12\184\128\112\151\213", "\52\178\229\188\67\231\201")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\78\87\11\178\12", "\67\65\33\48\100\151\60")].ScaleType = Enum.ScaleType.Fit;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\232\169\215\182\143", "\147\191\135\206\184")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\41\180\197\157\3", "\210\228\72\198\161\184\51")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\64\231\28\118\139\102", "\174\86\41\147\112\19")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\111\5\149\31\9\14\19\174\87", "\203\59\96\237\107\69\111\113"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\31\184\237\52\181\135", "\183\68\118\204\129\81\144")].Size = UDim2.new(1, -20, 0, 26);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\164\100\232\14\199\94", "\226\110\205\16\132\107")].Position = UDim2.fromOffset(10, 90);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\202\244\213\68\174\147", "\33\139\163\128\185")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\81\16\210\82\29\84", "\190\55\56\100")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\113\157\25\59\55\218\179\126\154\24\36\54\207\223", "\147\54\207\92\126\115\131");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\56\33\113\8\59\93", "\30\109\81\85\29\109")].TextColor3 = Color3.fromRGB(255, 205, 70);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\120\64\186\51\155\172", "\156\159\17\52\214\86\190")].Font = Enum.Font.GothamBlack;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\230\169\176\171\170\237", "\220\206\143\221")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\116\57\27\221\137\130", "\178\230\29\77\119\184\172")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\191\24\31\50\168", "\152\149\222\106\123\23")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\35\228\6\229", "\213\189\70\150\35")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\123\80\108\28\99\84\118\13\67", "\104\47\53\20"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\73\147\89\236", "\111\195\44\225\124\220")].Size = UDim2.new(1, -20, 0, 16);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\67\18\54\251", "\203\184\38\96\19\203")].Position = UDim2.fromOffset(10, 118);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\118\107\4\158", "\174\89\19\25\33")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\23\64\11\167", "\107\79\114\50\46\151\231")].Text = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\131\135\26\163\22\153\133\105", "\160\89\198\213\73\234\89\215")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\8\49\168\190\133\100\94\149\218\224\122", "\165\40\17\212\158");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\220\26\118\118", "\70\133\185\104\83")].TextColor3 = Color3.fromRGB(150, 130, 80);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\64\86\111\153", "\169\100\37\36\74")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\130\176\21\80", "\48\96\231\194")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\95\28\104\73", "\227\168\58\110\77\121\184\207")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\61\173\68\244\139", "\197\27\92\223\32\209\187\17")];
		stageLabel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\55\90\219\239\47\94\193\254\15", "\155\99\63\163"));
		stageLabel.Size = UDim2.new(1, -20, 0, 18);
		stageLabel.Position = UDim2.fromOffset(10, 150);
		stageLabel.BackgroundTransparency = 1;
		stageLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\177\197\160\159\173\141\140\214\239\195\247", "\228\226\177\193\237\217");
		stageLabel.TextColor3 = Color3.fromRGB(240, 230, 200);
		stageLabel.Font = Enum.Font.GothamSemibold;
		stageLabel.TextScaled = true;
		stageLabel.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\177\49\226\113\224", "\134\84\208\67")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\173\148\126\20\233\214", "\60\115\204\230")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\193\40\234\125\226", "\16\135\90\139"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\117\20\17\73\17\40", "\24\52\20\102\83\46\52")].Size = UDim2.new(1, -40, 0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\46\51\6\8\129\127", "\111\164\79\65\68")].Position = UDim2.fromOffset(20, 182);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\216\145\252\41\175\150", "\138\166\185\227\190\78")].BackgroundColor3 = Color3.fromRGB(28, 22, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\117\215\21\85\102\73", "\121\171\20\165\87\50\67")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\57\171\20\190\71\150", "\98\166\88\217\86\217")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\247\107\5\195\140", "\188\150\150\25\97\230")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\219\26\82", "\141\186\233\63\98\108")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\196\195\15\185\55\255\239\62", "\69\145\138\76\214"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\157\204\217", "\118\16\175\233\233\223")].CornerRadius = UDim.new(1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\214\112\235", "\29\235\228\85\219\142\235")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\213\168\255\112\11\119", "\50\93\180\218\189\23\46\71")];
		barFill = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\248\182\90\65\65", "\40\190\196\59\44\36\188"));
		barFill.Size = UDim2.new(0, 0, 1, 0);
		barFill.BackgroundColor3 = Color3.fromRGB(255, 195, 40);
		barFill.BorderSizePixel = 0;
		barFill.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\68\206\150\253\56\93", "\109\92\37\188\212\154\29")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\188\225\147", "\58\100\143\196\163\81")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\47\107\0\172\45\71\224\28", "\110\122\34\67\195\95\41\133"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\226\30\26", "\182\21\209\59\42")].CornerRadius = UDim.new(1, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\4\128\77", "\222\215\55\165\125\65")].Parent = barFill;
		pctLabel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\24\212\222\14\222\192\239\79\32", "\42\76\177\166\122\146\161\141"));
		pctLabel.Size = UDim2.new(1, -20, 0, 16);
		pctLabel.Position = UDim2.fromOffset(10, 200);
		pctLabel.BackgroundTransparency = 1;
		pctLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\245\207", "\22\197\234\101\174\25");
		pctLabel.TextColor3 = Color3.fromRGB(255, 210, 80);
		pctLabel.Font = Enum.Font.GothamBold;
		pctLabel.TextScaled = true;
		pctLabel.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\53\183\216\51\255", "\230\77\84\197\188\22\207\183")];
		statusLabel = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\205\17\222\232\160\160\242\48\245", "\85\153\116\166\156\236\193\144"));
		statusLabel.Size = UDim2.new(1, -20, 0, 16);
		statusLabel.Position = UDim2.fromOffset(10, 220);
		statusLabel.BackgroundTransparency = 1;
		statusLabel.Text = LUAOBFUSACTOR_DECRYPT_STR_0("\148\236\72\178\247\5\228\247\76\186\240", "\96\196\128\45\211\132");
		statusLabel.TextColor3 = Color3.fromRGB(180, 160, 110);
		statusLabel.Font = Enum.Font.Gotham;
		statusLabel.TextScaled = true;
		statusLabel.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\140\105\91\151\255", "\184\85\237\27\63\178\207\212")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\86\14\121\26\88\4\90\77\9", "\63\104\57\105")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\45\149\165\73\14", "\36\107\231\196"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\186\165\161\79\180\175\130\24\229", "\231\61\213\194")].Size = UDim2.new(1, -28, 0, 150);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\162\58\85\27\172\48\118\76\253", "\19\105\205\93")].Position = UDim2.fromOffset(14, 250);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\165\7\217\167\45\168\5\219\196\111", "\95\201\104\190\225")].BackgroundColor3 = Color3.fromRGB(8, 7, 4);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\196\198\232\189\202\204\203\234\155", "\174\207\171\161")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\241\10\213\234\214\224\251\72\163", "\183\141\158\109\147\152")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\8\244\8\105\89", "\108\76\105\134")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\145\244\177", "\174\139\165\209\129")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\150\154\193\206\212\13\117\106", "\24\195\211\130\161\166\99\16"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\87\172\124", "\118\38\99\137\76\51")].CornerRadius = UDim.new(0, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\114\64\66", "\64\157\70\101\114\105")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\167\160\197\2\65\165\162\166\64", "\112\32\200\199\131")];
		logBox = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\24\85\68\172\239\170\32\41\92", "\66\76\48\60\216\163\203"));
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
		logBox.Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\137\126\213\77\207\41\191\195\41", "\68\218\230\25\147\63\174")];
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\150\6\92\77\178\168\56\110\12\145\152\3\19\79\164\168\43\71\73\178", "\214\205\74\51\44"));
		pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\221\121\203\188\116\232\73\227\232\114\254", "\23\154\44\130\156"));
	end
	local function showError(stage, err)
		err = tostring(err);
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\42\138\162\175\50\22\3\155\237\139\4\33\62\148", "\115\113\198\205\206\86"), stage, err);
		pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\162\118\215\118\222\23", "\58\228\55\158") .. stage);
		pushLog(string.sub(err, 1, 160));
		setProgress(0, LUAOBFUSACTOR_DECRYPT_STR_0("\152\166\241\10\124\139\20\157\165\245\10", "\85\212\233\176\78\92\205"), stage);
		if not gui then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\89\154\230\15\8", "\130\42\56\232")] = gui:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\216\186\43\247", "\95\138\213\68\131\32")) and gui.Root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\9\41\179\71", "\22\74\72\193\35"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\118\235\76\105\41", "\56\76\25\132")] = gui:GetChildren()[1];
		card = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\206\164\50\138\14", "\175\62\161\203\70")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\210\204\7\112\108", "\85\92\189\163\115")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\10\173\34\60", "\88\73\204\80"))) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\140\31\82\108\138", "\186\78\227\112\38\73")];
		if not card then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\238\82\233\71\74\63\172", "\26\156\55\157\53\51")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\184\221\14\205\154\69\152\204\25\215", "\48\236\184\118\185\216"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\184\67\34\214\113\181", "\84\133\221\55\80\175")].Size = UDim2.new(0.42, 0, 0, 32);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\175\226\48\180\222\25\237", "\60\221\135\68\198\167")].Position = UDim2.new(0.06, 0, 1, -44);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\184\236\145\91\156\190", "\185\142\221\152\227\34")].BackgroundColor3 = Color3.fromRGB(45, 36, 12);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\74\192\67\232\90\118\167", "\151\56\165\55\154\35\83")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\146\102\49\220\153", "\142\192\35\101");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\112\61\177\254\201\252", "\118\182\21\73\195\135\236\204")].TextColor3 = Color3.fromRGB(255, 230, 160);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\57\14\82\29\72\173", "\157\104\92\122\32\100\109")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\163\219\216\36\98\221", "\203\195\198\175\170\93\71\237")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\78\42\199\72\84\172", "\156\78\43\94\181\49\113")].Parent = card;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\235\129\243", "\25\18\136\164\195\107\35")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\221\4\138\64\96\178\196\170", "\216\136\77\201\47\18\220\161"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\239\110\138", "\226\77\140\75\186\104\188")].CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\205\149\111", "\47\217\174\176\95")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\216\98\16\171\17\40", "\70\216\189\22\98\210\52\24")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\208\179\158\150\138", "\179\186\191\195\231")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\205\58\0\240\219\42\12\240\246\49", "\132\153\95\120"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\189\30\52\178\138", "\192\209\210\110\77\151\186")].Size = UDim2.new(0.42, 0, 0, 32);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\12\50\240\186\148", "\164\128\99\66\137\159")].Position = UDim2.new(0.52, 0, 1, -44);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\134\249\167\69\217", "\222\96\233\137")].BackgroundColor3 = Color3.fromRGB(30, 24, 10);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\188\183\6\205\163", "\144\217\211\199\127\232\147")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\219\0\14\17\149\96\48\118\215\29", "\36\152\79\94\72\181\37\98");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\215\87\38\146\136", "\95\183\184\39")].TextColor3 = Color3.fromRGB(255, 230, 160);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\48\247\63\17\208", "\98\213\95\135\70\52\224")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\172\217\110\17\174", "\52\158\195\169\23")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\179\34\109\195\101", "\235\26\220\82\20\230\85\27")].Parent = card;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\162\172\146", "\20\232\193\137\162")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\23\246\230\169\245\130\18\99", "\17\66\191\165\198\135\236\119"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\172\235\67", "\177\111\207\206\115\159\136\140")].CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\138\85\68", "\63\101\233\112\116\180\47")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\52\253\11\189\102", "\86\163\91\141\114\152")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\4\100\106\127\3", "\90\51\107\20\19")].MouseButton1Click:Connect(function()
			pcall(function()
				if setclipboard then
					setclipboard(stage .. "\n" .. err);
				end
			end);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\245\145\253\36\200\160", "\93\237\144\229\143")].MouseButton1Click:Connect(function()
			destroyGui();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\211\222\47\78\22", "\38\117\150\144\121\107")].GreedyLoader_Running = false;
			task.spawn(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\169\237\127\125", "\90\77\219\142")] = select(1, httpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\238\16\53\41\95\93\53\169\3\51\60\73\3\99\238\17\37\35\73\11\118\168\28\56\35\3\11\117\231\0\36\43\2\11\111\231", "\26\134\100\65\89\44\103"), 12));
				if ((type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\241\51\102\244", "\196\145\131\80\67")]) == LUAOBFUSACTOR_DECRYPT_STR_0("\13\164\20\1\22\239", "\136\126\208\102\104\120")) and (#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\152\205\6\255", "\49\24\234\174\35\207\50\93")] > 50)) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\252\184\216", "\17\108\146\157\232")] = loadstring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\209\23\168\127", "\200\43\163\116\141\79")]);
					if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\56\120\211", "\131\223\86\93\227\208\148")] then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\75\243\230", "\213\131\37\214\214\125")]();
					end
				end
			end);
		end);
	end
	local function readSession()
		local ok, raw = pcall(function()
			if (isfile and isfile(LUAOBFUSACTOR_DECRYPT_STR_0("\1\57\32\186\229\63\3\48\187\251\35\39\41\240\242\35\56\54\182\238\40\101\34\183", "\129\70\75\69\223"))) then
				return readfile(LUAOBFUSACTOR_DECRYPT_STR_0("\97\217\246\236\120\246\110\222\247\243\121\227\74\132\224\236\111\252\79\196\253\167\123\231", "\143\38\171\147\137\28"));
			end
		end);
		if (ok and (type(raw) == LUAOBFUSACTOR_DECRYPT_STR_0("\195\150\171\250\13\228", "\180\176\226\217\147\99\131")) and (raw ~= "")) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\184\61\19\192\252\127", "\103\179\217\79")] = {};
			for bit in string.gmatch(raw, LUAOBFUSACTOR_DECRYPT_STR_0("\113\137\0\232\10", "\195\42\215\124\181\33\236")) do
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\88\37\42\54\189\93", "\152\109\57\87\94\69")][#TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\214\24\183\173\151\4", "\200\153\183\106\195\222\178\52")] + 1] = bit;
			end
			if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\226\154\41\90\31\98", "\58\82\131\232\93\41")][1] == LUAOBFUSACTOR_DECRYPT_STR_0("\164\127\227\48\110\12\170\120\254\42\75\110", "\95\227\55\176\117\61")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\127\49\95\184\93\46", "\203\120\30\67\43")][3]) then
				return {[LUAOBFUSACTOR_DECRYPT_STR_0("\228\54\72\253\215\240\40\72", "\185\145\69\45\143")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\30\11\178\207\207\79", "\188\234\127\121\198")][2],[LUAOBFUSACTOR_DECRYPT_STR_0("\51\55\10", "\227\88\82\115")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\30\168\179\17\54\19", "\19\35\127\218\199\98")][3],[LUAOBFUSACTOR_DECRYPT_STR_0("\25\227\26\235\14\254\25\221\29\239", "\130\124\155\106")]=tonumber(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\202\228\187\176\179\44", "\223\181\171\150\207\195\150\28")][4])};
			end
		end
		if ((type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\31\205\152\76\28", "\105\44\90\131\206")].GreedyAuth) == LUAOBFUSACTOR_DECRYPT_STR_0("\235\225\176\181\13", "\94\159\128\210\217\104")) and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\220\40\137\26\47", "\26\48\153\102\223\63\31\153")].GreedyAuth.key) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\101\195\197\71\16", "\147\98\32\141")].GreedyAuth;
		end
		return nil;
	end
	local function validateKeyOnline(key)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\70\240\143\86", "\43\120\35\131\170\102\54")] = httpRequest({[LUAOBFUSACTOR_DECRYPT_STR_0("\97\20\139", "\228\52\102\231\214\197\208")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\193\89\227\206\170\45\243\33\213\71\230\175\219", "\182\126\128\21\170\138\235\121")],[LUAOBFUSACTOR_DECRYPT_STR_0("\166\223\33\238\137\23", "\102\235\186\85\134\230\115\80")]=LUAOBFUSACTOR_DECRYPT_STR_0("\103\35\13\107", "\66\55\108\94\63\18\180"),[LUAOBFUSACTOR_DECRYPT_STR_0("\60\136\132\51\34\75\7", "\57\116\237\229\87\71")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\137\190\227\243\114\224\83\231\133\244\247\114", "\39\202\209\141\135\23\142")]=LUAOBFUSACTOR_DECRYPT_STR_0("\254\35\25\6\59\251\254\39\0\5\60\183\245\32\6\4", "\152\159\83\105\106\82")},[LUAOBFUSACTOR_DECRYPT_STR_0("\163\201\85\235", "\60\225\166\49\146\169")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\10\59\58\50\2\61\8\38\41\4\66\127", "\103\79\126\79\74\97")]:JSONEncode({[LUAOBFUSACTOR_DECRYPT_STR_0("\177\122\202", "\122\218\31\179\19\62")]=key,[LUAOBFUSACTOR_DECRYPT_STR_0("\166\197\200\211\199\160\72\182", "\37\211\182\173\161\169\193")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\54\76\192\45\105\252\167", "\217\151\90\45\185\72\27")].Name})});
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\121\244\87\6", "\54\163\28\135\114")] then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\43\212\83\140\75\124\60\210\82\140\113\121\41\210\81\135\74", "\31\72\187\61\226\46");
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\7\87\211\2\46", "\68\163\102\35\178\39\30")] = nil;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\123\159\151", "\113\222\16\186\167\99\213\227")] = pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\15\239\247\107\94", "\150\78\110\155")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\173\209\51\241\151\27\173\86\140\198\34\164\244", "\32\229\165\71\129\196\126\223")]:JSONDecode(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\140\215\196\209", "\181\163\233\164\225\225")].Body or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\142\45\50\0", "\23\48\235\94")].body or "");
		end);
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\209\157\13", "\178\28\186\184\61\55\83")] or (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\204\83\61\183\94", "\149\164\173\39\92\146\110")]) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\231\38\18\19\31", "\123\147\71\112\127\122"))) then
			return false, LUAOBFUSACTOR_DECRYPT_STR_0("\197\195\148\112\74\197\201\189\99\67\223\221\141\127\85\201", "\38\172\173\226\17");
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\16\56\238\8\65", "\143\45\113\76")].valid == true) then
			return true, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\185\8\61\253\232", "\92\216\216\124")].expires_at or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\95\51\184\65\184\11", "\157\59\82\204\32")].expiresAt;
		end
		return false, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\63\247\251\172\186", "\209\88\94\131\154\137\138\179")].reason or LUAOBFUSACTOR_DECRYPT_STR_0("\33\175\210\125\18\42\53\29\35\164\221", "\66\72\193\164\28\126\67\81");
	end
	local function ensureKey()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\41\187\75\99\38", "\22\135\76\200\56\70")] = readSession();
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\53\235\55\24\177", "\129\237\80\152\68\61")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\173\23\224\89\71", "\56\49\200\100\147\124\119")].key) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\38\175\181\156", "\144\172\94\223")] = tonumber(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\10\177\84\97\95", "\39\68\111\194")].expires_at);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\181\226\213\86\188\147\246", "\215\182\198\135\167\25")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\76\249\91\200\25", "\40\237\41\138")].username or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\113\233\235\15\151", "\42\167\20\154\152")].username == TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\90\242\163\91\116\51\15\174", "\65\42\158\194\34\17")].Name);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\46\95\9\2\230\94\190", "\142\122\71\50\108\77\141\123")] = not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\186\239\93\107", "\91\117\194\159\120")] or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\5\46\93\101", "\68\122\125\94\120\85\145")] > os.time());
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\15\202\76\231\210\255\71", "\218\119\124\175\62\168\185")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\177\249\69\193\138\251\13\148", "\164\197\144\40")]) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\213\132\189\152\230", "\214\227\144\202\235\189")].GreedyAuth = {[LUAOBFUSACTOR_DECRYPT_STR_0("\230\160\158", "\92\141\197\231\27\112\211\51")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\250\153\176\148\182", "\177\134\159\234\195")].key,[LUAOBFUSACTOR_DECRYPT_STR_0("\168\248\58\178\199\188\230\58", "\169\221\139\95\192")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\135\126\38\39\52\155\219", "\70\190\235\31\95\66")].Name,[LUAOBFUSACTOR_DECRYPT_STR_0("\191\250\10\239\247\191\241\37\231\241", "\133\218\130\122\134")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\231\243\129\140", "\88\92\159\131\164\188\195")],[LUAOBFUSACTOR_DECRYPT_STR_0("\148\61", "\189\224\78\223\43\183\139")]=os.time()};
				pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\29\249\153\5\200\33\242\202\2\211\59\239\158\19\197", "\161\78\156\234\118"));
				task.spawn(function()
					local ok, reason = validateKeyOnline(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\178\218\207\226\231", "\188\199\215\169")].key);
					if (not ok and (reason ~= LUAOBFUSACTOR_DECRYPT_STR_0("\255\6\81\117\237\255\29\86\116\230\195\15\94\114\228\249\13", "\136\156\105\63\27")) and (reason ~= LUAOBFUSACTOR_DECRYPT_STR_0("\18\130\111\53\23\133\125\11\9\137\106\36\20\130\106\49", "\84\123\236\25"))) then
						warn(LUAOBFUSACTOR_DECRYPT_STR_0("\203\167\165\22\168\176\226\182\234\21\171\245\251\142\179\77", "\213\144\235\202\119\204"), reason);
					end
				end);
				return true;
			end
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\61\240\28\109\115", "\45\67\120\190\74\72\67")].GreedyOfficial or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\7\7\195\147\188\216", "\137\64\66\141\197\153\232\142")].GreedyLoader_Done) then
			return true;
		end
		pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\40\213\59\230\154\6\193\55\175\154\6\212", "\232\99\176\66\198"));
		setProgress(8, LUAOBFUSACTOR_DECRYPT_STR_0("\199\36\49", "\76\140\65\72\102\27\237\153"), LUAOBFUSACTOR_DECRYPT_STR_0("\111\212\2\215\197\65\178\67\217\19\220\196\4\254\65\223\15", "\222\42\186\118\178\183\97"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\226\72\133\94\231\65\142\24\188", "\234\61\140\36")] = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\216\255\34", "\111\65\189\218\18")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\97\66\21\49\10\94\163\70\110\13\48\5\72", "\207\35\43\123\85\107\60"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\99\173\229\186", "\25\16\202\192\138")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\206\200\191\231\172\250\218\222\164", "\148\157\171\205\130\201"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\211\49\121", "\150\67\180\20\73\177")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\170\10\31\72\137\1\49\72\148\63\27\89\136", "\45\237\120\122");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\239\231\124", "\76\183\136\194")].ResetOnSpawn = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\225\160\104", "\116\26\134\133\88\48\47")].IgnoreGuiInset = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\198\229\180", "\18\126\161\192\132\221")].DisplayOrder = 1001;
		parentGui(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\47\235\84", "\54\63\72\206\100")]);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\80\72\63\181", "\27\168\57\37\26\133")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\11\184\125\165\210", "\183\77\202\28\200"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\58\132\77\71", "\104\119\83\233")].Size = UDim2.fromScale(1, 1);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\241\42\103\19", "\35\149\152\71\66")].BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\225\79\245\106", "\90\121\136\34\208")].BackgroundTransparency = 0.45;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\7\88\91\151", "\126\167\110\53")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\25\35\189\140", "\95\93\112\78\152\188")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\242\192\69", "\178\161\149\229\117\132\222")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\215\210\187\228\70", "\67\232\187\189\204\193\118\198")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\173\60\180\45\62", "\143\235\78\213\64\91\98"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\68\139\254\53\230", "\214\237\40\228\137\16")].Size = UDim2.fromOffset(340, 210);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\239\224\206\70\246", "\198\229\131\143\185\99")].Position = UDim2.fromScale(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\128\167\100\20\220", "\19\49\236\200")].AnchorPoint = Vector2.new(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\59\249\160\161\234", "\218\158\87\150\215\132")].BackgroundColor3 = Color3.fromRGB(255, 190, 40);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\18\214\245\115\114", "\173\155\126\185\130\86\66")].BackgroundTransparency = 0.82;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\170\181\208\205\188", "\140\133\198\218\167\232")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\34\187\106\193\229", "\228\213\78\212\29")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\75\243\85", "\139\231\44\214\101")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\227\9\73\51\244\97", "\118\185\143\102\62\112\209\81")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\105\89\10\233\183\27\25\42", "\88\60\16\73\134\197\117\124"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\230\247\223\98\21\186", "\33\48\138\152\168")].CornerRadius = UDim.new(0, 22);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\26\63\70\226\114\34", "\87\18\118\80\49\161")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\18\213\183\245\28", "\208\44\126\186\192")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\22\171\209\70\185\153", "\46\151\122\196\166\116\156\169")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\195\255\71\23\254", "\155\133\141\38\122"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\38\163\86\29\58\245", "\197\69\74\204\33\47\31")].Size = UDim2.fromOffset(320, 190);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\67\85\144\162\10\10", "\231\144\47\58")].Position = UDim2.fromScale(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\212\213\98\74\120\159", "\89\210\184\186\21\120\93\175")].AnchorPoint = Vector2.new(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\182\95\115\194\43\127\225", "\90\209\51\28\181\25")].BackgroundColor3 = Color3.fromRGB(255, 210, 80);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\119\88\249\237\149\43", "\223\176\27\55\142")].BackgroundTransparency = 0.88;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\183\193\162\118\254\158", "\213\68\219\174")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\236\44\240\120\128\111", "\31\107\128\67\135\74\165\95")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\239\185\29", "\209\184\136\156\45\33")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\196\122\31\234\36\141\37", "\216\103\168\21\104")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\77\132\96\171\106\163\70\182", "\196\24\205\35"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\135\236\17\124\168\166\86", "\102\78\235\131")].CornerRadius = UDim.new(0, 18);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\34\59\83\21\26\242\100", "\84\154\78\84\36\39\89\215")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\237\89\79\87\184\177", "\101\157\129\54\56")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\236\218", "\25\125\201\234\203\67")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\95\230\25\14\17", "\115\25\148\120\99\116\71"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\120\233", "\33\108\93\217\68")].Size = UDim2.fromOffset(300, 168);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\14\241", "\205\187\43\193")].Position = UDim2.fromScale(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\55\85", "\191\158\18\101")].AnchorPoint = Vector2.new(0.5, 0.5);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\134\215", "\207\165\163\231\215")].BackgroundColor3 = Color3.fromRGB(14, 11, 6);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\188\169", "\16\166\153\153\54\68")].BorderSizePixel = 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\246\144", "\153\178\211\160\38\84\65")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\12\31\123", "\75\226\107\58")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\221\84\42", "\173\56\190\113\26\113\162")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\254\247\14\10\229\197\219\63", "\151\171\190\77\101"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\44\189\249", "\107\165\79\152\201\152\29")].CornerRadius = UDim.new(0, 14);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\77\173\155", "\31\55\46\136\171\52")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\109\140", "\148\177\72\188")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\162\69\220\173\179\18\131", "\179\198\214\55")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\197\37\65\98\87\220\251\9", "\179\144\108\18\22\37"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\183\9\134\196\195\230\75", "\175\166\195\123\233")].Color = Color3.fromRGB(255, 200, 60);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\214\79\70\251\234\135\13", "\144\143\162\61\41")].Thickness = 1.6;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\199\15\95\121\130\118\176", "\83\128\179\125\48\18\231")].Transparency = 0.15;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\163\225\210\76\27\24\231", "\126\61\215\147\189\39")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\186\77", "\37\24\159\125")];
		task.spawn(function()
			while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\161\48\18", "\34\186\198\21")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\15\128\13", "\162\152\104\165\61")].Parent and not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\33\190\114\115\238\200\43\247\45", "\133\173\79\210\29\16")] do
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\107\232\46\131\79\232\57\155\117\238\46\200\44", "\75\237\28\141")]:Create(TABLE_TableIndirection["stroke%0"], TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\232\77\205\191\60\11\230\243\217\81\207\168", "\129\188\63\172\209\79\123\135")]=0.05,[LUAOBFUSACTOR_DECRYPT_STR_0("\116\236\239\206\75\234\227\222\83", "\173\32\132\134")]=2.2}):Play();
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\12\13\234\160\2\200\92\13\1\236\171\116\157", "\173\46\123\104\143\206\81")]:Create(TABLE_TableIndirection["glow%0"], TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\150\28\33\129\66\145\14\161\19\38\190\87\130\15\167\13\35\152\64\141\2\173", "\97\212\125\66\234\37\227")]=0.72,[LUAOBFUSACTOR_DECRYPT_STR_0("\185\234\172\48", "\126\234\131\214\85")]=UDim2.fromOffset(350, 218)}):Play();
				end);
				task.wait(0.95);
				if (not (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\210\12\10", "\47\228\181\41\58")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\251\156\107", "\127\198\156\185\91\99\80")].Parent) or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\20\192\255\164\0\60\218\176\74", "\190\149\122\172\144\199\107\89")]) then
					break;
				end
				pcall(function()
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\18\244\251\240\1\0\227\232\247\49\0\180\174", "\158\82\101\145\158")]:Create(TABLE_TableIndirection["stroke%0"], TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\68\236\3\24\87\96\255\16\19\74\115\231", "\36\16\158\98\118")]=0.35,[LUAOBFUSACTOR_DECRYPT_STR_0("\244\30\202\248\83\230\34\246\211", "\133\160\118\163\155\56\136\71")]=1.3}):Play();
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\181\116\247\184\44\176\228\180\120\241\179\90\229", "\213\150\194\17\146\214\127")]:Create(TABLE_TableIndirection["glow%0"], TweenInfo.new(0.9, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {[LUAOBFUSACTOR_DECRYPT_STR_0("\57\168\167\223\65\182\173\35\21\173\144\198\71\170\177\38\26\187\161\218\69\189", "\86\123\201\196\180\38\196\194")]=0.88,[LUAOBFUSACTOR_DECRYPT_STR_0("\196\225\195\170", "\207\151\136\185")]=UDim2.fromOffset(330, 200)}):Play();
				end);
				task.wait(0.95);
			end
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\138\60\142\113\61\33", "\17\200\227\72\226\20\24")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\132\68\3\195\229\240\237\250\188", "\159\208\33\123\183\169\145\143"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\83\44\58\247\31\104", "\86\146\58\88")].Size = UDim2.new(1, -24, 0, 22);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\214\254\204\171\172\102", "\154\56\191\138\160\206\137\86")].Position = UDim2.fromOffset(12, 12);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\80\225\139\121\127\209", "\172\230\57\149\231\28\90\225")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\163\146\222\45\158\82", "\187\98\202\230\178\72")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\4\207\144\21\120\97\202\129\9", "\42\65\129\196\80");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\67\73\214\18\66\82", "\142\98\42\61\186\119\103\98")].TextColor3 = Color3.fromRGB(255, 210, 80);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\182\22\4\61\250\82", "\104\88\223\98")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\254\246\194\7\168\20", "\141\36\151\130\174\98")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\115\214\1\129\63\146", "\109\228\26\162")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\160\173", "\134\62\133\157\24\128")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\170\2\156\127", "\182\103\197\122\185\79\209")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\199\130\249\99\34\71\235", "\40\147\231\129\23\96"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\247\148\0\235", "\188\21\152\236\37\219\204")].Size = UDim2.new(1, -24, 0, 34);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\230\47\73\16", "\108\32\137\87")].Position = UDim2.fromOffset(12, 42);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\168\231\24\227\127", "\57\202\136\96\198\79\153\43")].BackgroundColor3 = Color3.fromRGB(20, 16, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\44\178\226\221", "\152\203\67\202\199\237\199")].PlaceholderText = LUAOBFUSACTOR_DECRYPT_STR_0("\221\107\237\55\39\77\65", "\134\154\35\192\111\127\21\25");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\186\41\17\79\112", "\178\216\70\105\106\64")].Text = "";
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\36\98\179\153", "\224\95\75\26\150\169\181\180")].TextColor3 = Color3.fromRGB(255, 240, 200);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\213\192\109\20", "\22\107\186\184\72\36\204")].PlaceholderColor3 = Color3.fromRGB(140, 120, 70);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\178\60\11\94", "\110\135\221\68\46")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\57\20\174\158", "\91\131\86\108\139\174\211")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\36\160\82\13", "\61\155\75\216\119")].ClearTextOnFocus = false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\164\170\121\8", "\189\100\203\210\92\56\105")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\20\173", "\72\79\49\157")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\179\116\236", "\220\232\208\81")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\192\151\198\63\62\84\164\231", "\193\149\222\133\80\76\58"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\94\10\130", "\178\166\61\47")].CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\73\173\42", "\94\155\42\136\26\170")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\48\62\240\212", "\213\228\95\70")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\40\168\135\212", "\23\74\219\162\228")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\12\207\117\187\41\54\237\67", "\91\89\134\38\207"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\253\141\102", "\71\36\142\168\86\115\176")].Color = Color3.fromRGB(180, 140, 40);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\221\178\55\239", "\41\191\193\18\223\99\222\54")].Thickness = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\53\130\122", "\202\203\70\167\74")].Transparency = 0.4;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\18\153\99", "\17\76\97\188\83")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\40\193\114\96", "\195\229\71\185\87\80\227\43")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\237\239\7\21\191", "\143\128\156\96\48")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\140\212\232\6\59\185\211\245\30", "\119\216\177\144\114"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\58\254\7\153", "\34\169\73\153")].Size = UDim2.new(1, -24, 0, 14);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\255\12\206\250", "\235\202\140\107")].Position = UDim2.fromOffset(12, 80);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\103\51\237\185", "\165\108\20\84\200\137\71\151")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\167\44\205\42", "\232\26\212\75")].Text = "";
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\90\117\173\167", "\151\87\41\18\136")].TextColor3 = Color3.fromRGB(255, 160, 60);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\86\188\205\149\174", "\158\59\207\170\176")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\77\52\12\220", "\236\47\62\83\41")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\186\39\126\250", "\226\154\201\64\91\202")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\12\77", "\220\161\41\125\120\42")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\126\229\94", "\110\220\17\192")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\64\124\44\14\201\34\229\179\123\119", "\199\20\25\84\122\139\87\145"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\6\152\254", "\138\39\105\189\206\123")].Size = UDim2.new(1, -24, 0, 32);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\24\8\204\125", "\159\127\103\233\77\147\153\175")].Position = UDim2.fromOffset(12, 100);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\255\161\250", "\171\103\144\132\202\32")].BackgroundColor3 = Color3.fromRGB(55, 42, 12);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\32\172\92", "\108\112\79\137")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\10\236\88\7\142\42", "\85\95\162\20\72\205\97\137");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\242\111\140", "\173\151\157\74\188\109\152")].TextColor3 = Color3.fromRGB(255, 235, 180);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\7\125\141", "\147\68\104\88\189\188\52\181")].Font = Enum.Font.GothamBold;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\135\206\128", "\176\122\232\235")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\122\127\31", "\142\224\21\90\47")].AutoButtonColor = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\219\98\6", "\229\20\180\71\54\196\235")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\59\145", "\224\73\30\161\131\149\202")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\230\180\0", "\48\145\133\145")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\111\101\150\225\195\34\95\94", "\76\58\44\213\142\177"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\39\87\125", "\24\171\68\114\77")].CornerRadius = UDim.new(0, 8);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\30\21\2", "\205\143\125\48\50\231\190\100")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\168\81\85", "\194\161\199\116\101\129\131\191")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\55\141\248", "\194\140\68\168\200\151")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\119\210\230\49\231\77\240\208", "\149\34\155\181\69"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\238\144\170", "\154\99\157\181")].Color = Color3.fromRGB(255, 200, 50);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\28\169\240", "\140\237\111\140\192")].Thickness = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\10\56\72", "\120\102\121\29")].Transparency = 0.35;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\240\252\107", "\91\204\131\217")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\240\16\132", "\158\174\159\53\180\211\189")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\248\249\152\39", "\213\50\157\141\189\23")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\202\35\156\180\80\177\234\50\139\174", "\196\158\70\228\192\18"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\90\5\11\137", "\185\42\63\113\46")].Size = UDim2.new(1, -24, 0, 22);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\216\53\124\75", "\123\180\189\65\89")].Position = UDim2.fromOffset(12, 138);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\137\228\161\217", "\233\162\236\144\132")].BackgroundTransparency = 1;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\193\234\95\233", "\63\210\164\158\122\217\150")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\20\206\226\172\66\253\42", "\152\83\171\150\140\41");
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\224\151\118\132", "\104\226\133\227\83\180\123")].TextColor3 = Color3.fromRGB(190, 165, 90);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\14\55\21\83", "\48\99\107\67")].Font = Enum.Font.Gotham;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\163\105\149\125", "\27\190\198\29\176\77")].TextScaled = true;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\78\233\113\249", "\46\143\43\157\84\201")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\81\61\6", "\168\55\24\54\162\63\115")];
		local function finishOk()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\2\244\44\143\209\197\18\254\101\208", "\174\119\154\64\224\178")] = true;
			pcall(function()
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\121\128\43", "\132\74\30\165\27\101\199\122")]:Destroy();
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\226\186\247", "\212\79\135\159\199\199\213")]:Fire();
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\126\165\161\2\12", "\120\25\192\213\39\60\183")].MouseButton1Click:Connect(function()
			pcall(function()
				if setclipboard then
					setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\101\6\119\52\105\17\99\93\16", "\40\120\32\95")]);
				end
			end);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\184\62\63\255", "\127\90\203\89\26\207")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\241\60\161\192\73\254\210\37\166\206\13", "\157\189\85\207\171\105");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\178\223\240\83", "\99\166\193\184\213")].TextColor3 = Color3.fromRGB(120, 220, 120);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\184\197\235", "\234\182\215\224\219\108")].MouseButton1Click:Connect(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\132\162\112\144", "\85\160\225\219")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\10\155\140\102", "\43\60\101\227\169\86\188")].Text or ""):gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\78\141\194\244", "\87\16\168\177\223\58\172\217"), ""):gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\113\222\18\153", "\91\84\173\57\189"), "");
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\27\188\21\185\240", "\182\112\217\108\156\192")] == "") then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\27\79\170\219", "\235\202\104\40\143")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\40\133\15\188\31\203\16\188\20", "\217\109\235\123");
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\154\121\19\32", "\221\71\233\30\54\16\176\173")].TextColor3 = Color3.fromRGB(255, 160, 60);
				return;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\243\27\239", "\223\84\156\62")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\152\178\172", "\91\182\156\130\189\215");
			task.spawn(function()
				local ok, expOrReason = validateKeyOnline(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\118\181\16\46", "\53\30\19\204")]);
				if ok then
					pcall(function()
						if (makefolder and not isfolder(LUAOBFUSACTOR_DECRYPT_STR_0("\222\242\117\129\163\224\200\101\128\189\252\236\124", "\199\153\128\16\228"))) then
							makefolder(LUAOBFUSACTOR_DECRYPT_STR_0("\246\56\224\28\163\200\2\240\29\189\212\38\233", "\199\177\74\133\121"));
						end
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\192\178\251\114\150", "\74\216\169\220\158\87\166")] = table.concat({LUAOBFUSACTOR_DECRYPT_STR_0("\207\11\32\9\105\219\10\60\2\101\254\114", "\58\136\67\115\76"),TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\166\217\64\128\50\238\13", "\61\145\202\184\57\229\64\203")].Name,TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\87\87\144\2\12", "\39\60\50\233")],tostring(expOrReason or (os.time() + 86400)),tostring(os.time()),"x"}, "|");
						if writefile then
							writefile(LUAOBFUSACTOR_DECRYPT_STR_0("\61\33\166\41\134\49\154\182\30\41\166\32\142\103\161\166\9\32\170\35\140\102\181\171", "\195\122\83\195\76\226\72\210"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\221\53\251\100\180", "\65\132\180\91\158")]);
						end
					end);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\89\255\24\64\44", "\78\101\28\177")].GreedyAuth = {[LUAOBFUSACTOR_DECRYPT_STR_0("\46\177\249", "\49\69\212\128")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\9\201\183\177", "\129\119\108\176\146")],[LUAOBFUSACTOR_DECRYPT_STR_0("\41\220\2\223\43\15\17\57", "\124\92\175\103\173\69\110")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\52\2\46\196\42\70\103", "\87\161\88\99")].Name,[LUAOBFUSACTOR_DECRYPT_STR_0("\23\225\255\197\165\213\48\45\248\251", "\67\114\153\143\172\215\176")]=expOrReason,[LUAOBFUSACTOR_DECRYPT_STR_0("\170\177", "\110\222\194\142")]=os.time()};
					finishOk();
				else
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\202\28\236\2", "\193\119\185\123\201\50")].Text = tostring(expOrReason);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\122\27\254\99\95", "\127\23\104\153\70\111\25")].TextColor3 = Color3.fromRGB(255, 100, 90);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\8\227\255", "\211\105\103\198\207\75\76\215")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\251\137\156\192\93\39", "\214\174\199\208\143\30\108\218");
				end
			end);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\129\78\250", "\41\113\228\107\202\197\54\184")].Event:Wait();
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\131\52\83\121\134\61\88\63\221", "\60\26\237\88")];
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\227\6\123\231\170\221\56\73\166\165\221\51\52\245\186\217\45\113\168\224\150", "\206\184\74\20\134"));
	if not ensureKey() then
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\3\200\225\176\247\79\42\241\120\239\235\168\179\68\55\216\120\244\252\190\229\67\60\201\60", "\172\88\132\142\209\147\42\88"));
		print(LUAOBFUSACTOR_DECRYPT_STR_0("\188\166\195\12\50\240\172\186\202\199\8\47\181\176\136\158\140\29\36\250\168\142\142\201\9", "\222\231\234\172\109\86\149"));
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\202\238\46\168\191", "\120\141\143\160")].GreedyLoader_Running = false;
		return;
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\123\128\185\83\68\169\164\111\0\167\179\75\0\131\157", "\50\32\204\214"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\161\98\27\79\246\65", "\113\230\39\85\25\211")].GreedyLoader_Auth = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\175\18\248\20\206\185\93\215\184\3\173\119", "\43\190\219\102\136\71\171\203")]:GenerateGUID(false);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\5\91\30\111\103\46", "\57\66\30\80")].GreedyLoader_Token = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\253\142\35\193\105", "\228\73\184\192\117\228\89\148")].GreedyLoader_Auth;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\172\91\34\138\217", "\116\175\233\21")].GreedyLoader_Done = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\221\144\112\158\97", "\95\158\152\222\38\187\81")].GreedyOfficial = true;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\152\27\132\230\152", "\168\152\221\85\210\195")].GreedyOfficialTag = LUAOBFUSACTOR_DECRYPT_STR_0("\172\204\240\130\175\199\253\146\175\196\240\139\167", "\231\203\190\149");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\24\205\199\249\165", "\123\173\93\131\145\220\149")].GreedyHudzell_Ready = false;
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\45\232\226\32\112\252\4\249\173\34\102\252\23\208\232\6\97\240\88\138\163", "\153\118\164\141\65\20"));
	createGui();
	setProgress(0, LUAOBFUSACTOR_DECRYPT_STR_0("\201\0\163\199\211\57\174\26\179\198\205\37\194\30", "\96\142\82\230\130\151"), LUAOBFUSACTOR_DECRYPT_STR_0("\100\181\86\2\229\237\76\181\95\86\225\234", "\142\47\208\47\34\132"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\244\177\11\22", "\60\150\222\100\98\59"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\78\57\78\22\244\145", "\81\37\92\55\54\187\218"));
	task.wait(0.1);
	setProgress(10, LUAOBFUSACTOR_DECRYPT_STR_0("\41\74\164\35\136\1\72\164\45\136\14\67\227\121\207", "\225\96\36\205\87"), LUAOBFUSACTOR_DECRYPT_STR_0("\217\180\71\105\125\93\0\231\161\2\125\115\88\7\229\169\67\125", "\105\137\198\34\25\28\47"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\24\167\72\98", "\160\113\201\33\22"));
	task.wait(0.08);
	setProgress(25, LUAOBFUSACTOR_DECRYPT_STR_0("\240\87\187\169\165\162\213\92\165\169\174\237\220\77\174\233\231\227", "\205\180\56\204\199\201"), LUAOBFUSACTOR_DECRYPT_STR_0("\171\234\8\40", "\120\227\190\92"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\6\112\16\122\39\89\203\223\125\79\11\122\49\72\208\236\58\28\27\116\52\82\213\237\60\88", "\130\93\60\127\27\67\60\185"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\76\61\47\64\236\76\124\76\114\43\90\225\81\105", "\29\40\82\88\46\128\35"));
	local source, usedUrl, lastErr;
	for i, url in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\102\230\52\49\140\4\112\230\49\50\253\107", "\216\91\37\180\125\97")]) do
		if (i > 1) then
			pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\35\119\16\207\85\36\117\23\141\25\107", "\55\69\22\124\163"));
			setProgress(30, LUAOBFUSACTOR_DECRYPT_STR_0("\94\210\80\228\221\112\83\255", "\148\24\179\60\136\191\17\48"), url);
		end
		local body, err = httpGet(url, 14);
		if body then
			source = body;
			usedUrl = url;
			break;
		end
		lastErr = err;
		pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\180\43\240\172\182", "\150\210\74\153\192") .. tostring(err));
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\216\228\55\139\113\127\166\222\136\60\133\98\116\184\236\201\60\202\115\115\186\234\219\48\143\113", "\212\131\168\88\234\21\26"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\65\123\158\130\52\40\68\112\201\136\55\41\64", "\71\37\20\233\236\88"));
	if not source then
		showError(LUAOBFUSACTOR_DECRYPT_STR_0("\233\73\167\24\76\227\77\88", "\60\173\38\208\118\32\140\44"), LUAOBFUSACTOR_DECRYPT_STR_0("\96\62\237\147\21\253\109\33\161\213\33\198\77\55\229\137\96", "\175\33\82\129\179\64") .. tostring(lastErr));
		return;
	end
	setProgress(45, LUAOBFUSACTOR_DECRYPT_STR_0("\216\238\60\198\56\179\250\230\62\200\124\161\225\250\34\204\57\252\160\161", "\210\142\143\80\175\92"), usedUrl);
	local okVal, info = validateSource(source, usedUrl);
	if not okVal then
		showError(LUAOBFUSACTOR_DECRYPT_STR_0("\143\232\255\207\189\232\231\195", "\166\217\137\147"), tostring(info) .. LUAOBFUSACTOR_DECRYPT_STR_0("\163\191\50", "\38\131\195\18\198\145") .. string.sub(source, 1, 80));
		return;
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\104\250\53\234\60\81\65\235\122\248\55\65\65\213\63\171\46\85\95\223\62\234\44\81\87", "\52\51\182\90\139\88"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\224\184\220\238\71\247\173\213\227\3", "\35\150\217\176\135") .. tostring(info) .. LUAOBFUSACTOR_DECRYPT_STR_0("\185\82\18\24\114\80", "\22\153\48\107\108\23\35"));
	setProgress(60, LUAOBFUSACTOR_DECRYPT_STR_0("\45\138\182\10\118\121\72\231\9\203\245\84", "\137\110\229\219\122\31\21\33"), LUAOBFUSACTOR_DECRYPT_STR_0("\22\178\57\127\37\95\54\119\20\186", "\30\122\221\88\27\86\43\68"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\3\4\228\135\60\45\249\187\120\43\228\139\40\33\231\143\54\47", "\230\88\72\139"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\113\187\27\11\10\4\81\124\179", "\56\18\212\118\123\99\104"));
	local fn, compileError = loadstring(source);
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\37\197\247\210\219\219\12\212\184\208\208\211\14\224\244\210\203\215\17\231\184\213\214\208\23\250\240\214\219", "\190\126\137\152\179\191"));
	if not fn then
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\19\46\125\202\174\69\58\63\50\200\165\77\56\11\126\206\234\70\41\11\126\145", "\32\72\98\18\171\202"), compileError);
		showError(LUAOBFUSACTOR_DECRYPT_STR_0("\39\135\63\100\254\8\137\38\125\248\10", "\151\100\232\82\20"), tostring(compileError));
		return;
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\68\245\249\9\123\220\228\53\63\213\249\9\123\202\226\26\118\215\241\72\124\214\251\24\118\213\247\28\118\214\248\72\80\242", "\104\31\185\150"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\223\182\254\231\238\192\229\128\243\146", "\160\188\217\147\151\135\172\128"));
	setProgress(75, LUAOBFUSACTOR_DECRYPT_STR_0("\63\207\21\224\59\219\6\211\23\176\63\209\10\222\5\228\51\198\1\147\94\190", "\169\111\189\112\144\90"), LUAOBFUSACTOR_DECRYPT_STR_0("\203\143\36\170\172\192\26\135\217", "\226\173\227\69\205\223\224\105"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\72\44\39\75\206\9\93\126\39\67\202\24", "\123\56\94\66\59\175"));
	setProgress(85, LUAOBFUSACTOR_DECRYPT_STR_0("\223\91\118\226\15\234\136\244\68\51\233\15\252\207\180\13", "\225\154\35\19\129\122\158"), LUAOBFUSACTOR_DECRYPT_STR_0("\72\21\229\89\252\233\215", "\84\58\96\139\55\149\135\176"));
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\40\19\172\1\74\202\44\46\127\166\24\75\204\43\7\54\173\7\14\199\43\17", "\94\115\95\195\96\46\175"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\70\83\58\62\59\57\142\238\68\11\55\40\44", "\128\35\43\95\93\78\77\231"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\162\20\56\61\4\118\172\160\88\102", "\201\196\125\86\84\119\30")] = false;
	local execOk, execErr = false, nil;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\221\16\190\209\250\65\239", "\223\163\142\100")] = os.clock();
	task.spawn(function()
		execOk, execErr = pcall(fn);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\31\205\184\171\138\19\199\244\232", "\216\226\118\163\209")] = true;
	end);
	while not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\184\249\21\8\68\120\58\186\181\75", "\95\222\144\123\97\55\16")] do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\136\187\83\240\28\128\255\19", "\131\121\228\218\35")] = os.clock() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\205\227\54\0\107\15\156\128", "\123\185\176\66\97\25")];
		setProgress(85, LUAOBFUSACTOR_DECRYPT_STR_0("\237\23\28\82\0\59\81\63\207\79\17\68\23\97\22\127", "\81\168\111\121\49\117\79\56"), string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\226\6\228\166\212\15\225\236\135\79\171\231\193\25", "\214\167\106\133"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\52\77\95\39\122\221\108\104", "\185\73\88\44\47\84\31")]));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\219\27\176\192\250\140\146\74", "\159\232\183\122\192\179")] > 3) then
			pushLog(string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\55\38\161\45\40\114\161\47\45\38\232\100\106\99\174\50", "\65\68\82\200"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\92\115\48\220\202\122\96\0", "\30\69\48\18\64\175\175")]));
		end
		task.wait(0.4);
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\203\0\16\237\63\245\62\34\172\62\232\41\28\249\47\249\35\17\172\41\245\56\10\254\53\245\40", "\91\144\76\127\140"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\229\16\67\34\198\174\220\223\238\72\84\36\199\175\199\222\229\12", "\176\128\104\38\65\179\218\181"));
	if not execOk then
		warn(LUAOBFUSACTOR_DECRYPT_STR_0("\235\232\205\20\212\193\208\40\144\214\215\27\196\205\207\16\144\193\208\7\223\214\152", "\117\176\164\162"), execErr);
		showError(LUAOBFUSACTOR_DECRYPT_STR_0("\182\215\11\228\211\116\129", "\25\228\162\101\144\186"), tostring(execErr));
		return;
	end
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\115\26\182\15\246\225\90\11\249\6\231\230\8\25\146", "\132\40\86\217\110\146"));
	pushLog(LUAOBFUSACTOR_DECRYPT_STR_0("\118\222\37\252\136\88", "\62\30\171\71\220\199\19\156"));
	setProgress(100, LUAOBFUSACTOR_DECRYPT_STR_0("\104\80\174\118\79\204\46\73\89", "\45\32\37\204\86\61\169\79"), LUAOBFUSACTOR_DECRYPT_STR_0("\81\90\11\185", "\28\53\53\101\220\213"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\14\77\17", "\191\109\60\104\33\58\193\48")] = os.clock();
	while (os.clock() - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\133\93\183", "\135\231\183\120")]) < 3 do
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\47\98\210\112\74", "\201\134\106\44\132\85\122")].GreedyHudzell_Ready then
			break;
		end
		task.wait(0.2);
	end
	task.wait(0.3);
	destroyGui();
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\13\32\120\62\5\9\218\30\118\8\120\49\4", "\67\86\108\23\95\97\108\168"));
end);
if not okAll then
	warn(LUAOBFUSACTOR_DECRYPT_STR_0("\159\20\67\11\160\33\199\109\228\30\109\62\133\8\143", "\48\196\88\44\106\196\68\181"), errAll);
	print(LUAOBFUSACTOR_DECRYPT_STR_0("\185\243\211\34\132\161\176\17\194\249\253\23\161\136\248", "\76\226\191\188\67\224\196\194"), errAll);
end
