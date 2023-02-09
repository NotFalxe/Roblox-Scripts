-- Take off your jump and fall animations for this to work

while true do
local Animate = game.Players.LocalPlayer.Character.Animate
Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=10921258489"
Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=10921259953"
Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=10921160088"
Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=10921148939"
game.Players.LocalPlayer.Character.Humanoid.Jump = false
wait(1)
end
