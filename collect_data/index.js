require('dotenv').config()
const request = require('request');
const fs = require('fs')
var API_KEY = process.env.API_KEY

function getImageAddress(url) {
    return new Promise((resolve, reject) => {
        request.get(url, function (err, res, body) {
            resolve(res.request.uri.href)
        });
    })

}

request.get(`https://maps.googleapis.com/maps/api/place/textsearch/json?query=new%20york%20blood%20donation&location=40.7549316,-74.0033844&radius=10000&types=health&key=${API_KEY}`, {}, async (error, response, body) => {
    let json = JSON.parse(response.body)
    let results = json.results
    let i = 0;
    while (i < results.length) {
        console.log(results[i]['formatted_address'])
        var imageAddress;
        if (results[i]['photos'] != null) {
            let photoReference = results[i]['photos'][0]['photo_reference'] || ""
            imageAddress = await getImageAddress(`https://maps.googleapis.com/maps/api/place/photo?maxwidth=1280&photoreference=${photoReference}&key=${API_KEY}`)
        } else {
            imageAddress = "https://portaltibia.com.br/wp-content/themes/crystalskull/img/defaults/default.jpg"
        }
        results[i]['image'] = imageAddress;
        i++;
    }
    fs.writeFileSync('./blood_banks.json', JSON.stringify(results));
    process.exit(0)
});