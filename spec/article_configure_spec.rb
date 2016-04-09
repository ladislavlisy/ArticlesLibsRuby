require 'rspec'
require_relative '../lib/RubyMineBox'

describe 'Configure Articles' do

  it 'should Return_53_For_Articles_Length' do
    articles_all = Configure.configure_articles
    expect(articles_all.length).to eq(53)
  end
end