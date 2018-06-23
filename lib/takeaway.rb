require 'titleize'

# Understands the output of dishes with prices to the command line
class Takeaway
  DISHES = [
    { name: "pizza",     price: 10 },
    { name: "eel pizza", price: 3  }
  ]

  def initialize(output = $stdout)
    @output = output
  end

  def exit
    @output.print "Goodbye!\n"
  end

  def list
    @output.print DISHES.map { |dish| "#{dish[:name].titleize}: $#{dish[:price]}\n" }.join
  end
end