# Blazor Server Crud
Simple demo to connect `Blazor Server hosted model` to mysql

## Structure
|Project| Description|
|-|-|
|Server|BlazorServer application|
|DataLibrary|Library to access to the database (mysql) using `Mysql.Data`, `Dapper`|

## DataLibrary / IDataAccess
`DataLibrary/DataAccess` Contains the acces to the database, it is implemented on the pages from blazor, check `Server/Pages/People.razor`.

Don't forget to inject on `Server/Startup.cs` 
## Database
Can run mysql with docker, check the file: `backing-services/docker-compose.yml`

To run the database and the adminer

`docker-compose up -d`

Result: 
| port | service | container name |
| ---- | ------- | ---------------|
| 8080 | adminer | backing-services_adminer_1 |
| 3306 | mysql:8.0.21 | backing-services_db_1|

## Migrations
Use the file: `db/v1_migration.sql` to check the table `catalog.people`

## Demo
Allow to get all the data
Can save new person

## Commands to create the project
```
dotnet new sln -o BlazorServerCrud
cd BlazorServerCrud

dotnet new blazorserver -o Server
dotnet new classlib -o DataLibrary
dotnet new gitignore

dotnet sln add Server/Server.csproj
dotnet sln add DataLibrary
dotnet add Server/Server.csproj reference DataLibrary/DataLibrary.csproj

cd Server
dotnet watch run
```

## Credits / Source

- [IAmTimCorey - C# To MySQL Using Blazor](https://www.youtube.com/watch?v=_JxC6EUxbDo)