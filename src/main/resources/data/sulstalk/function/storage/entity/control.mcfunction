# data merge entity @s {Radius:0.0f}
scoreboard players add @s sulstalk_age 1

execute if score @s sulstalk_half_tick matches 1 store result score @s sulstalk_storage_spawn run execute if entity @e[tag=sulstalk_storage]
execute if score @s sulstalk_half_tick matches 1 if score @s sulstalk_storage_spawn matches 2.. unless score @s sulstalk_age > @e[tag=sulstalk_storage,sort=random,limit=1] sulstalk_age run kill @s
execute if score @s sulstalk_half_tick matches 1 if score @s sulstalk_spawn > @s sulstalk_spawn_max as @e[tag=sulstalk_spawned,limit=1,sort=random] positioned as @s unless entity @e[type=player,distance=..40] run scoreboard players set @s sulstalk_should_die 1

data modify entity @s Pos set from entity @r Pos
execute store result score @s sulstalk_gametime_storage run time query gametime
execute store result score @s sulstalk_daytime_storage run time query day

execute if score @s sulstalk_half_tick matches 1 run function sulstalk:storage/entity/variables

execute if score @s sulstalk_quarter_tick matches 1 if score @s sulstalk_disable_griefing matches 0 run execute at @r if entity @e[distance=..20,type=item,limit=1,nbt={Item:{count:64,id:"minecraft:black_concrete_powder"}}] run function sulstalk:disable_griefing
execute if score @s sulstalk_quarter_tick matches 1 if score @s sulstalk_disable_griefing matches 1 run execute at @r unless entity @e[distance=..20,type=item,limit=1,tag=sulstalk_griefing_tag_1] run data modify entity @e[distance=..20,type=item,limit=1,nbt={Item:{count:32,id:"minecraft:black_concrete_powder"}}] Tags append value "sulstalk_griefing_tag_1"
execute if score @s sulstalk_quarter_tick matches 1 if score @s sulstalk_disable_griefing matches 1 run execute at @r if entity @e[distance=..20,type=item,limit=1,tag=sulstalk_griefing_tag_1] run execute if entity @e[distance=..20,type=item,limit=1,tag=!sulstalk_griefing_tag_1,nbt={Item:{count:32,id:"minecraft:black_concrete_powder"}}] run function sulstalk:enable_griefing

execute run function sulstalk:storage/entity/half_ticks
execute run function sulstalk:storage/entity/quarter_ticks
execute run function sulstalk:storage/entity/other_ticks