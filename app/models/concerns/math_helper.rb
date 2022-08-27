module MathHelper
  extend ActiveSupport::Concern

  private
  def cm_to_m(value, current_unit = :cm)
    return value if current_unit.to_sym == :m
    value / 100.0
  end
end