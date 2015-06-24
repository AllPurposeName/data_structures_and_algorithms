require 'pry'
require 'sinatra/base'
require 'sinatra/json'
require 'capybara'
require 'launchy'

class SearchApp < Sinatra::Base
  helpers Sinatra::JSON

  configure do
    set(:index, {})
  end

  post "/index" do
    name = params[:file][:filename]
    path = params[:file][:tempfile]

    text = File.readlines(path)

    @whatever = parse_words(text, name)

  end

  post "/query" do

    binding.pry
    results = settings.index.find_all do |word, _value|
      word == params["query"]
    end
    json results
  end


  delete "/index" do
    settings.index.reject! do |word, _value|
      word == params["query"]
    end
  end

  def parse_words(text_file, name)
    results = text_file.each_with_index do |line, line_number|
      line.split(" ").each_with_index do |word, word_number|
        settings.index[word] ||= []
        settings.index[word] << "#{name}:#{line_number}:#{word_number}"
      end
    end
    def test_case_name


    save_and_open_page
  end
    json results
  end

end
