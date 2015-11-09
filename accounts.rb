require "gosu"

class Account

	attr_accessor :name, :initial_deposit, :desired_pin, :acc_num

	def initialize(name, initial_deposit, desired_pin, acc_num)
		@name = name
		@id = initial_deposit
		@pin = desired_pin
		@acc_num = acc_num
		@file = File.new("#{@acc_num}.txt", "w")
		write_to_file
	end

	def write_to_file
		@target = File.open("#{@acc_num}.txt", "w")
		@target.write(@name)
		@target.write("\n")
		@target.write(@id)
		@target.write("\n")
		@target.write(@pin)
	end
end