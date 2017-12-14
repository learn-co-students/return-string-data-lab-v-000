class AddDescriptionToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :description, :string, default: "No desciption."
  end
end
