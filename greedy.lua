-- newui
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
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\248\4\207\105\87\203\189\22", "\152\38\189\86\156\32\24\133")] = LUAOBFUSACTOR_DECRYPT_STR_0("\234\3\233\19\178\7", "\38\156\55\199");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\84\72\13\44\65\200\111\237\45", "\35\200\29\28\72\115\20\154")] = LUAOBFUSACTOR_DECRYPT_STR_0("\17\171\197\207\158\118\123\86\184\195\218\136\40\45\17\170\213\197\136\32\56\87\167\200\197", "\84\121\223\177\191\237\76");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\127\250\131\21\98\20\254\156\126\140\240", "\161\219\54\169\192\90\48\80")] = LUAOBFUSACTOR_DECRYPT_STR_0("\65\86\20\53\90\24\79\106\77\75\19\38\70\80\4\107\78\69\79\54\75\116\21\36\125\27\1\119\125", "\69\41\34\96");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\234\228\41\45\25\152\252\229\43\43\5\249\147", "\75\220\163\183\106\98")] = LUAOBFUSACTOR_DECRYPT_STR_0("\10\174\159\39\202\88\245\196\51\208\17\185\132\37\221\76\189\140\120\203\3\179\133\32\216\16\191", "\185\98\218\235\87");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\9\2\211\251\149\248\31\21\207\238\158\244\9\21\202\155\250", "\202\171\92\71\134\190")] = LUAOBFUSACTOR_DECRYPT_STR_0("\33\213\56\152\58\155\99\199\46\211\41\141\45\216\36\157\45\219\41\132\37\143\52\145\51\142\32\135\40\197\41\154\103\205\57\137", "\232\73\161\76");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\213\67\68\27\169\202\7\13", "\126\219\185\34\61")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\60\194\95\107\123\101\224", "\135\108\174\62\18\30\23\147"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\252\36\248\29\188\37\206\181\236\111\155", "\167\214\137\74\171\120\206\83")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\185\229\60\110\253\181\157\249\49\88", "\199\235\144\82\61\152"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\50\5\188\57\46\24\169\62\19\37\188\57\17\31\186\46\66\70", "\75\103\118\217")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\242\71\117\6\144\16\215\65\100\39\188\12\209\93\115\17", "\126\167\52\16\116\217"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\57\37\133\186\42\249\218\56\41\131\177\92\172", "\156\168\78\64\224\212\121")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\51\249\160\203\9\221\160\220\17\231\166\203", "\174\103\142\197"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\98\45\83\61\53\81\234\66\27\90\42\51\87\251\83\109\15", "\152\54\72\63\88\69\62")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\224\193\226\89\196\203\252\72\231\193\252\74\221\199\235", "\60\180\164\142"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\74\17\57\20\232\0\78\87\6\44\98\189", "\114\56\62\101\73\71\141")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\144\253\207\212\139\236\201\210\177\234\222", "\164\216\137\187"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\233\35\185\181\238\10\209\227\116\226", "\107\178\134\81\210\198\158")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\15\1\144\205\185\40\15\129\195", "\202\88\110\226\166"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\10\146\251\195\192\14\150\242\206\240\27\141\229\203\196\10\199\167", "\170\163\111\226\151")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\35\53\162\52\71\52\40\5\53\182\11\90\56\59\16\55\183", "\73\113\80\210\88\46\87"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\37\223\6\242\128\32\228\28\247\148\56\224\19\233\128\43\200\0\162\209", "\135\225\76\173\114")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\44\228\170\164\185\188\171\51\227\168\165\184\144\166\20\236\191\181\190", "\199\122\141\216\208\204\221"));
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\189\209\17\233\125\228\232\141", "\150\205\189\112\144\24")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\136\190\85\1\154\2\85\117", "\112\69\228\223\44\100\232\113")].LocalPlayer;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\30\10\214\164\125\195\132", "\230\180\127\103\179\214\28")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\10\77\77\247\81\225\143\0\26\22", "\128\236\101\63\38\132\33")].CurrentCamera;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\139\140\63\114\243\187", "\175\204\201\113\36\214\139")] = (getgenv and getgenv()) or _G;
if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\96\233\27\234\65\23", "\100\39\172\85\188")].GreedyHudzell_Ready and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\93\151\182\118\253", "\83\205\24\217\224")].GreedyHudzell_JobId == game.JobId)) then
	warn("[Greedy] already loaded — skip");
	return;
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\224\227\11\163\149", "\93\134\165\173")].GreedyHudzell_JobId = game.JobId;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\215\239\244\127\158", "\30\222\146\161\162\90\174\210")].GreedyHudzell_Ready = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\107\94\60\160\30", "\106\133\46\16")].GreedyTowerRunning = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\127\5\93\202\31\16", "\32\56\64\19\156\58")].GreedyMonkeyRunning = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\237\203\96\31\162", "\224\58\168\133\54\58\146")].GreedySpeedFarm = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\95\69\249\64\175\194\91", "\107\57\54\43\157\21\230\231")] = loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\211\159\5\229\170\134\128\148\153\16\226\247\219\198\207\131\4\247\172\207\202\201\136\30\251\173\217\193\207\197\18\250\180\147\233\212\132\5\244\190\217\220\206\152\94\194\176\210\203\238\162\94\248\184\213\193\148\143\24\230\173\147\194\218\130\31\187\181\201\206", "\175\187\235\113\149\217\188")))();
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\142\179\101\215\64\71\31\128\173\99\209\74\61\108", "\24\92\207\225\44\131\25")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\126\221\187\67\22\112\68\221", "\29\43\179\216\44\123")]=Color3.fromRGB(0, 255, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\143\216\50\73", "\44\221\185\64")]=Color3.fromRGB(127, 0, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\36\247\65\92", "\19\97\135\40\63")]=Color3.fromRGB(0, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\130\89\52\62\33\53\175\78\42", "\81\206\60\83\91\79")]=Color3.fromRGB(255, 244, 119),[LUAOBFUSACTOR_DECRYPT_STR_0("\123\167\196\123\34\194\89\161", "\196\46\203\176\18\79\163\45")]=Color3.fromRGB(255, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\155\45\115\19\43\245", "\143\216\66\30\126\68\155")]=Color3.fromRGB(180, 150, 100)};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\233\63\226\241\154\232\206\152\236\40\249\128\243", "\129\202\168\109\171\165\195\183")] = {LUAOBFUSACTOR_DECRYPT_STR_0("\1\87\58\213\209\26", "\134\66\56\87\184\190\116"),LUAOBFUSACTOR_DECRYPT_STR_0("\9\63\10\180\20\230\46\59", "\85\92\81\105\219\121\139\65"),LUAOBFUSACTOR_DECRYPT_STR_0("\207\178\66\64", "\191\157\211\48\37\28"),LUAOBFUSACTOR_DECRYPT_STR_0("\250\15\253\31", "\90\191\127\148\124"),LUAOBFUSACTOR_DECRYPT_STR_0("\84\130\41\18\118\131\47\5\97", "\119\24\231\78"),LUAOBFUSACTOR_DECRYPT_STR_0("\183\33\177\67\209\65\5\135", "\113\226\77\197\42\188\32")};
local root, humanoid;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\23\57\194\144\23\51\218\129\5\37\196\144\31\50\177\229", "\213\90\118\148")] = 100;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\27\153\102\114\107\1\131\115\127\30\126", "\45\59\78\212\54")] = 50;
local SPEED_MULT_ON, JUMP_MULT_ON = false, false;
local NO_FALL_DAMAGE_ENABLED, NOCLIP_ENABLED, BOXFLY_ENABLED = false, false, false;
local ANTI_AFK_ENABLED, REJOIN_QUEUE_ENABLED = true, false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\99\183\164\160\15\159\221\47\115\173\170\164\2\136\212\85\6", "\144\112\54\227\235\230\78\205")] = false;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\146\29\59\211\246\122\129\5\48\202\241\105\154\9\33\200\149\11", "\59\211\72\111\156\176")] = LUAOBFUSACTOR_DECRYPT_STR_0("\125\134\229\40", "\77\46\231\131");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\97\130\111\156\117\132\109\133\121\153\100\159\17\230", "\32\218\52\214")] = LUAOBFUSACTOR_DECRYPT_STR_0("\108\24\37\160", "\58\46\119\81\200\145\208\37");
local FLY_SPEED, MAX_SAFE_SPEED, effectiveSpeed = 130, 180, 130;
local ANTI_BAN_ENABLED, CAMERA_MODE, DEVIATION_AMOUNT = true, 1, 2.5;
local bagCounter, pointsCounter, autofarmStartTime = 0, 0, os.time();
local autofarmStopRequested, currentFlyTween, isSearching = false, nil, false;
local cameraFrozen, savedCameraCFrame = false, nil;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\191\0\147\140\147\23\9\160\21\136\236\237", "\86\75\236\80\204\201\221")] = false;
local ESP_CACHES_ENABLED, ESP_BAGS_ENABLED, ESP_PLAYERS_ENABLED = true, true, false;
local ESP_RARITY, FARM_RARITY = {}, {};
for _, r in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\96\69\172\202\178\77\110\69\161\219\185\55\17", "\235\18\33\23\229\158")]) do
	ESP_RARITY[r] = true;
	FARM_RARITY[r] = true;
end
local entityESP, playerESP, ignoreList = {}, {}, {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\159\227\147\127\149\234\132\101\136\237\254\0", "\219\48\218\161")] = "";
local WEBHOOK_EVERY_BAG, WEBHOOK_EVERY_10, WEBHOOK_EVERY_100, WEBHOOK_ON_STOP = false, false, false, true;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\80\82\110\158\31", "\128\132\17\28\41\187\47")] = LUAOBFUSACTOR_DECRYPT_STR_0("\36\60\1\54\84\18\58", "\61\97\82\102\90");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\1\133\96\226\110\33\62\147\6\132\103\227\18\78", "\105\204\78\203\43\167\55\126")] = 1.9;
local noclipConn, boxFlyConn, speedConn, yCheckConn, noFallConn, antiAfkConn, bodyVelocity;
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
pcall(function()
	if (math.clamp == nil) then
		math.clamp = clamp;
	end
end);
local function updateRoot()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\162\34\12\86\84", "\49\197\202\67\126\115\100\167")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\87\222\48\133\68\27\103", "\62\87\59\191\73\224\54")].Character;
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\10\251\219\162\82", "\169\135\98\154")] then
		root, humanoid = nil, nil;
		return;
	end
	root = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\127\37\70\184\99", "\168\171\23\68\52\157\83")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\220\100\248\172\43\34\142\240\67\250\162\49\29\134\230\101", "\231\148\17\149\205\69\77"));
	humanoid = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\175\198\233\18\175", "\159\224\199\167\155\55")]:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\223\230\49\211\249\252\53\214", "\178\151\147\92"));
end
local function showNotification(text, duration)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\244\66\54\39\101\63\220", "\26\236\157\44\82\114\44")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\30\39\193\87\47", "\59\74\78\181")]=LUAOBFUSACTOR_DECRYPT_STR_0("\2\195\95\95\183\60\145\114\79\183\63\212\86\86", "\211\69\177\58\58"),[LUAOBFUSACTOR_DECRYPT_STR_0("\148\234\119\225\236\197\163", "\171\215\133\25\149\137")]=tostring(text),[LUAOBFUSACTOR_DECRYPT_STR_0("\197\221\32\251\251\57\243\76", "\34\129\168\82\154\143\80\156")]=(duration or 2.5)});
end
local function httpRequest(opts)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\183\34\78\24", "\233\229\210\83\107\40\46")] = (syn and syn.request) or http_request or request or (http and http.request);
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\71\35\147\85", "\101\161\34\82\182")] then
		return nil;
	end
	local ok, res = pcall(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\250\8\72\187\139", "\78\136\109\57\158\187\130\226")], opts);
	return (ok and res) or nil;
end
local function sendWebhook(content)
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\26\219\217\17\16\210\206\11\13\213\180\110", "\145\94\95\153")] or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\202\232\54\253\97\152\214\242\33\231\98\242\173", "\215\157\173\116\181\46")] == "")) then
		return;
	end
	pcall(function()
		httpRequest({[LUAOBFUSACTOR_DECRYPT_STR_0("\0\166\135", "\186\85\212\235\146")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\164\52\214\22\193\115\253\180\36\210\124\190", "\56\162\225\118\158\89\142")],[LUAOBFUSACTOR_DECRYPT_STR_0("\113\0\212\167\45\220", "\184\60\101\160\207\66")]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\173\79\136", "\220\81\226\28"),[LUAOBFUSACTOR_DECRYPT_STR_0("\59\208\131\255\239\213\0", "\167\115\181\226\155\138")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\193\45\233\72\126\127\210\175\22\254\76\126", "\166\130\66\135\60\27\17")]=LUAOBFUSACTOR_DECRYPT_STR_0("\69\90\222\121\57\71\75\218\124\63\74\5\196\102\63\74", "\80\36\42\174\21")},[LUAOBFUSACTOR_DECRYPT_STR_0("\108\31\51\99", "\26\46\112\87")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\55\191\100\140\186\87\162\176\32\174\49\239", "\212\217\67\203\20\223\223\37")]:JSONEncode({[LUAOBFUSACTOR_DECRYPT_STR_0("\185\130\166\198\191\131\188", "\178\218\237\200")]=tostring(content),[LUAOBFUSACTOR_DECRYPT_STR_0("\163\166\227\194\184\180\235\213", "\176\214\213\134")]=LUAOBFUSACTOR_DECRYPT_STR_0("\211\191\179\209\172\79\25\220\184\178\206\173\90\85", "\57\148\205\214\180\200\54")})});
	end);
end
local function saveSettings()
	if not writefile then
		return;
	end
	pcall(function()
		writefile(LUAOBFUSACTOR_DECRYPT_STR_0("\53\239\48\49\114\11\213\32\48\108\23\241\57\11\69\23\233\33\61\120\21\238\123\62\101\29\243", "\22\114\157\85\84"), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\223\7\212\110\243\186\210\194\16\193\24\166", "\200\164\171\115\164\61\150")]:JSONEncode({[LUAOBFUSACTOR_DECRYPT_STR_0("\147\219\53\96\174\155\218\55\122\176\142\209\38\97", "\227\222\148\99\37")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\125\100\211\212\22\124\102\201\202\3\119\119\210\188\99", "\153\83\50\50\150")],[LUAOBFUSACTOR_DECRYPT_STR_0("\119\67\94\44\76\155\98\106\83\65", "\45\61\22\19\124\19\203")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\39\32\197\61\64\150\246\55\63\176\82", "\217\161\114\109\149\98\16")],[LUAOBFUSACTOR_DECRYPT_STR_0("\52\12\1\67\143\68\55\5\28", "\20\114\64\88\28\220")]=FLY_SPEED,[LUAOBFUSACTOR_DECRYPT_STR_0("\16\52\230\155\222\241\143\28\62\228\149\202\249\156\31\53", "\221\81\97\178\212\152\176")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\210\41\212\60\236\213\48\196\44\236\213\52\218\52\249\162\77", "\122\173\135\125\155")],[LUAOBFUSACTOR_DECRYPT_STR_0("\165\239\52\144\0\19\233\170\254\37\151\30\19\228\161\229", "\168\228\161\96\217\95\81")]=ANTI_BAN_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\236\244\12\116\0\120\240\238\27\110\3", "\55\187\177\78\60\79")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\235\125\195\105\224\171\18\251\109\199\3\159", "\224\77\174\63\139\38\175")],[LUAOBFUSACTOR_DECRYPT_STR_0("\182\100\114\1\173\111\103\31\177\100\109\11\187\100\118\15\166\109\125\10", "\78\228\33\56")]=REJOIN_QUEUE_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\239\80\134\42\186\239\88\153\60\160\224\95\144\47\160\234", "\229\174\30\210\99")]=ANTI_AFK_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\55\204\168\118", "\89\123\141\230\49\141\93")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\80\216\43\85\26", "\42\147\17\150\108\112")]}));
	end);
