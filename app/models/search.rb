class Search < ActiveRecord::Base
  def deals
    @deals ||= find_deals
  end

  def find_deals
    Deals.find(:all, conditions: conditions)
  end

  # NOTE: doesn't trigger if blank
  def keyword_conditions
    ["deals.title LIKE ?", "%#{keywords}%", "%#{keywords}%"] unless keywords.blank?
  end

  def state_conditions
    ["deals.state = ?", state] unless state.blank?
  end

  def conditions
    [conditions_clauses.join(' AND '), conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    methods.grep(/_conditions$/).map { |m| send(m) }.compact
  end
end
