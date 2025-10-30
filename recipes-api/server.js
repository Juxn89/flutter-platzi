const fs = require('fs');
const path = require('path');
const express = require('express');
const bodyParser = require('body-parser');
const { v4: uuidv4 } = require('uuid');

const DATA_PATH = path.join(__dirname, 'data', 'recipes.json');
const app = express();
app.use(bodyParser.json());

function readData() {
  if (!fs.existsSync(DATA_PATH)) return { recipes: [] };
  const raw = fs.readFileSync(DATA_PATH, 'utf8');
  try { return JSON.parse(raw); } catch { return { recipes: [] }; }
}

function writeData(obj) {
  fs.writeFileSync(DATA_PATH, JSON.stringify(obj, null, 2), 'utf8');
}

function ensureIds() {
  const data = readData();
  if (!Array.isArray(data.recipes)) data.recipes = [];
  let changed = false;
  data.recipes = data.recipes.map(r => {
    if (!r.id) { r.id = uuidv4(); changed = true; }
    return r;
  });
  if (changed) writeData(data);
  return data;
}

app.get('/recipe', (req, res) => {
  const data = ensureIds();
  res.json(data.recipes);
});

app.get('/recipe/:id', (req, res) => {
  const data = ensureIds();
  const r = data.recipes.find(x => x.id === req.params.id);
  if (!r) return res.status(404).json({ error: 'Not found' });
  res.json(r);
});

app.patch('/recipe/:id', (req, res) => {
  const data = ensureIds();
  const idx = data.recipes.findIndex(x => x.id === req.params.id);
  if (idx === -1) return res.status(404).json({ error: 'Not found' });
  const allowed = ['name','author','image_link','recipe','favorite'];
  const updates = Object.keys(req.body).reduce((acc,k)=>{
    if (allowed.includes(k)) acc[k] = req.body[k];
    return acc;
  },{});
  data.recipes[idx] = { ...data.recipes[idx], ...updates };
  writeData(data);
  res.json(data.recipes[idx]);
});

app.delete('/recipe/:id', (req, res) => {
  const data = ensureIds();
  const idx = data.recipes.findIndex(x => x.id === req.params.id);
  if (idx === -1) return res.status(404).json({ error: 'Not found' });
  const removed = data.recipes.splice(idx,1)[0];
  writeData(data);
  res.json({ removed });
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => console.log(`recipes api listening on ${PORT}`));