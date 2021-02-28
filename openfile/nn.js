/*
 * the nn cmd, stands for: node-neovim
 */
const fs = require("fs");
const path = require('path');
const attach = require('neovim').attach; 

(async function() {
  const nvim = await attach({ socket: "/tmp/nvim" });
  console.log("arv:", process.argv);
  const command = process.argv[2];
  console.log("cmd:", command);
  console.log("pwd:", process.cwd());
  getMethods = (obj) => Object.getOwnPropertyNames(obj).filter(item => typeof obj[item] === 'function')
  if(command === "cd"){
    nvim.command(`tcd ${process.cwd()}`);
  }else if(command === "open"){
    const file = process.argv[3];
    console.log("file:", file);
    nvim.command(`sp ${process.cwd()}/${file}`);
  }else if(command === "define"){
    console.log("define");
    nvim.getLine()
      .then(line => {
        console.log("line:", line);
      })
      .catch(e => {
        console.error("e:", e);
      });
  }else{
    console.error("command not supported");
  }
  setTimeout(() => {
    process.exit();
  }, 100);
})();
