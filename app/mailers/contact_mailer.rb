class ContactMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  def contact(contact, destino)
    # Aqui são as variáveis que são impressas dentro do arquivo app/views/contact_mailer/contact.html.erb
    # Funciona da mesma maneira como as views de controllers, com diferença da linha `mail`
    # que nós utilizamos para passar os headers e infos do email
    @name = contact.name
    @body = contact.body
    @email = contact.email
    @subject = contact.subject

    mail from: @email, to: destino, subject: @subject
  end
end
