# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY ["Server/*.csproj", "Server/"]
COPY ["DataLibrary/*.csproj", "DataLibrary/"]
RUN dotnet restore -v n  Server/*.csproj 
COPY . .

WORKDIR "/source/Server"
RUN dotnet build "Server.csproj" -c release -o /app
RUN dotnet publish "Server.csproj" -c release -o /publishApp

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:5.0

WORKDIR /app
COPY --from=build /publishApp .
RUN ls /app
ENTRYPOINT ["dotnet", "Server.dll"]