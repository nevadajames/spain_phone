# frozen_string_literal: true

RSpec.describe SpainPhone::Generator do
  let(:landline) { SpainPhone::Generator.landline }
  let(:mobile_phone) { SpainPhone::Generator.mobile }
  let(:premium) { SpainPhone::Generator.premium }
  let(:toll_free) { SpainPhone::Generator.toll_free }

  context 'Validate generated phones' do
    it 'returns true for valid attributes' do
      [landline, mobile_phone, premium, toll_free].each do |phone|
        expect(phone.valid?).to be true
        expect(phone.international).to eq(['+34', phone.phone_number].join)
      end
    end
  end

  context 'Checks phone type' do
    it 'returns mobile for valid mobile' do
      expect(mobile_phone.phone_type).to eq('mobile')
    end
    it 'returns landline for valid landline' do
      expect(landline.phone_type).to eq('landline')
    end
    it 'returns premium for valid premium phone' do
      expect(premium.phone_type).to eq('premium')
    end
    it 'returns toll-free for valid toll-free phone' do
      expect(toll_free.phone_type).to eq('toll-free')
    end
  end

  context 'Generated landline has province' do
    it 'generated  landline.province is not nil' do
      expect(landline.province).to be
    end
  end
end
