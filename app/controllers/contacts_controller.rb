class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_email(@contact).deliver
      flash[:success] = '問い合わせを受け付けました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
