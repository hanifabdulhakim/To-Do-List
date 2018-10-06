alias p puts
alias g gets
p "\n"
p 'please choose from the following option!'
p "\n"

def main_loop 
	while true do
		p <<-menu
			pilihan menu :

			1. buat tugas
			2. lihat tugas
			3. hapus tugas
			4. hapus file
			5. keluar
			menu

		p "\n"
		print 'what would you like to do? '

		i = g.to_i
		case i
		when 1
			p "\n"
			buat_tugas
		when 2
			p "\n"
			p 'file yg sudah ada :'
			p "\n"
			perlihatkan_semua_file
			p "\n"
			print 'pilih nama file nya apa? (wajib menggunakan .txt extension) : '
			file = g.chomp
			p "\n"
			p 'tugas d dalam file ini adalah : '
			p "\n"
			lihat_tugas(file)
			p "\n"
		when 3
			p "\n"
			perlihatkan_semua_file
			p "\n"
			print "di file apa tugas yang anda ingin hapus? : "
			i = g.chomp
			lihat_tugas(i)
			print 'baris ke berapa yg ingin anda hapus? : '
			number = g.to_i
			hapus_tugas(i, number)
		when 4
			p "\n"
			perlihatkan_semua_file
			p "\n"
			print 'file apa yg ingin anda hapus? '
			d = g.chomp
			hapus_file(check_extension(d))
			p "\n"
			p "FILE #{check_extension(d)} BERHASIL DI HAPUS!!!"
			p "\n"
			perlihatkan_semua_file
			p "\n"
		when 5
			break
		else
			p "\n"
			p 'sorry, you dont enter anything'
			p "\n"
		end
	end
end


def buat_tugas
	print 'masukan tugas yg ingin d lakukan! : '
	t = g.chomp
	if t.empty?
		p 'error!!!'
		buat_tugas
	else
	p "\n"
	p "tugas yg anda masukkan adalah : .. #{t}"
	print 'apakah ingin d masukkan ke dalam file? (yes/no) : '
	o = g.chomp
	p "\n"
	end
	case o
	when /yes/
		print 'apa nama file nya? (wajib menggunakan .txt extension) : '
		f = g.chomp
		fixed_filename = check_extension(f)
		p "\n"
		p "inside #{fixed_filename} is : "
		buat_file(fixed_filename,t)
		p "\n"
		lihat_tugas(fixed_filename)
		p "\n"
	when /no/
		p "tugas anda adalah #{t}"
		p "\n"
		main_loop
	else
		buat_tugas
	end
end

def hapus_tugas(filename, number)
	arr = []
	File.open(filename, 'r') do |f|
		f.each_line { |line| arr << line.strip }
	end
	arr.delete_at(number-1)
	perbarui(filename, arr)
end

def hapus_file(filename)
	File.delete(filename) if File.exist? filename
end

def perbarui(filename,task)
	File.open(filename, "w") do |f|
		task.each { |task| f.puts task }
	end
end

def mengurutkan_penomoran_tugas(task)
	task.each_with_index { |task, index| puts "#{index + 1}. #{task}" }
end

def buat_file(nama_file, tugas)
	File.open(nama_file, "a+") { |file| file.puts tugas }
end


def lihat_tugas(a)
	arr = []
	File.open(a, "r") do |file|
	 	file.each_line { |line| arr << line }
	end
	return mengurutkan_penomoran_tugas(arr)
end


def perlihatkan_semua_file
	Dir.glob("*.txt").each { |file| puts file  }
end


def simpan_ke_dalam_file(filename, tugas)
	if File.exist? filename
		print 'file sudah ada, apakah ingin d tambah? (yes/no) : '
		o = g.chomp
		case o
		when /yes/
			buat_file(filename, tugas)
		when /no/
			raise 'alright'
		end
	else
		buat_file(filename, tugas)
	end
end

def check_extension(filename)
	accepted_extension = '.txt'
 	if filename.include? accepted_extension
 		filename
 	else
 		"#{filename + accepted_extension}"
 	end
end

main_loop