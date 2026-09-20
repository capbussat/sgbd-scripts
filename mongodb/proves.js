// mongosh --file proves.js 
use("test")
db.alumnes.insertMany([{nom:"Anna",edat:20},{nom:"Pau",edat:22}])
printjson(db.alumnes.find().toArray())
