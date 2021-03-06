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

  def test_it_has_mask_last_name_method
    assert ::NameMasker.respond_to?(:mask_last_name)
  end

  def test_it_masks_empty_last_name_correctly
    assert_equal '*', ::NameMasker.mask_last_name('')
  end

  def test_is_masks_last_name_correctly
    names = %w[Al Doe Koch Maggio Swaniawski]
    expected_results = %w[*l **e **ch ***io ***ki]

    names.each_with_index do |name, index|
      assert_equal expected_results[index], ::NameMasker.mask_last_name(name)
    end
  end

  def test_it_has_mask_method
    assert ::NameMasker.respond_to?(:mask)
  end

  def test_it_should_mask_as_expected
    names = ['Ali Moustapha', 'Lonnie Koch', 'Kandis Moen', 'Misha Durgan',
             'M Good', 'Huey W', 'Donnell Anderson']
    expected = ['Al* ***ha', 'Lo*** **ch', 'Ka*** **en', 'Mi*** ***an',
                '* **od', 'Hu** *', 'Do*** ***on']

    names.each_with_index do |full_name, index|
      first_name, last_name = full_name.split(' ')
      assert_equal expected[index], ::NameMasker.mask(first_name, last_name)
    end
  end

  def test_it_has_mask_phone_number_method
    assert ::NameMasker.respond_to?(:mask_phone_number)
  end

  def test_it_should_mask_phone_number_correctly
    phone_numbers = [['90', '5555555555'], ['1', '2025550132']]
    expected_result = ['+905*******55', '+12*******32']

    phone_numbers.each_with_index do |full_gsm, index|
      assert_equal expected_result[index],
                   ::NameMasker.mask_phone_number(*full_gsm)
    end
  end

  def test_it_has_mask_email_method
    emails = ["claris@prosaccorath.info", "clarence.schuster@heidenreich.co",
              "sadie@casperoberbrunner.co", "malisa_blanda@harris.io"]
    expected_result = ['*l***@p***', '*l***@h***', '*a***@c***', '*a***@h***']

    emails.each_with_index do |email, index|
      assert_equal expected_result[index], ::NameMasker.mask_email(email)
    end
  end

  def test_is_masks_all_content_of_email_if_not_at_present
    assert_equal '***', ::NameMasker.mask_email('loremipsum.com')
  end
end
