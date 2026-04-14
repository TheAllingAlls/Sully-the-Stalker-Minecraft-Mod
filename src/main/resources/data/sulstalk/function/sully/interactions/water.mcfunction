scoreboard objectives add sulstalk_underwater trigger ""
scoreboard objectives add sulstalk_underwater_rotate trigger ""
execute unless score @s sulstalk_underwater matches 0.. run scoreboard players set @s sulstalk_underwater 0
execute unless score @s sulstalk_underwater_rotate matches -1..1 run scoreboard players set @s sulstalk_underwater_rotate 0

execute unless score @s sulstalk_underwater matches 1.. positioned as @s if block ~ ~ ~ #sulstalk:can_be_trapped_under run scoreboard players set @s sulstalk_underwater 3
execute if score @s sulstalk_underwater matches 1.. positioned as @s positioned ~ ~1 ~ if block ~ ~ ~ air run scoreboard players set @s sulstalk_underwater 2
execute if score @s sulstalk_underwater matches 2.. positioned as @s positioned ~ ~2 ~ if block ~ ~ ~ air run scoreboard players set @s sulstalk_underwater 1

execute if score @s sulstalk_underwater matches 1.. positioned as @s rotated as @s unless block ^ ^ ^1 #sulstalk:can_pass_through store result score @s sulstalk_underwater_rotate run random value -1..1
execute if score @s sulstalk_underwater matches 1.. positioned as @s rotated as @s if block ^ ^ ^1 #sulstalk:can_pass_through run scoreboard players set @s sulstalk_underwater_rotate 0
execute if score @s sulstalk_underwater_rotate matches -1 rotated as @s run rotate @s ~-45 ~0.0
execute if score @s sulstalk_underwater_rotate matches 1 rotated as @s run rotate @s ~45 ~0.0