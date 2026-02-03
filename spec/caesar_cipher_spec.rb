require_relative '../caesar_cipher'

describe CaesarsMessage do
  let(:shift) { 1 }
  subject(:caesar_msg) { described_class.new(shift) }

  describe '#initialize' do
    # only creating instance variables.
  end

  describe 'encode_message shift 1' do
    # public, I accept a message and encode it.
    context 'encode message' do
      let(:shift) { 1 }

      it 'encode message, A => B' do
        result = caesar_msg.encode_message('A')
        expect(result).to eq('B')
      end

      it 'encode message, wrap around' do
        result = caesar_msg.encode_message(126.chr)
        expect(result).to eq(32.chr)
      end
    end
  end

  describe 'encode_message, shift 95 (modular shift of 1)' do
    # public, I accept a message and encode it.
    context 'encode message' do
      let(:shift) { 95 }

      it 'encode message, A => B' do
        result = caesar_msg.encode_message('A')
        expect(result).to eq('B')
      end

      it 'encode message, wrap around' do
        result = caesar_msg.encode_message(126.chr)
        expect(result).to eq(32.chr)
      end
    end
  end

  describe 'decode_message' do
    # public, I accept a coded message and decode it.
    context 'decode message shift 1' do
      let(:shift) { 1 }

      it 'decode message, B => A' do
        result = caesar_msg.decode_message('B')
        expect(result).to eq('A')
      end
      it 'decode message, wrap' do
        result = caesar_msg.decode_message(32.chr)
        expect(result).to eq(126.chr)
      end
    end

    context 'decode message shift 95 (module shift 1)' do
      let(:shift) { 95 }

      it 'decode message, B => A' do
        result = caesar_msg.decode_message('B')
        expect(result).to eq('A')
      end
      it 'decode message, wrap' do
        result = caesar_msg.decode_message(32.chr)
        expect(result).to eq(126.chr)
      end
    end
  end

  describe 'convert_msg_to_ascii_array' do
    # I exist for internal use only.
  end

  describe 'shift_msg_ascii_codes' do
    # I exists for internal use only. I handle shifts and wrap arrounds.
  end

  describe 'array_of_codes_to_msg' do
    # I exist for internal use only.
  end

  describe 'print_message_to_console' do
    # I print messages to the console.
    before do
      allow(caesar_msg).to receive(:shift_quantity).and_return('1')
      allow(caesar_msg).to receive(:decoded_message).and_return('Test')
      allow(caesar_msg).to receive(:coded_message).and_return('Uftu')
    end
    it 'message display' do
      expected_output = <<~MSG

        Caesar Shift Applied =  1
        -----------------
        Original Message:       Test
           Coded Message:       Uftu

      MSG
      expect { caesar_msg.print_message_to_console }
        .to output(expected_output)
        .to_stdout
    end
  end
end
