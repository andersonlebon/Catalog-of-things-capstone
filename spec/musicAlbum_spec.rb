require './musicAlbum'


describe MusicAlbum do
    context "When MusicAlbum is initialised" do
       it "Should return an istance of the Class musicAlbum" do
        new_music_album = MusicAlbum.new("2020-10-10", on_spotify: true)
        expect(new_music_album).to be_an_instance_of MusicAlbum 
       end
    end

    context "When Music is initialise with on_spotity to false" do
       it "Should return an istance of the Class musicAlbum" do
        new_music_album = MusicAlbum.new("2020-10-10", on_spotify: true)
        expect(new_music_album).to be_an_instance_of MusicAlbum 
       end
    end
end