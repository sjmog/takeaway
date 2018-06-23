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

  def self.run(input = $stdin, takeaway = Takeaway.new)
    loop do
      input_string = input.gets || "exit"
      command      = input_string.split(" ").first

      if command == "exit"
        takeaway.exit
        break
      elsif command == "list"
        takeaway.list
      end
    end
  end

  def list
    @output.print DISHES.map { |dish| "#{dish[:name].titleize}: $#{dish[:price]}\n" }.join
  end

  def exit
    @output.print "Goodbye!\n"
  end
end