execute positioned 0 0 0 unless entity @e[tag=time_storage,limit=1,sort=nearest] at @r summon area_effect_cloud ~ ~ ~ {Radius:0.1f,Tags:["time_storage"]}
execute positioned 0 0 0 as entity @e[tag=time_storage,limit=1,sort=nearest] run data modify entity @s Pos set from entity @r Pos
execute positioned 0 0 0 as entity @e[tag=time_storage,limit=1,sort=nearest] run store result score @s 