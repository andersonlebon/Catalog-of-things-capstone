# frozen_string_literal: true

require_relative '../rb/music_album'

describe MusicAlbum do
  context 'When MusicAlbum is initialised with on_spotity to true' do
    new_music_album = MusicAlbum.new('name', 'rock', 'author', 'label', '2010-10-10', true, 0)
    it 'Should return an instance of the Class musicAlbum' do
      expect(new_music_album).to be_an_instance_of MusicAlbum
    end
    it 'Should Return false' do
      expect(new_music_album.can_be_archived?).to be true
    end
  end

  context 'When Music is initialise with on_spotity to false' do
    new_music_album = MusicAlbum.new('name', 'rock', 'author', 'label', '2010-10-10', false, 0)
    it 'Should return an instance of the Class musicAlbum' do
      expect(new_music_album).to be_an_instance_of MusicAlbum
    end

    it 'Should Return true' do
      expect(new_music_album.can_be_archived?).to be false
    end
    
  end
end
