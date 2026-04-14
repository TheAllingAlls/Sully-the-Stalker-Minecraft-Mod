scoreboard objectives add sulstalk_time_storage trigger ""
scoreboard objectives add sulstalk_spawn_max trigger ""
scoreboard objectives add sulstalk_spawn trigger ""
scoreboard objectives add sulstalk_can_spawn trigger ""

execute run scoreboard players set @s sulstalk_spawn_max 20
execute run scoreboard players set @s sulstalk_spawn 0
execute run scoreboard players set @s sulstalk_can_spawn 1