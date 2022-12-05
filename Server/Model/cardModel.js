const  mongoose  = require("mongoose");

const Schema = mongoose.Schema;

const cardSchema = new Schema({

    title: {
        type:String,
        
    },
    url: {
        type:String,
        
    }, 


        imageUrl : {
            type:String,
        },
  

    description : {
        type:String,
        
    },

    type : {
        type:String,
        
    },

    site_name : {
        type:String,
        
    },

    date : {
        type:String,
        
    },
    
})


const Card = mongoose.model('card', cardSchema);

module.exports = Card;