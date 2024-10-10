CreateThread(function()
    for _, v in ipairs(Config.GunZones) do
        local sphere = lib.zones.sphere({
            coords = v.coords,
            radius = v.radius,
            debug = v.debug,

            onExit = function()
                lib.notify({
                    title = 'GunZone',
                    description = 'You successfully exited the GunZone!',
                    type = 'error',
                    position = 'top'
                })
            end,

            inside = function()
                if not HasPedGotWeapon(cache.ped, v.weapon, false) then
                    DisableControlAction(0, 24, true)
                    DisableControlAction(0, 257, true)
                    DisableControlAction(0, 263, true)
                end
            end,

            onEnter = function()
                lib.notify({
                    title = 'GunZone',
                    description = 'You successfully entered the GunZone!',
                    type = 'success',
                    position = 'top'
                })
            end,
        })
        
        local blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, 110)
        SetBlipColour(blip, 0)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.blip)
        EndTextCommandSetBlipName(blip)
        
        local blip3 = AddBlipForRadius(v.coords, v.radius)
        SetBlipColour(blip3, 47)
        SetBlipAlpha(blip3, 150)
    end
end)