#!/usr/bin/ruby
require_relative 'lib/parser'


if ARGV.count == 1 && File.exist?(ARGV[0])
  Parser.new(ARGV[0])
else
  s = "Welcome to the Melbourne Ruby robot. Please use an instruction file
  \nand the only command options.\
  \neg $rob.rb commands.txt"
  puts s
end