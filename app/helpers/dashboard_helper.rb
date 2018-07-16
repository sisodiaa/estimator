module DashboardHelper
  def section_dropdown_values
    Machine.distinct.pluck(:section).sort.map do |section|
      [section.titleize, section]
    end.unshift(['All', 'all'])
  end

  def grade_dropdown_values
    Belt.pluck(:grade).sort.unshift(['All', 'all'])
  end
end
