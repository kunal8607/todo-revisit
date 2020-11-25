class CreateTodoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :todo_items do |t|
    	t.string :name
    	t.text :desc
    end
  end
end
