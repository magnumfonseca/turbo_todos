class Add < ActiveRecord::Migration[7.0]
  def change
    add_reference :todos, :user, index: true
  end
end
