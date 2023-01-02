class SlugValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    sanitized_value = value.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

    record.errors.add(attribute, :invalid) if value != sanitized_value
  end
end
