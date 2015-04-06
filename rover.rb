class Plateau
  attr_reader :max_x, :max_y, :min_y, :min_x
  def initialize (init_plat_x, init_plat_y)
    @max_x = init_plat_x
    @max_y = init_plat_y
    @min_x = 0
    @min_y = 0
  end

  def to_s
    puts "Your plateau size is #{@max_x} by #{@max_y}."
  end
end

class Rover
  def initialize (init_x,init_y,init_direction)
    @x = init_x
    @y = init_y
    @direction = init_direction
  end

  def move(plateau)
    if @direction == "N" && @y < plateau.max_y
      @y += 1
    elsif @direction == "S" && @y > plateau.min_y
      @y -= 1
    elsif @direction == "E" && @x < plateau.max_x
      @x += 1
    elsif @direction == "W" && @x > plateau.min_x
      @x -= 1
    end
  end

  def turn_left
    case @direction
      when "N"
        @direction = "W"
      when "W"
        @direction = "S"
      when "S"
        @direction = "E"
      when "E"
        @direction = "N"
    end
  end

  def turn_right
    if @direction == "N"
      @direction = "E"
    elsif @direction == "W"
      @direction = "N"
    elsif @direction == "S"
      @direction = "W"
    elsif @direction == "E"
      @direction = "S"
    end
  end

  def move_instruction(plateau)
    puts "Now please enter your move instructions."
    puts "Enter 'L' to turn left. Enter 'R' to turn right. Enter 'M' to move your rover."
    puts "i.e. LMRM will turn the rover left, then move ahead, then turn the rover right, then move ahead."
    command = gets.chomp.upcase
    command_arr = command.split(//)
    command_arr.each do |action|
      turn_left if action == "L"
      turn_right if action == "R"
      move(plateau) if action == "M"
    end
  end

  def to_s
    "The rover is at #{@x}, #{@y}, facing: #{@direction}"
  end
end

class Runner
  def start
    puts "Welcome to the Mars Rover Program"
    puts "Please input the size of your plateau in this format 'x y'."
    puts "(for example, enter '5 5' if you want your plateau to be 5x5 square)"
    plateau_size = gets.chomp.split
    plateau = Plateau.new(plateau_size[0].to_i, plateau_size[1].to_i)
    puts plateau
    puts "Please enter the starting position of your Mars Rover in the format 'x, y, Direction'"
    puts "for example. enter '1 2 N' if you want your rover to start at x=1, y=2, and facing North"
    start_position = gets.chomp.split1 2
    my_rover = Rover.new(start_position[0].to_i, start_position[1].to_i, start_position[2].to_s)
    puts my_rover
    my_rover.move_instruction(plateau)
    puts my_rover
  end
end

my_runner = Runner.new
my_runner.start
