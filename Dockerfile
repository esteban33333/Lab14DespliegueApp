FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY ["Lab14DespliegueApp/Lab14DespliegueApp.csproj", "Lab14DespliegueApp/"]
RUN dotnet restore "Lab14DespliegueApp/Lab14DespliegueApp.csproj"
COPY . .
WORKDIR "/src/Lab14DespliegueApp"
RUN dotnet publish "Lab14DespliegueApp.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENV ASPNETCORE_URLS=http://0.0.0.0:8080
EXPOSE 8080
ENTRYPOINT ["dotnet", "Lab14DespliegueApp.dll"]
