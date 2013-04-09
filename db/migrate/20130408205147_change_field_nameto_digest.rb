class ChangeFieldNametoDigest < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.rename :password_disgest, :password_digest
	end
  end
end
