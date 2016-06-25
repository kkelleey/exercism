require 'pry'

class Bst
  VERSION = 1
  attr_reader :data, :left, :right

  def initialize(initial)
    @data = initial
  end

  def insert(new_node_value)
    direction = new_node_value <= @data ? :@left : :@right
    instance_var = instance_variable_get(direction)
    if instance_var
      instance_var.insert(new_node_value)
    else
      new_node = self.class.new(new_node_value)
      instance_variable_set(direction, new_node)
    end
  end

  def each
    return to_enum(:each) unless block_given?
    child_nodes.map(&:data).each { |data| yield(data) }
  end

  def child_nodes
    return [self] if @left.nil? && @right.nil?
    nodes = []
    nodes += @left.child_nodes unless @left.nil?
    nodes << self
    nodes += @right.child_nodes unless @right.nil?
    nodes
  end
end
