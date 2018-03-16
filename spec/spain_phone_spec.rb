RSpec.describe SpainPhone do

  before(:all) do
    @phone = SpainPhone::Phone.new('634213351')
  end


  it "has a version number" do
    expect(SpainPhone::VERSION).not_to be nil
  end

  it "returns true for valid phone" do
    expect(@phone.valid?).to be true
  end

  it "returns mobile for valid mobile phone" do
    expect(@phone.phone_type).to eq('mobile')
  end

  it "returns international number" do
    expect(@phone.international).to eq(['+34', @phone.phone_number].join)
  end
end
