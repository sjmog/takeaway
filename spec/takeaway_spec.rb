require 'takeaway'

RSpec.describe Takeaway do
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