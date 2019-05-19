class InvoicesController < ApplicationController
	def index
		@invoices = current_user.invoices

	end

	def new
		byebug
		@invoice = Invoice.new
	end


	def show
		set_invoice
	end

	
	def edit
		
	end

	def create
		@invoice = Invoice.new(invoice_params)
		@invoice.user = current_user
		@invoice.save
		redirect_to invoice_path(@invoice)
	end


	 def update 
	 	set_invoice
    	if @invoice.update(invoice_params)
      	redirect_to invoices_path
     else 
      set_invoice
      render :edit
    end
  end

	 def destroy
	 	set_invoice
	 	@invoice.destroy
	 	redirect_to invoices_path
  end

	private

	def invoice_params
		params.require(:invoice).permit(:service, :rate, :amount, :total, :project_id, :user_id)
	end

	def set_invoice
	@invoice = Invoice.find_by(id: params[:id])
		if !@invoice
			redirect_to invoices_path
	end
	end

	private
	def set_invoice
	@invoice = Invoice.find_by(id: params[:id])
end


end


# def new
# 		# check if nested and its a proper id
# 		if params[:client_id] && @client = Client.find_by_id(params[:client_id].to_i)
# 		@project = Project.new(client_id: params[:client_id].to_i)
# 		else
# 		#unnested
# 		@project = Project.new
# 	end
# 	end

	
# 	def index
# 		if params[:client_id]
# 			@projects = Client.find_by_id(params[:client_id].to_i).projects
# 		else
# 		@projects = current_user.projects
# 	end
# 	end

# 	def show
# 		@project = Project.find(params[:id])
# 	end

# 	def update
# 	end

# 	def create
# 		@project = current_user.projects.build(project_params)
# 		if @project.save
# 			redirect_to project_path(@project)
# 			else
# 			render :new
# 		end
# 			end

		#  redirect_to user_projects_path
		# @project = Project.new(project_params)
		# @project.client_id = @client.id
		# @project.save
		# redirect_to client_projects_path


		# @client = Client.new(client_params)
		# @client.user = current_user
		# @client.save
		# redirect_to client_path(@client)
		# current_user.clients.build(client_params)
		# if @client.save
		# redirect_to client_path(@client)
		# else
		# render :new
		# @client.user_id = current_user.id equals @client.user = current user



# 	private

# 	def project_params
# 		params.require(:project).permit(:description, :client_id)
# 	end

# 	def set_client
# 		@client = Client.find_by(id: params[:client_id].to_i)
# 	end
# end


# def update 
# 	 	set_client
#     	if @client.update(client_params)
#       	redirect_to clients_path
#      else 
#       set_client
#       render :edit
#     end
#   end

# 	 def destroy
# 	 	set_client
# 	 	@client.destroy
# 	 	redirect_to clients_path