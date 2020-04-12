# frozen_string_literal: true

require 'spain_phone/version'
require 'spain_phone/area_codes'
require 'spain_phone/generator'

module SpainPhone
  class Phone
    include AreaCodes

    attr_reader :phone_number

    def initialize(phone_number)
      @phone_number = phone_number.to_s.gsub(/\D/, '')
    end

    def valid?
      return false if phone_number.length != 9

      !phone_number.match(/^[9678][0-9]{8}$/).nil?
    end

    def area_code
      phone_number.to_s[0..2] if valid?
    end

    def country_code
      '+34'
    end

    def international
      [country_code, phone_number].join
    end

    def phone_type
      return nil unless valid?

      if area_code.match(/^80[1-9]|^90[1-9]/)
        'premium'
      elsif area_code.match(/^800|^900/)
        'toll-free'
      else
        @phone_number.match(/^[67]\d{8}$/).nil? ? 'landline' : 'mobile'
      end
    end

    def province
      return nil unless phone_type == 'landline'

      AREA_CODES.each do |key, value|
        value.each do |area|
          return key if area.to_s == area_code
        end
      end
    end
  end
end
