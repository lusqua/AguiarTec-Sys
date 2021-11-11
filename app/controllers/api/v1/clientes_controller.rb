class Api::V1::ClientesController < Api::V1::ApiController
  before_action :set_cliente, only: [:show, :update, :destroy]

  before_action :require_authorization!, only: [:show, :update, :destroy]

  # GET /api/v1/clientes

  def index
    @clientes = current_user.cliente

    render json: @clientes
  end

  # GET /api/v1/clientes/1

  def show
    render json: @cliente
  end

  # POST /api/v1/clientes

  def create
    @cliente = Cliente.new(cliente_params.merge(user: current_user))

    if @cliente.save
      render json: @cliente, status: :created
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/clientes/1

  def update
    if @cliente.update(cliente_params)
      render json: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/clientes/1

  def destroy
    @cliente.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.

  def cliente_params
    params.require(:cliente).permit(:cpf, :name, :email, :phone, :description)
  end

  def require_authorization!
    unless current_user == @cliente.user
      render json: {}, status: :forbidden
    end
  end
end
