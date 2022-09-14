class StaticPagesController < ApplicationController
    require 'flickr'

    def index
        flickr = Flickr.new ENV["api_key"], ENV["api_secret"]

        begin
            @photos = flickr.people.getPublicPhotos(user_id: params[:user_id])
        rescue
            @photos = []
        end
    end
end
