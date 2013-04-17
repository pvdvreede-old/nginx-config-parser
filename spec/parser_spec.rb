require 'spec_helper'

describe NginxConfigParser::Parser do
  let(:parser)  { NginxConfigParser::Parser.new }

  context "value parsing" do
    let(:value_parser) { parser.value }

    it 'parses integers to { :integer => value }' do
      expect(value_parser.parse("23423")).to    eq :integer => "23423"
      expect(value_parser.parse("-345")).to     eq :integer => "-345"
      expect(value_parser.parse("8")).to        eq :integer => "8"
    end

    it 'parses string' do
      expect(value_parser.parse("sdf7sdf8sg")).to   eq :string => "sdf7sdf8sg"
      expect(value_parser.parse("hgfeagg")).to      eq :string => "hgfeagg"
    end
  end

end
