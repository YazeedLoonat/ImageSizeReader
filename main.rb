require 'fastimage'
load './json.rb'
#gem install fastimage

def main
	toRtn = "MEDIAID, URL, Width, Height\n"
	$json.each do |elem|
		begin			
			sizeArray = FastImage.size("#{elem["URL"]}")
			toRtn = toRtn + "#{elem["MEDIAID"]}, #{elem["URL"]}, #{sizeArray[0]}, #{sizeArray[1]}\n"
		rescue
			puts "#{elem["URL"]} failed to load"
		end
	end
	File.write('output.csv', toRtn)
end
main