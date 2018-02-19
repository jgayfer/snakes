require_relative 'rules_interface'

class StandardRules < RulesInterface
  def roll_is_valid(roll_num)
    (1..6).cover?(roll_num)
  end
end
