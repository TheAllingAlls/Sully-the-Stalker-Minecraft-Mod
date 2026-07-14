# data merge entity @s {Radius:0.0f}
data modify entity @s Pos set from entity @r Pos
execute store result score @s sulstalk_time_storage run time query gametime

execute as @e[tag=sulstalk_storage] if score @s sulstalk_disable_griefing matches 0 run execute at @r if entity @e[distance=..20,type=item,limit=1,nbt={Item:{count:64,id:"minecraft:black_concrete_powder"}}] run function sulstalk:disable_griefing
execute as @e[tag=sulstalk_storage] if score @s sulstalk_disable_griefing matches 1 run execute at @r unless entity @e[distance=..20,type=item,limit=1,tag=sulstalk_griefing_tag_1] run data modify entity @e[distance=..20,type=item,limit=1,nbt={Item:{count:32,id:"minecraft:black_concrete_powder"}}] Tags append value "sulstalk_griefing_tag_1"
execute as @e[tag=sulstalk_storage] if score @s sulstalk_disable_griefing matches 1 run execute at @r if entity @e[distance=..20,type=item,limit=1,tag=sulstalk_griefing_tag_1] run execute if entity @e[distance=..20,type=item,limit=1,tag=!sulstalk_griefing_tag_1,nbt={Item:{count:32,id:"minecraft:black_concrete_powder"}}] run function sulstalk:enable_griefing

execute as @e[tag=sulstalk_storage] run function sulstalk:storage/entity/half_ticks