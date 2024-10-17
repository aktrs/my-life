class GraphsController < ApplicationController
  def new
    @graph = Graph.new
  end

  def create
    graph = Graph.new(graph_params)
    graph.save
    redirect_to graphs_path
  end

  def index
    @graphs = Graph.all
    @data_for_graph = Graph.group(:age).sum(:value)
    Rails.logger.debug @data_for_graph.inspect
  end

  private
  def graph_params
    params.require(:graph).permit(:age, :value, :comment)
  end

end
