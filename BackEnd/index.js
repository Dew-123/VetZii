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

app.post('/dataAddUser', async (req, res) => {
    try {
      // Retrieve the data parameters from the request
      const { Fname, Lname, nameOfThePet, petType, gender, email, mobileNumber, password } = req.body;
  
      // Log the received data
      console.log('Received data:');
      console.log('First Name:', Fname);
      console.log('Last Name:', Lname);
      console.log('Name of the Pet:', nameOfThePet);
      console.log('Pet Type:', petType);
      console.log('Gender:', gender);
      console.log('Email:', email);
      console.log('Mobile Number:', mobileNumber);
      console.log('Password:', password);
  
      // Validate if all required fields are provided
      if (!Fname || !Lname || !nameOfThePet || !petType || !gender || !email || !mobileNumber || !password) {
        return res.status(400).json({ error: 'Missing required fields' });
      }
  
      // Connect to MongoDB
      await connectToMongoDB();
  
      // Check if the data already exists
      const existingData = await getDataUsers(email,password);
      console.log('Existing data length:', existingData.length);
      if (existingData.length != 0) {
        return res.status(400).json({ error: 'Data already exists' });
      }
  
      // Prepare the data object
      const newData = {
        Fname,
        Lname,
        nameOfThePet,
        petType,
        gender,
        email,
        mobileNumber,
        password
      };
  
      // Add data to MongoDB
      const result = await addDataUsers(newData);
  
      // Send the result as response
      res.json({ message: 'Data added successfully', insertedId: result.insertedId });
    } catch (error) {
      console.error('Error handling API request:', error);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });

  
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });