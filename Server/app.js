require('dotenv').config()
// require('express-async-errors')
const BodyParser = require("body-parser");
const Card = require('../Server/Model/cardModel');

const mongoose = require('mongoose')



try {
    db = mongoose.connect(process.env.DATABASE_URL,
      
    console.log("DB connected..."),
    );   // to connect Database wiht url
   
    
} catch (error) {
    console.log("DB error ...")
}

// const db = mongoose.connection

// db.on('error', (error)=>{
//     console.log(error);
// })
// db.once('open', ()=>{
//     console.log("DB connected");
// })

const express = require('express');
const app = express();

const PORT = 3000;

app.use(express.json())
app.use(BodyParser.json());
app.use(BodyParser.urlencoded({ extended: true }));





const saveRoute = require('./Routes/save')
// app.use('/', saveRoute)
app.use('/', saveRoute)

// app.listen(PORT, "0.0.0.0", function() {    
//     console.log(`Connected port at ${PORT} !`);  
// });  

app.listen(PORT,  () => 
    
    console.log(`Listening on ${PORT}`)
)







// app.get('/', (req, res) => {
    // let ax = openGraph(url, ( error, result) => {
    //     // console.log(typeof result.title);    
    //     // // return result;     /// this is object 
    //     // //  let data = result;  
    //     console.log(result);    
    //     // // let me = JSON.parse(result);
    //     // // return me;
    //     // let a = document.getElementById("title_name");
    //     // a.innerHTML = result.title;  
    //     return result;  
         
    // },  );
// }
// )

console.log("hello world...");