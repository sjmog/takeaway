require_relative './takeaway'

# Understands routing the commands given to the program
class Controller
   def self.start(input = $stdin, takeaway = Takeaway.new)
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
end