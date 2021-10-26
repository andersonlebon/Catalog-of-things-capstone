require_relative 'handler'

module FileHandler
    def save_in_file(name, array)
        if (array.length > 0)
            serial = []
            for i in array
                serial.push(i.to_json)
            end
            File.write((name+'.json'), serial.join("\n"), mode: 'w')
        end
    end

    def load_file(name)
        if(File.exist?("#{}.json"))
    end
end