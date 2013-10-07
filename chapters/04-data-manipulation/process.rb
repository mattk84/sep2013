#!/usr/bin/env ruby

require 'json'

class DataParser
    attr_accessor :data
    
    def initialize(data_dir)
        @data_dir = data_dir
        @data = {}
    end

    # Load the stats from the subdirectories of @data_dir
    def parse
        load_from_disk
#        process_data
    end

    private
    
    def load_from_disk
        Dir.foreach(@data_dir) do |subdir| # "working"
            next if subdir == '.' || subdir == '..'
            
            load_subdir(subdir)
        end
    end
    
    def load_subdir(subdir)
        @data[subdir] ||= {} # @data = { subdir => {}, ... }   
        h = @data[subdir]
           
        path = File.join(@data_dir, subdir)
        Dir.foreach(path) do |filename|
            next if filename == '.' || filename == '..'
            
            fullpath = File.join(path, filename)
            json_str = File.read(fullpath)
            obj = JSON.parse(json_str)
            
            h[filename] = obj
        end
    end
        
    def process_data      
    end
end

if (__FILE__ == $0)
    process_rb_dir = File.dirname(__FILE__) # 04-data-manipulation
    data_dir = File.join(process_rb_dir, 'data') # 04-data-manipulation/data
    dp = DataParser.new(data_dir)
    
    dp.parse
#    p dp.data # format up to you
    
    d = dp.data # d[subdir][filename][key]
    
    by_key = {}
    
    keys = %w{fps v_codec bitrate a_codec}
    keys.each do |k|
        by_key[k] ||= {}
 #       puts "for key #{k}:"
        
        d.each do |subdir, subdir_data|
            by_key[k][subdir] ||= []
#            puts "working on #{subdir}"
            subdir_data.each do |filename, file_data|
                by_key[k][subdir] << file_data[k]
            end
            
            by_key[k][subdir].uniq!
        end
    end
    
    p by_key
end
