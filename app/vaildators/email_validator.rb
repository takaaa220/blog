class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && invalid_email?(value)
      record.errors.add(attribute, :invalid_email)
    end
  end

  private

  def invalid_email?(email)
    regex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/
    !regex.match?(email)
  end
end