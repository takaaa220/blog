class PasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && invalid_password?(value)
      record.errors.add(attribute, :invalid_password)
    end
  end

  private

  def invalid_password?(password)
    regex = /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}$/i
    !regex.match?(password)
  end
end