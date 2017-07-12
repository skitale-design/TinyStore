# require 'product'

class Film < Product

  attr_reader :title, :year, :director

  def initialize(params)
    super
    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end
end
