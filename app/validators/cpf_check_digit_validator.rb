class CpfCheckDigitValidator < ActiveModel::EachValidator
  INVALIDS = %w(
    12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666
    77777777777 88888888888 99999999999 00000000000
  ).freeze

  def validate_each(record, attribute, value)
    value = value.scan(/[0-9]/)
    return if basic_check(value) && first_check_digit(value) && second_check_digit(value)

    append_error(record, attribute)
    false
  end

  private

  def basic_check(value)
    value.length == 11 && !INVALIDS.include?(value.join)
  end

  def first_check_digit(value)
    first = 0
    (0..8).each { |i| first += (10 - i) * value[i].to_i }
    first *= 10
    first %= 11
    first = 0 if first == 10
    first == value[9].to_i
  end

  def second_check_digit(value)
    second = 0
    (0..9).each { |i| second += (11 - i) * value[i].to_i }
    second *= 10
    second %= 11
    second = 0 if second == 10
    second == value[10].to_i
  end

  def append_error(record, attribute)
    record.errors.add(attribute, options[:message] || ' inválido!')
  end
end
