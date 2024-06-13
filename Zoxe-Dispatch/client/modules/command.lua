Check = false

RegisterCommand('Dispatch_Com', function()
    FirstOpenDispatch()
end)

lib.addKeybind({
    name = 'Dispatch_Key',
    description = 'Open Dispatch',
    defaultKey = Config.Settings.OpenDispatch,
    onPressed = function()
        FirstOpenDispatch()
    end
})

exports('FirstOpenDispatch', FirstOpenDispatch)
