require 'rails_helper'

RSpec.describe "weeks/new", type: :view do
  before(:each) do
    assign(:week, Week.new(
      :name => "MyString",
      :number => 1,
      :mechanic => ""
    ))
  end

  it "renders new week form" do
    render

    assert_select "form[action=?][method=?]", weeks_path, "post" do

      assert_select "input#week_name[name=?]", "week[name]"

      assert_select "input#week_number[name=?]", "week[number]"

      assert_select "input#week_mechanic[name=?]", "week[mechanic]"
    end
  end
end
