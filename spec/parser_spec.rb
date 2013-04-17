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

  context "key value pair parsing" do
    let(:pair_parser) { parser.key_value }

    it 'parses a single value setting' do
      expect(pair_parser.parse("key value;")).to eq(
        :key => "key", :value => ["value"]
      )
    end

    it 'parses two value settings' do
      expect(pair_parser.parse("key value1 value2;")).to eq(
        :key => "key", :value => [:string => "value1", :string => "value2"]
      )
    end

  end

end
