require_relative '../rb/genre'

describe Genre do
    context "When the Genre class is initialised" do
        new_genre = Genre.new(0,"Comedy")
        it "Should return an instance of Genre" do
            expect(new_genre).to be_an_instance_of Genre
        end
        it "Should retun an empty array" do
            expect(new_genre.items).to be == []
        end

        it "Should return item1" do
            new_genre.add_item "item1"
            expect(new_genre.items[0]).to eql "item1"
        end
    end
end