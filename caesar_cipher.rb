# frozen_string_literal: true

# TOP Ruby Project, Caesar Cipher
#

# method/class definitions
def print_user_help_message
  File.open('help_message.txt') do |f|
    puts f.read
  end
end

def user_entered_invalid_options?(operation, shift_quantity, message)
  invalid_user_options = false
  unless ['--encode', '--decode'].include?(operation)
    puts "invalid option, #{operation}"
    puts '  valid options are --encode, or --decode'
    invalid_user_options = true
  end

  unless shift_quantity.to_i.positive?
    puts "invalid shift quantity: #{shift_quantity}"
    puts 'expected an integer value > 0.'
    invalid_user_options = true
  end

  unless message.is_a?(String) && message.length.positive?
    puts 'invalid message,'
    puts '  expected a string of characters including upper case, lower case,'
    puts '  digits, special characters, and punctuation marks.'
    puts ''
    puts '  Message received was:'
    puts message
    invalid_user_options = true
  end

  invalid_user_options
end

##
class CaesarsMessage
  attr_accessor :decoded_message, :coded_message, :shift_quantity, :msg_array,
                :shifted_msg_array

  def initialize(shift_quantity)
    self.shift_quantity = shift_quantity
    self.msg_array = []
    self.shifted_msg_array = []
  end

  def encode_message(msg)
    self.decoded_message = msg
    self.msg_array = convert_msg_to_ascii_array(decoded_message)
    self.shifted_msg_array = shift_msg_ascii_codes(decoded_message,
                                                   shift_quantity)
    self.coded_message = array_of_codes_to_msg(shifted_msg_array)
  end

  def decode_message(msg)
    self.coded_message = msg
    self.msg_array = convert_msg_to_ascii_array(coded_message)
    self.shifted_msg_array = shift_msg_ascii_codes(coded_message,
                                                   -1 * shift_quantity)
    self.decoded_message = array_of_codes_to_msg(shifted_msg_array)
  end

  def convert_msg_to_ascii_array(msg)
    msg.chars.map(&:ord)
  end

  def shift_msg_ascii_codes(_msg, shift_qty)
    msg_array.map do |code|
      code = if shift_qty.negative?
               code - (shift_qty.abs % 94)
             else
               code + (shift_qty % 94)
             end

      if code > 126
        code -= 95
      elsif code < 32
        code += 95
      end
      code.chr
    end
  end

  def array_of_codes_to_msg(msg_array)
    msg_array.join
  end

  def print_message_to_console
    puts ''
    puts "Caesar Shift Applied =  #{shift_quantity}"
    puts '-----------------'
    puts "Original Message:       #{decoded_message}"
    puts "   Coded Message:       #{coded_message}"
    puts ''
  end
end

## begin code

if ARGV.length != 3
  print_user_help_message
elsif ['--help', '-h'].include?(ARGV[0])
  print_user_help_message
end

operation = ARGV[0]
shift_quantity = ARGV[1].to_i
message = ARGV[2]

unless user_entered_invalid_options?(operation, shift_quantity.to_i, message)
  my_message = CaesarsMessage.new(shift_quantity.to_i)

  case operation
  when '--encode'
    my_message.encode_message(message)
    my_message.print_message_to_console

  when '--decode'
    my_message.decode_message(message)
    my_message.print_message_to_console

  end
end
