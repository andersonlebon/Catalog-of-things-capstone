require './main'

def createFile (file_name)
    FileUtils.touch(file_name)
end

def read_file(file_name)
    File.write(file_name, JSON.dump(content))
end