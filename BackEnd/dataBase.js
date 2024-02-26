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

async function getDataUsers(email,password) {
    try {
      // Access the database and collection
      const database = client.db("vetzil"); // Update with your database name
      const collection = database.collection("users"); // Update with your collection name
  
      const query = { email: email,password:password};
      const cursor = collection.find(query);
  
      // Convert cursor to array
      const data = await cursor.toArray();
      
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

  async function getDataVets(email) {
    try {
      // Access the database and collection
      const database = client.db("vetzil"); // Update with your database name
      const collection = database.collection("vets"); // Update with your collection name
  
      const query = { email: email };
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

  module.exports = { connectToMongoDB, getDataUsers ,addDataUsers,getDataVets,addDataVets};

  