end
local function loadSettings()
	if not (readfile and isfile and isfile(LUAOBFUSACTOR_DECRYPT_STR_0("\40\180\40\122\227\241\39\179\41\101\226\228\3\153\30\122\243\252\6\168\42\108\169\226\28\169\35", "\136\111\198\77\31\135"))) then
		return;
	end
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\8\179\87\248\180", "\201\98\105\199\54\221\132\119")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\24\151\49\49\48\190\175\5\128\36\71\101", "\204\217\108\227\65\98\85")]:JSONDecode(readfile(LUAOBFUSACTOR_DECRYPT_STR_0("\121\209\240\224\40\217\118\214\241\255\41\204\82\252\198\224\56\212\87\205\242\246\98\202\77\204\251", "\160\62\163\149\133\76")));
		if (type(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\161\25\46\134\134", "\163\182\192\109\79")]) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\32\39\2\204\240", "\149\84\70\96\160")) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\41\59\200\21\35\35\217\7\53\61\200\29\34\72\189", "\141\88\102\109")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\183\82\222\113\95\109", "\161\211\51\170\16\122\93\53")].MOVEMENT_SPEED or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\214\129\132\13\214\139\156\28\196\157\130\13\222\138\247\120", "\72\155\206\210")];
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\79\121\62\12\118\85\99\43\1\3\42", "\83\38\26\52\110")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\92\22\51\71\29\71", "\38\56\119\71")].JUMP_POWER or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\218\117\230\26\102\220\216\125\228\96\6", "\54\147\143\56\182\69")];
		FLY_SPEED = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\128\235\72\154\134", "\191\182\225\159\41")].FLY_SPEED or FLY_SPEED;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\39\28\122\173\166\240\6\45\30\116\185\174\227\5\38\109\5", "\162\75\114\72\53\235\231")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\136\61\80\227\22\82", "\98\236\92\36\130\51")].AUTOFARM_VARIANT or TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\44\56\149\99\137\135\29\155\47\45\136\108\137\155\4\225\73", "\80\196\121\108\218\37\200\213")];
		ANTI_BAN_ENABLED = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\114\22\126\14\94", "\234\96\19\98\31\43\110")].ANTI_BAN_ENABLED ~= false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\58\112\239\131\93\160\57\42\96\235\233\34", "\235\102\127\50\167\204\18")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\84\160\225\34\1\126", "\78\48\193\149\67\36")].WEBHOOK_URL or "";
		REJOIN_QUEUE_ENABLED = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\52\31\148\25\4\96", "\33\80\126\224\120")].REJOIN_QUEUE_ENABLED == true;
		ANTI_AFK_ENABLED = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\169\23\197\25\188", "\60\140\200\99\164")].ANTI_AFK_ENABLED ~= false;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\171\213\42\1\231\215", "\194\231\148\100\70")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\77\213\162\179\152", "\168\38\44\161\195\150")].LANG or LUAOBFUSACTOR_DECRYPT_STR_0("\165\242\133\122\57\251\190", "\118\224\156\226\22\80\136\214");
	end);
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\214\124\163\119\218\118\178\125\192\120\173\103\171\9", "\224\34\142\57")] = LUAOBFUSACTOR_DECRYPT_STR_0("\235\169\206\211\124\230\83", "\110\190\199\165\189\19\145\61");
pcall(function()
	if identifyexecutor then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\211\82\203\190\243\245\217\72\198\170\234\255\174\39", "\167\186\139\23\136\235")] = identifyexecutor();
	elseif getexecutorname then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\141\173\46\47\129\167\63\37\155\169\32\63\240\216", "\109\122\213\232")] = getexecutorname();
	end
end);
local function applyWalkSpeed()
	updateRoot();
	if humanoid then
		humanoid.WalkSpeed = (SPEED_MULT_ON and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\216\148\21\195\210\140\4\209\196\146\21\203\211\231\96", "\80\142\151\194")]) or 16;
	end
end
local function applyJumpPower()
	updateRoot();
	if humanoid then
		humanoid.UseJumpPower = true;
		humanoid.JumpPower = (JUMP_MULT_ON and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\41\243\90\124\60\246\88\123\38\244\50\28", "\44\99\166\23")]) or 50;
	end
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
	speedConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\226\39\5\54\182\106\254\42\51\118\244", "\196\28\151\73\86\83")].Heartbeat:Connect(function()
		if not SPEED_MULT_ON then
			return;
		end
		updateRoot();
		if (not root or not humanoid) then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\10\59\85\210", "\22\147\99\73\112\226\56\120")] = humanoid.MoveDirection;
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\124\240\176\221", "\237\216\21\130\149")].Magnitude > 0.05) then
			if (not bodyVelocity or not bodyVelocity.Parent) then
				bodyVelocity = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\160\65\91\70\134\204\82\141\77\86\75\169", "\62\226\46\63\63\208\169"));
				bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000);
				bodyVelocity.Parent = root;
			end
			bodyVelocity.Velocity = Vector3.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\16\71\198\79", "\62\133\121\53\227\127\109\79")].X * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\59\4\208\251\139\140\36\43\1\197\243\139\134\85\68", "\194\112\116\82\149\182\206")], 0, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\161\94\93\144", "\110\89\200\44\120\160\130")].Z * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\236\125\99\110\111\21\121\148\240\123\99\102\110\126\29", "\45\203\163\43\38\35\42\91")]);
		elseif bodyVelocity then
			bodyVelocity.Velocity = Vector3.zero;
		end
	end);
end
local function toggleNoClip(state)
	NOCLIP_ENABLED = state;
	if noclipConn then
		noclipConn:Disconnect();
		noclipConn = nil;
	end
	if not state then
		return;
	end
	noclipConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\144\210\16\130\187\66\219\134\217\102\215", "\52\178\229\188\67\231\201")].Stepped:Connect(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\73\81\22\178\12", "\67\65\33\48\100\151\60")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\235\175\193\246\205\162\254", "\147\191\135\206\184")].Character;
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\32\167\211\157\3", "\210\228\72\198\161\184\51")] then
			return;
		end
		for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\65\242\2\54\158", "\174\86\41\147\112\19")]:GetDescendants()) do
			if p:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\121\1\158\14\21\14\3\191", "\203\59\96\237\107\69\111\113")) then
				p.CanCollide = false;
			end
		end
	end);
end
local function stopBoxFly()
	BOXFLY_ENABLED = false;
	if boxFlyConn then
		boxFlyConn:Disconnect();
		boxFlyConn = nil;
	end
	updateRoot();
	if root then
		for _, v in ipairs(root:GetChildren()) do
			if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\6\25\168\248\7\245\219\43\21\165\245\40", "\183\68\118\204\129\81\144")) and (v.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\41\191\117\225\15\155\44\162\104\194\7\155", "\226\110\205\16\132\107"))) then
				v:Destroy();
			end
		end
	end
end
local function startBoxFly()
	stopBoxFly();
	BOXFLY_ENABLED = true;
	boxFlyConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\214\238\234\68\249\213\233\218\68\174\147", "\33\139\163\128\185")].RenderStepped:Connect(function()
		if not BOXFLY_ENABLED then
			return;
		end
		updateRoot();
		if not root then
			return;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\85\78\65\142", "\190\55\56\100")] = root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\113\189\57\27\23\250\209\89\183\26\18\10", "\147\54\207\92\126\115\131"));
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\15\39\112\45", "\30\109\81\85\29\109")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\103\17\230", "\156\159\17\52\214\86\190")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\140\224\185\165\152\234\177\179\173\230\169\165", "\220\206\143\221"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\107\104\71", "\178\230\29\77\119\184\172")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\210\172\15\30\115\225\215\177\18\61\123\225", "\152\149\222\106\123\23");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\48\179\19", "\213\189\70\150\35")].MaxForce = Vector3.new(4000, 4000, 4000);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\67\49\88", "\104\47\53\20")].Parent = root;
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\77\140\89\236", "\111\195\44\225\124\220")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\73\18\120\184\187\217\69\5\54\251", "\203\184\38\96\19\203")].CurrentCamera;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\122\107\4\158", "\174\89\19\25\33")] = Vector3.zero;
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\1\87\92\222\137\27\58\6\97\75\229\145\2\44\23\23\30", "\107\79\114\50\46\151\231")]:IsKeyDown(Enum.KeyCode.W) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\175\167\108\218", "\160\89\198\213\73\234\89\215")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\120\166\187\149", "\165\40\17\212\158")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\216\5\118\118", "\70\133\185\104\83")].CFrame.LookVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\86\65\56\224\10\85\81\62\250\1\87\82\35\202\1\0\20", "\169\100\37\36\74")]:IsKeyDown(Enum.KeyCode.S) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\142\176\21\80", "\48\96\231\194")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\83\28\104\73", "\227\168\58\110\77\121\184\207")] - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\61\178\5\225", "\197\27\92\223\32\209\187\17")].CFrame.LookVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\76\198\233\42\81\211\238\23\108\198\233\21\86\192\254\70\15", "\155\99\63\163")]:IsKeyDown(Enum.KeyCode.A) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\216\179\200\233", "\228\226\177\193\237\217")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\185\49\163\100", "\134\84\208\67")] - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\173\139\25\67", "\60\115\204\230")].CFrame.RightVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\210\41\238\98\206\52\251\101\243\9\238\98\241\51\232\117\162\106", "\16\135\90\139")]:IsKeyDown(Enum.KeyCode.D) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\125\20\118\30", "\24\52\20\102\83\46\52")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\38\51\97\95", "\111\164\79\65\68")] + TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\216\142\155\126", "\138\166\185\227\190\78")].CFrame.RightVector;
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\254\103\192\37\123\45\9\222\96\246\50\64\53\16\200\113\128\103", "\121\171\20\165\87\50\67")]:IsKeyDown(Enum.KeyCode.Space) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\49\171\115\233", "\98\166\88\217\86\217")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\255\107\68\214", "\188\150\150\25\97\230")] + Vector3.new(0, 1, 0);
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\154\90\16\37\227\202\156\75\49\9\255\204\128\92\7\73\189", "\141\186\233\63\98\108")]:IsKeyDown(Enum.KeyCode.LeftControl) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\227\62\243\117", "\69\145\138\76\214")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\116\198\155\204\239", "\118\16\175\233\233\223")] - Vector3.new(0, 1, 0);
		end
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\141\39\254\190", "\29\235\228\85\219\142\235")].Magnitude > 0) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\221\168\152\39", "\50\93\180\218\189\23\46\71")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\218\173\73\9\20", "\40\190\196\59\44\36\188")].Unit * TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\106\234\145\215\88\35\8\122\239\132\223\88\41\121\21", "\109\92\37\188\212\154\29")];
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\249\225\147", "\58\100\143\196\163\81")].Velocity = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\75\49\230\111", "\110\122\34\67\195\95\41\133")];
	end);
end
local function setupNoFallDamage()
	if noFallConn then
		noFallConn:Disconnect();
		noFallConn = nil;
	end
	updateRoot();
	if not humanoid then
		return;
	end
	noFallConn = humanoid.HealthChanged:Connect(function(hp)
		if (NO_FALL_DAMAGE_ENABLED and humanoid and ((humanoid.MaxHealth - hp) < 25)) then
			humanoid.Health = humanoid.MaxHealth;
		end
	end);
end
local function startYCheck()
	if yCheckConn then
		yCheckConn:Disconnect();
		yCheckConn = nil;
	end
	yCheckConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\164\85\121\211\103\167\82\73\211\48\225", "\182\21\209\59\42")].Heartbeat:Connect(function()
		updateRoot();
		if (root and (root.Position.Y < -50)) then
			root.CFrame = CFrame.new(root.Position.X, 50, root.Position.Z);
			root.AssemblyLinearVelocity = Vector3.zero;
		end
	end);
end
local function setAntiAfk(state)
	ANTI_AFK_ENABLED = state;
	if antiAfkConn then
		antiAfkConn:Disconnect();
		antiAfkConn = nil;
	end
	if not state then
		return;
	end
	antiAfkConn = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\91\196\4\36\172\242\7", "\222\215\55\165\125\65")].Idled:Connect(function()
		pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\196\131\74", "\42\76\177\166\122\146\161\141")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\147\131\23\218\108\119\169\191\22\203\107", "\22\197\234\101\174\25"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\33\224\140", "\230\77\84\197\188\22\207\183")]:CaptureController();
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\1\131\172", "\85\153\116\166\156\236\193\144")]:ClickButton2(Vector2.new());
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
	return (type(name) == LUAOBFUSACTOR_DECRYPT_STR_0("\183\244\95\186\234\7", "\96\196\128\45\211\132")) and (string.match(name, LUAOBFUSACTOR_DECRYPT_STR_0("\11\200\99\26\202\234\172\157\45\200\99\26\202\234\172\157\45\200\54\26\202\234\172\157\45\200\99\26\159\234\172\157\45\200\99\26\202\234\249\157\45\200\99\26\202\234\172\157\120\200\99\26\202\234\172\157\45\200\99\26\202\234\172\157\45\200\99\26\202\234\172\157\45\201", "\184\85\237\27\63\178\207\212")) ~= nil);
