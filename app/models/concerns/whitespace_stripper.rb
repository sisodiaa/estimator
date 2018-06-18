module WhitespaceStripper
  extend ActiveSupport::Concern

  included do
    before_validation :strip_whitespace
  end

  def strip_whitespace
    self.attribute_names.slice(1..-3).each do |attr_name|
      self.update_attribute(attr_name, self[attr_name].strip) unless self[attr_name].nil?
    end
  end
end
