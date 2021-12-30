const readline = require("readline");
const r = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
r.question("Enter occasion:  ", function(occasion) {
switch(occasion)
{
    case "New Year" :
                    console.log("Happy New Year");
                    break;
                    
    case "Birthday" :
                    console.log("Happy Birthday");
                    break;  
    
    case "Christmas" :
                    console.log("Merry Chrismas");
                    break;    

    case "Anniversary" :
                    console.log("Happy Anniversary");
                    break;  

    default :
                    console.log("Please Enter correct occassion");                    

}
r.close();

});