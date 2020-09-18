require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject {
    described_class.new(url: "https://www.youtube.com/watch?v=GY7Ps8fqGdc",
                        title: "Ruby on Rails Tutorial",
                        description: "For quite some time I have been using Rails and NodeJS for all of my web and Android development so I decided to make a Ruby on Rails video tutorial. I will cover a lot in this tutorial. We'll cover installation, MVC, setting up MySQL, the file system, creating controllers and views, embedded Ruby, Routes, communication between the controller and views, migrations and more.")
  }

  it "is not valid without a url" do
    subject.url = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a url" do
    subject.title = nil
    expect(subject).to_not be_valid
  end
end
