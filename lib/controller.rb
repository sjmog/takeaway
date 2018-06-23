require_relative './takeaway'

# Understands routing the commands given to the program
class Controller
  COMMANDS = {
    "exit" => proc { @takeaway.exit; raise StopIteration },
    "list" => proc { @takeaway.list }
  }

  def initialize(io, takeaway)
    @io       = io
    @takeaway = takeaway
  end

   def self.start(io = $stdin, takeaway = Takeaway.new)
    new(io, takeaway).start
  end

  def start
    loop { instance_exec(&COMMANDS[command]) }
  end

  private

  def command
    input.first
  end

  def input
    (@io.gets || "exit").split(" ")
  end
end