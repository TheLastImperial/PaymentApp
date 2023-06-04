class Api::V1::SalaryDetailsController < ApplicationController
  before_action :set_salary_detail, only: %i[ show update destroy ]

  def generic
    @generic_salary_details = SalaryDetail
      .where(role_id: nil, is_discount: false, is_quantity: true)
      .order(is_main: :desc).order(:id)
    render json: @generic_salary_details
  end

  # GET /salary_details
  # GET /salary_details.json
  def index
    @salary_details = SalaryDetail.all.order(:id)
    render json: @salary_details
  end

  # GET /salary_details/1
  # GET /salary_details/1.json
  def show
  end

  # POST /salary_details
  # POST /salary_details.json
  def create
    @salary_detail = SalaryDetail.new(salary_detail_params)

    if @salary_detail.save
      render json: @salary_detail, status: :created, location: api_v1_salary_details_path(@salary_detail)
    else
      render json: @salary_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /salary_details/1
  # PATCH/PUT /salary_details/1.json
  def update
    if @salary_detail.update(salary_detail_params)
      render json: @salary_detail, status: :ok, location: api_v1_salary_details_path(@salary_detail)
    else
      render json: @salary_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /salary_details/1
  # DELETE /salary_details/1.json
  def destroy
    @salary_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary_detail
      @salary_detail = SalaryDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salary_detail_params
      params.require(:salary_detail).permit(:name,
        :value,
        :default_value,
        :conditional_value,
        :is_quantity,
        :is_discount,
        :is_main,
        :role_id
      )
    end
end
