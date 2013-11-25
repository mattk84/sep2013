# app read key
# app dump
# app write key value
# app delete key
# app flush

class KeyStore
  def initialize(directory)
    @dir = directory
  end
        
  def file_for(key)
    File.join(@dir, key)
  end

  # # write a key (passed_key, passed_value)
  # open the file and overwrite its contents with the passed value
  # if no value passed, write ""
  def write(key, value="")
    File.open(file_for(key), 'w') do |f|
      f << value
    end
    
    value
  end

  # # read a key (passed_key)
  # open the file and print stored value
  def read(key)
    File.read(file_for(key)) rescue nil # TODO make this better
  end
  
  # # delete a key (passed_key)
  # delete the key file
  def delete(key)
    File.delete(file_for(key)) rescue nil
  end

  # # dump all keys
  # iterate across all key files
  # for each, print key
  # run read on that key
  def dump
    contents = {}
    Dir.foreach(@dir) do |filename|
      next if filename == '.' || filename == '..'
      
      contents[filename] = read(filename)
    end
    
    contents
  end

  # # delete all keys
  # iterate across all key files
  # for each, run delete on that key
  def flush
    Dir.foreach(@dir) do |filename|
      next if filename == '.' || filename == '..'
      
      delete(filename)
    end
  end
  
end # class

if (__FILE__ == $0)
  require 'fileutils'
  # take the cache directory as a command-line argument
  # assume it's empty!! (user's responsibility)
  if (ARGV.size == 0)
    cache_directory = "/tmp/kvs-test-cache"
    FileUtils.rm_rf cache_directory
    FileUtils.mkdir cache_directory
  else
    cache_directory = ARGV[0]
  end
  
  ks = KeyStore.new(cache_directory)
  
  def verify_dump(ks, expected)
    h = ks.dump
    raise "HASH DRIVEWAY DONE GOT MESSED UP" if h != expected
  end    

 
  k = 'key1'
 #   - app dump => "{}" or similar
  res = ks.dump
  raise "WTF NOT EMPTY" if (res.size > 0)
    
 #   - app read key1 => "" or similar
  res = ks.read(k)
  raise "WTF NOT NIL" unless res.nil?
  
 #   - app write key1 value1
 #   - app read key1 => "value1"
  v = 'value1'
  ks.write(k, v)
  raise "WTF WRONG VALUE" unless ks.read(k) == v
  
 #   - app write key2 value2
 #   - app dump => "{key1=>value1, key2=>value2}" or similar
  vtoo = 'value2'
  ktoo = 'key2'
  ks.write(ktoo, vtoo)
  verify_dump(ks, { k => v, ktoo => vtoo } )
  
 #   - app write key2 value3
 #   - app read key2 => "value3"
  vthree = 'value3'
  ks.write(ktoo, vthree)
  raise "WRONG VALUE AGAIN GOSH" unless ks.read(ktoo) == vthree
 
 #   - app delete key1
 #   - app read key1 => "" or similar
  ks.delete(k)  
  res = ks.read(k)
  raise "WTF NOT NIL" unless res.nil?
  
 #   - app dump => "{key2=>value3}" or similar
  verify_dump(ks, { ktoo => vthree })
  
 #   - app flush
 #   - app dump => "{}" or similar
  ks.flush
  verify_dump(ks, {})
  
  puts "cookies and rainbows 'n shit"
end