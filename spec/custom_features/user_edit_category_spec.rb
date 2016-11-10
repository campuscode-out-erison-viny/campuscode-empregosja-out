require 'rails_helper'

feature 'User edit categories' do 
  scenario 'successfully' do

    category = Category.create(name: 'GP')

    visit edit_category_path(category)

    fill_in 'Nome', with: 'Meretriz de codigo'

    click_on 'Atualizar Categoria'

    expect(page).to have_content('Categoria atualizada com sucesso')
    expect(page).to have_current_path(category_path(category))
  end

  scenario 'Should without data' do
    category = Category.create(name: 'GP')

    visit edit_category_path(category)

    fill_in 'Nome', with: ''

    click_on 'Atualizar Categoria'

    expect(page).to have_content('Não foi possível atualizar a categoria')
  end
end