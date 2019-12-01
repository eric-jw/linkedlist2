class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list, previous_nodes = nil)
  return previous_nodes if list.nil?
  new_list = LinkedListNode.new(list.value, previous_nodes)
  reverse_list(list.next_node, new_list)
end


def detect_cycle(list)
  h = list
  t = list
  while true
    if h.nil?
      return 'No Loop Found'
    end
    h = h.next_node
    if h.nil?
      return 'No Loop Found'
    end
    h = h.next_node
    t = t.next_node
    if h == t
      return 'Loop Found'
    end
  end
end


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
cycle = LinkedListNode.new(100, node3)
node1.next_node = cycle

print_values(node3)
rlist = node3.reverse_list(node3)
print_values(rlist)


puts detect_cycle(cycle)