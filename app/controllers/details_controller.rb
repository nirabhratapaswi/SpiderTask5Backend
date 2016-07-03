class DetailsController < ApplicationController
    def index
    end
    def create
        @details = params[:search]
        @moviename = @details[:moviename].gsub(' ','+')
        require 'net/http'
        require 'open-uri'
        @year = @details[:year]
        if @year
            @json = JSON.parse(open("http://www.omdbapi.com/?t=" + @moviename + "&plot=full&y=" + @year) { |x| x.read })
            else
                @json = JSON.parse(open("http://www.omdbapi.com/?t=" + @moviename + "&plot=full") { |x| x.read })
        end
        render 'new'
    end
    def new
    end
end
