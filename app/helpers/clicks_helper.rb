module ClicksHelper
  def statistics_days(months_scope)
    if months_scope
      "Last #{months_scope.to_i * 30} days statistics."
    else
      'All clicks.'
    end
  end
end
