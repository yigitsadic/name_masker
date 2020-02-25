require "test_helper"

class NameMaskerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NameMasker::VERSION
  end

  def test_it_has_mask_first_name_method
    assert ::NameMasker.respond_to?(:mask_first_name)
  end

  def test_it_masks_empty_first_name_correctly
    assert_equal '*', ::NameMasker.mask_first_name('')
  end

  def test_it_masks_first_name_correctly
    names = %w[Ali Kaci Natasha Abraham G]
    expected_results = %w[Al* Ka** Na*** Ab*** *]

    names.each_with_index do |name, index|
      assert_equal expected_results[index], ::NameMasker.mask_first_name(name)
    end
  end
end
