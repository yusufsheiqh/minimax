require 'minimax'

describe 'minimax' do
  let(:minimax) { Minimax.new }

  it 'can give a score of 0 when game is a draw' do
    board = [
      1, 2, 1,
      1, 2, 1,
      2, 1, 2
    ]

    response = minimax.execute(board, human: 1, ai: 2)

    expect(response[:score]).to eq(0)
  end

  it 'can give a score of 0 when different game is a draw' do
    board = [
      2, 1, 2,
      1, 2, 1,
      1, 2, 1
    ]

    response = minimax.execute(board, human: 1, ai: 2)

    expect(response[:score]).to eq(0)
  end

  it 'can give a score of 100 when ai player wins' do
    board = [
      1, 1, 1,
      0, 0, 0,
      0, 0, 0
    ]

    response = minimax.execute(board, human: nil, ai: 1)

    expect(response[:score]).to eq(100)
  end

  it 'can give a score of 100 when ai player win example 2' do
    board = [
      2, 2, 2,
      0, 0, 0,
      0, 0, 0
    ]

    response = minimax.execute(board, human: nil, ai: 2)

    expect(response[:score]).to eq(100)
  end

  it 'can give a score of 100 when ai player win example 3' do
    board = [
      2, 2, 2,
      1, 1, 0,
      0, 0, 0
    ]

    response = minimax.execute(board, human: 1, ai: 2)

    expect(response[:score]).to eq(100)
  end

  it 'can give a score of -100 when human player wins' do
    board = [
      1, 1, 1,
      0, 0, 0,
      0, 0, 0
    ]

    response = minimax.execute(board, human: 1, ai: nil)

    expect(response[:score]).to eq(-100)
  end

  it 'can give a score of -100 when human player wins example 2' do
    board = [
      2, 2, 2,
      0, 0, 0,
      0, 0, 0
    ]

    response = minimax.execute(board, human: 2, ai: nil)

    expect(response[:score]).to eq(-100)
  end

  it 'can give a score of 100 when last space is a winning move' do
    board = [
      1, 1, 2,
      1, 2, 1,
      1, 2, 2
    ]

    response = minimax.execute(board, human: 2, ai: 1)

    expect(response[:score]).to eq(100)
  end

  it 'can place mark on last available space' do
    board = [
      2, 1, 2,
      1, 2, 1,
      1, 2, 0
    ]

    response = minimax.execute(board, human: 2, ai: 1)

    expect(response[:move]).to eq(8)
  end

  it 'can place mark on last available space example 2' do
    board = [
      2, 1, 2,
      1, 0, 1,
      1, 2, 2
    ]

    response = minimax.execute(board, human: 2, ai: 1)

    expect(response[:move]).to eq(4)
  end

  it 'can place mark on last available space example 3' do
    board = [
      2, 1, 2,
      0, 1, 1,
      1, 2, 2
    ]

    response = minimax.execute(board, human: 2, ai: 1)

    expect(response[:move]).to eq(3)
  end

  it 'can place winning mark on 2nd to last available space' do
    board = [
      1, 1, 2,
      0, 1, 2,
      1, 2, 0
    ]

    response = minimax.execute(board, human: 1, ai: 2)

    expect(response[:move]).to eq(8)
  end

  it 'can place winning mark on 2nd to last available space example 2' do
    board = [
      2, 1, 0,
      0, 1, 1,
      1, 2, 2
    ]

    response = minimax.execute(board, human: 1, ai: 2)

    expect(response[:move]).to eq(3)
  end

  it 'can block player from winning' do
    board = [
      1, 2, 2,
      1, 0, 2,
      0, 1, 1
    ]

    response = minimax.execute(board, human: 1, ai: 2)

    expect(response[:move]).to eq(6)
  end

  it 'can block player from winning example 2' do
    board = [
      1, 1, 0,
      2, 0, 0,
      0, 0, 0
    ]

    response = minimax.execute(board, human: 1, ai: 2)

    expect(response[:move]).to eq(2)
  end
end
