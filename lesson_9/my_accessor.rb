module MyAccessor

  def self.included base
    base.send :extend, self
  end

  def attr_accessor_with_history(*attrs)
    attrs.each do |attr|
      attr = attr.to_sym
      attr_history = "#{attr}_history".to_sym
      define_method(attr) { instance_variable_get("@#{attr}") }
        history = instance_variable_get("@#{attr_history}")
        if history.nil?
          history = []
          instance_variable_set("@#{attr_history}", history)
        end
        define_method("#{attr}=".to_sym) do |value|
        instance_variable_set("@#{attr}", value)
        history << value
      end
      define_method(attr_history){ instance_variable_get("@#{attr_history}") }
    end
  end


  def strong_attr_accessor(name, klass)
    define_method(name) { instance_variable_get("@#{name}") }
    define_method("#{name}=".to_sym) { |value|
      if value.is_a?(klass)
        instance_variable_set("@#{name}", value)
      else
        raise "Value class isn't valid"
      end
    }
  end
end