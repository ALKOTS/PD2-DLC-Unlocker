function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local heists = {}

function get_heists()
    local file = io.open(SavePath .. "dlcs-to-unlock.txt", "r") 

    if file == nil then 
        
        file = io.open(SavePath .. "dlcs-to-unlock.txt", "a") 
        file:write("*")
        file:close() 
    end

    file = io.open(SavePath .. "dlcs-to-unlock.txt", "r") 
    for line in file:lines() do
        table.insert (heists, line)
    end

    file:close()
    
end


old_steam_check = old_steam_check or WinSteamDLCManager._check_dlc_data


function WinSteamDLCManager:_check_dlc_data(dlc_data)
    if(heists[1] == nil) then
        get_heists()
    end

    if(heists[1] == "*") then
        return true
    end

    if has_value(heists, dlc_data.app_id) then
        return true 
    end

    return old_steam_check(self, dlc_data)

end

function WinEpicDLCManager:_check_dlc_data(dlc_data)
    return true
end
function WINDLCManager:_check_dlc_data(dlc_data)
    return true
end