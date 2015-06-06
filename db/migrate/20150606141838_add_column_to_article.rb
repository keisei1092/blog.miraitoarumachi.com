class AddColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :category, :string, :after => :title
  end
end
