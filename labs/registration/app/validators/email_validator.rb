class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !value.include?('@')
      record.errors[attribute] << "does not have an @ symbol"
    end
  end
end

#record is person object
#attribute is email 
#value is the value coming in