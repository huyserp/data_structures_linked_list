require 'pry'
class Node
    attr_accessor :next_node, :value

    def initialize(value=nil)
        @next_node = nil
        @value = value
    end
end

class LinkedList
    attr_accessor :name
    attr_reader :head, :tail
    
    def initialize(name)
        @name = name
        @head = nil
        @tail = nil
    end

    def append(value)
        #adds a new node containing value to the end of the list
        value = Node.new(value)
        if @head.nil?
            @head = value
            @tail = value
        else
            @tail.next_node = value
            @tail = value
        end
    end

    def prepend(value)
        #adds a new node containing value to the start of the list
        value = Node.new(value)
        if @head.nil?
            @head = value
            @tail = value
        else
            value.next_node = @head
            @head = value
        end
    end

    def size
        #size returns the total number of nodes in the list
        find(@tail.value)
    end
    
    def at(index_value)
        #returns the node at the given index
        node = @head
        index = 1
        until node.nil?
           if index_value == index
            return node
           else
            node = node.next_node
            index += 1
           end
        end
        return nil if node.nil?
    end

    def pop
        #removes the last element from the list
        old_tail = @tail
        @tail = at(self.size - 1)
        @tail.next_node = nil
        old_tail
    end

    def contains?(value)
        #returns true if the passed in value is in the list and otherwise returns false.
        node = @head
        until node.nil?
           if node.value == value
            return true
           else
            node = node.next_node
           end
        end
        return false if node.nil?
    end

    def find(value)
        #returns the index of the node containing value, or nil if not found.
        node = @head
        index = 1
        until node.nil?
           if node.value == value
            return index
           else
            node = node.next_node
            index += 1
           end
        end
        return nil if node.nil?
    end

    def to_s
        #represent your LinkedList objects as strings, so you can print them out and preview them in the console. 
        #The format should be: ( value ) -> ( value ) -> ( value ) -> nil
        string = []
        node = @head
        until node.nil?
            added_value = "( #{node.value} ) -> "
            string << added_value
            node = node.next_node
        end
        string << "nil"
        puts string.join

    end

# Extra Credit

    def insert_at(value, index)
        #inserts the node with the provided value at the given index
        old_node_at_index = self.at(index)
        new_node_at_index = Node.new value 
        self.at(index - 1).next_node = new_node_at_index
        new_node_at_index.next_node = old_node_at_index
        new_node_at_index
    end

    def remove_at(index)
        #removes the node at the given index. 
        #(You will need to update the links of your nodes in the list when you remove a node.)
        previous_node = self.at(index - 1)
        next_node = self.at(index + 1)
        node = self.at(index)
        node.next_node = nil
        previous_node.next_node = next_node
    end
end
