class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    # Esta linha checa se todas as valicações são verdadeiras
    # Nada é salvo em banco, portanto não usar o .save
    if @contact.valid?
      @contact.store_photo!
      destino = Business.find(contact_params[:business_id]).email
      # Envia o email de contato
      ContactMailer.contact(@contact, destino).deliver_now
      # limpar os campos
      @contact = Contact.new
      # enviar a mensagem de sucesso
      @message = 'Contato enviado com sucesso'
    else
      # enviar a mensagem de erro
      @message = 'Corrija os erros e tente novamente'
    end

    # Renderiza o JS contendo as infos do form de contato
    render :create
  end

  def contact_params
    # Certificar de que apenas esses campos são aceitos no POST
    params.require(:contact).permit(
      :business_id, :name, :email, :subject, :body, :photo
    )
  end
end
