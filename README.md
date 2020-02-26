# NameMasker [![Gem Version](https://badge.fury.io/rb/name_masker.svg)](https://badge.fury.io/rb/name_masker) ![Ruby](https://github.com/yigitsadic/name_masker/workflows/Ruby/badge.svg?branch=master)

Name masker is a gem for masking first name and last name.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'name_masker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install name_masker

## Usage

name_masker gem has 5 commands:

```ruby
first_name = 'Lorem'
last_name = 'Ipsum'

puts NameMasker.mask_first_name(first_name)
# Lo***

puts NameMasker.mask_last_name(last_name)
# ***um

puts NameMasker.mask(first_name, last_name)
# Lo*** ***um

puts NameMasker.mask_email('sadie@casperoberbrunner.co')
# '*a***@c***'

puts NameMasker.mask_phone_number('1', '2025550132')
# +12*******32
```