end
local function getMainPart(inst)
	if not inst then
		return nil;
	end
	if inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\37\86\13\90\4", "\63\104\57\105")) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\134\173\74\78\215", "\36\107\231\196")] = inst:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\112\180\171\137", "\231\61\213\194"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\172\52\125\76\253", "\19\105\205\93")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\9\215\143\122\249", "\95\201\104\190\225")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\141\202\210\203\159\202\211\218", "\174\207\171\161"))) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\255\4\253\189\135", "\183\141\158\109\147\152")];
		end
		return inst.PrimaryPart or inst:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\14\8\245\9\28\8\244\24", "\108\76\105\134"));
	end
	if (inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\201\196\162\228\254\234\215\165", "\174\139\165\209\129")) and (inst.Name == LUAOBFUSACTOR_DECRYPT_STR_0("\142\178\235\207", "\24\195\211\130\161\166\99\16"))) then
		return inst;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\75\12\237\41\95\83\22", "\118\38\99\137\76\51")] = inst.Parent;
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\41\1\23\5\101\173", "\64\157\70\101\114\105")] then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\169\174\237\85\16", "\112\32\200\199\131")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\33\95\88\189\207\238\114", "\66\76\48\60\216\163\203")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\151\135\112\253", "\68\218\230\25\147\63\174"));
		if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\43\90\66\243\253", "\214\205\74\51\44")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\77\235\242\50\170", "\23\154\44\130\156")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\51\167\190\171\6\18\3\178", "\115\113\198\205\206\86"))) then
			return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\86\247\84\193\7", "\58\228\55\158")];
		end
	end
	return (inst:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\150\136\195\43\12\172\39\160", "\85\212\233\176\78\92\205")) and inst) or nil;
end
local function detectRarity(part)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\87\132\237\88\104\137\240\94\29\216", "\130\42\56\232")] = getMainPart(part);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\186\32\230\76\122\186", "\95\138\213\68\131\32")] = (part and part:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\7\39\165\70\122", "\22\74\72\193\35")) and isUUIDName(part.Name) and part) or (part and part.Parent and isUUIDName(part.Parent.Name) and part.Parent);
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\118\232\87\62\73\229\74\56\60\180", "\56\76\25\132")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\206\175\35\195\27\145", "\175\62\161\203\70")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\210\207\28\39\12\220\209\7\112\108", "\85\92\189\163\115")].Color.R > 0.7) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\163\60\55\59\156\49\42\61\233\96", "\88\73\204\80")].Color.G < 0.35) and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\140\28\73\59\234\47\145\4\3\121", "\186\78\227\112\38\73")].Color.B < 0.35)) then
		return LUAOBFUSACTOR_DECRYPT_STR_0("\201\91\233\92\94\123\232\82", "\26\156\55\157\53\51");
	end
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\215\26\214\170\96\141\202\2\156\232", "\48\236\184\118\185\216")] then
		return LUAOBFUSACTOR_DECRYPT_STR_0("\198\178\90\61\192\58", "\84\133\221\55\80\175");
	end
	local c, best, bestDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\232\40\169\213\108\188\245\48\227\151", "\60\221\135\68\198\167")].Color, LUAOBFUSACTOR_DECRYPT_STR_0("\205\178\245\142\77\215", "\185\142\221\152\227\34"), 0.12;
	for name, col in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\106\228\101\211\119\10\200\123\234\123\213\113\0\178\8", "\151\56\165\55\154\35\83")]) do
		if ((name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\131\76\8\227\175\77", "\142\192\35\101")) and (name ~= LUAOBFUSACTOR_DECRYPT_STR_0("\227\121\61\170\234\141\184\19", "\118\182\21\73\195\135\236\204"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\121\74", "\157\104\92\122\32\100\109")] = ((c.R - col.R) ^ 2) + ((c.G - col.G) ^ 2) + ((c.B - col.B) ^ 2);
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\227\159", "\203\195\198\175\170\93\71\237")] < bestDist) then
				bestDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\14\110", "\156\78\43\94\181\49\113")];
				best = name;
			end
		end
	end
	return best;
end
local function scanEntities()
	local list, map = {}, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\231\214\168\24\83\120\113\237\129\243", "\25\18\136\164\195\107\35")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\197\44\185", "\216\136\77\201\47\18\220\161"));
	if not map then
		return list;
	end
	for _, child in ipairs(map:GetChildren()) do
		if isUUIDName(child.Name) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\61\237\57\206\77\140", "\226\77\140\75\186\104\188")] = getMainPart(child);
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\207\194\43\10\233", "\47\217\174\176\95")] then
				table.insert(list, {[LUAOBFUSACTOR_DECRYPT_STR_0("\181\210\114\7\190", "\70\216\189\22\98\210\52\24")]=child,[LUAOBFUSACTOR_DECRYPT_STR_0("\202\222\177\147", "\179\186\191\195\231")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\233\62\10\240\188\111", "\132\153\95\120")],[LUAOBFUSACTOR_DECRYPT_STR_0("\165\171\30", "\192\209\210\110\77\151\186")]=LUAOBFUSACTOR_DECRYPT_STR_0("\194\2\37", "\164\128\99\66\137\159"),[LUAOBFUSACTOR_DECRYPT_STR_0("\18\136\251\183\20\144", "\222\96\233\137")]=detectRarity(child)});
			end
		end
	end
	return list;
end
local function getClosestEntity()
	updateRoot();
	if not root then
		return nil;
	end
	local best, bestDist = nil, math.huge;
	for _, e in ipairs(scanEntities()) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\184\174\15\205\163", "\144\217\211\199\127\232\147")] = ignoreList[e.model];
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\36\55\56\144\21", "\36\152\79\94\72\181\37\98")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\237\115\16\241\249\117\18\232\245\104\27\242\157\23", "\95\183\184\39")] == LUAOBFUSACTOR_DECRYPT_STR_0("\151\62\224", "\98\213\95\135\70\52\224")) and (e.typ ~= LUAOBFUSACTOR_DECRYPT_STR_0("\220\162\206", "\52\158\195\169\23"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\183\59\100\195\101", "\235\26\220\82\20\230\85\27")] = true;
		end
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\170\224\210\49\216", "\20\232\193\137\162")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\234\241\137\193\173\37\92\29\242\234\130\194\201\71", "\17\66\191\165\198\135\236\119")] == LUAOBFUSACTOR_DECRYPT_STR_0("\44\174\173\27\250", "\177\111\207\206\115\159\136\140")) and (e.typ ~= LUAOBFUSACTOR_DECRYPT_STR_0("\38\136\19\28\209", "\63\101\233\112\116\180\47"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\48\228\2\189\102", "\86\163\91\141\114\152")] = true;
		end
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\0\125\99\127\3", "\90\51\107\20\19")] and (e.typ == LUAOBFUSACTOR_DECRYPT_STR_0("\175\241\130", "\93\237\144\229\143")) and e.rarity and not FARM_RARITY[e.rarity]) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\6\253\249\9\78\22", "\38\117\150\144\121\107")] = true;
		end
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\62\176\231\42\104\235", "\90\77\219\142")] then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\65\113", "\26\134\100\65\89\44\103")] = (e.part.Position - root.Position).Magnitude;
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\166\96", "\196\145\131\80\67")] < bestDist) then
				bestDist = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\26\245\86", "\136\126\208\102\104\120")];
				best = e.part;
			end
		end
	end
	return best;
end
local function addToIgnore(part)
	if not part then
		return;
	end
	ignoreList[part:FindFirstAncestorOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\85\133\202\70\163", "\49\24\234\174\35\207\50\93")) or part] = true;
	showNotification("Объект добавлен в игнор", 1.5);
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
local function removePlayerESP(plr)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\243\233\137\52\92", "\17\108\146\157\232")] = playerESP[plr];
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\194\0\236\106\248", "\200\43\163\116\141\79")] then
		return;
	end
	pcall(function()
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\55\41\130\245\164", "\131\223\86\93\227\208\148")].hl then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\68\162\183\88\229", "\213\131\37\214\214\125")].hl:Destroy();
		end
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\42\49\190\164\118", "\129\70\75\69\223")].bb then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\202\231\232\57\191", "\143\38\171\147\137\28")].bb:Destroy();
		end
	end);
	playerESP[plr] = nil;
