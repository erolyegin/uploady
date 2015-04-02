class PhotosController < ApplicationController
 before_action :authenticate_user!
 def index
   @photos = current_user.photos #currently logged in user
     #@photos = Photo.all
 end

 def new
     @photo = Photo.new
 end

 def create
     @photo = Photo.new(photo_params)
   @photo.user_id = current_user.id
     if @photo.save
         redirect_to photos_path
     else
         render :new
     end
 end

 def edit
   @photo = current_user.photos.find(params[:id])
   #@photo = Photo.find(params[:id])
 end

 def update
   @photo = current_user.photos.find(params[:id])
   #@photo = Photo.find(params[:id])
   if @photo.update_attributes(photo_params)
     redirect_to photos_path
   else
     render :edit
   end
 end

 private #only this controller can call this parameter #can be reverted to public/protected

 def photo_params
     params.require(:photo).permit(:filename, :caption) 
 end
end
