class WorldCup

    def self.current_match
        current_matches_json = make_api_call(url: "https://worldcupjson.net/matches/current")
    end

    def self.matches_today
        matches_today_json = make_api_call(url: "https://worldcupjson.net/matches/today")
    end

    def self.all_matches_info
        all_matches_info = make_api_call(url: "https://worldcupjson.net/matches")
    end


    private

    def self.make_api_call(url: nil, authentication: false)
        response = Faraday.get(url)
        response_body = JSON.parse(response.body)

    end

end