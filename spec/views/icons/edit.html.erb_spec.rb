require 'spec_helper'

describe "icons/edit" do
  before(:each) do
    @icon = assign(:icon, stub_model(Icon,
      :title => "MyString",
      :url => "MyText",
      :xposition => 1,
      :yposition => 1
    ))
  end

  it "renders the edit icon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => icons_path(@icon), :method => "post" do
      assert_select "input#icon_title", :name => "icon[title]"
      assert_select "textarea#icon_url", :name => "icon[url]"
      assert_select "input#icon_xposition", :name => "icon[xposition]"
      assert_select "input#icon_yposition", :name => "icon[yposition]"
    end
  end
end
