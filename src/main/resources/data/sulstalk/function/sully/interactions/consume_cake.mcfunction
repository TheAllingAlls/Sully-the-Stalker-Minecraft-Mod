execute positioned ~ ~ ~ if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2.5] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~1 ~ ~1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2.5] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2.5] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~ ~ ~1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2.5] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~ ~ ~-1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2.5] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~1 ~ ~ if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2.5] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~-1 ~ ~ if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2.5] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2.5] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2.5] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}

execute as @e[tag=sulstalk_cake_consumer,distance=..2] positioned as @s run setblock ~ ~ ~ air destroy
execute as @e[tag=sulstalk_cake_consumer,distance=..2] positioned as @s run summon item ~ ~0.1 ~ {Item:{count:3,id:"minecraft:wheat"}}
execute as @e[tag=sulstalk_cake_consumer,distance=..2] positioned as @s run summon item ~0.5 ~0.1 ~ {Item:{count:2,id:"minecraft:sugar"}}
execute as @e[tag=sulstalk_cake_consumer,distance=..2] positioned as @s run summon item ~-0.5 ~0.1 ~ {Item:{count:1,id:"minecraft:egg"}}
execute as @e[tag=sulstalk_cake_consumer,distance=..2] positioned as @s run summon item ~ ~0.1 ~0.5 {Item:{count:3,id:"minecraft:milk_bucket"}}
execute as @e[tag=sulstalk_cake_consumer,distance=..2] run kill @s

# scoreboard objectives add sulstalk_cake_consume_delay trigger ""
# execute as @e[tag=sulstalk_cake_consumer] unless score @s sulstalk_cake_consume_delay matches 0.. run scoreboard players set @s sulstalk_cake_consume_delay 20

# execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 20 positioned as @s positioned ~ ~ ~ run setblock ~ ~ ~ cake[bites=0]
# execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 15 positioned as @s positioned ~ ~ ~ run setblock ~ ~ ~ cake[bites=1]
# execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 12 positioned as @s positioned ~ ~ ~ run setblock ~ ~ ~ cake[bites=2]
# execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 10 positioned as @s positioned ~ ~ ~ run setblock ~ ~ ~ cake[bites=3]
# execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 8 positioned as @s positioned ~ ~ ~ run setblock ~ ~ ~ cake[bites=4]
# execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 5 positioned as @s positioned ~ ~ ~ run setblock ~ ~ ~ cake[bites=5]
# execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 0 positioned as @s positioned ~ ~ ~ run setblock ~ ~ ~ cake[bites=6]

# execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches -1 run kill @s
# execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 0.. run scoreboard players remove @s sulstalk_cake_consume_delay 1