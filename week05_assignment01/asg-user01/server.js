const express = require('express');
const server = express();
const port = 3000;
const cors = require('cors');
const status = require('statuses');


const cors_option = {origin:"http://localhost:4200",optionSuccessStatus:200};
server.use(express.json());
server.use(express.urlencoded({extended:true}));
server.use(cors(cors_option));
const USERS = [{id: 1, username: "Vaishnavi"},
                {id: 2, username: "Arun"},
                {id: 3, username: "Chandrakant"}]
server.get('/',(req,resp)=>{
    resp.send("express is working");
})
server.get('/users/',(req,resp)=>{
    resp.setHeader("Content-Type","application/json");
    console.log(USERS);
    resp.send(USERS);
})

server.listen(port,()=>{
    console.log("http://localhost:3000 started");
})