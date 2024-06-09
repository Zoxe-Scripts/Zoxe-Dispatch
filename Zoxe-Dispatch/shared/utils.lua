local Utils = {}

function Utils:ReturnDebug(...)
    local args = { ... }

    if Config.ReturnDebug then
        for i, arg in ipairs(args) do
            if type(arg) == 'table' then
                args[i] = json.encode(arg, { sort_keys = true, indent = true })
            else
                args[i] = '^0' .. tostring(arg)
            end
        end
    end

    local formattedMessage = '^5[DEBUG] ^7' .. table.concat(args, '\t')
    print(formattedMessage)
end

function Utils:Core(string)
    lib.locale()
    if string == 'client' then
        if GetResourceState('es_extended'):find('start') then
            Utils:ReturnDebug('Esx Framework Detected')
            return require 'client.bridge.esx'
        elseif GetResourceState('qb-core'):find('start') then
            Utils:ReturnDebug('Qb Framework Detected')
            return require 'client.bridge.qb'
        else
            warn('Could not find a Framework!')
        end
    elseif string == 'server' then
        if GetResourceState('es_extended'):find('start') then
            return require 'server.bridge.esx'
        elseif GetResourceState('qb-core'):find('start') then
            return require 'server.bridge.qb'
        else
            warn('Could not find a Framework!')
        end
    end
end

function Utils:Resource()
    if GetResourceState('qb-core'):find('start') then
        Utils:ReturnDebug('QB Resource Detected')
        return 'QB'
    elseif GetResourceState('qs-base'):find('start') then
        Utils:ReturnDebug('QS Resource Detected')
        return 'QS'
    elseif GetResourceState('lb-phone'):find('start') then
        Utils:ReturnDebug('LB Resource Detected')
        return 'LB'
    else
        warn('Could not find a Resource!')
    end
end

return Utils
