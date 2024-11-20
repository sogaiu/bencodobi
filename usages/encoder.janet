(import ../src/bencodobi/encoder :as enc)
(import ../src/iostream :as ios)

(comment

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-num ostream "0")
    outbuf)
  # =>
  @"i0e"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-num ostream "-28")
    outbuf)
  # =>
  @"i-28e"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-num ostream "1111")
    outbuf)
  # =>
  @"i1111e"

  )

(comment

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-str ostream "")
    outbuf)
  # =>
  @"0:"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-str ostream "smile!")
    outbuf)
  # =>
  @"6:smile!"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-str ostream "a line\nanother line")
    outbuf)
  # =>
  @"19:a line\nanother line"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-str ostream "無為")
    outbuf)
  # =>
  @"6:\xE7\x84\xA1\xE7\x82\xBA"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-str ostream :keyword)
    outbuf)
  # =>
  @"7:keyword"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-str ostream 'symbol)
    outbuf)
  # =>
  @"6:symbol"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-str ostream @"buffer")
    outbuf)
  # =>
  @"6:buffer"

  )

(comment

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-list ostream [])
    outbuf)
  # =>
  @"le"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-list ostream ["ant" "bee" 3])
    outbuf)
  # =>
  @"l3:ant3:beei3ee"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-list ostream @[:x 'y @"z"])
    outbuf)
  # =>
  @"l1:x1:y1:ze"

  )

(comment

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-dict ostream {})
    outbuf)
  # =>
  @"de"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-dict ostream {"ant" 1 "bee" 2})
    outbuf)
  # =>
  @"d3:anti1e3:beei2ee"

  (let [outbuf @""
        ostream (ios/writer outbuf)]
    (enc/encode-dict ostream @{:key 'value "string" @"buffer"})
    outbuf)
  # =>
  @"d6:string6:buffer3:key5:valuee"

  )

(comment

  (let [outbuf @""]
    (enc/encode outbuf 1)
    outbuf)
  # =>
  @"i1e"

  (let [outbuf @""]
    (enc/encode outbuf "string")
    outbuf)
  # =>
  @"6:string"

  (let [outbuf @""]
    (enc/encode outbuf ["a" "tuple"])
    outbuf)
  # =>
  @"l1:a5:tuplee"

  (let [outbuf @""]
    (enc/encode outbuf {"key" "value"})
    outbuf)
  # =>
  @"d3:key5:valuee"

  )
