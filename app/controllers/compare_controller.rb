class CompareController < ApplicationController
    def index
    end
    def create
        @details = params[:search][:moviename].split(',')
        @bestRating = '0'
        @arrayAr = []
        @details.each do |d|
            @moviename = d.split('-')[0].gsub(' ','+')
            @year = d.split('-')[1]
            if @year
                @year = d.split('-')[1].gsub(' ','')
            end
            if @year
                @json = JSON.parse(open("http://www.omdbapi.com/?t=" + @moviename + "&plot=full&y=" + @year) { |x| x.read })
                else
                    @json = JSON.parse(open("http://www.omdbapi.com/?t=" + @moviename + "&plot=full") { |x| x.read })
            end
            @arrayAr.push(@json)
        end
        render 'new'
    end
    def new
    end
    private
end