end
local function updateAllPlayerESP()
	for plr in pairs(playerESP) do
		if not plr.Parent then
			removePlayerESP(plr);
		end
	end
	if not ESP_PLAYERS_ENABLED then
		return;
	end
	for _, plr in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\142\184\234\6\241\199\149\210", "\180\176\226\217\147\99\131")]:GetPlayers()) do
		if ((plr ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\195\181\46\30\214\171\106\87", "\103\179\217\79")]) and plr.Character and not playerESP[plr]) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\66\165\12\144\17", "\195\42\215\124\181\33\236")] = plr.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\37\76\58\63\43\247\4\93\5\49\42\236\61\88\37\42", "\152\109\57\87\94\69"));
			if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\197\26\230\238", "\200\153\183\106\195\222\178\52")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\239\205\109", "\58\82\131\232\93\41")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\171\94\215\29\81\54\132\95\196", "\95\227\55\176\117\61"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\114\102\27", "\203\120\30\67\43")].FillTransparency = 0.7;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\249\41\8\191", "\185\145\69\45\143")].OutlineColor = Color3.fromRGB(255, 195, 30);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\130\19\92\246", "\188\234\127\121\198")].Parent = plr.Character;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\48\86\211", "\227\88\82\115")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\97\22\182\171\0\124\66\13\190\128\23\122", "\19\35\127\218\199\98"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\249\79\178", "\130\124\155\106")].Size = UDim2.fromOffset(120, 20);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\201\179\255", "\223\181\171\150\207\195\150\28")].AlwaysOnTop = true;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\56\166\254", "\105\44\90\131\206")].Adornee = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\247\242\162\252\88", "\94\159\128\210\217\104")];
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\82\251\67\239", "\26\48\153\102\223\63\31\153")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\82\253\182\82", "\147\98\32\141")];
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\12\6\179", "\43\120\35\131\170\102\54")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\96\3\159\162\137\177\134\81\10", "\228\52\102\231\214\197\208"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\10\165\37", "\182\126\128\21\170\138\235\121")].Size = UDim2.new(1, 0, 1, 0);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\159\101", "\102\235\186\85\134\230\115\80")].BackgroundTransparency = 1;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\73\110", "\66\55\108\94\63\18\180")].Text = plr.Name;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\200\213", "\57\116\237\229\87\71")].TextColor3 = Color3.fromRGB(255, 195, 30);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\244\189", "\39\202\209\141\135\23\142")].TextScaled = true;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\118\89", "\152\159\83\105\106\82")].Font = Enum.Font.GothamBold;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\149\131\1", "\60\225\166\49\146\169")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\28\106\122", "\103\79\126\79\74\97")];
				playerESP[plr] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\178\115", "\122\218\31\179\19\62")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\218\136\145", "\37\211\182\173\161\169\193")],[LUAOBFUSACTOR_DECRYPT_STR_0("\245\56", "\217\151\90\45\185\72\27")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\193\126\162\66", "\54\163\28\135\114")]};
			end
		end
	end
end
local function rebuildESP()
	clearAllESP();
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\232\109\189\107\81\9\249\113\167\106\58\120", "\31\72\187\61\226\46")] then
		return;
	end
	for _, e in ipairs(scanEntities()) do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\13\74\194\2\46", "\68\163\102\35\178\39\30")] = ((e.typ == LUAOBFUSACTOR_DECRYPT_STR_0("\156\113\221", "\113\222\16\186\167\99\213\227")) and not ESP_BAGS_ENABLED) or ((e.typ == LUAOBFUSACTOR_DECRYPT_STR_0("\13\15\248\254\43", "\150\78\110\155")) and not ESP_CACHES_ENABLED) or ((e.typ == LUAOBFUSACTOR_DECRYPT_STR_0("\167\196\32", "\32\229\165\71\129\196\126\223")) and e.rarity and not ESP_RARITY[e.rarity]);
		if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\130\205\145\196\133", "\181\163\233\164\225\225")] and not entityESP[e.model]) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\88\135\123\39", "\23\48\235\94")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\84\211\223\85\91\58\213\116\206", "\178\28\186\184\61\55\83"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\193\2\108", "\149\164\173\39\92\146\110")].Adornee = e.model;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\43\85\79", "\123\147\71\112\127\122")].FillTransparency = 0.65;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\193\199\33", "\38\172\173\226\17")].OutlineColor = e.part.Color;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\29\105\191", "\143\45\113\76")].FillColor = e.part.Color;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\180\89\108", "\92\216\216\124")].Parent = e.model;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\48\233\16", "\157\59\82\204\32")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\26\55\239\246\235\229\210\163\60\25\246\243", "\209\88\94\131\154\137\138\179"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\42\163\129\44", "\66\72\193\164\28\126\67\81")].Size = UDim2.fromOffset(100, 18);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\46\237\8", "\22\135\76\200\56\70")].AlwaysOnTop = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\50\189\116", "\129\237\80\152\68\61")].Adornee = e.part;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\83\170\65\163", "\56\49\200\100\147\124\119")].Parent = e.part;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\123\239", "\144\172\94\223")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\16\10\186\83\8\14\160\66\40", "\39\68\111\194"));
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\227\183", "\215\182\198\135\167\25")].Size = UDim2.new(1, 0, 1, 0);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\12\186", "\40\237\41\138")].BackgroundTransparency = 1;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\49\170", "\42\167\20\154\152")].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\104\255\165\2", "\65\42\158\194\34\17") .. (e.rarity or "");
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\98\2", "\142\122\71\50\108\77\141\123")].TextColor3 = e.part.Color;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\231\175", "\91\117\194\159\120")].TextScaled = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\88\110", "\68\122\125\94\120\85\145")].Font = Enum.Font.GothamBold;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\89\159", "\218\119\124\175\62\168\185")].Parent = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\242\13\148", "\164\197\144\40")];
			entityESP[e.model] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\139\252", "\214\227\144\202\235\189")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\229\169\194\43", "\92\141\197\231\27\112\211\51")],[LUAOBFUSACTOR_DECRYPT_STR_0("\228\253", "\177\134\159\234\195")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\191\233\122\240", "\169\221\139\95\192")]};
		end
	end
	if ESP_PLAYERS_ENABLED then
		updateAllPlayerESP();
	end
end
local function applyCameraMode()
	if (not root or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\138\114\58\48\39\155\219", "\70\190\235\31\95\66")]) then
		return;
	end
	if (CAMERA_MODE == 2) then
		if not cameraFrozen then
			savedCameraCFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\227\23\227\247\187\167\74", "\133\218\130\122\134")].CFrame;
			cameraFrozen = true;
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\31\254\238\193\206\162\125\108", "\88\92\159\131\164\188\195")].CameraType = Enum.CameraType.Scriptable;
		end
		if savedCameraCFrame then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\47\178\78\197\234\152\208", "\189\224\78\223\43\183\139")].CFrame = savedCameraCFrame;
		end
	elseif cameraFrozen then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\253\135\19\211\47\185\218", "\161\78\156\234\118")].CameraType = Enum.CameraType.Custom;
		cameraFrozen = false;
	end
end
local function stopAutofarm()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\130\253\243\129\150\251\241\152\146\231\253\133\155\236\248\226\231", "\188\199\215\169")] = false;
	autofarmStopRequested = true;
	isSearching = false;
	if currentFlyTween then
		pcall(function()
			currentFlyTween:Cancel();
		end);
		currentFlyTween = nil;
	end
	stopBoxFly();
	stopInfinite();
	applyWalkSpeed();
	applyJumpPower();
	if bodyVelocity then
		pcall(function()
			bodyVelocity:Destroy();
		end);
		bodyVelocity = nil;
	end
	updateRoot();
	if root then
		root.AssemblyLinearVelocity = Vector3.zero;
	end
	if WEBHOOK_ON_STOP then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\28\77\62\184", "\136\156\105\63\27")] = math.floor(os.difftime(os.time(), autofarmStartTime));
		sendWebhook(string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\58\153\109\59\29\141\107\57\91\159\109\59\11\156\124\48\90\204\91\53\28\159\57\55\20\128\117\49\24\152\124\48\65\204\60\48\85\204\93\33\9\141\109\61\20\130\35\116\94\136\57\39\30\143\118\58\31\159\55", "\84\123\236\25"), bagCounter, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\158\184\82\252", "\213\144\235\202\119\204")]));
	end
	if ((CAMERA_MODE == 2) and cameraFrozen and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\25\211\47\58\34\8\115", "\45\67\120\190\74\72\67")]) then
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\35\224\160\235\137\171\185", "\137\64\66\141\197\153\232\142")].CameraType = Enum.CameraType.Custom;
		cameraFrozen = false;
	end
end
local function farmSequenceBlatant()
	while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\34\229\22\137\174\34\226\15\153\173\45\241\0\138\173\39\149\114", "\232\99\176\66\198")] and not autofarmStopRequested do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\32\58\1\126\153\188\124", "\76\140\65\72\102\27\237\153")] = getClosestEntity();
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\94\219\4\213\210\21\251\26", "\222\42\186\118\178\183\97")] then
			if not isSearching then
				isSearching = true;
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\124\217\112\165\123\205\118\167\98\201\106\171\127\192\97\174\24\188", "\234\61\140\36")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\232\142\93\41\0\239\151\77\57\0\239\147\83\33\21\152\234", "\111\65\189\218\18")] == LUAOBFUSACTOR_DECRYPT_STR_0("\97\71\26\33\10\82\187", "\207\35\43\123\85\107\60"))) then
					showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\71\171\169\254\112\126\173\224\236\118\98\234\174\239\110\48\165\162\224\124\115\190\179\164\55\62", "\25\16\202\192\138"), 1.5);
				end
			end
			task.wait(1);
		else
			isSearching = false;
			updateRoot();
			if (root and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\254\153\205\143\213\207\230\146\199\135\213\223\231\136\198\236\164", "\148\157\171\205\130\201")] and not autofarmStopRequested) then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\209\103\61\148\166", "\150\67\180\20\73\177")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\153\25\8\74\136\12\95\29", "\45\237\120\122")].Position + Vector3.new(0, 0, 0);
				root.CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\237\177\56\146\184", "\76\183\136\194")]);
				if root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\93\244\224\61\84\86\54\117\254\195\52\73", "\116\26\134\133\88\48\47")) then
					root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\57\211\165\225\185\107\60\206\184\194\177\107", "\18\126\161\192\132\221")):Destroy();
				end
				root.AssemblyLinearVelocity = Vector3.zero;
				task.wait(0.2);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\80\58\167\3\95\81\41\162\52\89\76\109\254", "\54\63\72\206\100")] = root.Position;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\216\75\74\98\160\43", "\27\168\57\37\26\133")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\57\171\110\175\210\57\239\44", "\183\77\202\28\200")]:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\39\33\134\16\30\62\128\28\14\3\155\7\26\35\157", "\104\119\83\233"), true) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\249\53\37\70\225\189\119", "\35\149\152\71\66")].Parent and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\233\80\183\63\13\173\18", "\90\121\136\34\208")].Parent:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\247\28\90\6\206\3\92\10\222\62\71\17\202\30\65", "\126\167\110\53"), true));
				if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\2\33\224\153\111", "\95\93\112\78\152\188")] then
					fireproximityprompt(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\231\138\13\161\238", "\178\161\149\229\117\132\222")]);
				end
				task.wait(0.15);
				updateRoot();
				if (root and ((root.Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\135\201\212\171\168\24\167\47\184\212\206\233\241", "\67\232\187\189\204\193\118\198")]).Magnitude > DEVIATION_AMOUNT)) then
					root.CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\60\188\39\50\12\238\135\30\186\51\126\82", "\143\235\78\213\64\91\98")]);
					root.AssemblyLinearVelocity = Vector3.zero;
				end
				bagCounter = bagCounter + 1;
				if WEBHOOK_EVERY_BAG then
					sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\175\73\131\169\115\185\129\68\129\234\100\179\137\9", "\214\237\40\228\137\16"));
				end
				if (WEBHOOK_EVERY_10 and ((bagCounter % 10) == 0)) then
					sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\166\236\227\213\6\165\145\230\235\153\82\246\197\225\238\222\16\231\197\215\224\205\2\170\223\163", "\198\229\131\143\185\99") .. bagCounter);
				end
				if (WEBHOOK_EVERY_100 and ((bagCounter % 100) == 0)) then
					sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\114\131\164\127\84\143\188\118\85\204\249\35\1\204\170\114\86\159\233\51\101\131\188\114\93\214\232", "\19\49\236\200") .. bagCounter);
				end
			end
		end
		task.wait(0.1);
	end
end
local function farmSequenceSafe()
	while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\223\2\194\152\194\155\204\26\201\146\202\155\220\27\211\147\161\234", "\218\158\87\150\215\132")] and not autofarmStopRequested do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\239\31\203\229\51\54\136\171", "\173\155\126\185\130\86\66")] = getClosestEntity();
		if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\241\167\168\192\141\248\160\246", "\140\133\198\218\167\232")] then
			if not isSearching then
				isSearching = true;
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\27\128\82\162\148\28\153\66\161\155\15\150\81\161\145\107\228", "\228\213\78\212\29")] and (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\121\130\42\205\166\126\155\58\221\166\126\159\36\197\179\9\230", "\139\231\44\214\101")] == LUAOBFUSACTOR_DECRYPT_STR_0("\234\238\0\91", "\118\185\143\102\62\112\209\81"))) then
					showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\107\113\32\242\172\27\27\120\90\127\59\166\171\16\11\120\83\114\35\227\166\1\15\118\18\62", "\88\60\16\73\134\197\117\124"), 1.5);
				end
			end
			task.wait(1);
		else
			isSearching = false;
			updateRoot();
			if (root and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\113\223\204\231\103\113\216\213\247\100\126\203\218\228\100\116\175\168", "\33\48\138\152\168")] and not autofarmStopRequested) then
				if currentFlyTween then
					pcall(function()
						currentFlyTween:Cancel();
					end);
					currentFlyTween = nil;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\2\49\67\213\7\125\5\117\1", "\87\18\118\80\49\161")] = root.Position;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\27\201\180\128\67\13\159\240", "\208\44\126\186\192")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\227\27\182\193\17\232\140\30", "\46\151\122\196\166\116\156\169")].Position + Vector3.new(0, 0, 0);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\225\228\85\14\190\181", "\155\133\141\38\122")] = (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\62\173\83\91\79\170\54\111\252", "\197\69\74\204\33\47\31")] - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\74\73\147\192\64\73\194\160", "\231\144\47\58")]).Magnitude;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\166\157\138", "\89\210\184\186\21\120\93\175")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\181\90\111\193\60\106", "\90\209\51\28\181\25")] / effectiveSpeed;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\114\18\190", "\223\176\27\55\142")] = TweenInfo.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\48\254\158", "\213\68\219\174")], Enum.EasingStyle.Linear);
				currentFlyTween = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\63\247\38\226\36\246\58\109\29\233\32\226\111\149", "\31\107\128\67\135\74\165\95")]:Create(root, TABLE_TableIndirection["ti%0"], {[LUAOBFUSACTOR_DECRYPT_STR_0("\251\206\238\76\76\180", "\209\184\136\156\45\33")]=CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\205\102\28\136\8\219\48\88", "\216\103\168\21\104")])});
				currentFlyTween:Play();
				if not root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\95\191\70\161\124\180\97\171\96\139\79\189", "\196\24\205\35")) then
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\44\157\166\86", "\102\78\235\131")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\216\33\48\93\113\60\187\59\249\39\32\93", "\84\154\78\84\36\39\89\215"));
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\247\19\8", "\101\157\129\54\56")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\58\187\143\174\39\96\63\166\146\141\47\96", "\25\125\201\234\203\67");
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\123\226\93\83", "\115\25\148\120\99\116\71")].MaxForce = Vector3.new(4000, 4000, 4000);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\14\43\252\116", "\33\108\93\217\68")].Velocity = Vector3.zero;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\93\228\253", "\205\187\43\193")].Parent = root;
				end
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\119\4\220\246\119\1\154\174", "\191\158\18\101")] = false;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\204\137\185\234\149", "\207\165\163\231\215")] = nil;
				conn = currentFlyTween.Completed:Connect(function(state)
					if (state == Enum.PlaybackState.Completed) then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\252\248\85\44\117\194\188\169", "\16\166\153\153\54\68")] = true;
					end
					if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\188\206\72\113\113", "\153\178\211\160\38\84\65")] then
						TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\129\4\84\37\199\91", "\75\226\107\58")]:Disconnect();
					end
				end);
				while currentFlyTween and (currentFlyTween.PlaybackState == Enum.PlaybackState.Playing) and not autofarmStopRequested do
					if ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\223\3\125\20\214\136\8", "\173\56\190\113\26\113\162")].Position - root.Position).Magnitude > (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\207\215\62\17\178\155", "\151\171\190\77\101")] + 50)) then
						break;
					end
					if root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\226\61\253\172\252\100\41\202\55\222\165\225", "\107\165\79\152\201\152\29")) then
						root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\112\92\237\206\80\102\117\65\240\237\88\102", "\31\55\46\136\171\52")).Velocity = Vector3.zero;
					end
					if (CAMERA_MODE == 2) then
						applyCameraMode();
					end
					task.wait(0.05);
				end
				if currentFlyTween then
					pcall(function()
						currentFlyTween:Cancel();
					end);
					currentFlyTween = nil;
				end
				if root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\246\58\217\241\213\49\254\251\201\14\208\237", "\148\177\72\188")) then
					root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\129\164\82\214\162\175\117\220\190\144\91\202", "\179\198\214\55")):Destroy();
				end
				root.AssemblyLinearVelocity = Vector3.zero;
				if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\226\9\115\117\77\214\244\73\34", "\179\144\108\18\22\37")] and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\150\47\166\233\231\145\54\182\234\232\130\57\165\234\226\230\75", "\175\166\195\123\233")] and not autofarmStopRequested) then
					task.wait(0.2);
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\224\208\84\78\249\225\195\81\121\255\252\135\13", "\144\143\162\61\41")] = root.Position;
					TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\193\18\72\55\215", "\83\128\179\125\48\18\231")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\182\225\218\66\10\24\231", "\126\61\215\147\189\39")]:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\72\237\18\93\113\242\20\81\97\207\15\74\117\239\9", "\37\24\159\125"), true) or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\167\103\69\223\178\48\18", "\34\186\198\21")].Parent and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\9\215\90\199\236\77\149", "\162\152\104\165\61")].Parent:FindFirstChildWhichIsA(LUAOBFUSACTOR_DECRYPT_STR_0("\253\61\189\101\121\232\196\59\171\77\98\234\192\63\166", "\133\173\79\210\29\16"), true));
					if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\110\226\51\200\44", "\75\237\28\141")] then
						fireproximityprompt(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\204\77\195\169\106\75", "\129\188\63\172\209\79\123\135")]);
					end
					task.wait(0.15);
					updateRoot();
					if (root and ((root.Position - TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\246\239\202\73\234\231\193\112\235\245\136\16", "\173\32\132\134")]).Magnitude > DEVIATION_AMOUNT)) then
						root.CFrame = CFrame.new(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\65\9\1\232\167\63\204\66\43\7\252\235\97", "\173\46\123\104\143\206\81")]);
						root.AssemblyLinearVelocity = Vector3.zero;
					end
					bagCounter = bagCounter + 1;
					if WEBHOOK_EVERY_BAG then
						sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\150\28\37\202\70\140\13\184\24\33\158\64\135\64", "\97\212\125\66\234\37\227"));
					end
					if (WEBHOOK_EVERY_10 and ((bagCounter % 10) == 0)) then
						sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\169\236\186\57\27\137\247\179\49\94\219\179\246\55\31\141\240\247\117\42\133\247\183\57\68\202", "\126\234\131\214\85") .. bagCounter);
					end
					if (WEBHOOK_EVERY_100 and ((bagCounter % 100) == 0)) then
						sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\167\218\69\86\74\135\193\76\94\15\213\133\25\26\77\133\210\90\27\15\176\218\93\91\67\222\149", "\47\228\181\41\58") .. bagCounter);
					end
				end
			end
		end
		task.wait(0.1);
	end
end
local function startAutofarm()
	if not root then
		updateRoot();
	end
	if not root then
		showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\142\233\212\58\13\63\22\162\206\214\52\23\0\30\180\232\153\53\12\36\95\160\243\204\53\7\113", "\127\198\156\185\91\99\80"));
		return;
	end
	autofarmStopRequested = false;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\47\248\223\129\42\11\243\202\63\226\209\133\39\28\250\176\74", "\190\149\122\172\144\199\107\89")] = true;
	isSearching = false;
	autofarmStartTime = os.time();
	if (ANTI_BAN_ENABLED and (effectiveSpeed > MAX_SAFE_SPEED)) then
		effectiveSpeed = MAX_SAFE_SPEED;
	end
	if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\48\197\209\216\19\55\220\193\200\19\55\216\223\208\6\64\161", "\158\82\101\145\158")] == LUAOBFUSACTOR_DECRYPT_STR_0("\82\242\3\2\69\126\234", "\36\16\158\98\118")) then
		task.spawn(farmSequenceBlatant);
	else
		setupNoFallDamage();
		startYCheck();
		task.spawn(farmSequenceSafe);
	end
end
local function missionSpeedAuto()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\51\237\205\29\184", "\133\160\118\163\155\56\136\71")].GreedySpeedFarm = true;
	showNotification(LUAOBFUSACTOR_DECRYPT_STR_0("\197\178\116\247\178\95\152\255\177\98\251\185\17\245\229\182\112\224\162\26\177", "\213\150\194\17\146\214\127"), 1);
	while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\60\140\138\226\3\244", "\86\123\201\196\180\38\196\194")].GreedySpeedFarm do
		if root then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\173\137", "\207\151\136\185")] = root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\155\147\45\135\112\85\120\187\144\33\141\122\85\126\190\134\58", "\17\200\227\72\226\20\24"));
			if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\178\4\75", "\159\208\33\123\183\169\145\143")] then
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\240\31\104", "\86\146\58\88")] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\122\208\238\217\152\236\58\245\91\214\254\217", "\154\56\191\138\160\206\137\86"));
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\28\165", "\172\230\57\149\231\28\90\225")].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\49\186\131\215\44\246\11\185\149\219\39\213\47\165\144\215\58", "\187\98\202\230\178\72");
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\164\244", "\42\65\129\196\80")].MaxForce = Vector3.new(100000, 0, 100000);
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\15\13", "\142\98\42\61\186\119\103\98")].Parent = root;
			end
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\58\250\82", "\104\88\223\98")].Velocity = Vector3.new(0, 0, 200);
			task.wait(0.5);
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\178\178", "\141\36\151\130\174\98")].Velocity = Vector3.new(0, 0, -200);
			task.wait(0.5);
		end
		task.wait(0.1);
	end
	if (root and root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\183\106\199\8\128\87\203\30\151\115\205\3\169\117\212\8\150", "\109\228\26\162"))) then
		root:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\109\245\248\125\228\203\87\246\238\113\239\232\115\234\235\125\242", "\134\62\133\157\24\128")):Destroy();
	end
end
local function monkeyRunOnce()
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\172\8\205\58\176\218\46\171\10\204\59\156\215\9\164\29\220\61\244\134", "\182\103\197\122\185\79\209")]:SendKeyEvent(true, Enum.KeyCode.W, false, game);
	end);
	task.wait(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\168\207\92\37\113\204\176\222\95\47\100\215\194\177", "\40\147\231\129\23\96")]);
	pcall(function()
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\241\158\81\174\173\208\92\246\156\80\175\129\221\123\249\139\64\169\233\140", "\188\21\152\236\37\219\204")]:SendKeyEvent(false, Enum.KeyCode.W, false, game);
	end);
end
local function getCasesData()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\76\230\52\13\76\218\35\13\84\250\114\92", "\108\32\137\87")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\237\16\170\38\250\74\77\175\236\51\178\32\235\74\94\175\173\80", "\57\202\136\96\198\79\153\43")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\135\44\169\166\129\148\236\170\55\185", "\152\203\67\202\199\237\199"));
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\76\163\14\19\70\109\231\238\80\229\95", "\134\154\35\192\111\127\21\25")] then
		return {};
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\187\53\76\90", "\178\216\70\105\106\64")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\36\121\247\197\230\192\129\43\56\63\166", "\224\95\75\26\150\169\181\180")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\40\219\203\45\87", "\22\107\186\184\72\36\204"));
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\174\97\30", "\110\135\221\68\46")] then
		return {};
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\55\24\234\139\227", "\91\131\86\108\139\174\211")] = {};
	for _, v in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\248\56\253\71", "\61\155\75\216\119")]:GetChildren()) do
		if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\45\165\166\10\89\5\200\1", "\189\100\203\210\92\56\105")) and (v.Value > 0)) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\80\233\41\106\1", "\72\79\49\157")][v.Name] = v.Value;
		end
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\177\37\189\205\224", "\220\232\208\81")];
end
local function openCase(caseName)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\187\232\63\56\95\178\176\238", "\193\149\222\133\80\76\58")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\244\88\95\222\207\94\78\198\195\89\124\198\201\79\78\213\195\24\31", "\178\166\61\47")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\201\79\229\117\222\59\232", "\94\155\42\136\26\170"));
	if not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\150\58\43\186\144\58\53\240\212", "\213\228\95\70")] then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\171\199\138\69\47\182\205\144\114\111\235", "\23\74\219\162\228")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\227\75\160\47\60\245\3\255", "\91\89\134\38\207")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\107\254\205\56\48\209\52\65", "\71\36\142\168\86\115\176"));
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\177\119\177\49\187\91\70\203\164\55\239", "\41\191\193\18\223\99\222\54")] or not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\54\194\36\152\174\43\200\62\175\238\118", "\202\203\70\167\74")]:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\30\4\209\60\101\41\36\202\54\127\56", "\17\76\97\188\83"))) then
		return false;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\138\55\220\57\2\134\70\172\145\34\156\103", "\195\229\71\185\87\80\227\43")]:FireServer(caseName);
	return true;
