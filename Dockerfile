#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
ENV ASPNETCORE_URLS http://*:44319
WORKDIR /app
EXPOSE 80
EXPOSE 44319

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY . /src
#COPY ["CleanArchitectureDemoProject.Api/CleanArchitectureDemoProject.Api.csproj", ""]
RUN dotnet restore "CleanArchitectureDemoProject.Api/CleanArchitectureDemoProject.Api.csproj"
COPY . .
RUN dotnet build "CleanArchitectureDemoProject.Api/CleanArchitectureDemoProject.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CleanArchitectureDemoProject.Api/CleanArchitectureDemoProject.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CleanArchitectureDemoProject.Api.dll"]
