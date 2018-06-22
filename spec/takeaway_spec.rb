require 'takeaway'

RSpec.describe Takeaway do
  describe '#print_dishes' do
    it 'prints the dishes with prices to the output' do
      expect { Takeaway.new.list_dishes }.to output("Pizza: $10\nEel Pizza: $3\n").to_stdout
    end
  end
end