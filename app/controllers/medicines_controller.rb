class MedicinesController < ApplicationController
  before_action :set_medicine, only: [:show, :edit, :update, :destroy, :zones]

  def index
    @medicines = Medicine.all
  end

  def show
  end

  def zones
    @zones = @medicine.zones
  end

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(medicine_params)
    @zones_id_array = params[:medicine][:zones]
    @zones_id_array.each do |zone_id|
      @zone = Zone.find(zone_id)
      @medicine.zones << @zone
    end
    if @medicine.save
      redirect_to @medicine
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @medicine.update(medicine_params)
      redirect_to @medicine
    else
      render :edit
    end
  end

  def destroy
    @medicine.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def set_medicine
    @medicine = Medicine.find(params[:id])
  end

  def medicine_params
    params.require(:medicine).permit(:title, :description, :price, :quantity, :zones)
  end
end
