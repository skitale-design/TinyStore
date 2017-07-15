class Disk < Product

  attr_accessor :title, :year, :artist, :genre

  def initialize(params)
    super
    @artist = params[:artist]
    @title = params[:title]
    @year = params[:year]
    @genre = params[:genre]
  end

  def to_s
    "#{artist} #{@title}, #{year}, #{super}"
  end

  def self.from_file(path)
    disk_params = []
    if File.exists?(path)
      file = File.new(path, "r:UTF-8")
      disk_params = file.readlines
      file.close
      # Вызываем для этого класса его же метод New
      self.new(
                title: disk_params[0].chomp,
                artist: disk_params[1].chomp,
                genre: disk_params[2].chomp,
                year: disk_params[3].to_i,
                price: disk_params[4].to_i,
                amount: disk_params[5].to_i
                )
    end
  end
end
