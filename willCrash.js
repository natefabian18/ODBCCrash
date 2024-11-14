const odbc = require("odbc");
require('dotenv').config()

async function connectToDatabase() {
	let database = process.env.DB || 'db'
	let password = process.env.PASS || 'DATABASE_PASSWORD1!'
	let connString = `Driver={ODBC Driver 17 for SQL Server};Server=${database};Database=master;Uid=sa;Pwd=${password};`;
	console.log(`Connecting with connString: ${connString}`);
	const connection = await odbc.connect(connString);
	const result = await connection.query("select * from INFORMATION_SCHEMA.COLUMNS");
	console.log(result);
}

connectToDatabase().catch((e) => console.log(e));
