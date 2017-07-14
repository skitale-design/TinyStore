class Film < Product

  attr_accessor :title, :year, :director

  def initialize(params)
    super
    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "#{super} Название: #{@title}, Год: #{year}, Режиссер: #{director}"
  end


  def self.from_file(path)
    film_params = []
    if File.exists?(path)
      file = File.new(path, "r:UTF-8")
      film_params = file.readlines
      file.close
      # Вызываем для этого класса его же метод New
      self.new(
                title: film_params[0].chomp,
                director: film_params[1].chomp,
                year: film_params[2].chomp,
                price: film_params[3].to_i,
                amount: film_params[4].to_i
                )
    end
    puts "----> Film created!"
  end


end
