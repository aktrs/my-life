class GraphsController < ApplicationController
  before_action :authenticate_user!
  def new
    @graph = Graph.new
  end

  def create
    graph = Graph.new(graph_params)
    Rails.logger.debug graph_params.inspect
    if graph.save
       redirect_to graphs_path
    else
       Rails.logger.debug graph.errors.full_messages.inspect
       respond_to do |format|
        format.html do
          @graph = graph
          render :new
        end
        format.json{render json: {errors:graph.errors.full_messages}, status: :unprocessable_entity}
      end
    end
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
