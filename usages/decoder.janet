(import ../src/bencodobi/decoder :as decd)
(import ../src/iostream :as ios)

(comment

  (let [inbuf @"i0e"
        istream (ios/reader inbuf)
        _ (decd/read-byte istream)]
    (decd/decode-int istream))
  # =>
  0

  (let [inbuf @"i1e"
        istream (ios/reader inbuf)
        _ (decd/read-byte istream)]
    (decd/decode-int istream))
  # =>
  1

  (let [inbuf @"i-39e"
        istream (ios/reader inbuf)
        _ (decd/read-byte istream)]
    (decd/decode-int istream))
  # =>
  -39

  (let [inbuf @"i1111e"
        istream (ios/reader inbuf)
        _ (decd/read-byte istream)]
    (decd/decode-int istream))
  # =>
  1111

  )

(comment

  (let [inbuf @"0:"
        istream (ios/reader inbuf)
        byte (decd/read-byte istream)
        digit (decd/to-digit byte)
        len (decd/decode-nums istream ":" digit)]
    (decd/decode-str istream len))
  # =>
  ""

  (let [inbuf @"6:smile!"
        istream (ios/reader inbuf)
        byte (decd/read-byte istream)
        digit (decd/to-digit byte)
        len (decd/decode-nums istream ":" digit)]
    (decd/decode-str istream len))
  # =>
  "smile!"

  (let [inbuf @"19:a line\nanother line"
        istream (ios/reader inbuf)
        byte (decd/read-byte istream)
        digit (decd/to-digit byte)
        len (decd/decode-nums istream ":" digit)]
    (decd/decode-str istream len))
  # =>
  "a line\nanother line"

  (let [inbuf @"19:a line\nanother line"
        istream (ios/reader inbuf)
        byte (decd/read-byte istream)
        digit (decd/to-digit byte)
        len (decd/decode-nums istream ":" digit)]
    (decd/decode-str istream len))
  # =>
  "a line\nanother line"

  (let [inbuf @"6:無為"
        istream (ios/reader inbuf)
        byte (decd/read-byte istream)
        digit (decd/to-digit byte)
        len (decd/decode-nums istream ":" digit)]
    (decd/decode-str istream len))
  # =>
  "無為"

  )

(comment

  (let [inbuf @"le"
        istream (ios/reader inbuf)
        _ (decd/read-byte istream)]
    (decd/decode-list istream))
  # =>
  []

  (let [inbuf @"l3:ant3:beei3ee"
        istream (ios/reader inbuf)
        _ (decd/read-byte istream)]
    (decd/decode-list istream))
  # =>
  ["ant" "bee" 3]

  )

(comment

  (let [inbuf @"de"
        istream (ios/reader inbuf)
        _ (decd/read-byte istream)]
    (decd/decode-dict istream))
  # =>
  {}

  (let [inbuf @"d3:anti1e3:beei2ee"
        istream (ios/reader inbuf)
        _ (decd/read-byte istream)]
    (decd/decode-dict istream))
  # =>
  {"ant" 1 "bee" 2}

  )

(comment

  (decd/decode @"i1e")
  # =>
  1

  (decd/decode @"6:string")
  # =>
  "string"

  (decd/decode @"l1:a5:tuplee")
  # =>
  ["a" "tuple"]

  (decd/decode @"d3:key5:valuee")
  # =>
  {"key" "value"}

  )
