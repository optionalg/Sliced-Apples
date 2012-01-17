#!/usr/bin/ruby
# Create a csv file of hardware addresses parsed from a command line argument
#
# Example:
# $ ruby macmacs.rb /path/to/file
#

require 'csv'

#Hardware Address RegEx
regex = Regexp.new('\w{1,2}:\w{1,2}:\w{1,2}:\w{1,2}:\w{1,2}:\w{1,2}')
hash = Hash.new
file = File.open(ARGV[0], "r")
file.each_line do |line|
	next if line == "\n"
	a = line.slice(regex)
	hash[a]= a
end

#Uncomment to also output to shell
#hash.each {|key, addr| print addr, "\n"}

CSV.open('Mac_Addresses.csv', "w") do |write|
	hash.each do |key, addr|
		write << [addr]
	end
end
