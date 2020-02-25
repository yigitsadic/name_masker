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

    base_string = case name.length
                  when 2
                    name[0]
                  else
                    name[0..1]
                  end

    [base_string, masked_part].join
  end
end
