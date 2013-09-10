require 'jekyll-assets'

module LiquidExtend
  def active(categories, category)
    categories.include?(category) ? 'active' : ''
  end
  Liquid::Template.register_filter self
end
