class MakePassesGeneral < ActiveRecord::Migration
  def change
    add_column :passes, :passable_id, :integer
    add_column :passes, :passable_type, :string
    Pass.all.each do |p|
      p.passable_type = 'Event'
      p.passable_id = p.id
      p.save
    end
    remove_column :passes, :pass_id
  end

end
