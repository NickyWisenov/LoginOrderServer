
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const app = express();
const port = process.env.PORT || 4000;
const routes = require('./routes');


app.use(bodyParser.json());
app.use(cors());
app.use(bodyParser.urlencoded({
  extended: false
}));


app.use('/api', routes);




app.listen(port, () => {
  console.log(`Server running on port: ${port}`);
});

