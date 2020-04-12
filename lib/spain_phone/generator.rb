# frozen_string_literal: true

require_relative './area_codes'

module SpainPhone
  class Generator
    extend AreaCodes

    class << self
      def landline
        area_code = AREA_CODES.values.sample
        area_code = area_code.sample if area_code.is_a?(Array)
        create_phone(area_code, six_digit_extension)
      end

      def mobile
        leading = %w[6 7].sample
        create_phone(leading, eight_digit_extension)
      end

      def toll_free
        leading = %w[900 800].sample
        create_phone(leading, six_digit_extension)
      end

      def premium
        leading = %w[902 802].sample
        create_phone(leading, six_digit_extension)
      end

      private

      def create_phone(leading, extension)
        SpainPhone::Phone.new([leading, extension].join)
      end

      def six_digit_extension
        Array.new(6) { rand(0..9) }.join
      end

      def eight_digit_extension
        Array.new(8) { rand(0..9) }.join
      end
    end
  end
end
