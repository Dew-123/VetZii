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

// Function to send email
function sendEmail(to, subject, text) {
  let mailOptions = {
    from: "mihanfernando23@gmail.com",
    to: to,
    subject: subject,
    text: text,
  };

  return new Promise((resolve, reject) => {
    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        reject(error);
      } else {
        resolve(info.response);
      }
    });
  });
}

module.exports = {
  sendEmail,
};
