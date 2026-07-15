scoreboard objectives add sulstalk_stew_drop_cooldown trigger ""

execute unless score @s sulstalk_stew_drop_cooldown = @s sulstalk_stew_drop_cooldown run scoreboard players set @s sulstalk_stew_drop_cooldown -1
execute as @e[limit=1,sort=nearest,distance=..10,type=player] unless score @s sulstalk_stew_timer = @s sulstalk_stew_timer unless score @s sulstalk_stew_drop_cooldown matches 1..