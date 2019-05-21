class InvoicesController < ApplicationController
	before_action :current_user

		def new
 		# check if nested and its a proper id
 		@project = Project.find_by_id(params[:project_id].to_i)
		# if params[:project_id] && @project
 		@invoice = Invoice.new(project_id: params[:project_id].to_i)
 		@invoice
 		# @else
 		# #unnested
 		# @invoice = Invoice.new
 		# @invoice.build_projectß
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
		params.require(:invoice).permit(:service, :rate, :amount, :total, :user_id, :project_id, :created_at)
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
 	