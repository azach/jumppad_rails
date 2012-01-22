module ApplicationHelper
	def page_title(content_for_title = nil)
	  @title = (content_for_title + " #{HTMLEntities.new.decode('&mdash;')} " if content_for_title).to_s + 'JumpPad'
	end
end