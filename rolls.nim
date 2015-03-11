import math, strutils, parseutils, re

type
  roll_results = object of RootObj
    rolls: seq[int]
    total: int

type
  parsed_roll = tuple[count: int, sides: int]

proc roll_dice(number: int, size: int): roll_results =
  result = roll_results(rolls: @[], total: 0)
  for i in countup(1, number):
    randomize()
    let roll = random(size) + 1
    result.total += roll
    result.rolls.add(roll)

proc to_string(rolls: roll_results): string =
  if rolls.rolls.len == 1:
    result = $(rolls.total)
  else:
    result = ""
    for roll in rolls.rolls:
      addSep(result, startLen=0)
      add(result, $roll)

    result = result & " = " & $(rolls.total)

proc parse_roll(roll_string: string): parsed_roll =
  let strings = split(roll_string, "d")
  (count: parse_int(strings[0]), sides: parse_int(strings[1]))

proc roll*(roll: string): string =
  let (count, sides) = parse_roll(roll)
  to_string(roll_dice(count, sides))

proc validate*(roll: string): bool =
  match(roll, re"^\d+d\d+$")

when is_main_module:
  echo validate("3d4")
  echo validate("d3d4")
  echo validate("3d4+5")

  for i in countup(1, 10):
    echo roll("3d4")

  for i in countup(1, 10):
    echo to_string(roll_dice(1, 6))
