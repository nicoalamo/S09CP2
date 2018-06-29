class Roulette
  attr_accessor :roulette

  def initialize
    @roulette = (1..10).to_a
    @history = []
  end

  def play(player_number)
    random_number = Roulette.new.roulette[rand(1..10)]
    if player_number == random_number
      puts 'GANASTE!'
      save_winners('winners.txt', player_number)
    else
      puts 'PERDISTE'
    end
    save_history('roulette_history.txt', random_number)
  end

  def save_history(filename, num_to_save)
    file = File.open(filename, 'a')
    file.puts num_to_save
    file.close
  end

  def save_winners(filename, num_to_save)
    file = File.open(filename, 'a')
    file.puts num_to_save
    file.close
  end

  def read_history(file_name)
    history = []
    file = File.open(file_name, 'r')
    data = file.readlines

    data.each do |line|
      history << line.chomp
    end

    history

  end

end

Roulette.new.play(5)
puts Roulette.new.read_history('roulette_history.txt')
