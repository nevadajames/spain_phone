RSpec.describe SpainPhone do

  before(:each) do
    @landline = SpainPhone::Phone.new('937886215')
    @landline_2 = SpainPhone::Phone.new('917445400')
    @mobile_phone = SpainPhone::Phone.new('634213351')
    @invalid_phone_numbers = ['0123','345345','999333666555', '222555123']
    @premium = SpainPhone::Phone.new('902224467')
    @toll_free = SpainPhone::Phone.new('900816261')
  end

  context 'Checking for version number' do
    it 'has a version number' do
      expect(SpainPhone::VERSION).not_to be nil
    end
  end

  context 'Phone numbers are valid' do
    it 'returns true for valid phone' do
      [@landline, @mobile_phone, @premium, @toll_free].each do |phone|
        expect(phone.valid?).to be true
      end
    end
    it 'returns false for invalid numbers' do
      @invalid_phone_numbers.each do |invalid_number|
        invalid = SpainPhone::Phone.new(invalid_number)
        expect(invalid.valid?).to be false
      end
    end
  end

  context 'International number for valid phones' do
    it 'returns international number for valid number' do
      [@landline, @mobile_phone, @premium, @toll_free].each do |phone|
        expect(phone.international).to eq(['+34', phone.phone_number].join)
      end
    end
  end

  context 'Checks phone type' do
    it 'returns mobile for valid mobile' do
      expect(@mobile_phone.phone_type).to eq('mobile')
    end
    it 'returns landline for valid landline' do
      expect(@landline.phone_type).to eq('landline')
    end
    it 'returns premium for valid premium phone' do
      expect(@premium.phone_type).to eq('premium')
    end
    it 'returns toll-free for valid toll-free phone' do
      expect(@toll_free.phone_type).to eq('toll-free')
    end
  end

  context 'Only valid phones have area code' do
    it 'returns nil for invalid numbers' do
      @invalid_phone_numbers.each do |invalid_number|
        invalid = SpainPhone::Phone.new(invalid_number)
        expect(invalid.area_code).to be_nil
      end
    end
    it 'returns area code for valid phone' do
      [@landline, @mobile_phone].each do |phone|
        expect(phone.area_code).to eq(phone.phone_number[0..2])
      end
    end
  end

  context 'Only valid landlines have province' do
    it 'returns province from valid landline' do
      expect(@landline.province).to eq(:Barcelona)
      expect(@landline_2.province).to eq(:Madrid)
    end
    it 'returns nil when calling province on non-landline' do
      [@mobile_phone,@premium, @toll_free].each do |non_landline|
        expect(non_landline.province).to be_nil
      end
    end
    it 'returns nil for invalid numbers province' do
      @invalid_phone_numbers.each do |invalid_number|
        invalid = SpainPhone::Phone.new(invalid_number)
        expect(invalid.province).to be_nil
      end
    end
  end
end
