const express = require("express");
const {
  connectToMongoDB,
  getDataUsers,
  addDataUsers,
  getDataVets,
  addDataVets,
  addDataPets,
  updateUserPassword,
  updateVetPassword,
} = require("./dataBase");
const bodyParser = require("body-parser");
const recover = require("./emailHandling");

const app = express();
const PORT = process.env.PORT || 3000;

// Parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// Parse application/json
app.use(bodyParser.json());

// Your routes and other middleware come here...
app.post("/dataGetUser", async (req, res) => {
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
    console.error("Error handling API request:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.post("/dataAddUser", async (req, res) => {
  try {
    // Retrieve the data parameters from the request
    const {
      Fname,
      Lname,
      nameOfThePet,
      petType,
      gender,
      email,
      mobileNumber,
      password,
    } = req.body;

    // Log the received data
    console.log("Received data:");
    console.log("First Name:", Fname);
    console.log("Last Name:", Lname);
    console.log("Name of the Pet:", nameOfThePet);
    console.log("Pet Type:", petType);
    console.log("Gender:", gender);
    console.log("Email:", email);
    console.log("Mobile Number:", mobileNumber);
    console.log("Password:", password);

    // Validate if all required fields are provided
    if (
      !Fname ||
      !Lname ||
      !nameOfThePet ||
      !petType ||
      !gender ||
      !email ||
      !mobileNumber ||
      !password
    ) {
      return res.status(400).json({ error: "Missing required fields" });
    }

    // Connect to MongoDB
    await connectToMongoDB();

    // Check if the data already exists
    const existingData = await getDataUsers(email, password);
    console.log("Existing data length:", existingData.length);
    if (existingData.length != 0) {
      return res.status(400).json({ error: "Data already exists" });
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
      password,
    };

    // Add data to MongoDB
    const result = await addDataUsers(newData);

    // Send the result as response
    res.json({
      message: "Data added successfully",
      insertedId: result.insertedId,
    });
  } catch (error) {
    console.error("Error handling API request:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.post("/recoverMailCodeSend", async (req, res) => {
  const email = req.body.email; // Assuming 'email' is the key for the email address in the request body
  console.log(email);
  const recoveryCode = generateRandomCode().toString(); // Convert recovery code to string
  recover.sendEmail(email, recoveryCode);
  res.json(recoveryCode);
});

app.post("/changeEmailUser", async (req, res) => {
  const { email, password } = req.body; // Assuming 'email' is the key for the email address in the request body
  console.log(email);
  console.log(password);
  data = await updateUserPassword(email, password);

  res.send(data);
});

app.post("/dataGetVet", async (req, res) => {
  try {
    // Retrieve the name query parameter from the request
    const {email,password} = req.body.email;

    // Connect to MongoDB and retrieve data
    const db = await connectToMongoDB();
    const data = await getDataVets(email,password);
    console.log(data);
    // Send the data as response
    res.json(data);
  } catch (error) {
    console.error("Error handling API request:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});


app.post("/dataGetVets", async (req, res) => {
  try {
  
    // Connect to MongoDB and retrieve data
    const db = await connectToMongoDB();
    const data = await getDataVets();
    console.log(data);
    // Send the data as response
    res.json(data);
  } catch (error) {
    console.error("Error handling API request:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});


app.get("/dataAddVet", async (req, res) => {
  try {
    // Retrieve the data parameters from the request
    const {
      fullName,
      addressOfTheClinic,
      fieldOfExpertise,
      email,
      mobileNumber,
      password,
    } = req.query;

    // Validate if all required fields are provided
    if (
      !fullName ||
      !addressOfTheClinic ||
      !fieldOfExpertise ||
      !email ||
      !mobileNumber ||
      !password
    ) {
      return res.status(400).json({ error: "Missing required fields" });
    }

    // Connect to MongoDB
    await connectToMongoDB();

    // Check if the data already exists
    const existingData = await getDataVets(email);
    console.log(existingData[0]);
    if (existingData[0]) {
      return res.status(400).json({ error: "Data already exists" });
    }

    // Prepare the data object
    const newData = {
      fullName,
      addressOfTheClinic,
      fieldOfExpertise,
      email,
      mobileNumber,
      password,
    };

    // Add data to MongoDB
    const result = await addDataVets(newData);

    // Send the result as response
    res.json({
      message: "Data added successfully",
      insertedId: result.insertedId,
    });
  } catch (error) {
    console.error("Error handling API request:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// Endpoint for adding pets
app.post("/addPet", async (req, res) => {
  try {
    
    const { name, description, contactNo } = req.body;

    
    if (!name || !description || !contactNo) {
      return res.status(400).json({ error: "Missing required fields" });
    }

    await connectToMongoDB();

    // Prepare the data object
    const newPetData = {
      name,
      description,
      contactNo
    };

    const result = await addDataPets(newPetData);
    
    // Send success response
    res.json({ message: "Pet added successfully",
    insertedId: result.insertedId
    });
  } catch (error) {
    console.error("Error handling API request:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

function generateRandomCode() {
  const min = 1000;
  const max = 9999;
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
