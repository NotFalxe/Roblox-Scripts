local library = require(game:GetService("ReplicatedStorage").Framework.Library)

local env = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game["First Person Controller"])

local unlock_all = true

--// Gun Bypass
local old_fire = library.Network.Fire
library.Network.Fire = newcclosure(function(self, ...)
   local args = {...}

   if unlock_all and tostring(self) == "Request Respawn" then
       args[1] = "1"
   end

   return old_fire(self, unpack(args))
end)

local old_own = env.DoesOwnGun
env.DoesOwnGun = function(...)
   return (unlock_all and true) or old_own(...)
end
--

--// Unlock All
local old_own_gun = library.GunCmds.DoesOwnGun
library.GunCmds.DoesOwnGun = newcclosure(function(self, ...)
   return (unlock_all and true) or old_own_gun(self, ...)
end)
--

--// Unlock Offsale
for _, gun in next, library.Directory.Guns do
   gun["offsale"] = false
end
--
