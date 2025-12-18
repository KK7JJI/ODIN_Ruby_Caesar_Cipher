# TOP Ruby Project, Caesar Cipher
#

def print_help_message()
    File.open("help_message.txt") do |f|
      puts f.read
    end
end


if ARGV.length != 3
  print_help_message()
end


operation = ARGV[0]
shift_quantity = ARGV[1]
message = ARGV[2]