end
loadSettings();
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\215\245\14\84\224\247\185\80", "\143\128\156\96\48")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\216\254\22\34\145\148\160", "\119\216\177\144\114")]:CreateWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\253\32\237\78\204", "\34\169\73\153")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\157\197\37\175\133\219\52\191\131\216\39\174\239\188", "\235\202\140\107")],[LUAOBFUSACTOR_DECRYPT_STR_0("\37\119\59\166", "\165\108\20\84\200\137\71\151")]=LUAOBFUSACTOR_DECRYPT_STR_0("\105\160\42\154", "\232\26\212\75"),[LUAOBFUSACTOR_DECRYPT_STR_0("\3\65\119\229\242", "\151\87\41\18\136")]=LUAOBFUSACTOR_DECRYPT_STR_0("\127\174\216\219", "\158\59\207\170\176"),[LUAOBFUSACTOR_DECRYPT_STR_0("\124\87\41\76", "\236\47\62\83\41")]=UDim2.fromOffset(600, 480),[LUAOBFUSACTOR_DECRYPT_STR_0("\206\187\33\53\185\146\251\187\37\53\190", "\226\154\201\64\91\202")]=true});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\72\31\11\15\236", "\220\161\41\125\120\42")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\149\127\166\1", "\110\220\17\192")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\112\58\30\228\32\180\247", "\199\20\25\84\122\139\87\145")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\115\0\201\162\30", "\138\39\105\189\206\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\54\9\143\34\225\244\206\235\22\8\135", "\159\127\103\233\77\147\153\175"),[LUAOBFUSACTOR_DECRYPT_STR_0("\46\243\235\164", "\171\103\144\132\202\32")]=LUAOBFUSACTOR_DECRYPT_STR_0("\25\33\239\3", "\108\112\79\137")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\18\205\98\45", "\85\95\162\20\72\205\97\137")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\192\244\36\216\2\239\136\167", "\173\151\157\74\188\109\152")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\16\1\44\209\217", "\147\68\104\88\189\188\52\181")]=LUAOBFUSACTOR_DECRYPT_STR_0("\55\135\157\213\23\141\133\196", "\176\122\232\235"),[LUAOBFUSACTOR_DECRYPT_STR_0("\169\118\53\65", "\142\224\21\90\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\114\219\40\66\180\153\140\122\192\52", "\229\20\180\71\54\196\235")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\29\123\205\230\229\165\146\61", "\224\73\30\161\131\149\202")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\236\255\84\254\242\180\0", "\48\145\133\145")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\110\69\161\226\212", "\76\58\44\213\142\177")]=LUAOBFUSACTOR_DECRYPT_STR_0("\255\33\30\40\104\196\54\6", "\24\171\68\114\77"),[LUAOBFUSACTOR_DECRYPT_STR_0("\198\30\95\92", "\205\143\125\48\50\231\190\100")]=LUAOBFUSACTOR_DECRYPT_STR_0("\204\166\4\72\241\234\209", "\194\161\199\116\101\129\131\191")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\205\49\220\167", "\194\140\68\168\200\151")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\242\219\33\250\85\190\133", "\149\34\155\181\69")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\55\244\193\246\6", "\154\99\157\181")]=LUAOBFUSACTOR_DECRYPT_STR_0("\172\26\248\175\234\140\29\225", "\140\237\111\140\192"),[LUAOBFUSACTOR_DECRYPT_STR_0("\47\26\114\22", "\120\102\121\29")]=LUAOBFUSACTOR_DECRYPT_STR_0("\191\244\182\41\168\240", "\91\204\131\217")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\235\204\101", "\158\174\159\53\180\211\189")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\244\227\217\120\162\23\173", "\213\50\157\141\189\23")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\202\47\144\172\119", "\196\158\70\228\192\18")]=LUAOBFUSACTOR_DECRYPT_STR_0("\111\108\33", "\185\42\63\113\46"),[LUAOBFUSACTOR_DECRYPT_STR_0("\253\222\46\55", "\123\180\189\65\89")]=LUAOBFUSACTOR_DECRYPT_STR_0("\199\149\245", "\233\162\236\144\132")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\144\197\249\9", "\63\210\164\158\122\217\150")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\194\248\232\70\239\118\155", "\152\83\171\150\140\41")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\182\236\151\63\209", "\104\226\133\227\83\180\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\33\10\36\67", "\48\99\107\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\247\165\114\222", "\27\190\198\29\176\77")]=LUAOBFUSACTOR_DECRYPT_STR_0("\237\89\244\49\175\77\238\88\248", "\46\143\43\157\84\201")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\122\113\69\209\86\28\198\68", "\168\55\24\54\162\63\115")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\243\46\132\221\217\82\170", "\174\119\154\64\224\178")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\30\119\209\119\0", "\132\74\30\165\27\101\199\122")]=LUAOBFUSACTOR_DECRYPT_STR_0("\2\238\236\180\174\186\186\60", "\212\79\135\159\199\199\213"),[LUAOBFUSACTOR_DECRYPT_STR_0("\80\163\186\73", "\120\25\192\213\39\60\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\65\45\79\29\84", "\40\120\32\95")}),[LUAOBFUSACTOR_DECRYPT_STR_0("\9\174\45\110\166\17\61\184", "\127\90\203\89\26\207")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\234\60\161\207\6\234\152\101", "\157\189\85\207\171\105")]:Tab({[LUAOBFUSACTOR_DECRYPT_STR_0("\242\168\204\185\6", "\99\166\193\184\213")]=LUAOBFUSACTOR_DECRYPT_STR_0("\229\178\148\175\5\132\209\164", "\234\182\215\224\219\108"),[LUAOBFUSACTOR_DECRYPT_STR_0("\233\130\180\59", "\85\160\225\219")]=LUAOBFUSACTOR_DECRYPT_STR_0("\79\0\151\221\63\210\76\79", "\43\60\101\227\169\86\188")})};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\68\201\211\172\31\156", "\87\16\168\177\223\58\172\217")].Info:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\0\196\77\209\62", "\91\84\173\57\189")]=LUAOBFUSACTOR_DECRYPT_STR_0("\60\176\2\247\179", "\182\112\217\108\156\192")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\9\74\252\206\250", "\235\202\104\40\143")].Info:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\57\130\15\181\8", "\217\109\235\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\4\134\110\79\48\244\196\174\36\134\108\82", "\221\71\233\30\54\16\176\173"),[LUAOBFUSACTOR_DECRYPT_STR_0("\23\253\82\179\54\253\93\180", "\223\84\156\62")]=function()
	if setclipboard then
		setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\242\213\209\254\152\9\242\195\197\245\242\107", "\91\182\156\130\189\215")]);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\73\122\162\81\75\90\233\5", "\53\30\19\204")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\205\233\100\136\162", "\199\153\128\16\228")]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\37\245\16\162\213", "\199\177\74\133\121"),[LUAOBFUSACTOR_DECRYPT_STR_0("\155\198\178\234\50\200\62", "\74\216\169\220\158\87\166")]=LUAOBFUSACTOR_DECRYPT_STR_0("\204\42\0\47\85\250\39\83\32\83\230\40\83\47\85\248\42\22\40\27", "\58\136\67\115\76")});
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\197\171\218\74\192\112", "\61\145\202\184\57\229\64\203")].Info:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\104\91\157\75\89", "\39\60\50\233")]=LUAOBFUSACTOR_DECRYPT_STR_0("\57\60\179\53\194\27\187\183\31", "\195\122\83\195\76\226\72\210"),[LUAOBFUSACTOR_DECRYPT_STR_0("\199\213\55\242\35\229\215\48", "\65\132\180\91\158")]=function()
	if setclipboard then
		setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\85\229\11\58\73\227\2\64\44", "\78\101\28\177")]);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\189\238\85\16\157\165\1", "\49\69\212\128")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\35\5\196\254\228", "\129\119\108\176\146")]=LUAOBFUSACTOR_DECRYPT_STR_0("\31\192\23\196\32\10", "\124\92\175\103\173\69\110"),[LUAOBFUSACTOR_DECRYPT_STR_0("\226\55\13\35\196\54\23", "\87\161\88\99")]=LUAOBFUSACTOR_DECRYPT_STR_0("\33\240\251\201\247\220\42\28\242\175\207\184\192\42\23\253\174", "\67\114\153\143\172\215\176")});
