require "./genre"

describe Genre do
    context "When the Genre class is initialised" do
        new_genre = Genre.new("Comedy")
        it "Should return an instance of Genre" do
            expect(new_genre).to be_an_instance_of Genre
        end
        it "Should retun an empty array" do
            expect(new_genre.items).to be == []
        end
    end
end