RSpec.describe "Interacting with the program as a user" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'See a list of dishes with prices' do
    # Run the list program and capture the result
    message_printed_to_stdout = `ruby app.rb`
    # Expect that result to get a list of dishes with prices
    expect(message_printed_to_stdout).to eq "Pizza: $10\nEel Pizza: $3\n"
  end
end