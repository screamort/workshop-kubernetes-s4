const express = require('express');
const app = express();
const PORT = 5000;

app.get('/', (req, res) => {
  res.json({ message: "Hello from API" });
});

app.get('/health', (req, res) => {
  res.json({ status: "ok" });
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`API listening on port ${PORT}`);
});
