class CD

  @@all_CDs = []

  attr_reader(:artist_name, :album_name)

  def initialize(attributes)
    @artist_name = attributes[:artist_name]
    @album_name = attributes[:album_name]
  end

  def CD.all
    @@all_CDs
  end

  def CD.clear
    @@all_CDs = []
  end

  def CD.search (type_search, search_string)
    if type_search == "album"
      CD.all.each do |disc|
        if search_string == disc.album_name
          return disc
        end
      end
    else # search_string == "artist"; make sure to edit in method
      CD.all.each do |disc|
        if search_string == disc.artist_name
          return disc
        end
      end
    end
  end

  def save
    @@all_CDs << self
  end

end
