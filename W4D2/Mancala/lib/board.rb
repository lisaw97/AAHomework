class Board
  attr_accessor :cups
  #cups[6] - player 1 store
  #cups[13] - player 2 store
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    (0...@cups.length).each do |i| 
      4.times {cups[i] << :stone} if i != 6 && i != 13
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)  
    raise "Invalid starting cup" if ![0..13].include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    count = @cups[start_pos].length
    @cups[start_pos] = [] 
    exclude = @cups[6]
    exclude = @cups[13] if current_player_name == @name1

    i = start_pos + 1
    while count > 0
        if exclude == @cups[6] && i != 6
          if i != 6
            @cups[i] << :stone 
            count -= 1
          end
        else
          if i != 13
            @cups[i] << :stone 
            count -= 1
          end
        end
        i += 1
    end
    render
    next_turn(i - 1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @board[ending_cup_idx].empty?
      :switch
    elsif ending_cup_idx == 6 && ending_cup_idx == 13
      :prompt
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? {|i| @cups[i].empty?} || (7..12).all? {|i| @cups[i].empty?}
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    if @cups[6].length > @cups[13].length 
      @name1 
    else
      @name2
    end
  end
end
