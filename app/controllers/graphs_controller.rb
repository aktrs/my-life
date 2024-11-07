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
      render :new, status: :unprocessable_entity
    end
  end
  
  def index
    @graphs = Graph.where(user: current_user).order(:age)
    @data_for_graph = @graphs.map do |graph|
      [graph.age, graph.value, graph.comment]
    end

    @graph_links = @graphs.map do |graph|
      [graph.age, edit_graph_path(graph)]
    end.to_h

    @data_with_links = @graphs.map do |graph|
      { age: graph.age, value: graph.value, id: graph.id, link: edit_graph_path(graph) }
    end  

    Rails.logger.debug "Data for graph: #{@data_for_graph.inspect}"
    Rails.logger.debug "Data with links: #{@data_with_links.inspect}"
  end

  def edit
    @graph = Graph.find(params[:id])
  end

  def update
    graph = Graph.find(params[:id])
    graph.update(graph_params)
    redirect_to graphs_path
  end

  def destroy
    graph = Graph.find(params[:id])
    graph.destroy
    redirect_to graphs_path
  end

  private

  def graph_params
    params.require(:graph).permit(:age, :value, :comment)
  end

end
