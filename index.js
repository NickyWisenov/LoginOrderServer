// Import thrid parties for APP
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const app = express();
const routes = require('./routes');

// App configuration
app.use(bodyParser.json());
app.use(cors());
app.use(bodyParser.urlencoded({
  extended: false
}));

// Route Configuration
app.use('/api', routes);


// Server Listen
const port = process.env.PORT || 4000;

app.listen(port, () => {
  console.log(`Server running on port: ${port}`);
});

