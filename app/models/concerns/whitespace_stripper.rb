module WhitespaceStripper
  extend ActiveSupport::Concern

  included do
    before_validation :strip_whitespace
  end

  def strip_whitespace
    self.attribute_names.each do |attr_name|
      if self[attr_name].respond_to?(:strip) && !self[attr_name].nil?
        self.update_attribute(attr_name, self[attr_name].strip)
      end
    end
  end
end
