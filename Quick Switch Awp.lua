----    Base    code    for    auto    updating.
--
--local    cS    =    GetScriptName()
--local    cV    =    '1.0.0'
--local    gS    =    'PUT    LINK    TO    RAW    LUA    SCRIPT'
--local    gV    =    'PUT    LINK    TO    RAW    VERSION'
--
--local    function    AutoUpdate()
--	if    gui.GetValue('lua_allow_http')    and    gui.GetValue('lua_allow_cfg')    then
--		local    nV    =    http.Get(gV)
--		if    cV    ~=    nV    then
--			local    nF    =    http.Get(gS)
--			local    cF    =    file.Open(cS,    'w')
--			cF:Write(nF)
--			cF:Close()
--			print(cS,    'updated    from',    cV,    'to',    nV)
--		else
--			print(cS,    'is    up-to-date.')
--		end
--	end
--end		
--
--callbacks.Register('Draw',    'Auto    Update')
--callbacks.Unregister('Draw',    'Auto    Update')



print("Loaded Quick Switch AWP By Starlordaiden")local a=client.GetPlayerIndexByUserID;local b=client.GetLocalPlayerIndex;local c;local d;local e=gui.Reference("MISC","Movement","Other")local f=gui.Checkbox(e,'lua_quick_switch','Quick Switch AWP',0)local function g(h)if f:GetValue()then if h:GetName()~='weapon_fire'then return end;if gui.GetValue("misc.fakelatency.enable")then return end;local i=b()local j=h:GetInt('userid')if i==a(j)then local k=h:GetString('weapon')if k=='weapon_awp'then client.Command('slot3',true)flip=true end end end end;client.AllowListener('weapon_fire')callbacks.Register('FireGameEvent','on_weapon_fire',g)local function l(h)if h:GetName()~='item_equip'then return end;local i=b()local j=h:GetInt('userid')local m=h:GetString('item')if i==a(j)then d=m end end;client.AllowListener('item_equip')callbacks.Register('FireGameEvent','on_item_equip',l)function reset_tick(n)if flip then if d~='awp'then client.Command("slot1",true)flip=false end end end;callbacks.Register('CreateMove','reset_tick',reset_tick)
