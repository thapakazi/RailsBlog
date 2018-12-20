require 'rails_helper'

RSpec.describe 'Deleting article' do

  before do
    @article = Article.create(title: 'Test title', body: 'Test body')
  end

  it 'A user deletes a article' do
    visit '/'

    click_link @article.title
    click_link 'Delete'

    expect(page).to have_content('Article has been deleted!')
    expect(current_path).to eq(articles_path)
  end

end