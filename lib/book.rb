class Book < Product

  attr_accessor :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "#{super} Название: #{@title}, Жанр: #{genre}, Автор: #{author}"
  end

  def self.from_file(path)
    book_params = []
    if File.exists?(path)
      file = File.new(path, "r:UTF-8")
      book_params = file.readlines
      file.close
      # Вызываем для этого класса его же метод New
      self.new(
                title: book_params[0].chomp,
                genre: book_params[1].chomp,
                author: book_params[2].chomp,
                price: book_params[3].to_i,
                amount: book_params[4].to_i
                )
    end
    puts "----> Book created!"
  end

end

