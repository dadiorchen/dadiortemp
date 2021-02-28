var attach = require('neovim').attach; // npm install neovim-client                                                                                           
(async function() {
  const nvim = await attach({ socket: "/tmp/nvim" });
  console.log("arv:", process.argv.slice(-1).join(''));
  await nvim.command(`sp ${process.argv.slice(-1).join('')}`);
  process.exit();
})();
