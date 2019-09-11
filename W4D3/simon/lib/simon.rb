class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      round_success_message
      @sequence_length += 1
    else
      game_over_message
      reset_game
    end
  end

  def show_sequence
    @sequence_length.times {add_random_color}
    @seq.each {|color| puts color}
  end

  def require_sequence
    (0...@sequence_length).each do |i|
      puts "recall color"
      input = gets.chomp
      @game_over = true if input != @seq[i]
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "correct!"
  end

  def game_over_message
    puts "game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
