import std.stdio;
import std.experimental.logger;

import database;


void main()
{
    string databaseType = "postgres";
    writeln("run Database for PostgreSQL demo.");
//    Database db = new Database("postgresql://postgres:123456@localhost:5432/test?charset=utf-8");
    Database db;

    if(databaseType == "postgres" ){
        db = new Database("postgresql://postgres:blockchainos!@localhost:5432/postgres");
    }else{

    }

    //string sql = `INSERT INTO public.test(id, name) VALUES (1, 1);`;

    string sql =  "INSERT INTO test(id,name) VALUES ('bos_1','blockchainos');";

    int result = db.execute(sql);
    writeln(result);

    Statement statement = db.prepare("SELECT id, name FROM test limit 10;");

    ResultSet rs = statement.query();

    foreach(row; rs)
    {
        writeln(row);
    }

    db.close();
}
