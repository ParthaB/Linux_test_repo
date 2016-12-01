def display_board(board)
	puts "#{board[0]} | #{board[1]} | #{board[2]}"
	puts "-----------"
	puts "#{board[3]} | #{board[4]} | #{board[5]}"
	puts "-----------"
	puts "#{board[6]} | #{board[7]} | #{board[8]}"
end

#user input is(1 to 9) -1
def input_to_index(user_input)
	user_input - 1
end

def turn_count(board)
	counter = 0
	board.each do |i|
		if i != " "
			counter += 1
		end
	end
	return counter
end

def current_player(board)
	if turn_count(board) % 2 == 0
		return "X"
	else
		return "O"
	end
end

def position_taken?(board, index)
	board[index] != " " && board[index] != ""
end

def valid_move?(board, index)
	index.between?(0,8) && !position_taken?(board, index)
end

def move(board, index, current_player)
	board[index] = current_player
end

def turn(board)
	puts "Please Enter 1-9:"
	index = gets.strip.to_i
	input = input_to_index(index)
	if valid_move?(board, index)
		move(board, input, current_player(board))
		display_board(board)
	else
		turn(board)
	end
end

WIN_COMB = [
			[0,1,2],
			[3,4,5],
			[6,7,8],
			[0,3,6],
			[1,4,7],
			[2,5,8],
			[0,4,8],
			[2,4,6]
		]

def won?(board)
	WIN_COMB.detect do |i|
		board[i[0]] == board[i[1]] &&
		board[i[1]] == board[i[2]] &&
		position_taken?(board, i[0])
	end
end

def full?(board)
	board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
	!won?(board) && full?(board)
end

def over?(board)
	won?(board) || draw?(board)
end

def winner(board)
	if WIN_COMB == won?(board)
		board[WIN_COMB.first]
	end
end

def play(board)
	until over?(board)
		turn(board)
	end
end

puts "Welcome to Tic Tac Toe!"
board = Array.new(9, " ")
play(board)