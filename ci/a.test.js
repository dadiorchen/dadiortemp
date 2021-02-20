const execa = require("execa");
const app = require("./app");
const supertest = require("supertest");

describe("", () => {

  it("", async () => {
    const {stdout} =  await execa.command("ls");
    console.log("stdout:", stdout);
  });

  it("express", async () => {

    const r = await supertest(app).get("/");
    //console.log("r:", r);
    expect(r.status).toBe(200);
    
  });


});
