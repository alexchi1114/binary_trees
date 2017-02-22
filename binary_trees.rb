class Tree
	attr_accessor :root
	class Node
		attr_accessor :value, :parent, :children
		def initialize(value)
			@value=value
			@parent=nil
			@children=[nil,nil]
		end
	end

	def initialize
		@root=nil
	end

	def build_tree(array)
		array.each_with_index do |element, index|
			if index==0
				@root=Node.new(element)
			else
				new_node = Node.new(element)
				current_root=@root
				search = true
				until search == false
					if element<current_root.value
						
						if current_root.children[0]==nil
							search = false
						else
							current_root = current_root.children[0]
						end
					else
						if current_root.children[1]==nil
							search = false
						else
							current_root = current_root.children[1]
						end
					end
				end

				if element < current_root.value
					current_root.children[0]=new_node
					new_node.parent = current_root
				else
					current_root.children[1]=new_node
					new_node.parent = current_root
				end
				
			end
		end
	end

	def breadth_first_search(value)
		que = [@root]
		search = true
		if @root == nil
			return nil
		end

		until (que == [] || search == false)
			if que[0].value == value
				search = false
				return que[0]
			else
				if que[0].children[0]!=nil
					que << que[0].children[0]
				end
				if que[0].children[1]!=nil
					que << que[0].children[1]
				end
			end
			que.shift
		end

		if search == true
			return nil
		end
	end
#Depth First Search
	def dfs(value, current_node)
		return current_node if current_node.value==value

		leaf = dfs(value, current_node.children[0]) unless current_node.children[0]==nil
		return leaf unless leaf.nil?
		leaf = dfs(value, current_node.children[1]) unless current_node.children[1]==nil
		return leaf unless leaf.nil?
	end

end

tree=Tree.new

tree.build_tree([1,7,4,23,8,9,4,3,5,7,9,67,6345,324])

puts tree.dfs(67, tree.root)


