require 'rails_helper'

RSpec.describe "artifacts/edit", type: :view do
  let(:artifact) {
    Artifact.create!(
      name: "MyString",
      picture: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:artifact, artifact)
  end

  it "renders the edit artifact form" do
    render

    assert_select "form[action=?][method=?]", artifact_path(artifact), "post" do

      assert_select "input[name=?]", "artifact[name]"

      assert_select "input[name=?]", "artifact[picture]"

      assert_select "input[name=?]", "artifact[user_id]"
    end
  end
end
