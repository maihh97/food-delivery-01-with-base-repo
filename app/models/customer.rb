class Customer
  attr_accessor :name, :id, :address

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def to_csv_row
    [@id, @name, @address]
  end

  def self.headers
    %w(id name address)
  end
end
