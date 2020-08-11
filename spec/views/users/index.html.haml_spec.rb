require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        name: "Name",
        public_uid: "Public Uid"
      ),
      User.create!(
        name: "Name",
        public_uid: "Public Uid"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Public Uid".to_s, count: 2
  end
end
