class Api::V1::PayslipsController < ApplicationController
  before_action :set_payslip, only: %i[ show update destroy ]

  # GET /payslips
  # GET /payslips.json
  def index
    @payslips = Payslip.all.order(:id)
    render json: @payslips
  end

  # GET /payslips/1
  # GET /payslips/1.json
  def show
    # render json: @payslip
  end

  # POST /payslips
  # POST /payslips.json
  def create
    payslip_details = []
    employee_id = payslip_params[:employee_id]
    @employee = Employee.find(employee_id)
    @salary_dets = @employee.role.salary_details

    # Adding salary details send by user.
    payslip_params[:salary_details].each do |salary|
      next if salary[:value] == 0
      @salary_det = SalaryDetail.find(salary[:id])
      pd = {
          salary_detail_id: salary[:id],
          description: @salary_det.name,
          quantity: salary[:value],
          total: salary[:value] * @salary_det.value
      }
      payslip_details.append(pd)
      # Extra time
      if @salary_det.is_main
        @salary_dets.each do |sal|
          next if salary[:value] < sal.conditional_value
          quantity = salary[:value] - sal.conditional_value
          next if quantity == 0
          payslip_details.append({
            salary_detail_id: salary[:id],
            description: sal.name,
            quantity: quantity,
            total: quantity * sal.value
          })
        end
      end
    end

    # Grocery vouchers
    @grocery_vouchers = SalaryDetail.where(
      role_id: 1,
      is_discount: false,
      is_quantity: false
    )
    @grocery_vouchers.each do |gv|
      total = payslip_details.reduce(0) { |t, pd| t + pd[:total] }
      payslip_details.append({
        salary_detail_id: gv.id,
        description: gv.name,
        quantity: gv.value/100,
        total: total * (gv.value/100)
      })
    end
    # End Grocery vouchers

    # Discounts
    @discounts = SalaryDetail.where(role_id: 1, is_discount: true)
    @discounts.each do |discount|
      total = payslip_details.reduce(0) { |t, pd| t + pd[:total] }
      next if total < discount.conditional_value
      payslip_details.append({
        salary_detail_id: discount.id,
        description: discount.name,
        quantity: discount.value/100,
        total: -(total * (discount.value/100))
      })
    end
    # End Discounts

    @payslip = Payslip.new({
      employee_id: employee_id,
      payslip_details_attributes: payslip_details,
      total: payslip_details.reduce(0) { |t, pd| t + pd[:total] }
    })

    if @payslip.save
      render json: @payslip, status: :created, location: api_v1_payslips_path(@payslip)
    else
      render json: @payslip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payslips/1
  # PATCH/PUT /payslips/1.json
  def update
    if @payslip.update(payslip_params)
      render :show, status: :ok, location: @payslip
    else
      render json: @payslip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payslips/1
  # DELETE /payslips/1.json
  def destroy
    @payslip.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payslip
      @payslip = Payslip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payslip_params
      params.require(:payslip)
        .permit(:employee_id,
        salary_details: [:id, :value])
    end
end
