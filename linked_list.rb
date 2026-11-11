class LinkedList

  attr_accessor :head

  def initialize
    self.head = nil
  end

  def append(value)
    if self.head.nil?
      self.head = Node.new(value, nil)
    else
      last_node = self.head

      while !last_node.next_node.nil?
        last_node = last_node.next_node
      end

      last_node.next_node = Node.new(value, nil)
    end
  end

  def prepend(value)
    if self.head.nil?
      self.head = Node.new(value, nil)
    else
      new_node = Node.new(value, self.head.next_node)
    end
  end

  def size
    return 0 if self.head.nil?

    count = 0
    last_node = self.head

    while !last_node.next_node.nil?
      count += 1
      last_node = last_node.next_node
    end

    return count
  end

  def head_value
    return nil if self.head.nil?

    return self.head.value
  end

  def tail
    return nil if self.head.nil?

    last_node = self.head

    while !last_node.next_node.nil?
      last_node = last_node.next_node
    end

    return last_node
  end

  def at(index)
    return nil if self.head.nil?

    count = 0
    last_node = self.head

    loop do
      if count == index
        return last_node.value
        break
      end

      count += 1
      last_node = last_node.next_node
    end
  end

  def pop
    return nil if self.head.nil?

    return_value = self.head.value

    self.head = self.head.next_node

    return return_value
  end

  def contains?(value)
    return false if self.head.nil?

    last_node = self.head

    loop do
      if last_node.value == value
        return true
        break
      end

      last_node = last_node.next_node
    end

    return false
  end

  def index(value)
    return nil if self.head.nil?

    count = 0
    last_node = self.head

    loop do
      if last_node.value == value
        return count
        break
      end

      count += 1
      last_node = last_node.next_node
    end

    return nil
  end

  def to_s
    puts '' if self.head.nil?

    string_list = ""

    current_node = self.head

    until current_node.nil?
      string_list += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end

    string_list += "nil"

    return string_list
  end

  def insert_at(index, *values)
    return nil if self.head.nil?

    object_value = []

    values.each_with_index do |value, i|
      object_value[i] = Node.new(value, nil)

      if i != 0
        object_value[i-1].next_node = object_value[i]
      end
    end

    count = 0
    head_node = self.head

    loop do
      if count < index
        break
      end

      if count == index
        if count == 0
          object_value[object_value.length - 1].next_node = head_node
          break
        end

        prev_next_node = head_node.next_node
        head_node.next_node = object_value[0]
        object_value[object_value.length - 1].next_node = prev_next_node
        break
      end

      count += 1
      head_node = head_node.next_node
    end
  end

  private

  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      self.value = value
      self.next_node = next_node
    end
  end
end



list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

list.insert_at(1, 10, 11)

puts list


