scoreboard objectives add sulstalk_time_storage trigger ""
scoreboard objectives add sulstalk_spawn_max trigger ""
scoreboard objectives add sulstalk_spawn trigger ""
scoreboard objectives add sulstalk_can_spawn trigger ""
scoreboard objectives add sulstalk_disable_griefing trigger ""

execute run scoreboard players set @s sulstalk_spawn_max 10
execute run scoreboard players set @s sulstalk_spawn 0
execute run scoreboard players set @s sulstalk_can_spawn 1
execute unless score @s sulstalk_disable_griefing matches 0..1 run scoreboard players set @s sulstalk_disable_griefing 0