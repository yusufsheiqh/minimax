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
      return -100 if board.values_at(*winning_set).all?(human)
      return 100 if board.values_at(*winning_set).all?(ai)
    end
    return 0 unless board.any?(0)

    board.rindex(0)
  end
end
