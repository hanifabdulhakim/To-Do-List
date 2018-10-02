alias p puts
alias g gets
p "\n"
p 'todo list command line'
p "\n"

def main_loop 
	while true do
		p <<-menu
			pilih menu :

			1. buat tugas
			2. lihat tugas
			3. keluar
			menu

		p "\n"

		i = g.to_i
		case i
		when 1
			buat_tugas
		when 2
			p 'file yg sudah ada :'
			p "\n"
			perlihatkan_semua_tugas
			p "\n"
			p 'pilih nama file nya apa? (wajib menggunakan .txt extension)'
			file = g.chomp
			p "\n"
			p 'tugas d dalam file ini adalah : '
			lihat_tugas(file)
			p "\n"
		when 3
			break
		end
	end
end


def buat_tugas
	p 'masukan tugas yg ingin d lakukan?'
	t = g.chomp
	p "\n"
	p 'apakah ingin d masukkan ke dalam file? (yes/no)'
	o = g.chomp
	p "\n"
	case o
	when /yes/
		p 'apa nama file nya? (wajib menggunakan .txt extension)'
		f = g.chomp
		fixed_filename = check_extension(f)
		buat_file(fixed_filename,t)
		p "\n"
	when /no/
		p 'tugas anda adalah #{t}'
	end
end


def buat_file(nama_file, tugas)
	File.open(nama_file, "w") { |file| file.puts tugas }
end


def lihat_tugas(a)
	File.open(a, "r") { |file| file.each_line {|line|puts line}  }
end


def perlihatkan_semua_tugas
	Dir.glob("*.txt").each { |file| puts file  }
end


def simpan_ke_dalam_file(filename, tugas)
	if File.exist? filename
		p 'file sudah ada, apakah ingin d tambah? (yes/no)'
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