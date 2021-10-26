# require './main'
require 'json'

def createFiles
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
    data = JSON.parse(File.read("./json/#{file_name}.json"))
    File.write("./json/#{file_name}.json", JSON.dump(data.push content))
end

def read_file(file_name)
    JSON.parse(File.read("./json/#{file_name}.json"))
end

