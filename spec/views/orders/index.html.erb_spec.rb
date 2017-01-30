require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
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
      ),
      Order.create!(
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
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Delivery Date".to_s, :count => 2
    assert_select "tr>td", :text => "Order Number".to_s, :count => 2
    assert_select "tr>td", :text => "Customer".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Production".to_s, :count => 2
    assert_select "tr>td", :text => "Department".to_s, :count => 2
    assert_select "tr>td", :text => "Quantity".to_s, :count => 2
    assert_select "tr>td", :text => "Hours".to_s, :count => 2
    assert_select "tr>td", :text => "Hours Diff".to_s, :count => 2
    assert_select "tr>td", :text => "Hours Nc".to_s, :count => 2
    assert_select "tr>td", :text => "Item List".to_s, :count => 2
    assert_select "tr>td", :text => "Material Bc".to_s, :count => 2
    assert_select "tr>td", :text => "Material Pc".to_s, :count => 2
  end
end
