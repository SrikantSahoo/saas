class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end 
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      name = param[:contact][:name]
      email = param[:contact][:email]
      body = param[:contact][:comments]
      ContactMailer.contact_email(name,email,body).deliver
      flash[:success]= 'Message sent'
      redirect_to new_contact_path
    else
      flash[:danger]= 'Error Occured. Message sent failed'
      redirect_to new_contact_path
    end
  end 
  
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end