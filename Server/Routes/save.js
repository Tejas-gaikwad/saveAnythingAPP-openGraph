const { query } = require('express');
const express = require('express')

const Card = require('../Model/cardModel');

const opengraph = require('open-graph');
const { Body } = require('node-fetch');
const router = express.Router()


// router.get('/', (req, res) => {

//     // res.send(req.body);

//     urlLink = req.body.urlLink;
//     // "https://medium.com/smma";

//        let ax = opengraph(urlLink, ( error, result) => {
//         console.log(result);    
//         res.send(result)
//         // return result;           
//     },  );


//     // res.send(result);
//     // return 
// })






router.get('/showThisCard', (req, res, next) => {                    /////         This api is used to fetch the data from UrlLink 
    urlLink = req.query.urlLink;


    console.log(urlLink);
    // "https://medium.com/smma";
       let ax = opengraph(urlLink, ( error, result) => {
        console.log(result);    
        res.send(result)  
        return next()       
    },  );
})

router.get('/getAllCards', (req, res)=>{                /////// This method give you all cards........
    Card.find()
    .then((result) => {
        res.send(res.send(result));
    }).
    catch((err)=> {
        console.log(err);
    })
})

router.post('/saveCard', async (req, res, next) => {            //////       This data is used to save the data in mongoDb 


    title = req.body.title,
    imageUrl = req.body.imageUrl,
    url = req.body.url,
    type = req.body.type,
    site_name = req.body.site_name
    description = req.body.description,
    date = req.body.date,

    // console.log(title);
    console.log(` url is --- ${url  } `);
    // console.log(imageUrl);
    // console.log(description);
    // console.log(type);
    // console.log(site_name);
    // console.log(date);
    
    
    const card = new Card({
        title : title,
        url : url,
        imageUrl : imageUrl,
        description : description,
        type: type,
        site_name : site_name,
        date : date,
    });


        const existCard =  await Card.findOne({ url : req.body.url})
            // return console.log("Result...");
        

        console.log(req.body.url);

       if (existCard) {
        //  console.log('This card is already present');
         res.status(204).json({"res" : "Content is already present..."})
       }else{
        console.log('This card is saved...');
        card.save()
        .then((result) => res.status(200).send(result))
        .catch((err)=> res.send(err))
       }
    


})



module.exports = router