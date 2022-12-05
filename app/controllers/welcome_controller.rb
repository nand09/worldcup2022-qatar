class WelcomeController < ApplicationController

    def index
        @current_matches = WorldCup.current_match
        @matches_today = WorldCup.matches_today
        @all_matches_data = WorldCup.all_matches_info
        @last_match = WorldCup.last_match
    end
end
