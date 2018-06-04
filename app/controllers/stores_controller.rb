class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def show
    @store =Store.find(params[:id])
  end

  def new
    @store =Store.new
    render
  end

  def create
    @store = Store.new

    if @store.save
      redirect_to stores_path
    else
      render
  end

  def edit
    @store =Store.find(params[:id])

  end

  def update
    @store =Store.find(store_params)

    if @store.update
      redirect_to store_path
    else
      render
  end

  def destroy
    @store =Store.find(params[:id]).destroy
    redirect_to store_path
  end

  private

  def store_params
    params.require(:store).permit(:store, :name, :body)
  end

end
