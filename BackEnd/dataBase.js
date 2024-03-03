const { MongoClient, ServerApiVersion } = require("mongodb");
const uri =
  "mongodb+srv://mihan:123@vetzil.j4oh8fz.mongodb.net/?retryWrites=true&w=majority"; // Update with your MongoDB URI

let client;

async function connectToMongoDB() {
  client = new MongoClient(uri, {
    serverApi: {
      version: ServerApiVersion.v1,
      strict: true,
      deprecationErrors: true,
    },
  });

  try {
    // Connect the client to the server	(optional starting in v4.7)
    await client.connect();
    // Send a ping to confirm a successful connection
    await client.db("vetzil").command({ ping: 1 });
    console.log(
      "Pinged your deployment. You successfully connected to MongoDB!"
    );
    return client; // Return the MongoDB client after connection
  } catch (error) {
    console.error("Failed to connect to MongoDB:", error);
    throw error; // Rethrow the error to handle it outside of this function
  }
}



async function getDataUsers(email, password) {
  try {
    await connectToMongoDB();
    // Access the database and collection
    const database = client.db("vetzil"); // Update with your database name
    const collection = database.collection("users"); // Update with your collection name

    let query;
    if (password) {
      query = { email: email, password: password };
    } else {
      query = { email: email };
    }
    console.log(query);
    const cursor = collection.find(query);

    // Convert cursor to array
    const data = await cursor.toArray();
    console.log(data);
    if (!password) {
      // If password is null, extract only the email field from the data
      return data.map((entry) => ({ email: entry.email }));
    }

    return data;
  } catch (error) {
    console.error("Error fetching data from MongoDB:", error);
    throw error;
  }
}

async function addDataUsers(newData) {
  try {
    // Access the database and collection
    const database = client.db("vetzil"); // Update with your database name
    const collection = database.collection("users"); // Update with your collection name

    // Insert the new data into the collection
    const result = await collection.insertOne(newData);
    console.log("Inserted new data with ID:", result.insertedId);

    return result;
  } catch (error) {
    console.error("Error adding data to MongoDB:", error);
    throw error;
  }
}

async function updateUserPassword(email, newPassword) {
  try {
    // Connect to MongoDB
    await connectToMongoDB();

    // Access the database and collection
    const database = client.db("vetzil");
    const collection = database.collection("users");

    // Find the user by email
    const query = { email: email };
    const user = await collection.findOne(query);

    if (!user) {
      throw new Error("User not found");
    }

    // Update user's password
    const result = await collection.updateOne(
      { _id: user._id },
      { $set: { password: newPassword } }
    );

    if (result.modifiedCount === 0) {
      throw new Error("Failed to update password");
    }

    console.log("Password updated successfully");

    return result;
  } catch (error) {
    console.error("Error updating user password:", error);
    throw error;
  }
}

async function getDataVets(email,password) {
  try {
    // Access the database and collection
    const database = client.db("vetzil"); // Update with your database name
    const collection = database.collection("vet"); // Update with your collection name

    // Define the query object outside of the conditionals
    let query = {};

    // Check if email exists
    if (email && password) {
      query = { email: email ,password:password};
    }

    // Find documents based on the query
    const cursor = collection.find(query);

    // Convert cursor to array
    const data = await cursor.toArray();

    return data;
  } catch (error) {
    console.error("Error fetching data from MongoDB:", error);
    throw error;
  }
}

async function addDataVets(newData) {
  try {
    // Access the database and collection
    const database = client.db("vetzil"); // Update with your database name
    const collection = database.collection("vet"); // Update with your collection name

    // Insert the new data into the collection
    const result = await collection.insertOne(newData);
    console.log("Inserted new data with ID:", result.insertedId);

    return result;
  } catch (error) {
    console.error("Error adding data to MongoDB:", error);
    throw error;
  }
}

async function updateVetPassword(email, newPassword) {
  try {
  // Connect to MongoDB
  await connectToMongoDB();
  
  // Access the database and collection
  const database = client.db("vetzil");
  const collection = database.collection("vet");
  
  // Find the user by email
  const query = { email: email };
  const user = await collection.findOne(query);
  
  if (!user) {
  throw new Error("Vet not found");
  }
  
  // Update user's password
  const result = await collection.updateOne(
  { _id: user._id },
  { $set: { password: newPassword } }
  );
  
  if (result.modifiedCount === 0) {
  throw new Error("Failed to update password");
  }
  
  console.log("Password updated successfully");
  
  return result;
  } catch (error) {
  console.error("Error updating vet password:", error);
  throw error;
  }
}
  
async function addDataPets(newData) {
  try {
    // Access the database and collection
    const database = client.db("petadaption"); // Update with your database name
    const collection = database.collection("pets"); // Update with your collection name

    // Insert the new data into the collection
    const result = await collection.insertOne(newData);
    console.log("Inserted new pet with ID:", result.insertedId);

    return result;
  } catch (error) {
    console.error("Error adding pet data to MongoDB:", error);
    throw error;
  }
}

async function addAppointmentToAccept(appointmentData) {
  try {
    // Access the database and collection
    const database = client.db("appointment"); 
    const collection = database.collection("toAccept");

    // Insert the new data into the collection
    const result = await collection.insertOne(appointmentData);
    console.log("Inserted new appointment with ID:", result.insertedId);

    return result;
  } catch (error) {
    console.error("Error adding appointment data to MongoDB:", error);
    throw error;
  }
}

async function addAppointmentCurrent(vetEmail) {
  try {
    await connectToMongoDB();
    const database = client.db("appointment");
    const toAcceptCollection = database.collection("toAccept");
    const currentCollection = database.collection("current");

    // Retrieve all appointment data associated with the provided vetEmail from toAccept collection
    const appointmentsToAccept = await toAcceptCollection.find({ vetEmail: vetEmail}).toArray();

    if (appointmentsToAccept.length == 0) {
      throw new Error("No appointments to accept for the provided vetEmail");
    }

    // Insert the retrieved appointment data into the current collection
    await currentCollection.insertMany(appointmentsToAccept);

    // Delete all appointment data associated with the provided vetEmail from toAccept collection
    await toAcceptCollection.deleteMany({ vetEmail: vetEmail });

    return { message: "Appointments accepted successfully" };
  } catch (error) {
    console.error("Error adding appointment data to current collection:", error);
    throw error;
  }
}

module.exports = {
  connectToMongoDB,
  getDataUsers,
  addDataUsers,
  getDataVets,
  addDataVets,
  addDataPets,
  addAppointmentToAccept,
  addAppointmentCurrent,
  updateUserPassword,
  updateVetPassword,
};
