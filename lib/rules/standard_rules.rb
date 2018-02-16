require_relative 'rules_interface'

class StandardRules < RulesInterface
  def roll_is_valid(roll_num)
    (1..6).cover?(roll_num)
  end

  def next_player(player_states)
    player_count = player_states.uniq(&:player).size
    player_states[-player_count].player
  end
end
