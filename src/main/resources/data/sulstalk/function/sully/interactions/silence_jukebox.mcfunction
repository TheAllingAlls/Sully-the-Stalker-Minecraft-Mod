execute positioned ~ ~ ~ unless entity @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~1 ~ ~1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~1 ~ ~-1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~ ~ ~1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~ ~ ~-1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~1 ~ ~ unless entity @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~-1 ~ ~ unless entity @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~-1 ~ ~1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~-1 ~ ~-1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}

execute as @e[distance=..3,limit=1,sort=nearest] positioned as @s run data merge entity @s {PickupDelay:2s}
execute as @e[distance=..3,limit=1,sort=nearest] positioned as @s run data modify entity @s Item.id set from block ~ ~-1 ~ RecordItem.id
execute as @e[distance=..3,limit=1,sort=nearest] positioned as @s run data modify entity @s Item.components.minecraft:item_model set from entity @s Item.id

execute positioned ~ ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run data merge block ~ ~ ~ {RecordItem:""}
execute positioned ~1 ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run data merge block ~ ~ ~ {RecordItem:""}
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run data merge block ~ ~ ~ {RecordItem:""}
execute positioned ~ ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run data merge block ~ ~ ~ {RecordItem:""}
execute positioned ~ ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run data merge block ~ ~ ~ {RecordItem:""}
execute positioned ~1 ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run data merge block ~ ~ ~ {RecordItem:""}
execute positioned ~-1 ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run data merge block ~ ~ ~ {RecordItem:""}
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run data merge block ~ ~ ~ {RecordItem:""}
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run data merge block ~ ~ ~ {RecordItem:""}

execute positioned ~ ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~1 ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~ ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~ ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~1 ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~-1 ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox