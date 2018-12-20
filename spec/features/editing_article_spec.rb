require 'rails_helper'

RSpec.feature 'Editing an Article' do
  before do
    @article = Article.create(title: 'Test title', body: 'Test body')
  end

  scenario 'A user edits an article' do
    visit '/'

    click_link @article.title
    click_link 'Edit'

    fill_in 'Title', with: 'Update title'
    fill_in 'Body', with: 'Update body'

    click_button 'Update'

    expect(page).to have_content('Article has been edited!')
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario 'A user fails to edit an article' do
    visit '/'

    click_link @article.title
    click_link 'Edit'

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Update body'

    click_button 'Update'

    expect(page).to have_content('Article could not be edited!')
    expect(page.current_path).to eq(article_path(@article))
  end

end