--[[game.create_force("ad-portal")
game.forces["ad-portal"].set_friend("player", true)
game.forces["ad-portal"].set_friend("enemy", true)
game.forces["player"].set_friend("ad-portal", true)
game.forces["enemy"].set_friend("ad-portal", true)]]--