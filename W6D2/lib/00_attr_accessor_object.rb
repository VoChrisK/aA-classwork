class AttrAccessorObject
  def self.my_attr_accessor(*names)
    return if names.length < 1
    names.each do |name|
      define_method("#{name}") do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |val|
        instance_variable_set("@#{name}", val)
      end
    end
  end
end
