require 'rails_helper'

RSpec.describe "artifacts/index", type: :view do
  before(:each) do
    assign(:artifacts, [
      Artifact.create!(
        name: "Name",
        picture: "Picture",
        user: nil
      ),
      Artifact.create!(
        name: "Name",
        picture: "Picture",
        user: nil
      )
    ])
  end

  it "renders a list of artifacts" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Picture".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
