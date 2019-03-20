class Minimax
  WINNING_SETS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def execute(board, human:, ai:)
    WINNING_SETS.each do |winning_set|
      return { score: -100 } if board.values_at(*winning_set).all?(human)
      return { score: 100 } if board.values_at(*winning_set).all?(ai)
    end
    return { score: 0 } if board.none?(0)

    available_spaces = board.map.with_index { |elem, index| index if elem.zero? }.compact

    available_spaces.each do |space|
      temp_board = board.dup
      temp_board[space] = ai
      WINNING_SETS.each do |winning_set|
        return { move: space } if temp_board.values_at(*winning_set).all?(human) ||temp_board.values_at(*winning_set).all?(ai)
      end
    end

    { move: board.rindex(0) }
  end
end
