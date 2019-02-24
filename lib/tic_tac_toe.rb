class Player
  attr_reader :letter

  def initialize(letter)
    @letter = letter
  end

  def turn
    puts "#{@letter}, where would you like to go:"
    var = gets.chomp
  end
end

class Game
  attr_reader :places
  #def initialize(places = [" ", "x", "o", "o", "o", "x", "x", "o", "x"])
  def initialize(places = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @places = places
    @x = Player.new 'x'
    @o = Player.new 'o'
    @current = @x
  end

  def play
    puts_board
    9.times do
      var = @current.turn
      while valid?(var, @current.letter) == false
        var = @current.turn
      end
      puts_board
      exit if game_won?(@current.letter) == true
      switch
    end
    puts "Cat's game!"
  end

  def puts_board
    @board =
      ["  1  2  3", "a[#{@places[0]}][#{@places[1]}][#{@places[2]}]",
       "b[#{@places[3]}][#{@places[4]}][#{@places[5]}]",
       "c[#{@places[6]}][#{@places[7]}][#{@places[8]}]"]
    puts @board
  end

  def switch
    if @current == @x
      @current = @o
    else
      @current = @x
    end
  end

  def valid?(var, letter)
    if var == "a1" && @places[0] == " "
      @places[0] = letter
    elsif var == "a2" && @places[1] == " "
      @places[1] = letter
    elsif var == "a3" && @places[2] == " "
      @places[2] = letter
    elsif var == "b1" && @places[3] == " "
      @places[3] = letter
    elsif var == "b2" && @places[4] == " "
      @places[4] = letter
    elsif var == "b3" && @places[5] == " "
      @places[5] = letter
    elsif var == "c1" && @places[6] == " "
      @places[6] = letter
    elsif var == "c2" && @places[7] == " "
      @places[7] = letter
    elsif var == "c3" && @places[8] == " "
      @places[8] = letter
    else
      puts "Invalid input. Please specify an empty position on the board (e.g. 'a1')."
      false
    end
  end

  def game_won?(letter)
    if @places[0] == letter
      if @places[1] == letter && @places[2] == letter
        #[@places[0], @places[1], @places[2]].each { |x| x.upcase! }
        puts "#{letter} wins!"
        return true
      elsif @places[3] == letter && @places[6] == letter
        puts "#{letter} wins!"
        return true
      elsif @places[4] == letter && @places[8] == letter
        puts "#{letter} wins!"
        return true
      end
    end
    if @places[4] == letter
      if @places[3] == letter && @places[5] == letter
        puts "#{letter} wins!"
        return true
      elsif @places[1] == letter && @places[7] == letter
        puts "#{letter} wins!"
        return true
      elsif @places[2] == letter && @places[6] == letter
        puts "#{letter} wins!"
        return true
      end
    end
    if @places[8] == letter
      if @places[2] == letter && @places[5] == letter
        puts "#{letter} wins!"
        return true
      elsif @places[6] == letter && @places[7] == letter
        puts "#{letter} wins!"
        return true
      end
    end
    false
  end
end

Game.new.play
