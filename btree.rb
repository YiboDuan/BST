Encoding.default_internal = Encoding::UTF_8

class Node
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
    end

    def inspect
        linux_tree(self, "", true)
    end

    def to_s
        linux_tree(self, "", true)
    end

    protected

    # def linux_tree(prefix, is_tail)
    #     padding = prefix + (is_tail  ? '    ' : '│   ')
    #     leaf_padding = prefix + (is_tail ? '└── ' : '├── ')
    #     p "#{leaf_padding}#{val}"
    #     if right.nil?
    #         p "#{padding}├── " if left
    #     else
    #         right.linux_tree(padding, left.nil?)
    #     end
    #     left.linux_tree(padding, true) unless left.nil?
    # end

    def linux_tree(node, prefix, is_tail)
        padding = prefix + (is_tail  ? '    ' : '│   ')
        print prefix + (is_tail ? '└── ' : '├── ')
        if node
            p node.val
            if node.left or node.right
                linux_tree(node.right, padding, false)
                linux_tree(node.left, padding, true)
            end
        else
            p ' '
        end
    end
end

class Array
    def to_btree
        arr_to_btree(0)
    end

    protected

    def arr_to_btree(i)
        node = Node.new(self[i])
        left_index = 2*i + 1
        right_index = 2*i + 2
        node.left = arr_to_btree(left_index) unless self[left_index].nil?
        node.right = arr_to_btree(right_index) unless self[right_index].nil?
        node
    end
end

#### SAMPLE TREES ####
one_node = [1].to_btree
simple_tree = [1,2,3].to_btree
complex_tree = [15,6,25,nil,10,23,29,nil,nil,8,14,nil,nil,27,50].to_btree
line_tree = [1,nil,2,nil,nil,nil,3,nil,nil,nil,nil,nil,nil,nil,4].to_btree

# p one_node
# p simple_tree
# p complex_tree
# p line_tree