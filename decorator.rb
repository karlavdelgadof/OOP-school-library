require_relative 'nameable'

class Decorator < Nameable

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    super
    @nameable.correct_name
  end
end