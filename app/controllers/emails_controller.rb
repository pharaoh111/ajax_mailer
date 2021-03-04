class EmailsController < ApplicationController
    

def index
    @emails = Email.all       
end

def new
    @emails = Email.all 
end

def show 
    @emails = Email.find(params[:id])
    if @emails.read == false
    @emails.update_attributes(read: true)
    elsif @emails.read == true
    puts @emails.update_attributes(read: false)
    end
end



def create
    @email_listing = Email.create(object: Faker::Internet.email, body: Faker::Lorem.sentence)
    @email_listing.save
    respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
    end
end

def destroy
    @emails = Email.find(params[:id])
    @emails.destroy
    redirect_to root_path
  end

end
