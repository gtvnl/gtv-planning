require 'rails_helper'

RSpec.describe "weeks/edit", type: :view do
  before(:each) do
    @week = assign(:week, Week.create!(
      :name => "MyString",
      :number => 1,
      :mechanic => ""
    ))
  end

  it "renders the edit week form" do
    render

    assert_select "form[action=?][method=?]", week_path(@week), "post" do

      assert_select "input#week_name[name=?]", "week[name]"

      assert_select "input#week_number[name=?]", "week[number]"

      assert_select "input#week_mechanic[name=?]", "week[mechanic]"
    end
  end
end
