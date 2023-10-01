require('dotenv').config();
const express = require('express');
const app = express();
const iyzicoApi = require('./src/routers/iyzico');


app.use(express.json());
app.use(express.urlencoded({extended:true}));
const port = process.env.PORT || 2001
app.get("/", (req, res)=>{
    res.send("Hoşgeldiniz. Nodejs Api");
})
app.listen(port, (err, res)=>{
    console.log(`Server ${port} portundan başlatıldı...`);
})


app.use('/api/iyzico', iyzicoApi);





