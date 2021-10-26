require './main'

def createFile
    FileUtils.touch("./json/genres.json")
    FileUtils.touch("./json/labels.json")
    FileUtils.touch("./json/authors.json")
    FileUtils.touch("./json/soures.json")
    FileUtils.touch("./json/books.json")
    FileUtils.touch("./json/musicAlbum.json")
    FileUtils.touch("./json/movies.json")
    FileUtils.touch("./json/games.json")
end

def save_file(file_name, content)
    File.write("./json/#{file_name}.json", JSON.dump(content))
end

def read_file(file_name)
    JSON.parse(File.read("./json/#{file_name}.json"))
end
