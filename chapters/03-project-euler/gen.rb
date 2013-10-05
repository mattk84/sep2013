#!/usr/bin/env ruby

raise "I need an argument -- problem number" if ARGV.size == 0

problem_number = ARGV[0] # 3
formatted = '%03d' % problem_number # '003'
filename = "#{formatted}.rb" # '003.rb'

raise "#{filename} exists!" if File.exist?(filename)

File.open(filename, 'w+') do |f|
    f.write <<"EOS"
#!/usr/bin/env ruby

class Problem#{formatted}
    def self.run
    end
end

p Problem#{formatted}.run
EOS

end
