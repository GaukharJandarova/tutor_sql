class PagesController < ApplicationController
    def home
        @courses = Course.all
    end
def about
end
def help
end
# def tutors
# end
# def articles
# end
# def privacy_policy
# end
# def blog
# end
end
