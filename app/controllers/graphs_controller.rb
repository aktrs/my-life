class GraphsController < ApplicationController
  before_action :authenticate_user!
  def new
    @graph = Graph.new
  end

  def create
    @graph = current_user.graphs.new(graph_params) 
    if @graph.save
      redirect_to graphs_path, notice: 'グラフが追加されました。'
    else
      render :new
    end
  end
  
  def index
    @graphs = Graph.where(user: current_user)
    @data_for_graph = @graphs.map do |graph|
      [graph.age, graph.value]
    end.to_h
    Rails.logger.debug "Data for graph: #{@data_for_graph.inspect}"
  end

  def edit
    @graph = Graph.find(params[:id])
  end

  private

  def graph_params
    params.require(:graph).permit(:age, :value, :comment)
  end

end
