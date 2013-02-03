class AddAttachmentPhotoToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :events, :photo
  end
end
