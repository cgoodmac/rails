class AddTenantIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :tenant_id, :integer
  end
end
