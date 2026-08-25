class SgangsController < ApplicationController
  before_action :set_sgang, only: %i[ show edit update destroy ]
  before_action :correct_user, only: [ :edit, :update, :destroy ]


  # GET /sgangs or /sgangs.json
  def index
    @sgangs = Sgang.all
  end

  # GET /sgangs/1 or /sgangs/1.json
  def show
  end

  # GET /sgangs/new
  def new
    # @sgang = Sgang.new
    @sgang = current_user.sgang.build
  end

  # GET /sgangs/1/edit
  def edit
  end

  # POST /sgangs or /sgangs.json
  def create
    # @sgang = Sgang.new(sgang_params)
    @sgang = current_user.sgang.build(sgang_params)

    respond_to do |format|
      if @sgang.save
        format.html { redirect_to @sgang, notice: "Sgang was successfully created." }
        format.json { render :show, status: :created, location: @sgang }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @sgang.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /sgangs/1 or /sgangs/1.json
  def update
    respond_to do |format|
      if @sgang.update(sgang_params)
        format.html { redirect_to @sgang, notice: "Sgang was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @sgang }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @sgang.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /sgangs/1 or /sgangs/1.json
  def destroy
    @sgang.destroy!

    respond_to do |format|
      format.html { redirect_to sgangs_path, notice: "Sgang was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def correct_user
    @sgang = current_user.sgangs.find_by(id: params[:id])

    redirect_to sgangs_path, notice: "Not Authorized To Edit This Member" if @sgang.nil?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sgang
      @sgang = Sgang.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sgang_params
      params.expect(sgang: [ :first_name, :last_name, :phone, :facebook, :user_id ])
    end
end
