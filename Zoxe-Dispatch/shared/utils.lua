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
            if GetResourceState('qbx_core'):find('start') then
                Utils:ReturnDebug('Qbx Detected')
                return require 'client.bridge.qbox'
            else
                Utils:ReturnDebug('Qb Framework Detected')
                return require 'client.bridge.qb'
            end
        elseif GetResourceState('LegacyFramework'):find('start') then
            Utils:ReturnDebug('LegacyFramework Detected')
            return require 'client.bridge.legacy'
        else
            warn('Could not find a Framework!')
        end
    elseif string == 'server' then
        if GetResourceState('es_extended'):find('start') then
            Utils:ReturnDebug('Esx Framework Detected')
            return require 'server.bridge.esx'
        elseif GetResourceState('qb-core'):find('start') then
            if GetResourceState('qbx_core'):find('start') then
                Utils:ReturnDebug('Qbx Detected')
                return require 'server.bridge.qbox'
            else
                Utils:ReturnDebug('Qb Framework Detected')
                return require 'server.bridge.qb'
            end
        elseif GetResourceState('LegacyFramework'):find('start') then
            Utils:ReturnDebug('LegacyFramework Detected')
            return require 'server.bridge.legacy'
        else
            warn('Could not find a Framework!')
        end
    end
end

function Utils:Resource()
    if GetResourceState('qb-core'):find('start') then
        if GetResourceState('qbx_core'):find('start') then
            Utils:ReturnDebug('Qbox Resource Detected')
            return 'Qbox'
        else
            Utils:ReturnDebug('QB Resource Detected')
            return 'QB'
        end
    elseif GetResourceState('qs-base'):find('start') then
        Utils:ReturnDebug('QS Resource Detected')
        return 'QS'
    elseif GetResourceState('lb-phone'):find('start') then
        Utils:ReturnDebug('LB Resource Detected')
        return 'LB'
    elseif GetResourceState('ars_ambulancejob'):find('start') then
        Utils:ReturnDebug('Ars Resource Detected')
        return 'Ars'
    elseif GetResourceState('esx_ambulancejob'):find('start') then
        Utils:ReturnDebug('Esx Resource Detected')
        return 'Esx'
    else
        warn('Could not find a Resource!')
    end
end

return Utils
