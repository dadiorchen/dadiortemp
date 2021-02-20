const execa = require("execa");
const app = require("./app");
const supertest = require("supertest");

jest.mock("execa");

execa.command.mockResolvedValue({stdout:"ok"});
describe("", () => {

  it("", async () => {
    const {stdout} =  await execa.command("ls");
    console.log("stdout:", stdout);
  });

  it("express", async () => {

    const r = await supertest(app).post("/").send({
      repository: {
        name: "temp",
      },
    });
    //console.log("r:", r);
    expect(r.status).toBe(200);
    
  });


});
