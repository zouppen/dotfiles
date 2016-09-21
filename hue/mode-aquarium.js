var hue = require("node-hue-api"),
    HueApi = hue.HueApi,
    lightState = hue.lightState;

var displayResult = function(result) {
    console.log(JSON.stringify(result, null, 2));
};

var displayError = function(err) {
    console.error(err);
};

var host = "192.168.1.2",
    username = "5UTaO-eL6S6d5ez6mjnIBuOlsOwAHJxvkYJaomfC",
    api = new HueApi(host, username);

/////// Continuous Transition
var transTime = 5000;

var darkBlue = lightState.create().on().rgb(0,0,255).transition(transTime);
var lightBlue = lightState.create().on().rgb(20,50,200).transition(transTime);

function transition(i){
    if (i > 1000) {
        return;
    }
    api.setLightState(1, lightBlue)
        .then(function(res){
            displayResult(res);
            console.log("lightBLue, waiting");
            setTimeout(function(){
                api.setLightState(1, darkBlue)
                    .then(
                        function(res){
                            displayResult(res);
                            console.log("darkBLue, waiting");
                            setTimeout(function(){
                                i++;
                                transition(i);
                            }, transTime);
                        }
                    )
                    .fail(displayError)
                    .done();        
            }, transTime);
            
        })
        .fail(displayError)
        .done();
    
}

var i = 1;
transition(i);

console.log("done");


/////// Every hour / half hour notification
var alertState = lightState.create().alertShort();

function alertLight(){
    api.setLightState(1, alertState)
        .then(displayResult)
        .fail(displayError)
        .done();    
}

function tick()
{
    //get the mins of the current time
    var mins = new Date().getMinutes();
    if(mins == "00"){
        alertLight();
        setTimeout(function(){
            alertLight();
        }, 2000);
    }
    if(mins == "30"){
        alertLight();
    }
    console.log('Tick ' + mins);
}

setInterval(tick, 1000);
alertLight();
