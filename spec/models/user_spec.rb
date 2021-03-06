require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(username: "Anything",
                        password: "Lorem ipsum")
  }

  it "has many movies" do
    should respond_to(:movies)
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
