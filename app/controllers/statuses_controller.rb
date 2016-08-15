class StatusesController < ApplicationController
  before_action :set_status, only: [:edit, :update, :destroy]
  before_action :require_login

  def new
   @status = Status.new
  end

  def create
    @status =Status.new(status_params)
    if @status.save
      redirect_to(@status, flash:{notice: "Status is created successfully."})
  
      else
      flash[:alert] = "Error creating status. #{@status.errors.full_messages.to_sentence}"
      render :new
      end
  end

  def edit
  end

  def update
    if @status.update(status_params)
      redirect_to(status_path(@status), flash:{notice: "Status is updated successfully."})
    else
      render :edit
    end
  end

  def destroy
    @status.destroy
    redirect_to(statuses_path, flash:{notice: "Status is deleted."})
  end

  def set_status
    @status= Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:title, :content, :user_id)
  end

end
