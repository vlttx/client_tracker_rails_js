class InvoicesController < ApplicationController

		def new
 		# check if nested and its a proper id
 		@project = Project.find_by_id(params[:project_id].to_i)
		if params[:project_id] && @project
 		@invoice = Invoice.new(project_id: params[:project_id].to_i)
 		else
 		#unnested
 		@invoice = Invoice.new
 		@invoice.build_project
 	end
 	end

	def index
 		if params[:project_id]
 			@project = Project.find_by_id(params[:project_id].to_i)
 			@invoices = @project.invoices
 		else
 		@invoices = current_user.invoices
    end
	end


	def show
		set_invoice
	end

	
	def edit
		set_invoice
	end

	def create
		@invoice = Invoice.new(invoice_params)
		@invoice.user = current_user
		if @invoice.save
			redirect_to invoice_path(@invoice)
		else
			render :new
		end
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
		params.require(:invoice).permit(:service, :rate, :amount, :total, :user_id, :project_id)
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
 	

# 	def show
# 		@project = Project.find(params[:id])
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

# if params[:invoice][:project_attributes]
#  			@invoice = Invoice.new(invoice_params)
#  			@project = Project.new
#  			@invoice.project_id = @project.id
#  			@invoice.save
#  		else