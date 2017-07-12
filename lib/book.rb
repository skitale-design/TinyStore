class Book < Product

  attr_reader :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    puts "Цена: #{@price}, Количество: #{@amount} "\
          "Название: #{@title}, Жанр: #{genre}, Автор: #{author}"
  end
end

