const express = require('express');
const { connectToMongoDB, getDataUsers ,addDataUsers,getDataVets,addDataVets } = require('./dataBase');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });