class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def enqueue(value)
    if @head.nil? #if nothing in the queue, new up a new node, attach head to it
      @head = Node.new(value) # CAN USE SELF OR @. IF ASSIGNING, NEED TO USE IT. IF NOT ASSIGNING, DON'T NEED @ OR SELF. 
    else
      temp = Node.new(value)
      temp.nxt = head
      @head.prv = temp
      @head = temp
    end
  end

  def dequeue
    tail = get_last_node(@head)
    tail.prv.nxt = nil #chop off the last connection
    tail.prv = nil #chop off the
    tail
  end

  def get_last_node(node)
    if node.nxt
      get_last_node(node.nxt)
    else
      node
    end
  end

  # def insert(value)

  #   if @head.nil?
  #     @head = Node.new(value)
  #   else
  #     @head.nxt = Node.new(value)
  #   end
      
  # end

  # def to_s
  #   "This is a single, sorted linked list"
  # end

end