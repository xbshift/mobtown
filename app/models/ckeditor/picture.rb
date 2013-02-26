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
