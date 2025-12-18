# TOP - Project: Caesar Cipher

## Requirements:

- encryption: The cipher will read in a clear message, shift each character to
the right by the specified amount, and then return the encrypted message.

- decryption: The cipher will read in a coded message, shift each character to
the left by the specified amount, and then return the clear message.

This implementation makes use of the printable ascii codes 32-126 which
includes spaces, special characters, punctuation, digits, as well as
upper and lower case letters.

The program is designed to be run on the command line with the message
included as an argument.

**examples**:
```
ruby caesar_cipher --encode 1 'A simple message'
=> 'B!tjnqmf!nfttbhf'

ruby caesar_cipher --decode 1 'B!tjnqmf!nfttbhf'/
=> 'A simple message'
```

The shift quantity wraps from 126 - 32 during encryption and back during
decryption.  There are 94 characters in the range of ascii characters used
however shifts > 94 are supported using modulo arithmatic.

## Instructions

caesar_cipher.rb is a ruby script run from the commmand line using 3 input
parameters to either encode or decode a message by shifting individual
characters n-places right (encode) or left (decode).

**Usage is**:

Get Help:\
```ruby caesar_cipher --help | -h```

Code / Decode messages:\
```ruby caesar_cipher.rb OPTION QUANTITY MESSAGE```

OPTION is one of:
```
    --encode
    --decode
```
QUANTITY is any positive integer representing the magnitude of the
character shift used to encode or decode the message.

MESSAGE is a string representing the message to be coded or decoded.

**Examples**:
```
ruby caesar_cipher.rb --encode, 1, 'A simple message'
ruby caesar_cipher.rb --decode, 1, 'B!tjnqmf!nfttbhf'
```

Message coding is based on ascii values 32 - 126 covering space " " through "~"
including upper case characters, lower case characters, numbers, and special
characters.  Modulo arithmatic is used to handle shift quantities larger than
the available set of characters. A shift of +95 is the same as a shift of +1

NOTE: When working in the bash terminal remember to use single "'" quotation
marks to enclose the message so that bash treats the string as a literal string
irrespective of any special characters embedded in the string.
