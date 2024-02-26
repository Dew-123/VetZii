const express = require('express');
const { connectToMongoDB, getDataUsers ,addDataUsers,getDataVets,addDataVets } = require('./dataBase');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

// Parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// Parse application/json
app.use(bodyParser.json());

// Your routes and other middleware come here...
app.post('/dataGetUser', async (req, res) => {
  try {
    // Retrieve the email and password from the request body
    const { email, password } = req.body;
    console.log(email);
    console.log(password);
    // Connect to MongoDB and retrieve data
  
    const data = await getDataUsers(email, password);
    
    // Send the data as response
    res.json(data);
  } catch (error) {
    console.error('Error handling API request:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });