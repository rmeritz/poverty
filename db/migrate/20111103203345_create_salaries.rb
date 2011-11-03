class CreateSalaries < ActiveRecord::Migration
  def up
    create_table(:salaries) do |t|
      t.timestamps
      t.column :amount, :string
      t.column :ip, :string
    end
  end

  def down
    drop_table(:salaries)
  end
end
