
def is_on_board?(pos)
  pos[0] >= 0 && pos[0] < 8 && pos[1] >= 0 && pos[1] < 8
end

def get_legal_moves(pos)
  return [[-2,-1],[-1,-2],[2,-1],[1,-2],[2,1],[1,2],[-2,1],[-1,2]].map { |p| [pos[0] + p[0], pos[1] + p[1]] }.select{ |p| is_on_board?(p) }
end

class Node
  attr_reader :curr, :prev
  def initialize(curr, prev = nil)
    @curr = curr
    @prev = prev
  end
end

def get_path(pos)
  path = []
  while pos
    path << pos.curr
    pos = pos.prev
  end
  path.reverse
end

def knight_moves(startPos, endPos)
  return "Invalid start" unless is_on_board?(startPos)
  return "Invalid end" unless is_on_board?(endPos)
  queue = [Node.new(startPos)]
  iters = 0
  while iters < 10000
    iters += 1
    pos = queue.shift()
    if pos.curr == endPos
      return get_path(pos)
    end
    moves = get_legal_moves(pos.curr)
    moves.each do |move|
      queue << Node.new(move, pos)
    end
  end
  iters
end

p knight_moves([7, 6], [7, 7])
