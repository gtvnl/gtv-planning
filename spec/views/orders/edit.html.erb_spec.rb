require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :delivery_date => "MyString",
      :order_number => "MyString",
      :customer => "MyString",
      :status => "MyString",
      :description => "MyString",
      :production => "MyString",
      :department => "MyString",
      :quantity => "MyString",
      :hours => "MyString",
      :hours_diff => "MyString",
      :hours_nc => "MyString",
      :item_list => "MyString",
      :material_bc => "MyString",
      :material_pc => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_delivery_date[name=?]", "order[delivery_date]"

      assert_select "input#order_order_number[name=?]", "order[order_number]"

      assert_select "input#order_customer[name=?]", "order[customer]"

      assert_select "input#order_status[name=?]", "order[status]"

      assert_select "input#order_description[name=?]", "order[description]"

      assert_select "input#order_production[name=?]", "order[production]"

      assert_select "input#order_department[name=?]", "order[department]"

      assert_select "input#order_quantity[name=?]", "order[quantity]"

      assert_select "input#order_hours[name=?]", "order[hours]"

      assert_select "input#order_hours_diff[name=?]", "order[hours_diff]"

      assert_select "input#order_hours_nc[name=?]", "order[hours_nc]"

      assert_select "input#order_item_list[name=?]", "order[item_list]"

      assert_select "input#order_material_bc[name=?]", "order[material_bc]"

      assert_select "input#order_material_pc[name=?]", "order[material_pc]"
    end
  end
end
