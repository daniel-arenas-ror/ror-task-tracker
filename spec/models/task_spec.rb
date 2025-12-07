require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid with valid attributes" do
    task = build(:task)
    expect(task).to be_valid
  end

  it "is invalid without a description" do
    task = build(:task, description: nil)
    task.valid?
    expect(task.errors[:description]).to include("can't be blank")
  end

  it "is invalid if the description is too long" do
    task = build(:task, description: "a" * 101)
    task.valid?

    expect(task.errors[:description]).to include("is too long (maximum is 100 characters)")
  end
end
