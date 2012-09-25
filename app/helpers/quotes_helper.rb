module QuotesHelper
  def relevant_before
    @quote_lines.where(show_before: "true").order("ordering").collect { |r| [r.symbol, r.net_amount] }
  end
  def relevant_after
    @quote_lines.where(show_before: "false").order("ordering").collect { |r| [r.symbol, r.net_amount] }
  end

end