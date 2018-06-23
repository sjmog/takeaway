require 'takeaway'

RSpec.describe Takeaway do
  describe '.run' do
    it 'listens for commands' do
      mock_input = double
      mock_output = double(print: nil)
      mock_takeaway = Takeaway.new(mock_output)
      expect(mock_input).to receive(:gets)
      
      Takeaway.run(mock_input, mock_takeaway)
    end

    it 'exits with the command "exit"' do
      mock_input    = double
      mock_output   = double(print: nil)
      mock_takeaway = Takeaway.new(mock_output)
      allow(mock_input).to receive(:gets).and_return("exit")

      expect(mock_takeaway).to receive(:exit)

      Takeaway.run(mock_input, mock_takeaway)
    end

    it 'calls #list with the command "list"' do
      mock_input    = double
      mock_output   = double(print: nil)
      mock_takeaway = Takeaway.new(mock_output)
      allow(mock_input).to receive(:gets).and_return("list", "exit")

      expect(mock_takeaway).to receive(:list)

      Takeaway.run(mock_input, mock_takeaway)
    end
  end

  describe '#exit' do
    it 'prints a goodbye message' do
      expect { Takeaway.new.exit }.to output("Goodbye!\n").to_stdout
    end
  end

  describe '#list' do
    it 'lists the dishes with prices to the output' do
      expect { Takeaway.new.list }.to output("Pizza: $10\nEel Pizza: $3\n").to_stdout
    end
  end
end