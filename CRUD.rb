class Tasks

	def initialize()
		$directory_name = "lists"
		Dir.mkdir($directory_name) unless File.exists?($directory_name)
		Dir.chdir("\lists")
	end


	def time()
		puts "Enter time you want us to remind you :"
		$lname=gets.chomp.to_f
		$name=$lname
		@fileone=File.new($lname,"a+")

		puts "wi will remind you at : #{$name}"
		puts "\n\n"

		puts "Enter 1 if you want to add more or change to newly created time directory, enter anything if you want to go back to main menu"
		$choice = gets.chomp.to_i
		case $choice 
		when 1
			createtask()
		else
			home
		end
		@fileone.close
	end





	def notes()
		puts "Enter Your Notes :"
		$lname=gets.chomp
		$name=$lname
		@fileone=File.new($lname,"a+")

		puts "you created this notes : #{$name}"
		puts "\n\n"

		puts "Enter 1 if you want to add more to newly created notes, enter anything if you want to go back to main menu"
		$choice = gets.chomp.to_i
		case $choice 
		when 1
			createtask()
		else
			home
		end
		@fileone.close
	end




	def subtask()
		puts "Enter Your subtask :"
		$lname=gets.chomp
		$name=$lname
		@fileone=File.new($lname,"a+")

		puts "subtask #{$name} is created successfully"
		puts "\n\n"

		puts "Enter 1 if you want to add more to newly created subtask. enter anything if you want to go back to main menu"
		$choice = gets.chomp.to_i
		case $choice 
		when 1
			createtask()
		else
			home
		end
		@fileone.close
	end




	def list()
		puts "What kind of list you wnat to create : (shopping list, todo list, etc)"
		$lname=gets.chomp
		$name=$lname
		@fileone=File.new($lname,"a+")

		puts "list #{$name} is created successfully"
		puts "\n\n"

		puts "Enter 1 if you want to go back to submenu before, enter 2 if you want to go back to main menu"
		$choice = gets.chomp.to_i
		case $choice 
		when 1
			createtask()
		when 2
			home
		end
		@fileone.close
	end





	def today()
		puts "Enter Your Task :"
		$lname=gets.chomp
		$name=$lname
		@fileone=File.new($lname,"a+")

		puts "Task #{$name} is created successfully"
		puts "\n\n"

		puts "Enter 1 if you want to add task to newly created list enter anything if you want to go back to main menu"
		$choice = gets.chomp.to_i
		case $choice 
		when 1
			createtask()
		else
			home
		end
		@fileone.close
	end





	def tomorrow()
		puts "Enter Your Task :"
		$lname=gets.chomp
		$name=$lname
		@fileone=File.new($lname,"a+")

		puts "Task #{$name} is created successfully"
		puts "\n\n"
		puts "Enter 1 if you want to add task to newly created list enter anything if you want to go back to main menu"
		$choice = gets.chomp.to_i
		case $choice 
		when 1
			createtask()
		else
			home
		end
		@fileone.close
	end





	def upcoming()
		puts "Enter Your Task :"
		$lname=gets.chomp
		$name=$lname
		@fileone=File.new($lname,"a+")

		puts "Plan #{$name} is created successfully"
		puts "\n\n"

		puts "Enter 1 if you want to add task to newly created list enter anything if you want to go back to main menu"
		$choice = gets.chomp.to_i
		case $choice 
		when 1
			createtask()
		else
			home
		end
		@fileone.close
	end





	def someday()
		puts "Enter What To Do :"
		$lname=gets.chomp
		$name=$lname
		@fileone=File.new($lname,"a+")

		puts "Wish #{$name} is created successfully"
		puts "\n\n"

		puts "Enter 1 if you want to add task to newly created list enter anything if you want to go back to main menu"
		$choice = gets.chomp.to_i
		case $choice 
		when 1
			createtask()
		else
			someday
		end
		@fileone.close
	end




	def createtask()
		puts "Enter task"
		$task = gets.chomp
		File.open($task,"a+") do |line|
			line.puts "\r\r" + $task
			@fileone=File.new($task,"a+")
		end

		puts "#{$task} Added successfully to list #{$name}"
		puts "\n\n"
		puts "Enter 2 if you want to add time"
		puts "Enter 3 if you want to add notes"
		puts "Enter 4 if you want to add subtask"
		puts "Enter 5 if you want to add tag"
		puts 'Enter 6 if you want to add list'
		$choice = gets.chomp.to_i
		case $choice 
		when 2
			time
		when 3
			notes
		when 4
			subtask
		when 5
			tag
		when 6
			list
		else
			home
		end
		@fileone.close
	end




	def home
		puts "Tasks : "
		puts "1 : today "
		puts "2 : tomorrow "
		puts "3 : upcoming "
		puts "4 : someday "
		puts "\n\n"
		puts "10 : for checking existing list and to add task in it"
		puts "11 : delete file"
		puts "0 : to exit the software"
		$choice = gets.chomp.to_i
		case $choice
		when 1
			today
		when 2
			tomorrow
		when 3
			upcoming
		when 4
			someday
		when 11
			puts "what file you want to delete or edit?"
		when 10
			puts "Currently Created Folder are:"
			puts "\n\n"
			puts Dir.glob("*",$lname)
			puts "\n\n"
			puts "Choose the Folder you want to open!"
			$lname = gets.chomp
			if File.exist?($lname)
				puts "Enter 1 to Display Existing Tasks within #{$lname}"
				puts "Enter 2 to add new tasks in #{$lname}"
				$choice = gets.chomp.to_i
				case $choice
				when 1 
					puts "Tasks within #{$lname} are"
					File.open($lname,"a+").each do |line|
						puts line 
							#add else feature; go back to home
			puts "\n\n"
					end
					home
				when 2
					createtask() #expecting keyword end??? whatt .. 
				end
			end
		end
	end
end

one = Tasks.new
one.home