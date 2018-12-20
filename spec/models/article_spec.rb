require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'validates article with valid attributes' do
    article = Article.new(title: 'Test title', body: 'Test body')
    expect(article).to be_valid
  end

  it 'does not validate article without title' do
    article = Article.new(title: nil, body: 'Test body')
    expect(article).not_to be_valid
  end

  it 'does not validate article without body' do
    article = Article.new(title: 'Test title', body: nil)
    expect(article).not_to be_valid
  end
end
