class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :phone
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
