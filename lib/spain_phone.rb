require 'spain_phone/version'
require 'spain_phone/generator'


module SpainPhone

  AREA_CODES   =  {
        Marbella: [822], Badajoz:[ 824, 924], Guipuzcoa: [843,943],
        Navarra: [848, 948], Granada: [858, 958], Murcia: [868, 968], Baleares:[871, 971],
        Gerona: [872, 972], Lerida:[ 873, 973],Zaragoza: [876, 976],
        Tarragona:[877, 977], Pontevedra: [886, 986], Madrid: [911, 912, 913, 914, 915, 916, 917, 918],
        Segovia: [921], Salamanca: [923], Toledo: [925], Ciudad_Real: [926], Caceres: [927],
        Barcelona: [931, 932, 933, 934, 935, 936, 937, 938], La_Rioja: [941], Cantabria: [942],
        Vizcaya: [944, 946], Alava: [945], Burgos: [947], Guadalajara: [949], Almeria: [950],
        Malaga: [951, 952], Jaen: [953], Sevilla: [954, 955], Cordoba: [957], Huelva: [959],
        Valencia: [960, 961, 962, 963], Alicante: [965, 966],  Albacete: [967], Cuenca: [969],
        Huesca: [974],  Soria: [975], Teruel: [978], Palencia: [979], Zamora: [980], Lugo: [982],
        Valladolid: [983], Asturias: [984, 985], Orense: [988]
      }.freeze


  class Phone

    attr_accessor :phone_number

    def initialize phone_number
      @phone_number = phone_number.to_s.gsub(/\D/, '')
    end

    def valid?
      return false if @phone_number.length != 9
      return !@phone_number.match(/^[9678][0-9]{8}$/).nil?
    end

    def area_code
      return @phone_number.to_s[0..2] if valid?
    end

    def country_code
      "+34"
    end

    def international
      [country_code, @phone_number].join
    end

    def phone_type
      return nil unless valid?
      if area_code.match(/^80[1-9]|^90[1-9]/)
        "premium"
      elsif area_code.match(/^800|^900/)
        "toll-free"
      else
        @phone_number.match(/^[67]\d{8}$/).nil? ? "landline" : "mobile"
      end
    end

    def province
      return nil unless phone_type == "landline"
      AREA_CODES.each do |key, value|
        value.each do |area|
          return key if area.to_s == area_code
        end
      end
    end
  end
end
