class Order
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  index :order_number

  field :delivery_date, :type => String
  field :order_number, :type => String
  field :customer, :type => String
  field :status, :type => String
  field :description, :type => String
  field :production, :type => String
  field :department, :type => String
  field :quantity, :type => String
  field :hours, :type => String
  field :hours_diff, :type => String
  field :hours_nc, :type => String
  field :item_list, :type => String
  field :material_bc, :type => String
  field :material_pc, :type => String
end
