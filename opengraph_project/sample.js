const openGraph = require("open-graph");
const Card = require('../Server/Model/cardModel');
let url = "https://developer.twitter.com/en/docs/twitter-for-websites/cards/overview/summary";  

//Youtube is working
//Instagram is working
//Articles (WEBSITE link) link is working
//twiiter is NOT working

let data;   
let ax = openGraph(url, ( error, result) => {
    // console.log(typeof result.title);    
    // // return result;     /// this is object 
    // //  let data = result;  
    // console.log(result);    
    // // let me = JSON.parse(result);
    // // return me;
    // let a = document.getElementById("title_name");
    // a.innerHTML = result.title;  
    return result;      
},  );

// console.log(result);
// console.log(data);
// .then(result => {
//     return result.json();
// }).then(response => {
//     return response.json();
// }).catch(err => {   
//     console.log('request failed');
// })
// request.open('GET', openGraph, true);
// JSON.stringify()
// console.log(me);   




// app.post('/getSave', (req, res)=>{
//     const card = new Card({
//         title : "Title 1",
//         url: "Url 1",
//     });
//     card.save().
//     then((result) => {
//         res.send(result);
//     }).
//     catch((err)=> {
//         console.log(err);
//     })
// })




