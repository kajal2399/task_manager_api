require 'rails_helper'

RSpec.describe Task, type: :model do
  # Test for presence of title
  it 'is not valid without a title' do
    task = Task.new(title: nil, status: 'To Do')
    expect(task).not_to be_valid
    expect(task.errors.messages[:title]).to include("can't be blank")
  end

  # Test for inclusion of status
  it 'is not valid with a status outside the predefined choices' do
    task = Task.new(title: 'Valid Title', status: 'Invalid Status')
    expect(task).not_to be_valid
    expect(task.errors.messages[:status]).to include("is not included in the list")
  end

  # Test for a valid task
  it 'is valid with a title and a valid status' do
    task = Task.new(title: 'Valid Title', status: 'To Do')
    expect(task).to be_valid
  end
end
