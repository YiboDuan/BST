Encoding.default_internal = Encoding::UTF_8

class BTree
    attr_accessor :data, :left, :right
    def initialize(data)
        @data = data
    end

    def inspect
        linux_tree(self, "", true)
    end

    def to_s
        linux_tree(self, "", true)
    end

    protected

    def linux_tree(node, prefix, is_tail)
        padding = prefix + (is_tail  ? '    ' : '│   ')
        print prefix + (is_tail ? '└── ' : '├── ')
        if node
            p node.data
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
        node = BTree.new(self[i])
        left_index = 2*i + 1
        right_index = 2*i + 2
        node.left = arr_to_btree(left_index) unless self[left_index].nil?
        node.right = arr_to_btree(right_index) unless self[right_index].nil?
        node
    end
end

#### Sample BSTs ####
ONE = [1].to_btree
SIMPLE = [2,1,3].to_btree
COMPLEX = [15,6,25,nil,10,23,29,nil,nil,8,14,nil,nil,27,50].to_btree
LINE = [1,nil,2,nil,nil,nil,3,nil,nil,nil,nil,nil,nil,nil,4].to_btree