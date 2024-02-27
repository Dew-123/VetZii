const nodemailer = require("nodemailer");

// Create a transporter object using SMTP transport
let transporter = nodemailer.createTransport({
  host: "smtp.gmail.com",
  port: 465,
  secure: true,
  auth: {
    user: "mihanfernando23@gmail.com",
    pass: "nudf auvk cwaa wvlg ",
  },
});

// Email content
let mailOptions = {
  from: "mihanfernando23@gmail.com",
  to: "mihanamajith20@gmail.com",
  subject: "Hello from Node.js!",
  text: "This is a test email sent from Node.js using Nodemailer.",
};

// Send email
transporter.sendMail(mailOptions, (error, info) => {
  if (error) {
    console.log("Error occurred:", error);
  } else {
    console.log("Email sent:", info.response);
  }
});
