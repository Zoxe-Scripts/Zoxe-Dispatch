Check = false

RegisterCommand('Dispatch_Com', function()
    FirstOpenDispatch()
end)

lib.addKeybind({
    name = 'Dispatch_Key',
    description = 'Open Dispatch',
    defaultKey = Config.Settings.OpenDispatch,
    onPressed = function()
        if Function:CanOpen() then
            FirstOpenDispatch()
        end
    end
})
