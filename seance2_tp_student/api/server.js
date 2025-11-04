const express = require("express");
const app = express();
app.get("/", (_, res) => res.json({ ok: true, service: "api", ts: Date.now() }));
app.get("/health", (_, res) => res.send("OK"));
const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`API listening on ${port}`));
