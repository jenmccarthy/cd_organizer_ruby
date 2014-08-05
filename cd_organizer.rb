require "./lib/cd.rb"
require "./lib/artist.rb"
require "./lib/album.rb"

def main_menu

  puts "\n" + "*" * 50
  puts "Welcome to the CD Organizer Ruby method"
  puts "*" * 50 + "\n"

  input_option = ""

  while input_option != "x"

    puts "[+cd] - Enter a new CD"
    puts "[cds] - Lists all cds"
    puts "[cdf] - Find a CD by input attribute"
    puts "[m]   - Go to main menu (this menu)"
    puts "[x]   - Exit program\n"

    input_option = gets.chomp
    if input_option == "x"
      exit
    elsif input_option == "m"
      main_menu
    elsif input_option == "+cd"
      add_cd
    elsif input_option == "cds"
      list_all_cds
    elsif input_option == "cdf"
      find_cds
    else
      puts "Invalid option chosen, please try again\n"
      main_menu
    end
  end

  puts "Thank you for using the CD Organizer Ruby method\n"

end

def add_cd

  puts "Enter the artist name of the CD\n"
  input_artist_name = gets.chomp
  puts "Enter the album name of the CD\n"
  input_album_name = gets.chomp
  CD.new({:artist_name=>input_artist_name,
          :album_name=>input_album_name}).save
  puts "\n#{CD.all.last.album_name} by #{CD.all.last.artist_name} added\n"

end

def list_all_cds
  puts "\nYour list of CDs:"
  CD.all.each_with_index do |disc, index|
    puts "[#{index + 1}] #{disc.album_name} by #{disc.artist_name}"
  end
  puts "\n"
end

def find_cds
end

main_menu
