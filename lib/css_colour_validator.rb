class CssColourValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return false unless value
    record.errors[attribute] << (options[:message] || 'is not a valid CSS colour') unless ::HexadecimalColourValidator.matches?(value) or ::WebSafeColourValidator.matches?(value)
  end
end