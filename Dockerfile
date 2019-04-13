FROM microsoft/dotnet:sdk AS environ
WORKDIR /app

COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release

FROM microsoft/dotnet:aspnetcore-runtime
WORKDIR /app
COPY --from=environ /app/DotNetCoreHelloWorld/bin/Release/netcoreapp2.1/ .
ENTRYPOINT ["dotnet", "WebApi.dll"]
