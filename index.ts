import { Hono } from 'hono';
import mysql from 'mysql2/promise';

const app = new Hono();

const pool = mysql.createPool({
  host: 'db',
  user: 'root',
  password: 'rootpassword',
  database: 'keovilay_db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

interface Context {
  req: {
    param: (name: string) => string;
  };
  text: (message: string) => Response;
  json: (data: object) => Response;
}

app.use('*', async (c, next) => {
  c.res.headers.set('Access-Control-Allow-Origin', '*');
  c.res.headers.set('Access-Control-Allow-Methods', 'GET,POST,PUT,DELETE,OPTIONS');
  c.res.headers.set('Access-Control-Allow-Headers', 'Content-Type, Authorization');

  if (c.req.method === 'OPTIONS') {
    return c.text('OK');
  }

  await next();
});

app.get('/', async (c: Context) => {
  const conn = await pool.getConnection();
  try {
    const [rows] = await conn.query('SELECT * FROM mns_user');
    interface User {
      id: number;
      firstname: string;
      lastname: string;
    }

    const userList: User[] = (rows as any[]).map((row: any) => ({ id: row.id, lastname: row.lastname, firstname: row.firstname }));
    return c.json({ message: 'Bonjour, ceci est une API avec Bun.js et TypeScript!', users: userList });
  } catch (err) {
    console.error('Erreur lors de la récupération des utilisateurs:', err);
    return c.text('Erreur lors de la récupération des utilisateurs');
  } finally {
    conn.release();
  }
});

app.get('/salut/:nom',async (c: Context) => {
  const nom = c.req.param('nom');
  const conn = await pool.getConnection();
  const [rows] = await conn.query('SELECT * FROM mns_user');
    interface User {
      id: number;
      firstname: string;
      lastname: string;
    }

  const userList: User[] = (rows as any[]).map((row: any) => ({ id: row.id, lastname: row.lastname, firstname: row.firstname }));
  console.log(userList);
  return c.json({ message: `Bonjour, ${nom}!`, users: userList });
});

console.log('API démarrée sur http://localhost:3000');
console.log("test");
export default {
  port: 3000,
  fetch: app.fetch,
};
