enum ApiEnvironment {
  dev("http://192.168.1.44:8000"), // Development Server
  prod("https://api.yourapp.com"); // Production Server

  const ApiEnvironment(this.baseUrl);

  final String baseUrl;
}
