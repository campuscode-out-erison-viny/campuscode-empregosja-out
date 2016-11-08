require 'rails_helper'

feature 'Visitor view job details on company page' do
  scenario 'successfully' do
    #setup
    #criar uma vaga (empresa, categoria...)
    category = Category.create(name: 'Dev')
    category_ux = Category.create(name: 'UX')


    company = Company.create(name: 'R7',
                             location: 'SP',
                             mail: 'contato@r7.com.br',
                             phone: '2369-3476')

    job = Job.create(title: 'Dev Master',
                     location: 'Rio de Janeiro',
                     company: company,
                     category: category,
                     description: 'Vaga para Dev Master para Bootcamp Rails')

    another_job = Job.create(title: 'UX Senior',
                             location: 'São Paulo',
                             company: company,
                             category: category_ux,
                             description: 'UX com experiência em redes sociais')

    #steps

    visit company_path(company)

    click_link job.title

    expect(page).to have_css('h1', text: job.title)
    expect(page).to have_content(job.description)
    expect(page).to have_content(company.name)



    #visitar rooot
    #clicar nas coisas
    # click_on, click_button, click_link


    #expectativas
    #expect(page).to have_content/have_link/have_button 'banana'
  end

  scenario '' do
  end
end