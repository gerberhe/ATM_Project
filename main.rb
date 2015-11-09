require "gosu"
require_relative 'accounts'
require_relative 'interface_select'
require_relative 'window'

#Change the following line between "cmd" for a command
#line version of the ATM, or instead put in "gui" to
#get a windowed, GUI version of the ATM.
@desired_interface = "cmd"

@next_acc_num = File.open("next_new_acc.txt", "r")
@next_num = @next_acc_num.read
@next_num = @next_num.to_i
@log_in_num = 0

def run

	if @desired_interface == "cmd"
		print """
		Hello! Welcome to the Command Line Interface 
		for this ATM!
		
		Please enter a number from the selections below
		and hit Enter to proceed.

		1 - Make a new account
		2 - Login to a current account
		3 - Exit the ATM

		"""

		@initial_selection = $stdin.gets.chomp

		if @initial_selection == "1"
			print """
			To make a new account, please first enter
			your name.

			"""
			@name = $stdin.gets.chomp
			print """
			Great, now please enter your desired initial
			deposit for this account, in USD. (Enter this
			as a numerical value without any symbols such
			as '$'.)

			"""
			@initial_deposit = $stdin.gets.chomp
			print """
			And finally, please enter your desired PIN
			(Personal Identification Number) for this
			account. (4 Numbers)

			"""
			@pin = $stdin.gets.chomp
			print """
			We are now setting up and saving your account
			to our database...
			"""
			Account.new(@name, @initial_deposit, @pin, @next_num)

			@next_acc_num = File.open("next_new_acc.txt", "w")
			@next_num = @next_num + 1
			@next_acc_num.write("#{@next_num}")

			print """
			Great! Your account is all set up!

			You are now logged in, #{@name}. What would you like
			to do? Please type in a number from the list below
			and then hit Enter.

			1 - Withdraw
			2 - Deposit
			3 - Check Balance
			4 - Exit
			"""

		elsif @initial_selection == "2"
		def login
				print """
			To log into your account, please first enter
			your Account Number.

			"""
				@log_in_num = $stdin.gets.chomp
				if File.exist?("#{@log_in_num}.txt")
					@account = File.open("#{@log_in_num}.txt", "r")
				else
					print """
			Sorry, that Account Number does not exist. If you
			would like to use that Account Number, please 
			create a new account.
			"""
					run
				end
				print """
			Great, now please enter your PIN number to
			complete the login process.

			"""
				@entered_pin = $stdin.gets.chomp
				@person = @account.read.split("\n")

				if @entered_pin == @person[2]
					print """
			Successfully logged you in, #{@person[0]}.
			Account Info:
			--------------------
			Account Number: #{@log_in_num}
			PIN Number: #{@person[2]}

			Balance: $#{@person[1]}
			"""
				else
					print """
			Sorry, that PIN does not match the account number
			you have specified. Would you like to try to enter
			your PIN again?

			Please type the number of your selection and then
			hit Enter.

			1 - Yes
			2 - No

			"""

					@try_again_response = $stdin.gets.chomp

					if @try_again_response == "1"
						login
					elsif @try_again_response == "2"
						run
					end
				end
			end
			login

		elsif @initial_selection == "3"
			print """
		We hope to see you in the future! Have
		a nice day!
		"""
			abort()
		else
			print """
		---------------------------------------------
		Sorry, that's not an available option. Please
		try again.
		---------------------------------------------
			"""
			run
		end

	elsif @desired_interface == "gui"
		window = Window.new
		window.show
	end

end

run
