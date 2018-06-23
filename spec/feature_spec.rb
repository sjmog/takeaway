require 'open3'

RSpec.describe "Interacting with the program as a user" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'See a list of dishes with prices' do
    # Run the takeaway program in a sub-process
    Open3.pipeline_rw("takeaway") do |stdin, stdout|
      stdin.puts "list"
      stdin.puts "exit"

      # Expect that result to get a list of dishes with prices
      expect(stdout.read).to eq "Pizza: $10\nEel Pizza: $3\nGoodbye!\n"
    end
  end
end