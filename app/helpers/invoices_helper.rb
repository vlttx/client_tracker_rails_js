module InvoicesHelper
def last_modified(invoice)
    invoice.updated_at.strftime("last modified %b %e, at %l:%M %p")
end

def who_client(invoice)
	if (invoice.project_id)
		@project = Project.find(invoice.project_id)
		@clients = current_user.clients
		@clients.each do |c|
			if c.projects.include?(@project)
				return c.business_name
			end
		end
	else
	 return "no associated client"
	end
end
end
