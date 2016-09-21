var HueApi = require("node-hue-api").HueApi;

var displayResult = function(result) {
    console.log(JSON.stringify(result, null, 2));
};

var hostname = "192.168.1.2",
    username = "5UTaO-eL6S6d5ez6mjnIBuOlsOwAHJxvkYJaomfC",
    api;

api = new HueApi(hostname, username);

// --------------------------
// Using a promise
//api.description().then(displayResult).done();
//api.fullState().then(displayResult).done();
api.lights()
    .then(displayResult)
    .done();
