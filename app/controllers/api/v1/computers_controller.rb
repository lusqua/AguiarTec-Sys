class Api::V1::ComputersController < Api::V1::ApiController
  before_action :set_computer, only: [:show, :destroy, :update]
  before_action :set_cliente, only: [:create, :update]

  def index
    @computers = Computer.all
    render json: @computers
  end

  def show
    render json: @computer
  end

  def create
    @computer = Computer.new(computer_params.merge(cliente: @cliente, nome_cliente: @cliente[:name], status: "ENTRADA"))

    if @computer.save
      render json: @computer, status: :created
    else
      render json: @computer.errors, status: :unprocessable_entity
    end
  end

  def update
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
    @cliente = Cliente.find_by name: params[:computer][:cliente]
  end

  def set_computer
    @computer = Computer.find(params[:id])
  end

  def computer_params
    params.require(:computer).permit(:equipamento, :descricao, :defeito, :cliente)
  end
end
