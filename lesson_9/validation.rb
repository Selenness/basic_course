module Validation
  @@appends = { presence: 'not present', format: 'format is invalid', type: 'type is invalid' }.freeze

  module ClassMethods
    @@checks = []

    def validate(attr_name, validation_type, *attrs)
      @@checks <<  {attr_name: attr_name, validation_type: validation_type, attrs: attrs}
    end

    def self.get_checks
      @@checks
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def validate!
    ClassMethods.get_checks.each do |attr|
      value = instance_variable_get("@#{attr[:attr_name]}")
      valid = true
      puts "#{attr[:attr_name]}: #{attr[:validation_type]}"
      case attr[:validation_type]
        when :presence
          valid = !value.nil?
        when :format
          valid = value =~ attr[:attrs][0]
        when :type
          valid = value.is_a?(attr[:attrs][0])
        else
      end
      raise "Validation failed, attribute #{attr[:attr_name]} #{@@appends[attr[:validation_type]]}!" unless valid
    end
    true
  end

  def valid?
    validate!
  rescue
    false
  end
end