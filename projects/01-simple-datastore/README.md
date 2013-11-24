# Project 1
## Create a simple key-value data store.

All keys and values are strings.  
Store data in one file on disk per key.  
The name of the file should be the key.  
The contents of the file should be the value.

### It should support the following operations:


    write (key, value)
    read (key)
    delete (key)
    dump () # read all keys
    flush () # delete all keys

### Implementation

Design for re-use and testability: build a KeyValueStore (or similar) class.  
Test this class independent of any command-line wrapper.  
Then, build your command-line wrapper to map particular sets of
command-line options to particular method invocations on the class.

###The following series of interactions should be possible:

1. empty dump
    - app dump => "{}" or similar

1. no problem if key doesn't exist
    - app read key1 => "" or similar

1. key creation and reading
    - app write key1 value1
    - app read key1 => "value1"

1. key creation and dump all keys
    - app write key2 value2
    - app dump => "{key1=>value1, key2=>value2}" or similar

1. update an existing key
    - app write key2 value3
    - app read key2 => "value3"

1. delete just one key
    - app delete key1
    - app read key1 => "" or similar

1. verify key1 no longer present in dump
    - app dump => "{key2=>value3}" or similar

1. delete all keys
    - app flush

1. verify empty dump
    - app dump => "{}" or similar

###What are the advantages and disadvantages of our approach:

discuss Atomicity, Consistency, Multiple Users, etc.
