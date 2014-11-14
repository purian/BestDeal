module ClicksHelper
  def statistics_days(month_scope)
    if month_scope
      "Last #{month_scope.to_i * 30} days statistics."
    else
      'All clicks.'
    end
  end
end
