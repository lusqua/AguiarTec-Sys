class Api::V1::ComputerController < Api::V1::ApiController
  before_action :set_computer, only: [:show, :destroy, :update]
  before_action :set_cliente

  def index
    @computers = @cliente.computer.all
    render json: @computers
  end

  def show
    @computer = @cliente.computer.find(params[:id])
    render json: @computer
  end

  def create
    @computer = Computer.new(computer_params.merge(cliente: @cliente))

    if @computer.save
      render json: @computer, status: :created
    else
      render json: @computer.errors, status: :unprocessable_entity
    end
  end

  def update
    @computer = Computer.find(params[:id])
    if @computer.update(computer_params)
      render json: @computer
    else
      render json: @computer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @computer.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_cliente
    @cliente = Cliente.find(params[:cliente_id])
  end

  def set_computer
    @computer = Computer.find(params[:id])
  end

  def computer_params
    params.require(:computer).permit(:equipamento, :descricao, :defeito)
  end
end
