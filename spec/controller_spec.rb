require 'controller'

RSpec.describe Controller do
  describe '.start' do
    it 'listens for commands' do
      mock_input = double
      mock_takeaway = double(exit: nil)
      expect(mock_input).to receive(:gets)
      
      Controller.start(mock_input, mock_takeaway)
    end

    it 'instructs the takeaway to exit with the command "exit"' do
      mock_input    = double
      mock_takeaway = double(exit: nil)
      allow(mock_input).to receive(:gets).and_return("exit")

      expect(mock_takeaway).to receive(:exit)

      Controller.start(mock_input, mock_takeaway)
    end

    it 'instructs the takeaway to list with the command "list"' do
      mock_input    = double
      mock_takeaway = double(exit: nil)
      allow(mock_input).to receive(:gets).and_return("list", "exit")

      expect(mock_takeaway).to receive(:list)

      Controller.start(mock_input, mock_takeaway)
    end
  end
end