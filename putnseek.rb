$contatos = Array.new

def show_results(itens, itens2, op)
	result = Array.new
	if op == 0
		if itens.count > 0 
			puts "Results:\n"
			itens.each do |x|
				print $contatos[x]
				print "\n"
			end
		else
			puts "The search brought no records."
		end
	elsif op == 1
		result = itens & itens2
		if result.count > 0 
			puts "Results:\n"
			result.each do |x|
				print $contatos[x]
				print "\n"
			end
		else
			puts "The search brought no records."
		end
	else
		result = itens | itens2
		if result.count > 0 
			puts "Results:\n"
			result.each do |x|
				print $contatos[x]
				print "\n"
			end
		else
			puts "The search brought no records."
		end
	end
end

def intrudution()
	msg = "\nHi! Welcome to the segmentation program! \nPlease, choose one option "+
			"to start using it.\n\n(1) Register;\n(2) Search; \n(3) Delete; \n(4) Exit.\n\n"
	puts msg
end

def again()
	puts "\n(1) Register;\n(2) Search; \n(3) Delete; \n(4) Exit.\n\n"
	return gets.chomp.to_i
end

def register()
	puts "Please, provide the new record information.\nName:"
	name = gets.chomp
	puts "\nEmail:"
	email = gets.chomp
	puts "\nAge:"
	age = gets.chomp
	puts "\nState:"
	state = gets.chomp
	puts "\nFunction:"
	function = gets.chomp

	$contatos[$contatos.count] = [name, email, age, state, function]
	puts "\n"+name+" inserted successfully!"
end

