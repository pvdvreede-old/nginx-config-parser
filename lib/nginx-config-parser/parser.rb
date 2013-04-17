class NginxConfigParser::Parser < Parslet::Parser


  # primitive values
  rule(:digit)          { match("[0-9]") }
  rule(:integer)        { (str("-").maybe >> digit.repeat).as(:integer) }
  rule(:string)         { any.repeat.as(:string) }
  rule(:value)          { integer | string }

end
