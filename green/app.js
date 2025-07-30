const express = require('express');
const app = express();

const port = process.env.PORT || 5001;
const version = process.env.APP_VERSION || '1.0.0';

app.get('/', (req, res) => {
  res.send(`Running App Version: ${version}`);
});

app.listen(port, () => {
  console.log(`App running on port ${port}, version ${version}`);
});