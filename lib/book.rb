class Book < Product

  attr_reader :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "#{super} Название: #{@title}, Жанр: #{genre}, Автор: #{author}"
  end
end

