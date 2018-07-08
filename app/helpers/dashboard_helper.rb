module DashboardHelper
  def section_dropdown_values
    Machine.distinct.pluck(:section).map do |section|
      [section.titleize, section]
    end.unshift(['All', 'all'])
  end
end
