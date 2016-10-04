var HueApi = require("node-hue-api").HueApi;

var hostname = "192.168.1.2",
    userDescription = "Jasalt's Hue Controller";

var displayUserResult = function(result) {
    console.log("Created user: " + JSON.stringify(result));
};

var displayError = function(err) {
    console.log(err);
};

var hue = new HueApi();

// --------------------------
// Using a promise
hue.registerUser(hostname, userDescription) 
    .then(displayUserResult) 
    .fail(displayError) 
    .done();
