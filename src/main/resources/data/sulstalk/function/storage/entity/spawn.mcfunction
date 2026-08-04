# summon area_effect_cloud ~ ~ ~ {CustomName:"sulstalk_storage",Radius:0.1f,Tags:["sulstalk_storage"]}
execute at @r run summon marker ~ ~ ~ {CustomName:"sulstalk_storage",Tags:["sulstalk_storage"]}
execute positioned 0 0 0 as @e[tag=sulstalk_storage,limit=1,sort=furthest] run function sulstalk:storage/entity/variables