function script_path()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
 end

function GetDLCName(check_data)
	for dlc_name, dlc_data in pairs(Global.dlc_manager.all_dlc_data) do
		if dlc_data == check_data then
			return dlc_name
		end
	end
	return ""
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local heists = {}

function get_heists(platform)
    local filename = script_path() .. platform.."-dlcs-to-unlock.txt"
    local file = io.open(filename, "r") 

    if file == nil then 
        
        file = io.open(filename, "a") 
        file:write("*")
        file:close() 
    end

    file = io.open(filename, "r") 
    for line in file:lines() do
        table.insert (heists, line)
    end

    file:close()
    
end


old_steam_check = old_steam_check or WinSteamDLCManager._check_dlc_data
old_epic_check = old_epic_check or WinEpicDLCManager._check_dlc_data
old_win_check = old_win_check or WINDLCManager._check_dlc_data


function WinSteamDLCManager:_check_dlc_data(dlc_data)
    if(heists[1] == nil) then
        get_heists("steam")
    end

    if(heists[1] == "*") then
        return true
    end

    --Delete debug.txt and remove "--" symbols from the code below to recieve up to date dlc data

    -- local file = io.open(script_path() .. "debug.txt","a")
    -- if(dlc_data.app_id) then
    --     if(dlc_data.app_id~="218620") then 
    --         file:write(GetDLCName(dlc_data)," ",dlc_data.app_id,"\n")
    --     end --me
    -- end
    -- file:close()

    -- if has_value(heists, GetDLCName(dlc_data)) then
    --     return true 
    -- end

    if has_value(heists, dlc_data.app_id) then
        return true 
    end

    return old_steam_check(self, dlc_data)

end

function WinEpicDLCManager:_check_dlc_data(dlc_data)
    if(heists[1] == nil) then
        get_heists("epic")
    end

    if(heists[1] == "*") then
        return true
    end

    if has_value(heists, GetDLCName(dlc_data)) then
        return true 
    end

    return old_epic_check(self, dlc_data)
end

function WINDLCManager:_check_dlc_data(dlc_data)
    if(heists[1] == nil) then
        get_heists("win")
    end

    if(heists[1] == "*") then
        return true
    end

    if has_value(heists, GetDLCName(dlc_data)) then
        return true 
    end

    return old_epic_check(self, dlc_data)
end
