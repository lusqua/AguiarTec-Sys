class CreateComputers < ActiveRecord::Migration[6.1]
  def change
    create_table :computers do |t|
      t.string :equipamento
      t.string :descricao
      t.string :defeito
      t.string :laudo
      t.string :nome_cliente
      t.string :status
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
