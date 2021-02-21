

describe("b", () => {

  it("pipe", async () =>{
    async function command(cmd){
      const execa = require("execa");
      const r = execa.command(cmd)
      r.stdout.pipe(process.stdout);
      await new Promise((res) => {
        r.stdout.on("end", () => res());
      });
    }
    await command("echo unicon");
    console.log("ok");
  });
});
