require 'rails_helper'

feature 'User edit jobs' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    visit edit_company_path(company)

    fill_in 'Nome',      with: 'Company'
    fill_in 'Local',     with: 'São Paulo'
    fill_in 'Email',     with: 'mail@company.com.br'
    fill_in 'Telefone',  with: '1234-1234'

    click_on 'Atualizar Empresa'

    expect(page).to have_css('h1', text: 'Desenvolvedor')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('mail@company.com.br')
    expect(page).to have_content('1234-1234')
  end
end
