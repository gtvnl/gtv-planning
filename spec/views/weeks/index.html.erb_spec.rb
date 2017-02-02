require 'rails_helper'

RSpec.describe "weeks/index", type: :view do
  before(:each) do
    assign(:weeks, [
      Week.create!(
        :name => "Name",
        :number => 2,
        :mechanic => ""
      ),
      Week.create!(
        :name => "Name",
        :number => 2,
        :mechanic => ""
      )
    ])
  end

  it "renders a list of weeks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
