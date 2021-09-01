const express = require('express');
const app = express();
const port = 3000;
const {Client} = require('pg');
const client = new Client({
  user: 'postgres',
  password: '1234qwer',
  host: 'localhost',
  port: 5432,
  database: 'postgres'
});

app.use(express.json());

client.connect()
.then(() => console.log('Connected to database'))
.catch(e => console.log(e))

app.get('/products/', (req, res) => {
  let page = parseInt(req.query.page) || 1;
  let count = parseInt(req.query.count) || 5;
  let startId = (page - 1) * count + 1;
  // let endId = page * count;
  client.query(`
  select * from (
    select
    id,
    name,
    slogan,
    description,
    category,
    default_price,
    features,
    rank() over (
      order by id
      ) id_rank
      from products
      ) t
      where id_rank >= ${startId}
      limit ${count};
      `)
      .then((data) => res.status(200).send(data.rows))
      .catch(e => console.log(e))
    })

app.get('/products/:id', (req, res) => {
  client.query(`select * from products where id = ${req.params.id}`)
  .then((data) => res.status(200).send(data.rows[0]))
  .catch(e => console.log(e))
})

app.get('/products/:id/related', (req, res) => {
  client.query(`select * from related where id = ${req.params.id}`)
  .then((data) => res.status(200).send(data.rows[0]))
  .catch(e => console.log(e))
})

app.get('/products/:id/styles', (req, res) => {
  client.query(`select * from styles where product_id = ${req.params.id}`)
  .then((data) => res.status(200).send(data.rows[0]))
  .catch(e => console.log(e))
})

app.listen(port, (err) => {
  if (err) {
    console.log(err);
  } else {
    console.log(`Listening on port ${port}`);
  }
})