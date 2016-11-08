require 'rails_helper'

feature 'User create categories' do
  scenario 'successfully' do 

    visit new_category_path

    fill_in 'Nome', with: 'Categoria'

    click_on 'Criar Categoria'

    expect(page).to have_content('Categoria')
  end

  scenario 'Category already exists' do
    category = Category.create(name: 'Categoria')

    visit new_category_path

    fill_in 'Nome', with: 'Categoria'

    click_on 'Criar Categoria'

    expect(page).to have_content('Categoria já utilizada')
    expect(page).to have_current_path(categories_path)
  end
end
