import Config

if Config.config_env() == :dev do
  DotenvParser.load_file(".env")
end

config :nostrum,
  token: System.get_env("TOKEN")

config :psglx,
  env: Config.config_env(),
  guild_id: System.get_env("GUILD_ID"),
  disposable: System.get_env("DISPOSABLE_EMAIL")
