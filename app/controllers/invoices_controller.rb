class InvoicesController < ApplicationController
	def index
		@invoices = current_user.invoices

	end

	def new
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
		params.require(:invoice).permit(:service, :rate, :amount, :total)
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
