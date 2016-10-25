require 'spec_helper'

describe "icons/show" do
  before(:each) do
    @icon = assign(:icon, stub_model(Icon,
      :title => "Title",
      :url => "MyText",
      :xposition => 1,
      :yposition => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
