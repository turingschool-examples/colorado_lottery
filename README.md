## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* COMMIT YOUR TESTS FIRST! We will check for TDD via your git history.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
* Put your name in your PR!

### Iteration 1

Use TDD to create a `Game` and `Contestant` class that respond to the following interaction pattern:
A contestant is considered out of state if their state of residence is not Colorado.

```ruby
require "./lib/contestant"
#=> true

require "./lib/game"
#=> true

pick_4 = Game.new('Pick 4', 2)
#=> #<Game:0x007f96c296b7b0...>

mega_millions = Game.new('Mega Millions', 5, true)
#=> #<Game:0x007f96c2953278...>

mega_millions.name
#=> "Mega Millions"

mega_millions.cost
#=> 5

mega_millions.national_drawing?
#=> true

pick_4.national_drawing?
#=> false

alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
#=> <Contestant:0x007ff87ac0a498...>

alexander.full_name
#=> "Alexander Aigiades"

alexander.age
#=> 28

alexander.state_of_residence
#=> "CO"

alexander.spending_money
#=> 10

alexander.out_of_state?
#=> false

alexander.game_interests
#=> []

alexander.add_game_interest('Mega Millions')
alexander.add_game_interest('Pick 4')

alexander.game_interests
=> ["Mega Millions", "Pick 4"]
```

### Iteration 2

Use TDD to create a ColoradoLottery class that responds to the following interaction pattern.

- A contestant #can_register? if they are interested in the game, 18 years of age or older, and they are either a Colorado resident or this is a national game

```ruby
require "./lib/contestant"
#=> true

require "./lib/game"
#=> true

require "./lib/colorado_lottery"
#=> true

lottery = ColoradoLottery.new
#=> #<ColoradoLottery:0x007f8a3250c440...>

lottery.registered_contestants
#=> {}

lottery.winners
#=> []

lottery.current_contestants
#=> {}

pick_4 = Game.new('Pick 4', 2)
#=> #<Game:0x007f8a317b5e40...>

mega_millions = Game.new('Mega Millions', 5, true)
#=> #<Game:0x007f8a322ad5a0...>

cash_5 = Game.new('Cash 5', 1)
#=> #<Game:0x007f8a32295360...>

alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
#=> #<Contestant:0x007f8a3251c390...>

benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
#=> #<Contestant:0x007f8a30383350...>

frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglas',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})


winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})


alexander.add_game_interest('Pick 4')

alexander.add_game_interest('Mega Millions')

frederick.add_game_interest('Mega Millions')

winston.add_game_interest('Cash 5')

winston.add_game_interest('Mega Millions')

benjamin.add_game_interest('Mega Millions')

lottery.interested_and_18?(alexander, pick_4)
#=> true

lottery.interested_and_18?(benjamin, mega_millions)
#=> false

lottery.interested_and_18?(alexander, cash_5)
#=> false

lottery.can_register?(alexander, pick_4)
#=> true

lottery.can_register?(alexander, cash_5)
#=> false

lottery.can_register?(frederick, mega_millions)
#=> true

lottery.can_register?(benjamin, mega_millions)
#=> false

lottery.can_register?(frederick, cash_5)
#=> false
```

### Iteration 3

- Use TDD to update your `Lottery` class so that it responds to the following interaction pattern.
- To save time, we will keep the same setup from iteration 2 with all of the same objects and interests, plus we will add one additional contestant with interests at a specific point in the interaction.
- We will only register contestants that `#can_register?`
- `#eligible_contestants` is a list of all the contestants who have been registered to play a given game and that have more spending_money than the cost.
- current_contestants are lists of contestant names who have been charged, organized by game.

