require_relative './takeaway'

# Understands routing the commands given to the program
class Controller
  def initialize(input, takeaway)
    @input    = input
    @takeaway = takeaway
  end

   def self.start(input = $stdin, takeaway = Takeaway.new)
    new(input, takeaway).start
  end

  def start
    loop do
      input_string = @input.gets || "exit"
      command      = input_string.split(" ").first

      if command == "exit"
        @takeaway.exit
        break
      elsif command == "list"
        @takeaway.list
      end
    end
  end
end