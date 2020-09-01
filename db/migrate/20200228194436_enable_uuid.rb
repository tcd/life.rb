class EnableUuid < ActiveRecord::Migration[6.0]
  # [UUID Primary Key in Rails 6 with PostgreSQL and Active Record](https://pawelurbanek.com/uuid-order-rails)
  # @return [void]
  def change()
    enable_extension("pgcrypto")
  end
end
