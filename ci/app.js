const express = require("express");
const app = express();
app.use("*", (req, res) => {
  console.log("req:", req);
  res.status(200).send("welcome");
});
module.exports = app
