require 'rails_helper'

RSpec.feature 'Show a article' do
  before do
    @article = Article.create(title: 'The first article', body: 'Body of the article')
  end

  scenario 'A user is shown an article' do
    visit '/'
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end