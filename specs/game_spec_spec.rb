# frozen_string_literal: true

require_relative '../rb/game'

describe Game do
  context 'When Game is initialised' do
    proto =
      {
        'name' => 'MeatBoy',
        'id' => 0,
        'publish_date' => '2010-10-10',
        'author' => 'Toby Fox',
        'label' => 'TBA',
        'genre' => 'RPG'
      }
    prototwo =
      {
        'name' => 'Pokemon red',
        'id' => 0,
        'publish_date' => '1996-10-10',
        'author' => 'Nintendo',
        'label' => 'TBA',
        'genre' => 'RPG'
      }
    recent_game = Game.new(proto, false, '2021-8-28')
    old_game = Game.new(prototwo, false, '2000-8-28')
    it 'Should return an instance of the Class Game' do
      expect(recent_game).to be_an_instance_of Game
    end
    it "should return true if parent's method returns true AND if last_played_at is older than 2 years" do
      expect(old_game.can_be_archived?).to be true
    end
    it 'Otherwise, should return false' do
      expect(recent_game.can_be_archived?).to be false
    end
  end
end
