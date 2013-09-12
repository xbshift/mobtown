class AddAttachmentPhotoToStaff < ActiveRecord::Migration
  def self.up
    change_table :staff do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :staff, :photo
  end
end
