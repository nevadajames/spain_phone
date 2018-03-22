class SpainPhone::Generator
  def self.landline
    area_code = SpainPhone::AREA_CODES.values.sample
    if area_code.is_a?(Array)
      area_code = area_code.sample
    end
    create_phone(area_code, six_digit_extension)
  end

  def self.mobile
    leading = ['6','7'].sample
    create_phone(leading, eight_digit_extension)
  end

  def self.toll_free
    leading = ['900','800'].sample
    create_phone(leading, six_digit_extension)
  end

  def self.premium
    leading = ['902','802'].sample
    create_phone(leading, six_digit_extension)
  end

  def self.create_phone(leading,extension)
    SpainPhone::Phone.new([leading, extension].join)
  end

  private_class_method def self.six_digit_extension
    Array.new(6){ rand(0..9) }.join
  end

  private_class_method def self.eight_digit_extension
    Array.new(8){ rand(0..9) }.join
  end
end

