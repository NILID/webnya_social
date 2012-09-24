class HexadecimalColourValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
      record.errors[attribute] << (options[:message] || 'is not a valid hexadecimal colour') unless self.class.matches?(value)
  end

  def self.matches?(value)
    return false unless value
    /^#(?:[0-9a-f]{3})(?:[0-9a-f]{3})?$/i.match(value).nil? ? false : true
    end
 end