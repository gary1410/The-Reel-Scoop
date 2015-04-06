Analytics = Segment::Analytics.new({
    write_key: 'Om8REkS2fONFrKQ7UHT8WmAhoSjrBs5A',
    on_error: Proc.new { |status, msg| print msg }
})