require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :delivery_date => "Delivery Date",
      :order_number => "Order Number",
      :customer => "Customer",
      :status => "Status",
      :description => "Description",
      :production => "Production",
      :department => "Department",
      :quantity => "Quantity",
      :hours => "Hours",
      :hours_diff => "Hours Diff",
      :hours_nc => "Hours Nc",
      :item_list => "Item List",
      :material_bc => "Material Bc",
      :material_pc => "Material Pc"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Delivery Date/)
    expect(rendered).to match(/Order Number/)
    expect(rendered).to match(/Customer/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Production/)
    expect(rendered).to match(/Department/)
    expect(rendered).to match(/Quantity/)
    expect(rendered).to match(/Hours/)
    expect(rendered).to match(/Hours Diff/)
    expect(rendered).to match(/Hours Nc/)
    expect(rendered).to match(/Item List/)
    expect(rendered).to match(/Material Bc/)
    expect(rendered).to match(/Material Pc/)
  end
end
