# == Schema Information
#
# Table name: ckeditor_assets
#
#  id                :integer          not null, primary key
#  data_file_name    :string(255)      not null
#  data_content_type :string(255)
#  data_file_size    :integer
#  assetable_id      :integer
#  assetable_type    :string(30)
#  type              :string(30)
#  width             :integer
#  height            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
    :url  => "/system/ckeditor_assets/pictures/:style/:basename.:extension",
    :path => ":rails_root/public/system/ckeditor_assets/pictures/:style/:basename.:extension",
    :styles => { :content => '300>', :thumb => '118x100#' }
	
	validates_attachment_size :data, :less_than => 5.megabytes
	validates_attachment_presence :data
	
	def url_content
	  url(:content)
	end
end
