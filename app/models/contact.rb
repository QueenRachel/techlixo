class Contact
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :name, :email, :subject, :body, :photo, :business_id

  validates :name, :email, :subject, :body, presence: true

  # Validar o formato do email com o Regex abaixo
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
                      message: I18n.t('errors.messages.invalid')

  # Validar o tamanho das informações de corpo e nome
  validates :name, length: { maximum: 70 }
  validates :body, length: { maximum: 1000 }

   def initialize(attributes={})
     attributes && attributes.each do |name, value|
       send("#{name}=", value) if respond_to? name.to_sym
     end
   end

  def persisted?
    false
  end

  # @contact.inspect pode ser útil no caso de precisar imprimir as informações
  # atuais do seu objeto quando estiver debuggando erros
  def self.inspect
    "#<#{ self.to_s} #{ self.attributes.collect{ |e| ":#{ e }" }.join(', ') }>"
  end
end
