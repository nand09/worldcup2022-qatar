class WorldCup
    # url for getting the flag image of a country.
    # https://api.fifa.com/api/v3/picture/flags-sq-3/ARG

    def self.current_match
        current_matches_json = make_api_call(url: "https://worldcupjson.net/matches/current")
    end

    def self.matches_today
        matches_today_json = make_api_call(url: "https://worldcupjson.net/matches/today")
    end

    def self.all_matches_info
        all_matches_info = make_api_call(url: "https://worldcupjson.net/matches")
    end

    def self.last_match
        completed_matches = []
        self.all_matches_info.each do |match|
            if match["status"] == "completed"
                completed_matches << match
            end
        end
        completed_matches.last
    end

    def self.next_match
        future_matches = []
        self.all_matches_info.each do |match|
            if match["status"] == "future_scheduled"
                future_matches << match
            end
        end
        future_matches.first
    end

    def self.quarter_final_matches
        quarter_final_matches = []
        self.all_matches_info.each do |match|
            if match["stage_name"] == "Quarter-final"
                quarter_final_matches << match
            end
        end
    end


    private

    def self.make_api_call(url: nil, authentication: false)
        response = Faraday.get(url)
        response_body = JSON.parse(response.body)

    end

end