require "name_masker/version"

module NameMasker
  class Error < StandardError; end

  def self.mask_first_name(name)
    return '*' if name.length < 2

    masked_part = case name.length
                  when 2..3
                    '*'
                  when 4
                    '**'
                  else
                    '***'
                  end

    base_string = name.length == 2 ? name[0] : name[0..1]

    [base_string, masked_part].join
  end

  def self.mask_last_name(name)
    return '*' if name.length < 2

    masked_part = case name.length
                  when 2
                    '*'
                  when 3..4
                    '**'
                  else
                    '***'
                  end

    visible_part = name.length <= 3 ? name[-1] : name[-2..-1]

    [masked_part, visible_part].join
  end

  def self.mask(first_name, last_name)
    [mask_first_name(first_name), ' ', mask_last_name(last_name)].join
  end

  def self.mask_phone_number(country_code, gsm)
    ['+', country_code,
     gsm[0],
     (Array.new(gsm.length - 3) { '*' }).join,
     gsm[-2..-1]
    ].join
  end
end
