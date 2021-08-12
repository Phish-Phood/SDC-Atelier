const Client = require('pg').Client;

const client = new Client({
  user: "postgres",
  password: "1234qwer",
  host: "localhost",
  port: 5432,
  database: "postgres"
})

client.connect()
.then(() => console.log("Connection success"))
.catch(e => console.log(e))
.finally(() => client.end());