def search()
	puts "Choose one of the fields wanted for the search, or press enter to finish (default: show all records)"
	opt = ""
	op = 0
	msg = ""
	itens = Array.new
	itens2 = Array.new

	while opt != "\n" do
		msg = "\n(1) Name; \n(2) Email; \n(3) Age; \n(4) State; \n(5) Function."
		puts msg
		opt = gets.chomp

		case opt
		when "1"
			puts "Type the desired string for the search (case sensitive): "
			name = gets.chomp

			if op.to_i > 0
				$contatos.map{|row| row[0]}.each_with_index do |x, idx|
					if x.include? name
						itens2.push(idx)
					end
				end
				show_results(itens, itens2, op.to_i)
				opt = "\n"
			else
				$contatos.map{|row| row[0]}.each_with_index do |x, idx|
					if x.include? name
						itens.push(idx)
					end
				end
				puts "Do you want to put another criteria? (y/n)"
				criteria = gets.chomp
				if criteria == "y"
					puts "Choose the operator: \n\n(1) AND;\n(2) OR."
					op = gets.chomp
					while op != "1" and op != "2"
						puts "invalid choice, try again: "
						op = gets.chomp
					end
				else
					show_results(itens, itens2, op.to_i)
					opt = "\n"
				end
			end

		when "2"
			puts "Type the desired string for the search (case sensitive): "
			email = gets.chomp

			if op.to_i > 0
				$contatos.map{|row| row[1]}.each_with_index do |x, idx|
					if x.include? email
						itens2.push(idx)
					end
				end
				show_results(itens, itens2, op.to_i)
				opt = "\n"
			else
				$contatos.map{|row| row[1]}.each_with_index do |x, idx|
					if x.include? email
						itens.push(idx)
					end
				end
				puts "Do you want to put another criteria? (y/n)"
				criteria = gets.chomp
				if criteria == "y"
					puts "Choose the operator: \n\n(1) AND;\n(2) OR."
					op = gets.chomp
					while op != "1" and op != "2"
						puts "invalid choice, try again: "
						op = gets.chomp
					end
				else
					show_results(itens, itens2, op.to_i)
					opt = "\n"
				end
			end
		when "3"
			puts "Choose one option: \n(1) Less than;\n(2) More than;\n(3) Equal to."
			tooked = gets.chomp
			while tooked != "1" and tooked != "2" and tooked != "3"
				puts "invalid choice, try again: "
				tooked = gets.chomp
			end

			puts "Now insert the value (numbers only): "
			value = gets.chomp

			if op.to_i > 0
				$contatos.map{|row| row[2]}.each_with_index do |x, idx|
					case tooked
					when "1"
						if x.to_i < value.to_i
							itens2.push(idx)
						end
					when "2"
						if x.to_i > value.to_i
							itens2.push(idx)
						end
					when "3"
						if x.to_i == value.to_i
							itens2.push(idx)
						end
					end
				end
				show_results(itens, itens2, op.to_i)
				opt = "\n"
			else
				$contatos.map{|row| row[2]}.each_with_index do |x, idx|
					case tooked
					when "1"
						if x.to_i < value.to_i
							itens.push(idx)
						end
					when "2"
						if x.to_i > value.to_i
							itens.push(idx)
						end
					when "3"
						if x.to_i == value.to_i
							itens.push(idx)
						end
					end
				end
				puts "Do you want to put another criteria? (y/n)"
				criteria = gets.chomp
				if criteria == "y"
					puts "Choose the operator: \n\n(1) AND;\n(2) OR."
					op = gets.chomp
					while op != "1" and op != "2"
						puts "invalid choice, try again: "
						op = gets.chomp
					end
				else
					show_results(itens, itens2, op.to_i)
					opt = "\n"
				end
			end
		when "4"
			puts "Type the desired string for the search (case sensitive): "
			state = gets.chomp

			if op.to_i > 0
				$contatos.map{|row| row[3]}.each_with_index do |x, idx|
					if x.include? state
						itens2.push(idx)
					end
				end
				show_results(itens, itens2, op.to_i)
				opt = "\n"
			else
				$contatos.map{|row| row[3]}.each_with_index do |x, idx|
					if x.include? state
						itens.push(idx)
					end
				end
				puts "Do you want to put another criteria? (y/n)"
				criteria = gets.chomp
				if criteria == "y"
					puts "Choose the operator: \n\n(1) AND;\n(2) OR."
					op = gets.chomp
					while op != "1" and op != "2"
						puts "invalid choice, try again: "
						op = gets.chomp
					end
				else
					show_results(itens, itens2, op.to_i)
					opt = "\n"
				end
			end
		when "5"
			puts "Type the desired string for the search (case sensitive): "
			function = gets.chomp

			if op.to_i > 0
				$contatos.map{|row| row[4]}.each_with_index do |x, idx|
					if x.include? function
						itens2.push(idx)
					end
				end
				show_results(itens, itens2, op.to_i)
				opt = "\n"
			else
				$contatos.map{|row| row[4]}.each_with_index do |x, idx|
					if x.include? function
						itens.push(idx)
					end
				end
				puts "Do you want to put another criteria? (y/n)"
				criteria = gets.chomp
				if criteria == "y"
					puts "Choose the operator: \n\n(1) AND;\n(2) OR."
					op = gets.chomp
					while op != "1" and op != "2"
						puts "invalid choice, try again: "
						op = gets.chomp
					end
				else
					show_results(itens, itens2, op.to_i)
					opt = "\n"
				end
			end
		when ""
			if $contatos.count > 0
				$contatos.each do |x|
					print x, "\n"
				end
			else
				puts "No saved records"
			end
			opt = "\n"
		else
			puts "Invalid choice, please choose again: "
		end
	end
end

def delete()
	itens = Array.new
	puts "Type the name of the user to be deleted (case sensitive):"
	user = gets.chomp
	$contatos.map{|row| row[0]}.each_with_index do |x, idx|
		if x.include? user
			itens.push(idx)
		end
	end
	if itens.count == 0
		puts "There is no matching records."
	elsif itens.count == 1
		puts "Do you want to delete the record below? (y/n)\n"
		print $contatos[itens[0]]
		print "\n"
		yn = gets.chomp
		if yn == "y"
			$contatos.delete_at(itens[0])
			puts "Record deleted."
		else
			puts "Record not deleted."
		end
	else
		puts "There is more than one item with this name, do you want to delete it all? (y/n)"
		itens.each do |x|
			print $contatos[x]
			print "\n"
		end
		yn = gets.chomp
		if yn == "y"
			itens.reverse_each do |x|
				$contatos.delete_at(x)
			end
			puts "Records deleted"
		else
			puts "Nothing was deleted"
		end
	end
end			

intrudution()

choice = gets.chomp.to_i

while choice != 4 do
	case choice
	when 1
		register()
		choice = again()
	when 2
		search()
		choice = again()
	when 3
		delete() #todo
		choice = again()
	else
		puts "Invalid choice, please choose again: "
		choice = gets.chomp.to_i
	end
end

puts "\nThanks for using the segmentation program! We hope it has been useful."
