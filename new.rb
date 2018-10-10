print "\n"
puts ">>"+"== "+(" selamat datang di program input nilai ujian" )+" <<"+"=="
print "\n"

user = {}

def nilai_sama?(user)
	user.values.all? { |x| x == user.values[0]  }
end

def nilai_tertinggi(user)
	return if user.nil?
	temp = 0
	user.each { |nama, nilai| temp = nilai if nilai > temp }
	return temp
end


def nilai_terendah(user)
	return "tidak ada yg terendah" if nilai_sama? user
	temp = 100
	user.each { |nama,nilai| temp = nilai if nilai < temp }
	return temp
end


def nilai_tidak_lulus(user)
	puts "\n"
	puts "===> nilai tidak lulus <==="
	user.each do |nama, nilai|
		puts "Nilai ujian #{nama} tidak mencukupi. Capaian #{(nilai*10).to_f}%." if nilai < 5
	end
end


def nilai_lulus(user)
	puts "\n"
	puts "===> Nilai Lulus <==="
	user.each do |nama, nilai|
		puts "Nilai ujian #{nama} telah mencukupi. Capaian #{(nilai*10).to_f}%" if nilai >= 5
	end
end


def daftar_nilai(user)
	user.each { |nama, nilai| puts " #{nama.capitalize} " + " => " + " #{nilai} " }
end

loop do
	print "masukkan nama peserta! : "
	nama = gets.chomp
	user[nama]
	print "\n"

	print "masukkan nilai ujian #{nama} : "
	nilai = gets.to_f
	user[nama] = nilai
	print "\n"

	print "lanjutkan? [y/n] : "
	a = gets.chomp 
	case a
	when "y"
		print "\n"
		next
	when "n"
		print "\n"
		puts "terimakasih sudah memasukkan nilai nilai peserta ujian"
		puts "-"*38 + "*" + "-"*38
		puts "\n"
		daftar_nilai(user) #perlihatkan semua data yg telah di masukkan
		nilai_lulus(user)
		nilai_tidak_lulus(user)
		print "\n"
		puts "Nilai TERTINGGI adalah #{user.key(nilai_tertinggi(user)).capitalize} dengan nilai #{nilai_tertinggi(user)} "
			
		if nilai_terendah(user).is_a? Float or nilai_terendah(user).is_a? Integer
			puts "NIlai TERENDAH adalah #{user.key(nilai_terendah(user)).capitalize} dengan nilai #{nilai_terendah(user)}"
		else
			puts "Nilai TERENDAH adalah #{nilai_terendah(user)}"
		end
		puts "\n"	
		puts "program di buat dengan bahasa ruby oleh Hanif Abdul Hakim"
		print "\n"
		break
	else
		puts "maaf input yg anda masukkan tidak sesuai option"
		break
	end
end