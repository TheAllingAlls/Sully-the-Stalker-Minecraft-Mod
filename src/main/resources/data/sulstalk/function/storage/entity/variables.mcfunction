scoreboard objectives add sulstalk_ticks_half trigger ""
scoreboard objectives add sulstalk_half_tick trigger ""
scoreboard objectives add sulstalk_time_storage trigger ""
scoreboard objectives add sulstalk_spawn_max trigger ""
scoreboard objectives add sulstalk_spawn trigger ""
scoreboard objectives add sulstalk_can_spawn trigger ""
scoreboard objectives add sulstalk_disable_griefing trigger ""
scoreboard objectives add sulstalk_griefing_disabled_count trigger ""
scoreboard objectives add sulstalk_griefing_enabled_count trigger ""

execute run scoreboard players set @s sulstalk_ticks_half 10
execute run scoreboard players set @s sulstalk_half_tick 0

execute run scoreboard players set @s sulstalk_spawn_max 10
execute run scoreboard players set @s sulstalk_spawn 0
execute run scoreboard players set @s sulstalk_can_spawn 1
execute run scoreboard players set @s sulstalk_disable_griefing 0
execute run scoreboard players set @s sulstalk_griefing_disabled_count 0
execute run scoreboard players set @s sulstalk_griefing_enabled_count 0
