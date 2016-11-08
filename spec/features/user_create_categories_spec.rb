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
  end

  scenario 'Should fill all fields' do
    visit new_category_path

    click_on 'Criar Categoria'
    
    expect(page).to have_current_path(new_category_path)
    expect(page) have_content 'Categoria em branco'    
  end
end
