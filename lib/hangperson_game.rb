class HangpersonGame

  attr_accessor :word, :guesses, :wrong_guesses
  
  def initialize(word)
    @word = word
      @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
   def guess guess
    
    # if guess is contained in the alphabet
    if guess =~ /[[:alpha:]]/
      guess.downcase!
      if @word.include? guess and !@guesses.include? guess
        @guesses.concat guess
      elsif !@wrong_guesses.include? guess and !@word.include? guess
        @wrong_guesses.concat guess
        return true
      else
        return false
      end
    else
      guess = :invalid
      raise ArgumentError
    end
  end

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end
