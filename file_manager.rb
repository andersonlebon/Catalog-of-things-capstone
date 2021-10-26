# require './main'
require 'json'

def createFiles(file_names)
    file_names.each do |file_name| 
       if File.exist?("./json/#{file_name}.json") == false
        FileUtils.touch("./json/#{file_name}.json")
        File.write("./json/#{file_name}.json", JSON.dump([]))
       end
    end
end

def save_file(file_name, content)
    data = JSON.parse(File.read("./json/#{file_name}.json")) 
    File.write("./json/#{file_name}.json", JSON.dump(data.push content))
end

def read_file(file_name)
   return JSON.parse(File.read("./json/#{file_name}.json"))
end

