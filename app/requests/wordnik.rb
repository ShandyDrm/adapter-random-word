require 'faraday'

class Wordnik
  def self.randomWord(length, min_corpus_count = 100)
    params = {
      minLength: length,
      maxLength: length,
      minCorpusCount: min_corpus_count
    }

    headers = {
      'api_key': ENV['WORDNIK_API_KEY'],
      'accept': 'application/json',
      'user-agent': 'adapter-random-word'
    }

    response = Faraday.get('https://api.wordnik.com/v4/words.json/randomWord', params, headers)

    if response.status != 200
      raise 'unexpected error from wordnik'
    end

    JSON.parse(response.body)['word']
  end
end
