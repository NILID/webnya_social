require 'spec_helper'

describe "icons/index" do
  before(:each) do
    assign(:icons, [
      stub_model(Icon,
        :title => "Title",
        :url => "MyText",
        :xposition => 1,
        :yposition => 2
      ),
      stub_model(Icon,
        :title => "Title",
        :url => "MyText",
        :xposition => 1,
        :yposition => 2
      )
    ])
  end

  it "renders a list of icons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
