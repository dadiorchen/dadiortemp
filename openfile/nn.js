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
  if(command === "cd"){
    await nvim.command(`tcd ${process.cwd()}`);
  }else if(command === "open"){
    const file = process.argv[3];
    console.log("file:", file);
    await nvim.command(`sp ${process.cwd()}/${file}`);
  }else{
    console.error("command not supported");
  }
  process.exit();
})();
