const fs = require("fs");
var path = require('path');
var attach = require('neovim').attach; // npm install neovim-client                                                                                           
(async function() {
  const nvim = await attach({ socket: "/tmp/nvim" });
  console.log("arv:", process.argv.slice(-1).join(''));
  console.log("dir:", fs.openSync("."));
  console.log("dir:", path.basename(__dirname));
  console.log("cmd:", process.cwd());
  await nvim.command(`tcd ${process.cwd()}`);
  process.exit();
})();
