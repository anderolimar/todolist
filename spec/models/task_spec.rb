require 'rails_helper'

RSpec.describe Task, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.title = 'Anything'
    subject.description = 'Anything'
    subject.done = true
    expect(subject).to be_valid
  end
end
