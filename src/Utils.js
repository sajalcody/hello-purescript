/* In Javascript, 
-> Date.now() returns a current time in Unix Timestamp i.e. an Int
-> Date.now returns a function which returns value of Date.now()
*/

// FFI: getTime :: Effect Int
exports.getTimeIntEff = Date.now;
/* OR
exports.getTime = function(){
    return Date.now();
}
*/

// FFI: getTimeInt :: Int
exports.getTimeInt = Date.now();

exports.getTimeIntAsStrEff = Date.now;

exports.getTimeIntAsStr = Date.now(); //(Date.now()).toString();

/* In Javascript,
-> new Date or new Date() returns a Date object which represents Date in full string format
-> (new Date).toISOString() returns a string which represents Date in ISO format
-> (new Date).toISOString is function to (new Date).toISOString()
*/

//FFI: getTimeStr :: Effect String
exports.getTimeStrEff = function(){
    return (new Date()).toISOString();
}
// exports.getTimeStrEff = (new Date()).toISOString; // -> ERROR why??

//FFI: getTimeStr :: String
exports.getTimeStr = (new Date()).toISOString();

//This is totally wrong: Wrapping an inbuilt function inside a function
// exports.getTime = function(){
//     return Date.now;
// }

exports.getId = function(){
    window.id = window.id || 0;
    return window.id;
}

dummyF = "dummy Value";

callDummyF = function(){
    try{
        return dummyF;
    }
    catch (e){
        console.log(e.message + ". Defaulting to false");
        return "false";
    }
}

exports.getDummyEffV = callDummyF();

// var version = "1.2.3";

var getVersion = function(){
    try {
        var vArray = version.split('.');
        return parseInt(vArray[0]);
    }
    catch (e){
        console.log(e.message + ". Defaulting to 0");
        return 0;
    }
}

exports.callVersion = getVersion();