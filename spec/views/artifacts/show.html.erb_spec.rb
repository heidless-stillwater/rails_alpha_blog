require 'rails_helper'

RSpec.describe "artifacts/show", type: :view do
  before(:each) do
    assign(:artifact, Artifact.create!(
      name: "Name",
      picture: "Picture",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Picture/)
    expect(rendered).to match(//)
  end
end
