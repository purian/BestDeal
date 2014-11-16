module ClicksHelper
  def statistics_days(months_scope)
    unless months_scope == '0'
      if months_scope.nil?
        months_scope = '1'
      end
      "Last #{months_scope.to_i * 30} days statistics."
    else
      'All clicks.'
    end
  end
end
