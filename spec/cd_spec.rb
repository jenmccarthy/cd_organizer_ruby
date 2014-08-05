require "rspec"
require "./lib/cd.rb"
require "./lib/artist.rb"
require "./lib/album.rb"

describe CD do

  before do
    CD.clear
  end

  it("is initialized with an artist name and album name") do
    test_cd = CD.new({:artist_name=>"Sarah McLachlan",
                      :album_name=>"The Laws of Illusion"})
    expect(test_cd).to be_an_instance_of CD
  end

  it("is initialized with an artist name and album name") do
    test_cd = CD.new({:artist_name=>"Sarah McLachlan",
                      :album_name=>"The Laws of Illusion"})
    expect(test_cd.artist_name).to eq "Sarah McLachlan"
    expect(test_cd.album_name).to eq "The Laws of Illusion"
  end

  describe ".all" do
    it("adds the CD to the global collection of CDs") do
      test_cd = CD.new({:artist_name=>"Sarah McLachlan",
              :album_name=>"The Laws of Illusion"})
      test_cd.save
      expect(CD.all).to eq [test_cd]
      expect(CD.all.last).to eq test_cd
    end
  end

  describe ".search" do
    it("searches for CDs by album name") do
      test_cd = CD.new({:artist_name=>"Sarah McLachlan",
                        :album_name=>"The Laws of Illusion"})
      test_cd.save
      expect(CD.search("album", "The Laws of Illusion")).to eq test_cd
    end

    it("searches for CDs by artist name") do
      test_cd = CD.new({:artist_name=>"Sarah McLachlan",
                       :album_name=>"The Laws of Illusion"})
      test_cd.save
      expect(CD.search("artist", "Sarah McLachlan")).to eq test_cd
    end
  end

end
