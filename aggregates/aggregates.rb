class Aggregates
  class << self
    delegate :values, :flatten_values, :get, :get_key, :include?, :each, :method_missing, to: :new
  end
  delegate :include?, to: :values

  def module_name
    self.class.name.underscore
  end

  def values
    self.class.const_get 'VALUES'
  end

  def flatten_values
    values.values.flatten
  end

  def get(key)
    values[key]
  end

  def get_key(value)
    values.key value
  end

  def each
    values.each { |value| yield(value) }
  end

  def method_missing(method_name, *arguments, &block)
    return method_name.to_s if include?(method_name)

    super
  end

  def respond_to_missing?(*args)
    super
  end
end
