class Tree
  attr_accessor :root

  def insert(word)
    if @root.nil?
      @root = Node.new(word)
    else
      insert_node(@root, word)
    end
  end

  def insert_loop
    ["mike", "aaron", "adrian", "jenn", "bob", "mike", "sarah", "zed"].each do |i|
      insert(i)
    end
  end


  def sort
    sort_all(@root)
  end

  def sort_all(node)

    start_sort(node.prv) if node.prv
    puts node.data
    start_sort(node.nxt) if node.nxt

  end

  def insert_node(node, value)
    if (value <= node.data) && (node.prv.nil?)
      node.prv = Node.new(value)
    elsif (value > node.data) && (node.nxt.nil?)
      node.nxt = Node.new(value)
    elsif (value <= node.data) && (node.prv)
        insert_node(node.prv, value)
    elsif (value > node.data) && (node.nxt)
        insert_node(node.nxt, value)
    end
  end
end