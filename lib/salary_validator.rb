class SalaryValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, "can't be blank") if value.blank?
  end
end
