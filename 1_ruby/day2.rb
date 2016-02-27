p '- 1 - Print an array of 16 numbers, 4 numbers at a time -'

array = Array.new(17) {|i| 10 + i}

array.each_index{|x| 
  if x % 4 == 0
    puts array[x..x+3].to_s
  end
}

array.each_slice(4) {
  |a| p a
}

p '-2 - Build a Tree class that accepts nested Trees in its constructor -'

class Tree
  attr_accessor :children, :node_name

  def initialize(name, hash = {})
    @node_name = name

    node_children = hash.keys
    child_trees = []

    node_children.each {
      |key|
      child_trees.push(Tree.new(key, hash.fetch(key)))
    }

    @children = child_trees
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

hash = {'root' => {'level 1 1' => {'level 2 1' => {}, 'level 2 2' => {}}, 'level 1 2' => {}}}

tree = Tree.new('root', hash.fetch(hash.keys[0]))

tree.visit_all {|h| p h.node_name}

p '- 3 - Write a grep function -'

lineNumber = 1

IO.readlines(File.open("day2text.txt", "r")).each {
  |line|
  if (/second/ =~ line)
    p lineNumber.to_s + ' ' + line
  end
  lineNumber = lineNumber + 1
}



