import math

type
  Damageable = object of RootObj
    name: string
    current_hit_points: int
    max_hit_points: int

proc status*(creature: Damageable):string = 
  creature.name & ": " & $creature.current_hit_points & "/" & $creature.max_hit_points

proc damage*(creature: var Damageable, amount: int):Damageable = 
  creature.current_hit_points -= amount
  creature

proc heal*(creature: var Damageable, amount: int):Damageable = 
  let new_hit_points = min(creature.max_hit_points, creature.current_hit_points + amount)
  creature.current_hit_points = new_hit_points
  creature

proc buff*(creature: var Damageable, amount: int):Damageable =
  creature.current_hit_points += amount
  creature

when is_main_module:
  var c1 = Damageable(name: "goblin 1", current_hit_points: 10, max_hit_points: 10)

  echo c1.status
  echo c1.damage(5).status
  echo c1.heal(3).status
  echo c1.buff(3).status
