RSpec.describe SpainPhone do

  before(:all) do
    @landline = SpainPhone::Phone.new('937886215')
    @mobile_phone = SpainPhone::Phone.new('634213351')
    @invalid_phone_numbers = ['0123','345345','999333666555', '222555123']
  end


  it "has a version number" do
    expect(SpainPhone::VERSION).not_to be nil
  end

  it "returns true for valid phone" do
    [@landline, @mobile_phone].each do |phone|
      expect(phone.valid?).to be true
    end
  end

  it "returns mobile for valid mobile phone" do
    expect(@mobile_phone.phone_type).to eq('mobile')
  end

  it "returns international number" do
    [@landline, @mobile_phone].each do |phone|
      expect(phone.international).to eq(['+34', phone.phone_number].join)
    end
  end

  it "returns false for invalid numbers" do |invalid_number|
    @invalid_phone_numbers.each do
      invalid = SpainPhone::Phone.new(invalid_number)
      expect(invalid.valid?).to be false
    end
  end

  it "only returns area code for valid numbers" do
    @invalid_phone_numbers.each do |invalid_number|
      invalid = SpainPhone::Phone.new(invalid_number)
      expect(invalid.area_code).to be nil
    end
    [@landline, @mobile_phone].each do |phone|
      expect(phone.area_code).to eq(phone.phone_number[0..2])
    end
  end
end
