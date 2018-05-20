require 'rails_helper'

# Create articles
# show two articles
# expect articles
RSpec.feature 'List articles' do
  before do
    @article1 = Article.create(title: 'The first article', body: 'The body of first article')
    @article2 = Article.create(title: 'The second article', body: 'The body of second article')
  end

  scenario 'A user list all the articles' do
    visit '/'

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)

    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end
end
