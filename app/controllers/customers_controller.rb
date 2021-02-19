require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController

  def initialize(repo)
    @customer_repo = repo
    @view = CustomersView.new
  end


  def list
    customers = @customer_repo.all
    @view.display_all(customers)
  end

  def add
    #should ask the user for a name and price, then store the new customer
    answer = @view.ask_for_name_and_address
    customer = Customer.new(answer)
    @customer_repo.create(customer)
  end

  def edit
    id = @view.ask_for_id.to_i
    answer = @view.ask_for_name_and_address
    customer = Customer.new(answer)
    @customer_repo.update(id, customer)
  end

    def destroy(id)
    id = @view.ask_for_id.to_i
    @customer_repo.destroy(id)
  end
end