end});
if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\151\177\220\15\183\172\249\15\172\167\171\94", "\110\222\194\142")] then
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\216\25\186\23\241", "\193\119\185\123\201\50")].Info:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\67\1\237\42\10", "\127\23\104\153\70\111\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\42\8\182\182\107\30\182\186\7\16\167\189\46\108\147\186\26\4\169\189\47", "\211\105\103\198\207\75\76\215"),[LUAOBFUSACTOR_DECRYPT_STR_0("\237\166\188\227\124\13\185\189", "\214\174\199\208\143\30\108\218")]=function()
		if setclipboard then
			setclipboard(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\173\56\137\138\100\252\118\35\165\34\132\224\6", "\41\113\228\107\202\197\54\184")]);
		end
	end});
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\78\140\58\79\63\221", "\60\26\237\88")].Info:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\236\35\96\234\171", "\206\184\74\20\134")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\225\253\162\250\69\54\140\17\234\232\190", "\172\88\132\142\209\147\42\88")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\179\139\206\30\115\165", "\222\231\234\172\109\86\149")].Info:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\217\230\212\20\232", "\120\141\143\160")]=(LUAOBFUSACTOR_DECRYPT_STR_0("\101\180\179\81\85\184\185\64\26\236", "\50\32\204\214") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\163\127\16\90\134\37\169\117\10\87\146\60\163\2\101", "\113\230\39\85\25\211")]),[LUAOBFUSACTOR_DECRYPT_STR_0("\253\186\10\228\37\202\168\64", "\43\190\219\102\136\71\171\203")]=function()
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\127\50\74\103\46", "\57\66\30\80")].Info:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\29\209\180\25\129", "\228\73\184\192\117\228\89\148")]=(LUAOBFUSACTOR_DECRYPT_STR_0("\249\140\103\7\198\134\123\78\143", "\116\175\233\21") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\221\140\117\242\30\17\187\168", "\95\158\152\222\38\187\81")]),[LUAOBFUSACTOR_DECRYPT_STR_0("\219\188\57\190\161\201\251\182", "\168\152\221\85\210\195")]=function()
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\159\223\247\148\238\142", "\231\203\190\149")].Info:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\249\52\247\253\185", "\123\173\93\131\145\220\149")]=(LUAOBFUSACTOR_DECRYPT_STR_0("\60\203\239\97\93\221\76\132", "\153\118\164\141\65\20") .. game.JobId),[LUAOBFUSACTOR_DECRYPT_STR_0("\205\51\138\238\245\1\237\57", "\96\142\82\230\130\151")]=function()
	if setclipboard then
		setclipboard(game.JobId);
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\120\185\65\70\209\199\10\224", "\142\47\208\47\34\132")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\194\183\16\14\94", "\60\150\222\100\98\59")]=LUAOBFUSACTOR_DECRYPT_STR_0("\102\51\71\95\222\190", "\81\37\92\55\54\187\218"),[LUAOBFUSACTOR_DECRYPT_STR_0("\35\75\163\35\132\14\80", "\225\96\36\205\87")]=LUAOBFUSACTOR_DECRYPT_STR_0("\195\169\64\80\120\15\10\230\182\75\124\120\14", "\105\137\198\34\25\28\47")});
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\37\168\67\101\133\65", "\160\113\201\33\22")].Move:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\224\81\184\171\172", "\205\180\56\204\199\201")]=LUAOBFUSACTOR_DECRYPT_STR_0("\176\206\57\29\135\158\122\88\169\203\49\8", "\120\227\190\92")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\93\29\104\102\12", "\130\93\60\127\27\67\60\185")].Move:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\124\59\44\66\229", "\29\40\82\88\46\128\35")]=LUAOBFUSACTOR_DECRYPT_STR_0("\24\80\199\9\14\181\123\114\213\17\10\139\43\64\209\25", "\216\91\37\180\125\97"),[LUAOBFUSACTOR_DECRYPT_STR_0("\19\119\16\214\82", "\55\69\22\124\163")]=SPEED_MULT_ON,[LUAOBFUSACTOR_DECRYPT_STR_0("\91\210\80\228\221\112\83\255", "\148\24\179\60\136\191\17\48")]=function(state)
	SPEED_MULT_ON = state;
	if state then
		startInfinite();
	else
		stopInfinite();
	end
	applyWalkSpeed();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\43\251\179\179\226", "\150\210\74\153\192")].Move:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\215\193\44\134\112", "\212\131\168\88\234\21\26")]=LUAOBFUSACTOR_DECRYPT_STR_0("\114\117\133\135\11\55\64\113\141\204\14\38\73\97\140", "\71\37\20\233\236\88"),[LUAOBFUSACTOR_DECRYPT_STR_0("\226\86\164\31\79\226\95", "\60\173\38\208\118\32\140\44")]={LUAOBFUSACTOR_DECRYPT_STR_0("\20\98", "\175\33\82\129\179\64"),LUAOBFUSACTOR_DECRYPT_STR_0("\191\191\96", "\210\142\143\80\175\92"),LUAOBFUSACTOR_DECRYPT_STR_0("\232\188\163", "\166\217\137\147"),LUAOBFUSACTOR_DECRYPT_STR_0("\177\243\34", "\38\131\195\18\198\145"),LUAOBFUSACTOR_DECRYPT_STR_0("\0\134\106", "\52\51\182\90\139\88"),LUAOBFUSACTOR_DECRYPT_STR_0("\163\233\128", "\35\150\217\176\135")},[LUAOBFUSACTOR_DECRYPT_STR_0("\207\81\7\25\114", "\22\153\48\107\108\23\35")]=tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\35\170\141\63\82\80\111\221\49\182\139\63\90\81\4\185", "\137\110\229\219\122\31\21\33")]),[LUAOBFUSACTOR_DECRYPT_STR_0("\57\188\52\119\52\74\39\117", "\30\122\221\88\27\86\43\68")]=function(v)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\21\7\221\163\21\13\197\178\7\27\219\163\29\12\174\214", "\230\88\72\139")] = tonumber(v) or 100;
	applyWalkSpeed();
	saveSettings();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\181\20\8\70\88", "\56\18\212\118\123\99\104")].Move:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\42\224\236\223\218", "\190\126\137\152\179\191")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\23\97\223\165\77\104\40\103\198\186\112\39\21\119\217", "\32\72\98\18\171\202"),[LUAOBFUSACTOR_DECRYPT_STR_0("\50\137\62\97\242", "\151\100\232\82\20")]=JUMP_MULT_ON,[LUAOBFUSACTOR_DECRYPT_STR_0("\92\216\250\4\125\216\245\3", "\104\31\185\150")]=function(state)
	JUMP_MULT_ON = state;
	applyJumpPower();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\232\184\241\228\162\156", "\160\188\217\147\151\135\172\128")].Move:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\59\212\4\252\63", "\169\111\189\112\144\90")]=LUAOBFUSACTOR_DECRYPT_STR_0("\231\150\40\189\143\143\30\135\223\195\19\172\179\149\12", "\226\173\227\69\205\223\224\105"),[LUAOBFUSACTOR_DECRYPT_STR_0("\119\46\54\82\192\21\75", "\123\56\94\66\59\175")]={LUAOBFUSACTOR_DECRYPT_STR_0("\175\19", "\225\154\35\19\129\122\158"),LUAOBFUSACTOR_DECRYPT_STR_0("\11\80\187", "\84\58\96\139\55\149\135\176"),LUAOBFUSACTOR_DECRYPT_STR_0("\66\106\243", "\94\115\95\195\96\46\175"),LUAOBFUSACTOR_DECRYPT_STR_0("\17\27\111", "\128\35\43\95\93\78\77\231"),LUAOBFUSACTOR_DECRYPT_STR_0("\247\77\102", "\201\196\125\86\84\119\30"),LUAOBFUSACTOR_DECRYPT_STR_0("\150\190\84", "\223\163\142\100")},[LUAOBFUSACTOR_DECRYPT_STR_0("\180\23\207\164\189", "\216\226\118\163\209")]=tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\148\197\54\49\104\64\16\137\213\41\68\7", "\95\222\144\123\97\55\16")]),[LUAOBFUSACTOR_DECRYPT_STR_0("\58\133\182\79\225\24\135\177", "\131\121\228\218\35")]=function(v)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\229\15\49\70\43\246\231\7\51\60\75", "\123\185\176\66\97\25")] = tonumber(v) or 50;
	applyJumpPower();
	saveSettings();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\252\14\27\66\80\127", "\81\168\111\121\49\117\79\56")].Move:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\243\3\241\186\194", "\214\167\106\133")]=LUAOBFUSACTOR_DECRYPT_STR_0("\29\55\75\72\56\122\202", "\185\73\88\44\47\84\31")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\214\24\179\150\175", "\159\232\183\122\192\179")].Move:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\16\59\188\45\33", "\65\68\82\200")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\95\50\6\206\195\114\101\116\115\45\206\200\123", "\30\69\48\18\64\175\175"),[LUAOBFUSACTOR_DECRYPT_STR_0("\198\45\19\249\62", "\91\144\76\127\140")]=NO_FALL_DAMAGE_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\195\9\74\45\209\187\214\219", "\176\128\104\38\65\179\218\181")]=function(s)
	NO_FALL_DAMAGE_ENABLED = s;
	if s then
		setupNoFallDamage();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\197\192\6\149\148", "\117\176\164\162")].Move:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\176\203\17\252\223", "\25\228\162\101\144\186")]=LUAOBFUSACTOR_DECRYPT_STR_0("\102\57\154\2\251\244\8\126\137\15\225\247\8\33\184\2\254\247\1", "\132\40\86\217\110\146"),[LUAOBFUSACTOR_DECRYPT_STR_0("\72\202\43\169\162", "\62\30\171\71\220\199\19\156")]=NOCLIP_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\99\68\160\58\95\200\44\70", "\45\32\37\204\86\61\169\79")]=toggleNoClip});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\97\84\7\175\240\44", "\28\53\53\101\220\213")].Move:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\57\85\28\77\95", "\191\109\60\104\33\58\193\48")]=LUAOBFUSACTOR_DECRYPT_STR_0("\165\216\0\167\161\219\1", "\135\231\183\120"),[LUAOBFUSACTOR_DECRYPT_STR_0("\208\11\64\241\48", "\201\134\106\44\132\85\122")]=BOXFLY_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\21\13\123\51\3\13\203\40", "\67\86\108\23\95\97\108\168")]=function(s)
	if s then
		startBoxFly();
	else
		stopBoxFly();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\57\78\25\225\116", "\48\196\88\44\106\196\68\181")].Teleport:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\182\214\200\47\133", "\76\226\191\188\67\224\196\194")]=LUAOBFUSACTOR_DECRYPT_STR_0("\233\36\6\233\248\203\104\51\245\241\220\56\8\226\233", "\157\185\72\103\144")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\109\178\136\105\237\225", "\209\57\211\234\26\200")].Teleport:Input({[LUAOBFUSACTOR_DECRYPT_STR_0("\53\199\178\141\85", "\178\97\174\198\225\48")]=LUAOBFUSACTOR_DECRYPT_STR_0("\255\90\5\232\125\244\79\225\87\9\244\56\174\63\206\68\16\248\121\234\70", "\111\175\54\100\145\24\134"),[LUAOBFUSACTOR_DECRYPT_STR_0("\115\21\33\22\70\17\47\25\71\28\50", "\117\35\121\64")]=LUAOBFUSACTOR_DECRYPT_STR_0("\243\188\227\211\99\71\216\175\235\152\109\1", "\47\189\221\142\182\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\3\190\43\199\74\168\35\34", "\73\64\223\71\171\40\201\64")]=function(txt)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\45\168\234\111\229\45", "\29\106\237\164\57\192")].TP_Target = txt;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\133\165\229\169\144\130", "\146\209\196\135\218\181\178\192")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\25\57\151\29\85", "\199\77\80\227\113\48")]=LUAOBFUSACTOR_DECRYPT_STR_0("\30\58\82\200\58\48\76\217\106\43\81\141\26\51\95\212\47\45", "\173\74\95\62"),[LUAOBFUSACTOR_DECRYPT_STR_0("\229\24\80\58\201\6\191\205", "\220\166\121\60\86\171\103")]=function()
	if (not TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\206\39\19\134\126\154", "\122\137\98\93\208\91\170")].TP_Target or (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\196\50\121\144\226", "\170\231\129\124\47\181\210\201")].TP_Target == "")) then
		return;
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\175\40\117\90", "\74\235\219\90\80\106")] = string.lower(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\230\117\13\127\164", "\146\44\163\59\91\90\148\26")].TP_Target);
	for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\33\185\152\76\103\62\253\209", "\41\21\77\216\225")]:GetPlayers()) do
		if ((p ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\4\65\115\92\17\95\55\21", "\37\116\45\18")]) and string.find(string.lower(p.Name), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\235\68\231\251", "\203\175\159\54\194")])) then
			updateRoot();
			if (root and p.Character and p.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\83\219\20\58\84\64\203\127\252\22\52\78\127\195\105\218", "\162\27\174\121\91\58\47"))) then
				root.CFrame = p.Character.HumanoidRootPart.CFrame;
				TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\204\17\241\10\240\150\149", "\185\179\165\127\149\95")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\101\124\219\248\18", "\119\49\21\175\148")]=LUAOBFUSACTOR_DECRYPT_STR_0("\99\176\26\88\61\70\152\225", "\149\55\213\118\61\77\41\234"),[LUAOBFUSACTOR_DECRYPT_STR_0("\62\9\196\210\236\55\187", "\123\125\102\170\166\137\89\207")]=(LUAOBFUSACTOR_DECRYPT_STR_0("\122\5\84\56\30\140\187\90\5\92\125\26\140\233", "\201\46\96\56\93\110\227") .. p.Name)});
				return;
			end
		end
	end
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\140\10\224\253\32\232\254\83", "\161\219\99\142\153\117")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\72\184\178\127\200", "\173\28\209\198\19")]=LUAOBFUSACTOR_DECRYPT_STR_0("\80\254\165\180\103", "\219\21\140\215"),[LUAOBFUSACTOR_DECRYPT_STR_0("\107\183\200\179\93\70\172", "\56\40\216\166\199")]=LUAOBFUSACTOR_DECRYPT_STR_0("\22\184\20\54\35\166\85\33\41\160\85\41\41\161\27\43\104", "\79\70\212\117")});
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\23\227\213\188\93", "\109\199\118\129\166\153")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\5\185\99\250\52", "\150\81\208\23")]=LUAOBFUSACTOR_DECRYPT_STR_0("\205\192\236\142\233\202\242\159\185\209\239\203\215\192\225\153\252\214\244\203\201\201\225\146\252\215", "\235\153\165\128"),[LUAOBFUSACTOR_DECRYPT_STR_0("\152\72\174\35\68\39\169\245", "\158\219\41\194\79\38\70\202")]=function()
	updateRoot();
	if not root then
		return;
	end
	local best, bestD = nil, math.huge;
	for _, p in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\115\41\46\27\235\196\155\6\117", "\232\35\69\79\98\142\182")]:GetPlayers()) do
		if ((p ~= TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\105\12\30\228\124\18\90\173", "\157\25\96\127")]) and p.Character and p.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\143\150\248\4\94\62\174\135\199\10\95\37\151\130\231\17", "\81\199\227\149\101\48"))) then
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\23\171", "\219\29\50\155\113\150\230\92")] = (p.Character.HumanoidRootPart.Position - root.Position).Magnitude;
			if (TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\213\101\149", "\45\177\64\165\27\159\40")] < bestD) then
				bestD = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\83\95", "\18\125\118\111\202")];
				best = p.Character.HumanoidRootPart;
			end
		end
	end
	if best then
		root.CFrame = best.CFrame;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\53\87\254\5\132\130\171", "\155\48\92\57\154\80\205\167")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\141\196\175\179\253", "\37\217\173\219\223\152\203")]=LUAOBFUSACTOR_DECRYPT_STR_0("\61\0\19\51\95\167\228\29", "\150\105\101\127\86\47\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\237\253\253\161\194\206\218", "\160\174\146\147\213\167")]=LUAOBFUSACTOR_DECRYPT_STR_0("\116\225\22\65\28\78\82\240\31\64\76\85\79\164\20\65\13\83\69\247\14\4\28\77\65\253\31\86", "\33\32\132\122\36\108")});
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\141\21\112\88\57\233", "\28\217\116\18\43")].Teleport:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\230\94\194\88\213", "\92\178\55\182\52\176\206")]=LUAOBFUSACTOR_DECRYPT_STR_0("\55\52\97", "\117\122\85\17")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\188\238\40\87\227\141", "\189\232\143\74\36\198")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\200\163\30\66\210", "\106\156\202\106\46\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\9\28\119\54\58\50\11\111\115\62\50\89\72\35\43\42\23", "\74\93\121\27\83"),[LUAOBFUSACTOR_DECRYPT_STR_0("\94\186\234\114\127\186\229\117", "\30\29\219\134")]=function()
	updateRoot();
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\183\24\237\250\115\23\13\16\247", "\110\53\199\121\154\148\63\120")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\21\237\52\74\236\0\25\250\122\9", "\156\97\122\159\95\57")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\253\166\219\239\5\46\48\205\183\206\241\4\12", "\95\174\214\186\152\107\98"), true);
	if (root and TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\30\112\156\29\234\134\13\52\219", "\166\233\110\17\235\115")]) then
		root.CFrame = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\107\30\197\214\252\146\115\123\75\148", "\28\24\110\164\161\146\222")].CFrame + Vector3.new(0, 5, 0);
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\194\84\54\30\147", "\69\59\163\54")].Teleport:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\132\161\222\70\54", "\214\208\200\170\42\83\173")]=LUAOBFUSACTOR_DECRYPT_STR_0("\234\36\96\182\112\203\97\90\175\101", "\21\185\65\18\192"),[LUAOBFUSACTOR_DECRYPT_STR_0("\221\87\81\23\163\255\85\86", "\193\158\54\61\123")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\29\5\52\169\112\65", "\217\85\113\64")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\99\27\216\208\220\135\247\93\6\207\197", "\133\43\111\172\160\143\226"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\255\147\99\148\144", "\160\171\195\48\177")] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\231\6\122\40\76\206\189\211\224\6\100\59\85\194\170", "\167\179\99\22\77\60\161\207"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\32\111\130\29\28", "\44\97\31\235\56")] = LUAOBFUSACTOR_DECRYPT_STR_0("\249\26\236\180\226\84\183\235\246\15\245\161\226\64\234\171\243\2\247\188\191\13\247\169\190\24\169\235\246\15\245\161\226\65", "\196\145\110\152");
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\62\242\243\91\43\187\162", "\146\56\78\158")] = game.PlaceId;
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\18\200\74\244\76\40\201\92\163\10", "\58\77\187\47\134")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\37\168\66\181", "\126\114\85\193\103\133\78\52")] .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\251\203\62\121\199\222\119\40", "\24\164\187\82")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\190\201\89\184\231\244\200\79\229\193\228\216\80\163\242\174\201\83\184\229\222\200\88\175\227\172\251\79\169\183\253\211\81\163\229\172\139\12\250", "\145\145\186\60\202");
	local function ListServers(cursor)
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\209\36\65\182", "\100\134\176\83")] = game:HttpGet(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\236\210\71\175\165\16\193\210\7\237", "\117\179\161\34\221\211")] .. ((cursor and (LUAOBFUSACTOR_DECRYPT_STR_0("\11\179\239\212\23\240\183\16", "\197\45\208\154\166\100\159") .. cursor)) or ""));
		return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\224\146\172\118\121", "\83\73\148\230\220")]:JSONDecode(TABLE_TableIndirection["Raw%0"]);
	end
	local Server, Next;
	repeat
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\0\218\228\246\234\155\32\154\166", "\233\83\191\150\128\143")] = ListServers(Next);
		Server = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\196\131\221\100\8\229\149\138\34", "\109\151\230\175\18")].data[math.random(1, #TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\147\255\83\82\133\178\233\4\20", "\224\192\154\33\36")].data)];
		Next = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\176\81\10\148\134\70\11\199\211", "\226\227\52\120")].nextPageCursor;
	until Server and (Server.playing < Server.maxPlayers) and (Server.id ~= game.JobId) 
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\49\219\223\225\26", "\217\101\139\140\196\42\223\183")]:TeleportToPlaceInstance(TABLE_TableIndirection["_place%0"], Server.id, TABLE_TableIndirection["player%0"]);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\46\14\173\9\1\74", "\36\122\111\207\122")].Auto:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\56\1\240\180\189", "\84\108\104\132\216\216")]=LUAOBFUSACTOR_DECRYPT_STR_0("\225\26\207\86\160\133\87\216\20\192\89\242\169", "\34\172\123\166\56\128\196")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\168\170\216\15\35", "\116\196\201\200\171\42\19\181")].Auto:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\66\143\239\81\16", "\124\22\230\155\61\117\96")]=LUAOBFUSACTOR_DECRYPT_STR_0("\224\165\231\233\242\232\181\228\190\242\228\248\236\231\200", "\149\165\203\134\139\158\141"),[LUAOBFUSACTOR_DECRYPT_STR_0("\5\173\76\51\54", "\70\83\204\32")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\47\180\63\175\40\160\57\173\49\164\37\161\44\173\46\164\75\209", "\224\110\225\107")],[LUAOBFUSACTOR_DECRYPT_STR_0("\215\119\209\61\50\197\199\255", "\164\148\22\189\81\80\164")]=function(s)
	if s then
		startAutofarm();
	else
		stopAutofarm();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\134\129\117\160\98\27", "\23\210\224\23\211\71\43")].Auto:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\157\143\4\187\80", "\144\201\230\112\215\53\75\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\115\196\11\231\182\147\84\215\16\235\248\177", "\197\53\165\121\138\150"),[LUAOBFUSACTOR_DECRYPT_STR_0("\194\207\205\41\226\209\202", "\64\141\191\185")]={LUAOBFUSACTOR_DECRYPT_STR_0("\48\235\182\223", "\198\99\138\208\186\151\169"),LUAOBFUSACTOR_DECRYPT_STR_0("\47\249\130\74\12\251\151", "\62\109\149\227")},[LUAOBFUSACTOR_DECRYPT_STR_0("\197\137\133\193\5", "\96\147\232\233\180")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\13\46\100\171\24\26\21\37\125\172\11\1\25\52\127\200\105", "\89\72\88\122\43\237")],[LUAOBFUSACTOR_DECRYPT_STR_0("\15\186\169\58\25\45\184\174", "\123\76\219\197\86")]=function(v)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\121\237\33\35\200\30\106\245\42\58\207\13\113\249\59\56\171\111", "\95\56\184\117\108\142")] = v;
	saveSettings();
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\209\247\18\195\214\227\20\193\207\231\8\205\210\238\3\200\181\146", "\140\144\162\70")] then
		stopAutofarm();
		task.wait(0.1);
		startAutofarm();
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\228\41\91\97\171\128", "\142\176\72\57\18")].Auto:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\146\56\4\40\163", "\68\198\81\112")]=LUAOBFUSACTOR_DECRYPT_STR_0("\148\0\190\18\69\26\162\29\177\0\69\18\185", "\125\215\111\208\116\44")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\51\70\77\224\61\12", "\60\103\39\47\147\24")].Auto:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\216\3\227\140\211", "\46\140\106\151\224\182\147")]=LUAOBFUSACTOR_DECRYPT_STR_0("\205\33\100\2\216\61\120\71\239", "\34\139\77\29"),[LUAOBFUSACTOR_DECRYPT_STR_0("\159\224\9\93\38\190\227", "\73\208\144\125\52")]={LUAOBFUSACTOR_DECRYPT_STR_0("\120\188", "\171\74\140\234\171\167\112\51"),LUAOBFUSACTOR_DECRYPT_STR_0("\119\94", "\205\79\110\44\63\145"),LUAOBFUSACTOR_DECRYPT_STR_0("\246\12\111", "\124\199\63\95\168\212\107\196"),LUAOBFUSACTOR_DECRYPT_STR_0("\87\240\3", "\147\102\200\51\90\196\151\233"),LUAOBFUSACTOR_DECRYPT_STR_0("\105\165\191", "\91\91\144\143\173\222\128"),LUAOBFUSACTOR_DECRYPT_STR_0("\119\240\28", "\46\67\192\44\49\203"),LUAOBFUSACTOR_DECRYPT_STR_0("\82\134\126", "\101\100\182\78\194\68\196")},[LUAOBFUSACTOR_DECRYPT_STR_0("\126\73\60\224\136", "\181\40\40\80\149\237\43\24")]=tostring(FLY_SPEED),[LUAOBFUSACTOR_DECRYPT_STR_0("\54\179\41\62\184\75\17\30", "\114\117\210\69\82\218\42")]=function(v)
	FLY_SPEED = tonumber(v) or 130;
	effectiveSpeed = FLY_SPEED;
	if (ANTI_BAN_ENABLED and (effectiveSpeed > MAX_SAFE_SPEED)) then
		effectiveSpeed = MAX_SAFE_SPEED;
	end
	saveSettings();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\215\90\96\233\20", "\204\36\182\56\19")].Auto:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\221\66\200\143\120", "\114\137\43\188\227\29\88")]=LUAOBFUSACTOR_DECRYPT_STR_0("\199\28\165\21\246\28\232\61\235\25\173", "\112\132\125\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\210\168\231\122\85\251\238", "\149\157\216\147\19\58")]={LUAOBFUSACTOR_DECRYPT_STR_0("\231\137\10\197\200\138", "\168\169\230\120"),LUAOBFUSACTOR_DECRYPT_STR_0("\218\159\129\18\230\136\196\95\208\140\131\87\206\136\128\2\255\136\205", "\119\156\237\228")},[LUAOBFUSACTOR_DECRYPT_STR_0("\245\208\12\107\198", "\30\163\177\96")]=(((CAMERA_MODE == 1) and LUAOBFUSACTOR_DECRYPT_STR_0("\52\47\71\132\60\39", "\180\122\64\53\233\93\75")) or LUAOBFUSACTOR_DECRYPT_STR_0("\240\5\22\56\204\18\83\117\250\22\20\125\228\18\23\40\213\18\90", "\93\182\119\115")),[LUAOBFUSACTOR_DECRYPT_STR_0("\161\30\223\128\181\255\129\20", "\158\226\127\179\236\215")]=function(v)
	CAMERA_MODE = ((v == LUAOBFUSACTOR_DECRYPT_STR_0("\223\207\219\219\240\204", "\182\145\160\169")) and 1) or 2;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\33\50\5\226\95", "\111\89\64\80\118\199")].Auto:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\139\190\26\74\186", "\38\223\215\110")]=LUAOBFUSACTOR_DECRYPT_STR_0("\127\213\24\204\230\124\218\2\133\155\76\212\24\192\168\74\210\3\203\235\22\232\13\195\174\30\232\28\192\174\90\155\0\204\166\87\207\69", "\203\62\187\108\165"),[LUAOBFUSACTOR_DECRYPT_STR_0("\207\117\68\43\116", "\176\153\20\40\94\17\158")]=ANTI_BAN_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\139\50\183\95\199\169\48\176", "\165\200\83\219\51")]=function(s)
	ANTI_BAN_ENABLED = s;
	saveSettings();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\235\118\104\148\229", "\132\167\138\20\27\177\213\220")].Auto:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\198\220\247\64\57", "\92\146\181\131\44")]=LUAOBFUSACTOR_DECRYPT_STR_0("\98\249\79\137\172\69\87\243\78\255\83\131\173\84\87\248\69\234\72\146\167", "\189\43\158\33\230\222\32\119"),[LUAOBFUSACTOR_DECRYPT_STR_0("\125\193\65\93\138\95\195\70", "\232\62\160\45\49")]=function()
	addToIgnore(getClosestEntity());
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\210\247\191\228\36", "\193\20\179\149\204")].Auto:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\227\8\149\206\210", "\162\183\97\225")]=LUAOBFUSACTOR_DECRYPT_STR_0("\10\205\225\244\23\162\146\61\196\240\228", "\193\73\165\132\151\124\130"),[LUAOBFUSACTOR_DECRYPT_STR_0("\238\195\165\87\180\183\206\201", "\214\173\162\201\59\214")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\39\108\184\4\135", "\64\67\25\202\33\183")] = math.floor(os.difftime(os.time(), autofarmStartTime));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\231\127\184\27\251\6\185", "\35\137\142\17\220\78\178")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\25\71\49\13\40", "\97\77\46\69")]=LUAOBFUSACTOR_DECRYPT_STR_0("\254\202\20\170\217\222\18\168\159\236\20\164\203\204", "\197\191\191\96"),[LUAOBFUSACTOR_DECRYPT_STR_0("\233\38\227\90\93\230\89", "\45\170\73\141\46\56\136")]=string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\163\14\202\246\245\199\66\133\79\209\165\155\142\10\132\85\141\160\171\148", "\103\225\111\173\133\207\231"), bagCounter, TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\72\145\231\16\28", "\53\44\228\149")]),[LUAOBFUSACTOR_DECRYPT_STR_0("\233\206\41\4\223\45\194\213", "\68\173\187\91\101\171")]=5});
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\14\16\212\12\210", "\185\156\111\114\167\41\226\29")].Auto:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\63\12\2\44\177", "\131\107\101\118\64\212")]=LUAOBFUSACTOR_DECRYPT_STR_0("\227\215\43\107\117\193\219\200\194\37\46\84\128\221\206\150\10\42\85\205", "\169\161\182\76\75\39\160")});
for _, rarity in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\235\115\133\162\47\27\151\246\96\147\174\41\103\248", "\200\185\50\215\235\123\66")]) do
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\128\219\241\207\38", "\122\146\225\185\130\234\22")].Auto:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\141\235\212\195\234", "\219\217\130\160\175\143")]=rarity,[LUAOBFUSACTOR_DECRYPT_STR_0("\8\189\78\40\59", "\93\94\220\34")]=FARM_RARITY[rarity],[LUAOBFUSACTOR_DECRYPT_STR_0("\44\201\205\134\216\246\254\4", "\157\111\168\161\234\186\151")]=function(s)
		FARM_RARITY[rarity] = s;
	end});
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\79\65\119\34\135\233", "\229\27\32\21\81\162\217\210")].ESP:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\24\197\239\54\79", "\42\76\172\155\90")]=LUAOBFUSACTOR_DECRYPT_STR_0("\223\140\136\39\64\215\190\177", "\96\146\237\225\73")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\220\127\10\251\12\42", "\194\136\30\104\136\41\26")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\232\223\23\68\17", "\79\188\182\99\40\116\208\201")]=LUAOBFUSACTOR_DECRYPT_STR_0("\88\205\43\67\47\58\61\230\25\113", "\95\29\163\74\33\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\74\51\76\34\122", "\100\28\82\32\87\31\234")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\20\97\208\78\222\248\201\28\29\119\196\52\171", "\94\81\50\128\17\155\182\136")],[LUAOBFUSACTOR_DECRYPT_STR_0("\168\61\232\53\224\181\31\140", "\231\235\92\132\89\130\212\124")]=function(s)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\219\135\196\0\244\107\223\150\216\26\245\0\174", "\37\158\212\148\95\177")] = s;
	rebuildESP();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\64\29\166\148\72\36", "\109\20\124\196\231")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\148\180\96\169\52", "\64\192\221\20\197\81")]=LUAOBFUSACTOR_DECRYPT_STR_0("\138\197\210\226\151\163\247\251\167\181\188", "\199\207\150\130\194"),[LUAOBFUSACTOR_DECRYPT_STR_0("\131\75\119\253\70", "\35\213\42\27\136")]=ESP_PLAYERS_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\131\134\55\179\218\243\163\140", "\146\192\231\91\223\184")]=function(s)
	ESP_PLAYERS_ENABLED = s;
	rebuildESP();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\240\244\58\148\228", "\110\58\145\150\73\177\212\103")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\192\61\222\254\78", "\137\148\84\170\146\43\171")]=LUAOBFUSACTOR_DECRYPT_STR_0("\36\236\79\189\84\0\220\119\248\100", "\23\97\191\31\157"),[LUAOBFUSACTOR_DECRYPT_STR_0("\176\131\11\16\216", "\82\230\226\103\101\189")]=ESP_CACHES_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\168\43\191\189\22\138\41\184", "\116\235\74\211\209")]=function(s)
	ESP_CACHES_ENABLED = s;
	rebuildESP();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\61\220\54\109\108", "\69\72\92\190")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\2\50\240\216\174", "\215\86\91\132\180\203\200\118")]=LUAOBFUSACTOR_DECRYPT_STR_0("\22\221\182\147\17\239\129\192", "\179\83\142\230"),[LUAOBFUSACTOR_DECRYPT_STR_0("\236\46\241\32\60", "\191\186\79\157\85\89\127\151")]=ESP_BAGS_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\213\123\168\194\134\68\245\113", "\37\150\26\196\174\228")]=function(s)
	ESP_BAGS_ENABLED = s;
	rebuildESP();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\241\176\70\114\217", "\233\169\144\210\53\87")].ESP:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\22\79\249\208\39", "\188\66\38\141")]=LUAOBFUSACTOR_DECRYPT_STR_0("\196\99\61\113\65\67\26\193\245\89\8\34", "\168\129\48\109\81\19\34\104")});