```ruby
lottery.register_contestant(alexander, pick_4)

lottery.registered_contestants
#=> {"Pick 4"=> [#<Contestant:0x007f8a3251c390...>]}

lottery.register_contestant(alexander, mega_millions)

lottery.registered_contestants
#=> {"Pick 4"=> [#<Contestant:0x007f8a3251c390...>], "Mega Millions"=> [#<Contestant:0x007f8a3251c390...>]}

lottery.register_contestant(frederick, mega_millions)
lottery.register_contestant(winston, cash_5)
lottery.register_contestant(winston, mega_millions)

lottery.registered_contestants
#=> {"Pick 4"=> [#<Contestant:0x007f8a3251c390>], "Mega Millions" => [#<Contestant:0x007f8a3251c390...>, #<Contestant:0x007f8a325a6c98...>, #<Contestant:0x007f8a33092c10...>], "Cash 5" => [#<Contestant:0x007f8a33092c10...>]}

grace = Contestant.new({
                     first_name: 'Grace',
                     last_name: 'Hopper',
                     age: 20,
                     state_of_residence: 'CO',
                     spending_money: 20})
#=> #<Contestant:0x007ffe99998190...>

grace.add_game_interest('Mega Millions')
grace.add_game_interest('Cash 5')
grace.add_game_interest('Pick 4')
lottery.register_contestant(grace, mega_millions)
lottery.register_contestant(grace, cash_5)
lottery.register_contestant(grace, pick_4)

lottery.registered_contestants
#=> {"Pick 4"=> [#<Contestant:0x007f8a3251c390>, #<Contestant:0x007ffe99998190...>], "Mega Millions" => [#<Contestant:0x007f8a3251c390...>, #<Contestant:0x007f8a325a6c98...>, #<Contestant:0x007f8a33092c10...>, #<Contestant:0x007ffe99998190...>], "Cash 5" => [#<Contestant:0x007f8a33092c10...>, #<Contestant:0x007ffe99998190...>]}

lottery.eligible_contestants(pick_4)
#=> [#<Contestant:0x007ffe95fab0b8...>,
 #<Contestant:0x007ffe99998190...>]

lottery.eligible_contestants(cash_5)
#=> [#<Contestant:0x007ffe96db1180...>, #<Contestant:0x007ffe99998190...>]

lottery.eligible_contestants(mega_millions)
#=> [#<Contestant:0x007ffe95fab0b8...>, #<Contestant:0x007ffe99848470...>, #<Contestant:0x007ffe99998190...>]

lottery.charge_contestants(cash_5)

lottery.current_contestants
#=> {#<Game:0x007f8a32295360...> => ["Winston Churchill", "Grace Hopper"]}

grace.spending_money
#=> 19

winston.spending_money
#=> 4

lottery.charge_contestants(mega_millions)

lottery.current_contestants
#=> {#<Game:0x007f8a32295360...> => ["Winston Churchill", "Grace Hopper"],
 #<Game:0x007f8a322ad5a0...> => ["Alexander Aigades", "Frederick Douglas", "Grace Hopper"]}

grace.spending_money
#=> 14

winston.spending_money
#=> 4

alexander.spending_money
#=> 5

frederick.spending_money
#=> 15

lottery.charge_contestants(pick_4)

lottery.current_contestants
#=> {#<Game:0x007f8a32295360...> => ["Winston Churchill", "Grace Hopper"],
#<Game:0x007f8a322ad5a0...> => ["Alexander Aigades", "Frederick Douglas", "Grace Hopper"],
#<Game:0x007f8a317b5e40...> => ["Alexander Aigades", "Grace Hopper"]}
```

### Iteration 4

- Use TDD to update your `Lottery` class so that it responds to the following interaction pattern.
- All of the setup remains the same, make sure you have registered and charged contestants for all of the games.
- The #draw_winners method returns the date of the drawing as a string, and populates the #winners array with a random winner for each game based on available contestants
- Because the array for #winners will be populated randomly, we cannot guarantee its contents, but we can guarantee that it will be an array of hashes that is the same length as the number of games we have. An example, based on our setup, the return value could be:

<code>
[{"Winston Churchill"=>"Cash 5"},
{"Frederick Douglas"=>"Mega Millions"},
{"Grace Hopper"=>"Pick 4"}]
</code>

- To test the #announce_winner method, you will need to stub the return value of #winners.

```ruby

lottery.draw_winners
#=> "2020-04-07"

lottery.winners.class
#=> Array

lottery.winners.first.class
#=> Hash

lottery.winners.last.class
#=> Hash

lottery.winners.length
#=> 3

# Based on the example return value of #winners above in the iteration 4 directions, the announce_winner method would then return the following:

lottery.announce_winner("Pick 4")
#=> "Grace Hopper won the Pick 4 on 04/07"

lottery.announce_winner("Cash 5")
#=> "Winston Churchill won the Cash 5 on 04/07"

lottery.announce_winner("Mega Millions")
#=> "Frederick Douglas won the Mega Millions on 04/07"
```
