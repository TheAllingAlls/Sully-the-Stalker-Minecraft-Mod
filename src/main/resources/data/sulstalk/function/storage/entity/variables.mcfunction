scoreboard objectives add sulstalk_ticks_half trigger ""
scoreboard objectives add sulstalk_half_tick trigger ""
scoreboard objectives add sulstalk_ticks_quarter trigger ""
scoreboard objectives add sulstalk_quarter_tick trigger ""
scoreboard objectives add sulstalk_ticks_other trigger ""
scoreboard objectives add sulstalk_other_tick trigger ""
scoreboard objectives add sulstalk_gametime_storage trigger ""
scoreboard objectives add sulstalk_daytime_storage trigger ""
scoreboard objectives add sulstalk_storage_spawn trigger ""
scoreboard objectives add sulstalk_spawn_max trigger ""
scoreboard objectives add sulstalk_spawn trigger ""
scoreboard objectives add sulstalk_can_spawn trigger ""
scoreboard objectives add sulstalk_disable_griefing trigger ""
scoreboard objectives add sulstalk_griefing_disabled_count trigger ""
scoreboard objectives add sulstalk_griefing_enabled_count trigger ""

execute unless score @s sulstalk_ticks_half = @s sulstalk_ticks_half run scoreboard players set @s sulstalk_ticks_half 10
execute unless score @s sulstalk_half_tick = @s sulstalk_half_tick run scoreboard players set @s sulstalk_half_tick 0
execute unless score @s sulstalk_ticks_quarter = @s sulstalk_ticks_quarter run scoreboard players set @s sulstalk_ticks_quarter 5
execute unless score @s sulstalk_quarter_tick = @s sulstalk_quarter_tick run scoreboard players set @s sulstalk_quarter_tick 0
execute unless score @s sulstalk_ticks_other = @s sulstalk_ticks_other run scoreboard players set @s sulstalk_ticks_other 5
execute unless score @s sulstalk_other_tick = @s sulstalk_other_tick run scoreboard players set @s sulstalk_other_tick 0

execute unless score @s sulstalk_spawn_max = @s sulstalk_spawn_max run scoreboard players set @s sulstalk_spawn_max 10
execute unless score @s sulstalk_spawn = @s sulstalk_spawn run scoreboard players set @s sulstalk_spawn 0
execute unless score @s sulstalk_can_spawn = @s sulstalk_can_spawn run scoreboard players set @s sulstalk_can_spawn 1
execute unless score @s sulstalk_disable_griefing = @s sulstalk_disable_griefing run scoreboard players set @s sulstalk_disable_griefing 0
execute unless score @s sulstalk_griefing_disabled_count = @s sulstalk_griefing_disabled_count run scoreboard players set @s sulstalk_griefing_disabled_count 0
execute unless score @s sulstalk_griefing_enabled_count = @s sulstalk_griefing_enabled_count run scoreboard players set @s sulstalk_griefing_enabled_count 0