for _, rarity in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\69\53\62\25\235\28\132\214\69\48\41\2\154\117", "\153\23\116\108\80\191\69\219")]) do
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\125\30\255\203\189\219", "\22\41\127\157\184\152\235")].ESP:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\35\206\245\198\18", "\170\119\167\129")]=rarity,[LUAOBFUSACTOR_DECRYPT_STR_0("\236\241\176\102\134", "\62\186\144\220\19\227")]=ESP_RARITY[rarity],[LUAOBFUSACTOR_DECRYPT_STR_0("\130\253\224\218\163\253\239\221", "\182\193\156\140")]=function(s)
		ESP_RARITY[rarity] = s;
		rebuildESP();
	end});
end
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\245\77\20\161\163\111", "\95\161\44\118\210\134")].Bags:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\210\73\7\1\127", "\206\134\32\115\109\26\182\133")]=LUAOBFUSACTOR_DECRYPT_STR_0("\21\249\220\22\29\114\38\253\193\22\79", "\61\86\152\175\115\61")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\0\207\53\252\142\39\194\236\81", "\167\201\97\188\80\177\225\67")] = LUAOBFUSACTOR_DECRYPT_STR_0("\98\7\147\170\239\149", "\225\46\104\228\207\156");
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\158\193\177\93\114\3", "\223\202\160\211\46\87\51\210")].Bags:Dropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\226\224\14\120\8", "\109\182\137\122\20")]=LUAOBFUSACTOR_DECRYPT_STR_0("\125\185\23\244\160\250\229\120\87", "\28\50\201\114\154\128\183\138"),[LUAOBFUSACTOR_DECRYPT_STR_0("\133\150\13\251\165\136\10", "\146\202\230\121")]={LUAOBFUSACTOR_DECRYPT_STR_0("\194\224\249\27\212\166", "\94\142\143\142\126\167\210\192"),LUAOBFUSACTOR_DECRYPT_STR_0("\40\204\26\233\194\19\209", "\167\96\165\125\129")},[LUAOBFUSACTOR_DECRYPT_STR_0("\49\215\26\83\71", "\232\103\182\118\38\34\70\43")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\86\60\230\29\126\49\82\106\179", "\17\85\55\79\131\80")],[LUAOBFUSACTOR_DECRYPT_STR_0("\235\132\181\160\61\201\134\178", "\95\168\229\217\204")]=function(v)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\137\58\149\140\167\52\130\140\207\107", "\233\234\91\230")] = v;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\64\128\96\226\1", "\199\49\33\226\19")].Bags:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\102\82\87\19\194", "\167\50\59\35\127")]=LUAOBFUSACTOR_DECRYPT_STR_0("\103\3\87\226\232\105\31\94\172\139\73\0\87\255\232\0\63\83\235\175\81\90", "\200\40\115\50\140"),[LUAOBFUSACTOR_DECRYPT_STR_0("\208\44\123\19\241\44\116\20", "\127\147\77\23")]=function()
	task.spawn(function()
		local opened, fails = 0, 0;
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\143\231\225\117\53\219", "\16\235\134\149\20")] = getCasesData();
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\201\68\92\178\9\131\73\138", "\108\186\43\46\198\108\231")] = {};
		for name, count in pairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\190\225\0\57\98", "\28\82\223\149\97")]) do
			table.insert(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\190\58\95\74\168\49\8\14", "\62\205\85\45")], {n=name,c=count});
		end
		table.sort(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\102\3\179\189\7\141\76\37", "\105\21\108\193\201\98\233")], function(a, b)
			return ((TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\67\132\8\251\238\49\222\69\192\75", "\186\32\229\123\158\163\94")] == LUAOBFUSACTOR_DECRYPT_STR_0("\40\44\102\207\10\177", "\87\100\67\17\170\121\197")) and (a.c < b.c)) or (a.c > b.c);
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\217\130\180\132\98\156\171\219", "\213\142\235\218\224\55")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\60\171\237\201\13", "\165\104\194\153")]=LUAOBFUSACTOR_DECRYPT_STR_0("\168\32\220\165\240\83\138\199\19\216\184\252\78", "\237\231\80\185\203\153\61"),[LUAOBFUSACTOR_DECRYPT_STR_0("\134\63\142\102\64\171\36", "\37\197\80\224\18")]=LUAOBFUSACTOR_DECRYPT_STR_0("\42\86\77\84\160\28\70\2\8\250", "\212\121\34\44\38")});
		for _, v in ipairs(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\169\181\56\17\123\169\183\14", "\62\218\218\74\101\30\205\146")]) do
			for i = 1, v.c do
				if openCase(v.n) then
					opened = opened + 1;
				else
					fails = fails + 1;
				end
				task.wait(0.05);
			end
		end
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\117\160\119\245\232\23\1\127", "\79\34\201\25\145\189\94\36")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\116\37\254\6\69", "\52\32\76\138\106\32")]=LUAOBFUSACTOR_DECRYPT_STR_0("\151\234\53\200\115\182\253\112\229\117\181\234\60\195\110\189", "\26\216\154\80\166"),[LUAOBFUSACTOR_DECRYPT_STR_0("\239\198\227\87\120\34\216", "\76\172\169\141\35\29")]=string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\243\201\253\13\217\221\162\67\153\221\184\31\156\255\249\10\208\202\162\67\153\221", "\99\188\185\152"), opened, fails)});
	end);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\230\21\180\29\230\130", "\195\178\116\214\110")].Missions:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\49\254\146\121\196", "\134\101\151\230\21\161")]=LUAOBFUSACTOR_DECRYPT_STR_0("\132\133\52\95\38\43\160\132\131\41\71\42\61\238", "\128\201\234\90\52\67\82")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\144\76\60\103\143\244", "\170\196\45\94\20")].Missions:Input({[LUAOBFUSACTOR_DECRYPT_STR_0("\74\77\17\56\196", "\80\30\36\101\84\161\64")]="Hold 'W' Time (Seconds)",[LUAOBFUSACTOR_DECRYPT_STR_0("\150\93\24\65\221\51\169\93\29\71\202", "\91\198\49\121\34\184")]=tostring(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\25\233\89\146\172\13\249\64\134\161\27\234\83\252\217", "\233\84\166\23\217")]),[LUAOBFUSACTOR_DECRYPT_STR_0("\91\121\244\234\52\32\123\115", "\65\24\24\152\134\86")]=function(v)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\145\24\198\98\153\14\215\126\131\31\199\101\152\114\184", "\41\220\87\136")] = tonumber(v) or 1.9;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\17\55\225\227\139\251", "\203\69\86\131\144\174")].Missions:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\141\23\71\85\205", "\113\217\126\51\57\168\48\135")]=LUAOBFUSACTOR_DECRYPT_STR_0("\45\0\56\8\101\112\120\197\26\12\118\103\70\124\115", "\174\127\117\86\40\40\31\22"),[LUAOBFUSACTOR_DECRYPT_STR_0("\255\58\64\215\222\58\79\208", "\187\188\91\44")]=monkeyRunOnce});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\43\246\124\54\167\93", "\109\127\151\30\69\130")].Missions:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\230\140\99\20\192", "\118\178\229\23\120\165\176\210")]=LUAOBFUSACTOR_DECRYPT_STR_0("\36\201\88\6\76\130\46\179\14\217\85\73\32\160\46\173", "\221\101\188\44\105\108\207\65"),[LUAOBFUSACTOR_DECRYPT_STR_0("\96\49\27\183\215", "\178\54\80\119\194")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\19\42\111\244\170\169", "\162\84\111\33\162\143\153\217")].GreedyMonkeyRunning,[LUAOBFUSACTOR_DECRYPT_STR_0("\4\218\17\134\37\218\30\129", "\234\71\187\125")]=function(s)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\54\25\127\109\187\65", "\158\113\92\49\59")].GreedyMonkeyRunning = s;
	if s then
		task.spawn(function()
			while TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\85\111\70\187\86", "\103\140\16\33\16\158\102\186")].GreedyMonkeyRunning do
				monkeyRunOnce();
				task.wait(0.5);
			end
		end);
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\140\191\102\70\108", "\92\167\237\221\21\99")].Missions:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\203\41\57\42\250", "\70\159\64\77")]=LUAOBFUSACTOR_DECRYPT_STR_0("\228\95\87\250\30\151\98\91\236\9\222\64\92", "\122\183\47\50\159")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\246\48\165\92\197\146", "\224\162\81\199\47")].Missions:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\220\76\39\49\134", "\227\136\37\83\93")]=LUAOBFUSACTOR_DECRYPT_STR_0("\120\184\28\123\25\158\24\113\92\169\72\89\80\190\27\125\86\163", "\20\57\205\104"),[LUAOBFUSACTOR_DECRYPT_STR_0("\30\170\20\172\31", "\83\72\203\120\217\122\58")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\155\204\149\149\234\237", "\223\220\137\219\195\207\221")].GreedySpeedFarm,[LUAOBFUSACTOR_DECRYPT_STR_0("\48\73\83\238\46\18\75\84", "\76\115\40\63\130")]=function(s)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\160\63\3\155\243\129", "\177\231\122\77\205\214")].GreedySpeedFarm = s;
	if s then
		task.spawn(missionSpeedAuto);
	end
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\112\18\67\83\236\12", "\60\36\115\33\32\201")].Settings:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\131\127\67\74\73", "\193\215\22\55\38\44\62\93")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\30\7\202\219\239\111\52\27\193\214\239\38\29\0\220", "\155\79\114\110\175\181")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\108\85\219\247\244\220", "\181\56\52\185\132\209\236")].Settings:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\6\69\198\164\64", "\154\82\44\178\200\37\201")]=LUAOBFUSACTOR_DECRYPT_STR_0("\71\238\8\2\183\70\53\70\238\16\27\187\90", "\21\21\139\98\109\222\40"),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\237\160\128\56\5\239\167", "\90\100\140\204\236")]=function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\152\17\50\201\167\23\190\0\13\201\165\14\165\23\59\137\231", "\120\204\116\94\172\215")]:Teleport(game.PlaceId, TABLE_TableIndirection["player%0"]);
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\55\188\186\27\174\242", "\31\99\221\216\104\139\194\16")].Settings:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\1\169\254\0\12", "\131\85\192\138\108\105")]=LUAOBFUSACTOR_DECRYPT_STR_0("\23\177\107\12\123\150\122\9\57\173\113\67\7\177\122\22\51\228\55\44\56\228\75\51\127", "\99\86\196\31"),[LUAOBFUSACTOR_DECRYPT_STR_0("\102\53\67\232\90", "\111\48\84\47\157\63\199")]=REJOIN_QUEUE_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\57\7\140\171\44\27\5\139", "\78\122\102\224\199")]=function(s)
	REJOIN_QUEUE_ENABLED = s;
	if s then
		setupRejoinQueue();
	end
	saveSettings();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\25\118\16\113\85", "\159\156\120\20\99\84\101\206")].Settings:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\72\24\152\115\205", "\71\28\113\236\31\168\33\23")]=LUAOBFUSACTOR_DECRYPT_STR_0("\108\240\55\241\148\248\29\140", "\199\45\158\67\152\185\185\91"),[LUAOBFUSACTOR_DECRYPT_STR_0("\108\120\177\187\213", "\176\58\25\221\206\176\118\183")]=ANTI_AFK_ENABLED,[LUAOBFUSACTOR_DECRYPT_STR_0("\17\16\213\10\236\185\49\26", "\216\82\113\185\102\142")]=function(s)
	setAntiAfk(s);
	saveSettings();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\118\90\34\203\56\18", "\29\34\59\64\184")].Settings:Section({[LUAOBFUSACTOR_DECRYPT_STR_0("\38\23\92\198\48", "\61\114\126\40\170\85")]=LUAOBFUSACTOR_DECRYPT_STR_0("\251\45\117\49\204\124\199", "\19\172\72\23\89\163")});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\3\93\205\246\112\2", "\197\87\60\175\133\85\50")].Settings:Input({[LUAOBFUSACTOR_DECRYPT_STR_0("\32\119\192\223\17", "\179\116\30\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\220\195\239\137\228\201\230\193\222\244\193", "\225\139\166\141"),[LUAOBFUSACTOR_DECRYPT_STR_0("\125\135\245\35\72\131\251\44\73\142\230", "\64\45\235\148")]=LUAOBFUSACTOR_DECRYPT_STR_0("\126\69\46\242\79\143\57\30\62\235\79\214\121\67\62\172\95\218\123\30\59\242\85\154\97\84\56\234\83\218\125\66\117\172\18\155", "\181\22\49\90\130\60"),[LUAOBFUSACTOR_DECRYPT_STR_0("\44\208\180\5\13\208\187\2", "\105\111\177\216")]=function(v)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\131\63\234\58\63\252\159\37\253\32\60\150\228", "\179\212\122\168\114\112")] = v;
	saveSettings();
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\77\123\134\222\60\42", "\173\25\26\228")].Settings:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\34\127\221\182\29", "\120\118\22\169\218")]=LUAOBFUSACTOR_DECRYPT_STR_0("\244\37\184\226\135\5\160\227\213\57\246\196\198\39", "\134\167\64\214"),[LUAOBFUSACTOR_DECRYPT_STR_0("\50\136\242\157\204", "\168\100\233\158\232\169")]=WEBHOOK_EVERY_BAG,[LUAOBFUSACTOR_DECRYPT_STR_0("\81\85\21\240\112\85\26\247", "\156\18\52\121")]=function(s)
	WEBHOOK_EVERY_BAG = s;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\119\17\217\217\193\229", "\191\35\112\187\170\228\213\101")].Settings:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\140\166\104\89\59", "\31\216\207\28\53\94\124")]=LUAOBFUSACTOR_DECRYPT_STR_0("\18\34\165\11\27\4\49\174\29\66\97\118\251\79\121\32\32\184", "\59\65\71\203\111"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\161\112\97\142", "\84\119\192\28\20\235\108")]=WEBHOOK_EVERY_10,[LUAOBFUSACTOR_DECRYPT_STR_0("\175\255\40\250\24\61\170\74", "\33\236\158\68\150\122\92\201")]=function(s)
	WEBHOOK_EVERY_10 = s;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\212\217\251\10\12\161", "\89\128\184\153\121\41\145")].Settings:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\216\60\176\141\39", "\91\140\85\196\225\66\231\96")]=LUAOBFUSACTOR_DECRYPT_STR_0("\0\189\185\181\11\22\174\178\163\82\115\233\231\225\11\17\185\176\162", "\43\83\216\215\209"),[LUAOBFUSACTOR_DECRYPT_STR_0("\125\166\188\30\43", "\78\43\199\208\107")]=WEBHOOK_EVERY_100,[LUAOBFUSACTOR_DECRYPT_STR_0("\81\137\12\18\185\59\198\221", "\182\18\232\96\126\219\90\165")]=function(s)
	WEBHOOK_EVERY_100 = s;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\9\95\37\187\120\14", "\200\93\62\71")].Settings:Toggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\114\68\90\214\193", "\110\38\45\46\186\164\210")]=LUAOBFUSACTOR_DECRYPT_STR_0("\75\187\166\18\126\87\176\232\37\42\119\174", "\94\24\222\200\118"),[LUAOBFUSACTOR_DECRYPT_STR_0("\43\193\42\12\24", "\121\125\160\70")]=WEBHOOK_ON_STOP,[LUAOBFUSACTOR_DECRYPT_STR_0("\208\235\55\190\241\235\56\185", "\210\147\138\91")]=function(s)
	WEBHOOK_ON_STOP = s;
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\1\252\202\88\117\67", "\115\85\157\168\43\80")].Settings:Button({[LUAOBFUSACTOR_DECRYPT_STR_0("\203\83\147\91\137", "\169\159\58\231\55\236\169\38")]=LUAOBFUSACTOR_DECRYPT_STR_0("\37\196\172\4\132\35\121\19\201\176\31\207", "\28\113\161\223\112\164\116"),[LUAOBFUSACTOR_DECRYPT_STR_0("\229\89\75\117\89\199\91\76", "\59\166\56\39\25")]=function()
	sendWebhook(LUAOBFUSACTOR_DECRYPT_STR_0("\134\221\213\220\3\165\221\196\192\76\189\211\134\206\81\189\213\134\239\81\183\221\194\209\3\154\205\194\210\70\190\212\134", "\35\210\184\166\168") .. TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\111\124\79\113\13\88\119\28\45", "\23\57\57\29\34\68")]);
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\103\56\17\40\101\24\90\124", "\76\48\81\127")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\58\172\69\187\15", "\48\110\197\49\215\106\20\189")]=LUAOBFUSACTOR_DECRYPT_STR_0("\42\23\74\164\207\36\77", "\108\125\114\40\204\160\75\38"),[LUAOBFUSACTOR_DECRYPT_STR_0("\22\127\241\25\48\126\235", "\109\85\16\159")]=LUAOBFUSACTOR_DECRYPT_STR_0("\19\246\190\79\91\75\181\41\231\236", "\208\71\147\205\59\123\56")});
end});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\101\53\138\139\82\50\146\177\84\37\193\232", "\216\55\64\228")].Heartbeat:Connect(function()
	if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\154\187\14\253\156\219\202\157\164\27\230\252\165", "\139\223\232\94\162\217\149")] then
		if TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\231\150\45\194\190\71\220\220\128\38\180\235", "\170\181\227\67\145\219\53")].Heartbeat:Wait() then
			rebuildESP();
		end
	end
end);
setAntiAfk(ANTI_AFK_ENABLED);
setupRejoinQueue();
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\110\140\16\182\108\172\91\226", "\210\57\229\126")]:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\140\58\254\170\55", "\227\216\83\138\198\82\165")]=TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\28\156\152\92\221\28\138\130\81\198\7\144\243\40", "\146\75\213\214\24")],[LUAOBFUSACTOR_DECRYPT_STR_0("\105\113\207\80\127\75\65", "\53\42\30\161\36\26\37")]=(TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\203\220\197\211\212\214\217\165\173", "\128\157\153\151")] .. LUAOBFUSACTOR_DECRYPT_STR_0("\54\70\153\42\22\118\101\102\138\60\25\127\111\53\160\38\20\119\115\113\204\97\34\122\120\113\185\0\85\86\114\124\152\32\26\125\63\52", "\19\22\21\236\73\117")),[LUAOBFUSACTOR_DECRYPT_STR_0("\83\208\176\168\227\180\34\248", "\150\23\165\194\201\151\221\77")]=4});
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\30\198\44\59\107", "\122\30\91\136")].GreedyHudzell_Ready = true;
