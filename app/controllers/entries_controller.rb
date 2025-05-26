class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = current_user.entries
  end

  def show
    @entry = current_user.entries.find(params[:id])
  end

  def new
    @entry = current_user.entries.new
  end

  def edit
    @entry = current_user.entries.find(params[:id])
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to entries_path, notice: "Entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @entry = current_user.entries.find(params[:id])
    if @entry.update(entry_params)
      redirect_to entries_path, notice: "Entry was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry = current_user.entries.find(params[:id])
    @entry.destroy
    redirect_to entries_path, notice: "Entry was successfully deleted."
  end

  private

  def entry_params
    params.expect(entry: [ :name, :url, :username, :password ])
  end
end
