module InvoicesHelper
def last_modified(invoice)
    invoice.updated_at.strftime("Last modified %A, %b %e, at %l:%M %p")
end
end
