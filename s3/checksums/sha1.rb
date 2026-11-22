require 'digest'
crc32 = Digest::SHA1.file('myfile.txt')
puts(crc32)