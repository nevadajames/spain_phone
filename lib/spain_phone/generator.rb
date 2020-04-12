# frozen_string_literal: true

require_relative './area_codes'

module SpainPhone
  class Generator
    include AreaCodes

    def self.landline
      area_code = AREA_CODES.values.sample
      area_code = area_code.sample if area_code.is_a?(Array)
      create_phone(area_code, six_digit_extension)
    end

    def self.mobile
      leading = %w[6 7].sample
      create_phone(leading, eight_digit_extension)
    end

    def self.toll_free
      leading = %w[900 800].sample
      create_phone(leading, six_digit_extension)
    end

    def self.premium
      leading = %w[902 802].sample
      create_phone(leading, six_digit_extension)
    end

    def self.create_phone(leading, extension)
      SpainPhone::Phone.new([leading, extension].join)
    end

    private_class_method def self.six_digit_extension
      Array.new(6) { rand(0..9) }.join
    end

    private_class_method def self.eight_digit_extension
      Array.new(8) { rand(0..9) }.join
    end
  end
end
