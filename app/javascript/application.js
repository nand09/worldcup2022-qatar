// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


const currentMatch = async () => {
    const response = await fetch('https://worldcupjson.net/matches/current');
    const currentMatchesJson = await response.json(); //extract JSON from the http response
    // do something with myJson
    console.log(currentMatchesJson);
    var matchesInfoElement = document.getElementById("matchesInfo");
    
    currentMatchesJson.forEach(function (item, index) {
        console.log(item, index);
    
    })
    
  }

const matchesToday = async () => {
    const response = await fetch("https://worldcupjson.net/matches/today");
    const matchesTodayJson = await response.json();
    var matchesInfoElement = document.getElementById("matchesInfo");

    matchesTodayJson.forEach(function (item, index) {
        // matchesInfoElement.innerHTML += "<p>" + index + ":" + item.away_team.name + "</p>"
        `
        <table>
  <tr>
    <th>Home Team</th>
    <th>Away Team</th>
    <th>Score</th>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>Centro comercial Moctezuma</td>
    <td>Francisco Chang</td>
    <td>Mexico</td>
  </tr>
</table>
        `
    })

}

function showMatchInfo(){
    if (!currentMatch.length == 0) {
        document.getElementById("matchesInfo").innerHTML += currentMatch
        console.log(currentMatch)
    }    
}

// showMatchInfo()
// matchesToday();

