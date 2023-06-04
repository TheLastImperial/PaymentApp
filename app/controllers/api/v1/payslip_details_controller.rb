class Api::V1::PayslipDetailsController < ApplicationController
  before_action :set_payslip_detail, only: %i[ show update destroy ]

  # GET /payslip_details
  # GET /payslip_details.json
  def index
    @payslip_details = PayslipDetail.all
  end

  # GET /payslip_details/1
  # GET /payslip_details/1.json
  def show
  end

  # POST /payslip_details
  # POST /payslip_details.json
  def create
    @payslip_detail = PayslipDetail.new(payslip_detail_params)

    if @payslip_detail.save
      render :show, status: :created, location: @payslip_detail
    else
      render json: @payslip_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payslip_details/1
  # PATCH/PUT /payslip_details/1.json
  def update
    if @payslip_detail.update(payslip_detail_params)
      render :show, status: :ok, location: @payslip_detail
    else
      render json: @payslip_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payslip_details/1
  # DELETE /payslip_details/1.json
  def destroy
    @payslip_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payslip_detail
      @payslip_detail = PayslipDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payslip_detail_params
      params.require(:payslip_detail).permit(
          :description,
          :quantity,
          :total,
          :salary_detail_id,
          :payslip_id)
    end
end
