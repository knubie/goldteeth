class ChangeDatatypeForSlidesCaption < ActiveRecord::Migration
  def up
    change_table :slides do |t|
      t.change :caption, :text
    end
  end

  def down
    change_table :slides do |t|
      t.change :caption, :string
    end
  end
end
