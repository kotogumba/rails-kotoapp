class MedicinesController < ApplicationController
  def index
    @medicines = Medicine.all
  end

  def show
    @medicine = Medicine.find(params[:id])
  end

  def zones
    @medicine = Medicine.find(params[:id])
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
    @medicine = Medicine.find(params[:id])
  end

  def update
    @medicine = Medicine.find(params[:id])
    if @medicine.update(medicine_params)
      redirect_to @medicine
    else
      render :edit
    end
  end

  def destroy
    @medicine = Medicine.find(params[:id])
    @medicine.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def medicine_params
    params.require(:medicine).permit(:title, :description, :price, :quantity, :zones)
  end

end
