execute if data entity @s {PierceLevel:0b} store result entity @s Motion[0] double 0.00001 run data get entity @s Motion[0] -10000
execute if data entity @s {PierceLevel:0b} store result entity @s Motion[1] double 0.00001 run data get entity @s Motion[1] -10000
execute if data entity @s {PierceLevel:0b} store result entity @s Motion[2] double 0.00001 run data get entity @s Motion[2] -10000
execute unless data entity @s PierceLevel store result entity @s Motion[0] double 0.00001 run data get entity @s Motion[0] -10000
execute unless data entity @s PierceLevel store result entity @s Motion[1] double 0.00001 run data get entity @s Motion[1] -10000
execute unless data entity @s PierceLevel store result entity @s Motion[2] double 0.00001 run data get entity @s Motion[2] -10000