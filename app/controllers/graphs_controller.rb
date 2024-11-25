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
      [graph.age, graph.value, comment:graph.comment]
    end
    
    @labels = @graphs.pluck(:age)
    @values = @graphs.pluck(:value)

    @comments = @graphs.map(&:comment)

    @graph_links = @graphs.map do |graph|
      [graph.age, edit_graph_path(graph)]
    end.to_h

    @data_with_links = @graphs.map do |graph|
      { age: graph.age, value: graph.value, comment: graph.comment, id: graph.id, link: edit_graph_path(graph) }
    end  
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
    params.require(:graph).permit(:user_id, :age, :value, :comment, :image)
  end

end
