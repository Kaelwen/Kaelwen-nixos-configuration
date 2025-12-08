{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "binigo";
        email = "alyria83@gmail.com";
      };
      # http.proxy = "http://127.0.0.1:7897";
      # https.proxy = "http://127.0.0.1:7897";
    };
  };
}
