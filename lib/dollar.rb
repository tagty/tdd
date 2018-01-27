require 'money'

class Dollar < Money

  def times(multiplier)
    Money.new(@amount * multiplier)
  end
end
