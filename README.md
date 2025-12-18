TOP - Project: Caesar Cipher

Requirements: The cipher will read in a message, shift each character to
the right by a specified amount, and then return an encrypted message.

This implementation will make use of the printable ascii codes 32-126 which
includes spaces, special characters, punctuation, digits, as well as
upper and lower case letters.

The program is designed to be run on the command line with the message
included as a paramenter.

examples:
- cipher "encrypt", 1, "A simple message" # -> "B!tjnqmf!nfttbhf"
- cipher "decrypt", 1, "B!tjnqmf!nfttbhf" # -> "A simple message"

The shift quantity wraps from 126 - 32 during encryption and back during
decryption.  There are 94 characters in the range of ascii characters used
however shifts > 94 are supported using modulo arithmatic.
