class BinarySearchTree
  attr_reader :root_node
  def push(data)
    if root_node
      root_node.push(data)
    else
      @root_node = Node.new(data)
    end
  end

  def count
    if root_node
      root_node.count
    else
      0
    end
  end

  def include?(data)
    if root_node
      root_node.include?(data)
    else
      false
    end
  end

  def to_array
    if root_node
      root_node.to_array.flatten
    else
      []
    end
  end

  def sort
    if root_node
      root_node.sort.flatten
    else
      []
    end
  end

  def min
    if root_node
      root_node.min
    end
  end

  def max
    if root_node
      root_node.max
    end
  end

  def post_ordered
    if root_node
      root_node.post_ordered.flatten
    else
      []
    end
  end

  def min_height
    if root_node
      root_node.min_height.flatten.min
    else
      0
    end
  end

  def max_height
    if root_node
      root_node.max_height.flatten.max
    else
      0
    end
  end

  def balanced?
    if root_node
      max_height >=  min_height + 1 || max_height <= min_height + 1 && root_node.left && root_node.right
    else
      true
    end
  end

  def balance!
    if balanced?
    else
      imbalanced_tree = sort
      new_root_index = imbalanced_tree.count/2
      new_root_data = imbalanced_tree.slice!(new_root_index)
      @root_node = Node.new(new_root_data)
      imbalanced_tree.each do |data|
        @root_node.push(data)
      end
    end
  end

end

class Node
  attr_reader :data, :left, :right
  def initialize(starting_data, left_node=nil, right_node=nil)
    @data = starting_data
    @left = left_node
    @right = right_node
  end

  def push(node)
    if data
      if node <= data
        push_left(node)
      else
        push_right(node)
      end
    else
      @data = node
    end
  end

  def push_left(node)
    if left
      left.push(node)
    else
      @left = Node.new(node)
    end
  end

  def push_right(node)
    if right
      right.push(node)
    else
      @right = Node.new(node)
    end
  end

  def count
    if left && right
      left.count + right.count + 1
    elsif left
      left.count + 1
    elsif right
      right.count + 1
    else
      1
    end
  end

  def include?(query_data)
    if data == query_data
      true
    elsif left && right
      left.include?(query_data) || right.include?(query_data)
    elsif left
      left.include?(query_data)
    elsif right
      right.include?(query_data)
    else
      false
    end
  end

  def to_array
    if left && right
      [data, left.to_array, right.to_array]
    elsif left
      [data, left.to_array]
    elsif right
      [data, right.to_array]
    else
      data
    end
  end

  def sort
    if left && right
      [left.sort, data, right.sort]
    elsif left
      [left.sort, data]
    elsif right
      [data, right.sort]
    else
      data
    end
  end

  def min
    if left
      left.min
    else
      data
    end
  end

  def max
    if right
      right.max
    else
      data
    end
  end

  def to_s
    "I'm a node with #{data}"
  end

  def post_ordered
    if left && right
      [left.post_ordered, right.post_ordered, data]
    elsif left
      [left.post_ordered, data]
    elsif right
      [data, right.post_ordered]
    else
      [data]
    end
  end

  def min_height(total=0)
    if left && right
      [left.min_height(total + 1), right.min_height(total + 1)]
    elsif left
      [left.min_height(total + 1)]
    elsif right
      [right.min_height(total + 1)]
    else
      [total + 1]
    end
  end

  def max_height(total=0)
    if left && right
      [left.max_height(total + 1), right.max_height(total + 1)]
    elsif left
      [left.max_height(total + 1)]
    elsif right
      [right.max_height(total + 1)]
    else
      [total + 1]
    end
  end
end

binary = BinarySearchTree.new
random_nums = [rand(1..100), rand(1..100), rand(1..100), rand(1..100), rand(1..100), rand(1..100), rand(1..100)]
puts "=== UNSORTED =========="
puts random_nums
puts "========================"
random_nums.each {|num| binary.push(num)}
puts "======SORTED =========="
puts binary.sort
puts "========================"
