class NginxConfigParser::Parser < Parslet::Parser


  # primitive values
  rule(:space)          { match("\s") }
  rule(:space?)         { space.maybe }
  rule(:digit)          { match("[0-9]") }
  rule(:integer)        { (str("-").maybe >> digit.repeat).as(:integer) }
  rule(:string)         { any.repeat.as(:string) }
  rule(:value)          { integer | string }

  # value pairs
  rule(:ender)          { str(";") }
  rule(:values)         { (space.repeat(1) >> value >> space.repeat(1)).repeat }
  rule(:key_value)      { string.as(:key) >> space.repeat(1) >> values.as(:value) >> space.repeat >> ender }

end
