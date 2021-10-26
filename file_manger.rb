require './main'

def createFile (file_name)
    FileUtils.touch(file_name)
end

def save_file(file_name, content)
    File.write(file_name, JSON.dump(content))
end

def read_file(file_name)
    JSON.parse(File.read(file_name))
end