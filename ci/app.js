const execa = require("execa");
const express = require("express");
const bodyParser = require("body-parser")
const app = express();
app.use(bodyParser.json());
app.use("*", async (req, res) => {
  console.log("req.body:", req.body);
  //the body is okay, having name
  if(req.body && req.body.repository){
    console.log("fire...");
    const begin = Date.now();
    const {stdout} = await execa.command("echo ok");
    console.log("took time:", Date.now() - begin);
    console.log("result:", stdout);
  }
  res.status(200).send("welcome");
});
module.exports = app
