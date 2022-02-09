const dotenv = require('dotenv');
dotenv.config();

const pinataApiKey = process.env.PINATA_API_KEY;
const pinataSecretApiKey = process.env.PINATA_API_SECRET;
const pinataJWT = process.env.PINATA_API_JWT;

const axios = require("axios");
const fs = require("fs");
const FormData = require("form-data");

const pinFileToIPFS = async () => {
const url = `https://api.pinata.cloud/pinning/pinFileToIPFS`;
let data = new FormData();
// data.append("file", fs.createReadStream("./practice.jpeg"));
data.append("file", fs.createReadStream("./meta.json"));
const res = await axios.post(url, data, {
    maxContentLength: "Infinity", 
    headers: {
      "Authorization": `Bearer ${pinataJWT}`,
      "Content-Type": `multipart/form-data; boundary=${data._boundary}`,
      pinata_api_key: pinataApiKey, 
      pinata_secret_api_key: pinataSecretApiKey,
    },
  });
console.log(res.data);
};
pinFileToIPFS();