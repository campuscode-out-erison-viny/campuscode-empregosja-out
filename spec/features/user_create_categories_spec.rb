require 'rails_helper'

feature 'User create categories' do
  scenario 'successfully' do 

    visit new_category_path

    fill_in 'Nome', with: 'Categoria'

    click_on 'Criar Categoria'

    expect(page).to have_content('Categoria')
  end
end
