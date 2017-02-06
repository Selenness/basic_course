module Validation
  APPENDS = { presence: 'not present', format: 'format is invalid', type: 'type is invalid' }

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    attr_reader :checks

    @checks = []

    def validate(attr_name, validation_type, *attrs)
      @checks <<  {attr_name: attr_name, validation_type: validation_type, attrs: attrs}
    end

    def get_checks
      @checks
    end
  end

  def validate!
    self.class.get_checks.each do |attr|
      @value = instance_variable_get("@#{attr[:attr_name]}")
      @validate_with = attr[:attrs][0]
      @valid = self.send(attr[:validation_type])
      raise "Validation failed, attribute #{attr[:attr_name]} #{APPENDS[attr[:validation_type]]}!" unless @valid
    end
  end

  def valid?
    validate!
  rescue
    false
  end

  private

  def presence
    !@value.nil?
  end

  def format
    @value =~ @validate_with
  end

  def type
    @value.is_a?(@validate_with)
  end
end