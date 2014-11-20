class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    
    t.string :email
    t.string :password_digest

    t.timestamps
    
    has_secure_password

    attr_accessible :email, :password, :password_confirmation

    validates_uniqueness_of :email

    end
  end
end

  