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
    @@node_count = 0
    
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
        # @@node_count == 0 ? @head = value : @tail = value
        @@node_count += 1
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
        @@node_count += 1
    end

    def size
        #size returns the total number of nodes in the list
        @@node_count
    end
    
    def at(index)
        #returns the node at the given index
    end

    def pop
        #removes the last element from the list
    end

    def contains?(value)
        #returns true if the passed in value is in the list and otherwise returns false.
        node = @head
        until node.value == value || node == @tail
            node = node.next_node
        end
        node.nil? ? false : true
    end

    def find(value)
        #returns the index of the node containing value, or nil if not found.
    end

    def to_s
        #represent your LinkedList objects as strings, so you can print them out and preview them in the console. 
        #The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    end

# Extra Credit

    def insert_at(value, index)
        #inserts the node with the provided value at the given index
    end

    def remove_at(index)
        #removes the node at the given index. 
        #(You will need to update the links of your nodes in the list when you remove a node.)
    end
end
