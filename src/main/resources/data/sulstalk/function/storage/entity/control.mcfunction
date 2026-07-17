# data merge entity @s {Radius:0.0f}
execute if score @s sulstalk_half_tick matches 1 store result score @s sulstalk_storage_spawn run execute if entity @e[tag=sulstalk_storage]
execute if score @s sulstalk_half_tick matches 1 if score @s sulstalk_storage_spawn matches 2.. as @e[tag=sulstalk_storage,limit=1,sort=furthest] run kill @s

data modify entity @s Pos set from entity @r Pos
execute store result score @s sulstalk_gametime_storage run time query gametime
execute store result score @s sulstalk_daytime_storage run time query day

execute if score @s sulstalk_disable_griefing matches 0 run execute at @r if entity @e[distance=..20,type=item,limit=1,nbt={Item:{count:64,id:"minecraft:black_concrete_powder"}}] run function sulstalk:disable_griefing
execute if score @s sulstalk_disable_griefing matches 1 run execute at @r unless entity @e[distance=..20,type=item,limit=1,tag=sulstalk_griefing_tag_1] run data modify entity @e[distance=..20,type=item,limit=1,nbt={Item:{count:32,id:"minecraft:black_concrete_powder"}}] Tags append value "sulstalk_griefing_tag_1"
execute if score @s sulstalk_disable_griefing matches 1 run execute at @r if entity @e[distance=..20,type=item,limit=1,tag=sulstalk_griefing_tag_1] run execute if entity @e[distance=..20,type=item,limit=1,tag=!sulstalk_griefing_tag_1,nbt={Item:{count:32,id:"minecraft:black_concrete_powder"}}] run function sulstalk:enable_griefing

execute run function sulstalk:storage/entity/half_ticks