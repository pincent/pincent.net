require 'jekyll-assets'

module LiquidExtend
  def active(categories, category)
    !categories.nil? && categories.include?(category) ? 'active' : ''
  end
  Liquid::Template.register_filter self
end
